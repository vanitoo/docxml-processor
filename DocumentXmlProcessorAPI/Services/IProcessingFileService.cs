using System.Text;
using System.Text.Json;
using DocumentXmlProcessorAPI.Models.DataTransfer;
using DocumentXmlProcessorAPI.Models.Enums;
using DocumentXmlProcessorContext.Context;
using DocumentXmlProcessorContext.Entity;
using Microsoft.EntityFrameworkCore;

namespace DocumentXmlProcessorAPI.Services;

public interface IProcessingFileService
{
    Task<ServiceResponse<Guid?>> AddToProcessing(string xml, string? additionalData, string? callbackUrl, string? callbackParams);
    bool AddHtml(Guid processId, List<string> html, double timeProcessing);
    bool AddPdf(Guid processId, List<byte[]> pdfs, double timeProcessing);
    Task<List<string>> GetHtml(Guid processId);
    Task<List<byte[]>> GetPdf(Guid processId);
    Task<bool> DeleteDocuments(List<Guid> deleteIds);
    Task<ProcessingDocumentState> DocumentState(Guid processId);
    Task<ProcessingDocumentState> DocumentStateHtml(Guid processId);
}

public class ProcessingFileService : IProcessingFileService
{
    private readonly DocumentProcessorContext _context;
    private readonly ILogger<ProcessingFileService> _logger;
    private readonly IWebHostEnvironment _environment;

    private const string DataDirectory = "Data";

    public ProcessingFileService(DocumentProcessorContext context, ILogger<ProcessingFileService> logger, IWebHostEnvironment environment)
    {
        _context = context;
        _logger = logger;
        _environment = environment;
    }

    public async Task<ServiceResponse<Guid?>> AddToProcessing(string xml, string? additionalData, string? callbackUrl, string? callbackParams)
    {
        var processId = Guid.NewGuid();
        JsonDocument? jsonData = null;
        if (String.IsNullOrWhiteSpace(additionalData) == false)
        {
            jsonData = JsonDocument.Parse(additionalData);
        }

        string directoryPath = Path.Combine(_environment.ContentRootPath, DataDirectory, "Xml");
        if (!Directory.Exists(directoryPath))
        {
            Directory.CreateDirectory(directoryPath);
        }

        string filePath = Path.Combine(directoryPath, $"{processId}.xml");
        await File.WriteAllTextAsync(filePath, xml);

        try
        {
            await _context.ProcessingFilesData.AddAsync(new ProcessingFileData()
            {
                Id = processId,
                ProcessingFileId = processId,
                XmlPath = filePath
            });
            await _context.ProcessingFiles.AddAsync(new ProcessingFile()
            {
                Id = processId,
                AdditionalData = jsonData,
                ProcessingFileDataId = processId,
                CallbackUrl = callbackUrl,
                CallbackParams = callbackParams
            });
            await _context.SaveChangesAsync();
        }
        catch (Exception ex)
        {
            return new ServiceResponse<Guid?>() { Result = null, Errors = new List<string>() { "Произошла непредвиденная ошибка, обратитесь в тех поддержку." } };
        }

        return new ServiceResponse<Guid?>() { Result = processId };
    }

    public bool AddHtml(Guid processId, List<string> html, double timeProcessing)
    {
        try
        {
            var needDocument = _context.ProcessingFiles.Include(x => x.ProcessingFileData)
                .FirstOrDefault(x => x.Id == processId);
            if (needDocument == null)
            {
                return false;
            }

            string directoryPath = Path.Combine(_environment.ContentRootPath, DataDirectory, "Html", processId.ToString());

            needDocument.ProcessingFileData.HtmlPath = directoryPath;
            needDocument.ProcessingFileData.HtmlTimeProcessing = timeProcessing;
            _context.SaveChanges();

            if (!Directory.Exists(directoryPath))
            {
                Directory.CreateDirectory(directoryPath);
            }

            foreach (var doc in html)
            {
                string filePath = Path.Combine(directoryPath, $"{Guid.NewGuid()}_{DateTime.Now.ToString("dd_MM_yyyy_hh_mm_ss")}.html");
                File.WriteAllText(filePath, doc);
            }

            return true;
        }
        catch (Exception exception)
        {
            _logger.LogError($"Ошибка при сохранении данных в бд {processId}: {exception.Message}");
            return false;
        }
    }

    public bool AddPdf(Guid processId, List<byte[]> pdfs, double timeProcessing)
    {
        try
        {
            var needDocument = _context.ProcessingFiles.Include(x => x.ProcessingFileData)
                .FirstOrDefault(x => x.Id == processId);
            if (needDocument == null)
            {
                return false;
            }

            string directoryPath = Path.Combine(_environment.ContentRootPath, DataDirectory, "Pdf", processId.ToString());

            needDocument.ProcessingFileData.PdfPath = directoryPath;
            needDocument.ProcessingFileData.PdfTimeProcessing = timeProcessing;
            needDocument.DateCompleteProcessing = DateTime.Now;
            _context.SaveChanges();

            if (!Directory.Exists(directoryPath))
            {
                Directory.CreateDirectory(directoryPath);
            }

            foreach (var doc in pdfs)
            {
                string filePath = Path.Combine(directoryPath, $"{Guid.NewGuid()}_{DateTime.Now.ToString("dd_MM_yyyy_hh_mm_ss")}.pdf");
                File.WriteAllBytes(filePath, doc);
            }

            return true;
        }
        catch (Exception exception)
        {
            _logger.LogError($"Ошибка при сохранении данных в бд {processId}: {exception.Message}");
            return false;
        }
    }

    public async Task<List<string>> GetHtml(Guid processId)
    {
        try
        {
            var needDocument = _context.ProcessingFiles
                .Include(x => x.ProcessingFileData)
                .Include(x => x.ProcessingFileErrors)
                .FirstOrDefault(x => x.Id == processId);
            if (needDocument == null)
            {
                return new List<string>() { "В обработке не найден документ" };
            }

            if (needDocument.ProcessingFileErrors.Any())
            {
                return new List<string>() { $"Во время обработки документа, произошла ошибка, обратитесь в тех. поддержку. ProcessId = {processId}" };
            }

            if (needDocument.IsCompleteHtml)
            {
                string directoryPath = Path.Combine(_environment.ContentRootPath, DataDirectory, "Html",
                    processId.ToString());
                try
                {
                    List<string> result = new();
                    foreach (string file in Directory.EnumerateFiles(directoryPath, "*.*", SearchOption.AllDirectories))
                    {
                        string content = await File.ReadAllTextAsync(file);
                        result.Add(content);
                    }
                    return result;
                }
                catch (Exception ex)
                {
                    _logger.LogError("Ошибка при чтении файла с данными у {id}, {ex}", processId, ex);
                    return new List<string>() { "Ошибка при получении данных файла, обратитесь в тех поддержку!" };
                }
            }

            return new List<string>() { "Html данные ещё не готовы" };
        }
        catch (Exception ex)
        {
            _logger.LogError($"Ошибка при получении html {processId}: {ex.Message}");
            return new List<string>() { "Ошибка при получении данных файла, обратитесь в тех поддержку!" };
        }
    }

    public async Task<List<byte[]>> GetPdf(Guid processId)
    {
        try
        {
            var needDocument = _context.ProcessingFiles
                .Include(x => x.ProcessingFileData)
                .Include(x => x.ProcessingFileErrors)
                .FirstOrDefault(x => x.Id == processId);
            if (needDocument == null)
            {
                return new List<byte[]>() { Encoding.UTF8.GetBytes("В обработке не найден документ") };
            }

            if (needDocument.ProcessingFileErrors.Any())
            {
                return new List<byte[]>() { Encoding.UTF8.GetBytes($"Во время обработки документа, произошла ошибка, обратитесь в тех. поддержку. ProcessId = {processId}") };
            }

            if (needDocument.IsCompletePdf)
            {
                string directoryPath = Path.Combine(_environment.ContentRootPath, DataDirectory, "Pdf", processId.ToString());
                try
                {
                    List<byte[]> result = new();
                    foreach (string file in Directory.EnumerateFiles(directoryPath, "*.*", SearchOption.AllDirectories))
                    {
                        byte[] content = await File.ReadAllBytesAsync(file);
                        result.Add(content);
                    }
                    return result;
                }
                catch (Exception ex)
                {
                    _logger.LogError("Ошибка при чтении файла с данными у {id}, {ex}", processId, ex);
                    return new List<byte[]>() { Encoding.UTF8.GetBytes("Ошибка при получении данных файла, обратитесь в тех поддержку!") };
                }
            }

            return new List<byte[]>() { Encoding.UTF8.GetBytes("Pdf данные ещё не готовы") };
        }
        catch (Exception ex)
        {
            _logger.LogError($"Ошибка при получении pdf {processId}: {ex.Message}");
            return new List<byte[]>() { Encoding.UTF8.GetBytes("Ошибка при получении данных файла, обратитесь в тех поддержку!") };
        }
    }

    public async Task<bool> DeleteDocuments(List<Guid> deleteIds)
    {
        var needDocuments = await _context.ProcessingFiles
            .Include(x => x.ProcessingFileData)
            .Where(x => deleteIds.Contains(x.Id)).ToListAsync();

        foreach (var file in needDocuments)
        {
            if (file.IsCompleteHtml)
            {
                string directoryPath = Path.Combine(_environment.ContentRootPath, DataDirectory, "Html",
                    file.Id.ToString());

                if (Directory.Exists(directoryPath))
                {
                    try
                    {
                        foreach (string pathFile in Directory.EnumerateFiles(directoryPath, "*.*", SearchOption.AllDirectories))
                        {
                            if (File.Exists(pathFile))
                            {
                                File.Delete(pathFile);
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        _logger.LogError("Ошибка при удалении файла с данными {id}, {ex}", file.Id, ex);
                    }

                    try
                    {
                        Directory.Delete(directoryPath);
                    }
                    catch (Exception ex)
                    {
                        _logger.LogError("Ошибка при удалении директории {id}, {ex}", file.Id, ex);
                    }
                }
            }

            if (file.IsCompletePdf)
            {
                string directoryPath = Path.Combine(_environment.ContentRootPath, DataDirectory, "Pdf",
                    file.Id.ToString());

                if (Directory.Exists(directoryPath))
                {
                    try
                    {
                        foreach (string pathFile in Directory.EnumerateFiles(directoryPath, "*.*", SearchOption.AllDirectories))
                        {
                            if (File.Exists(pathFile))
                            {
                                File.Delete(pathFile);
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        _logger.LogError("Ошибка при удалении файла с данными {id}, {ex}", file.Id, ex);
                    }

                    try
                    {
                        Directory.Delete(directoryPath);
                    }
                    catch (Exception ex)
                    {
                        _logger.LogError("Ошибка при удалении директории {id}, {ex}", file.Id, ex);
                    }
                }
            }
        }

        try
        {
            _context.ProcessingFiles.RemoveRange(needDocuments);
            await _context.SaveChangesAsync();
            return true;
        }
        catch (Exception ex)
        {
            _logger.LogError("Ошибка при удалении из базы данных, {ex}", ex);
            return false;
        }
    }

    public async Task<ProcessingDocumentState> DocumentState(Guid processId)
    {
        var needDocument = await _context.ProcessingFiles
            .Include(x => x.ProcessingFileData)
            .Include(x => x.ProcessingFileErrors)
            .Where(x => x.Id == processId).FirstOrDefaultAsync();

        if (needDocument == null)
        {
            return ProcessingDocumentState.NotDocument;
        }

        if (needDocument.ProcessingFileErrors.Any())
        {
            return ProcessingDocumentState.Error;
        }

        if (needDocument.DateCompleteProcessing == null)
        {
            return ProcessingDocumentState.NotComplete;
        }

        return ProcessingDocumentState.Complete;
    }

    public async Task<ProcessingDocumentState> DocumentStateHtml(Guid processId)
    {
        var needDocument = await _context.ProcessingFiles
            .Include(x => x.ProcessingFileData)
            .Include(x => x.ProcessingFileErrors)
            .Where(x => x.Id == processId).FirstOrDefaultAsync();

        if (needDocument == null)
        {
            return ProcessingDocumentState.NotDocument;
        }

        if (needDocument.ProcessingFileErrors.Any())
        {
            return ProcessingDocumentState.Error;
        }

        if (needDocument.IsCompleteHtml == false)
        {
            return ProcessingDocumentState.NotComplete;
        }

        return ProcessingDocumentState.Complete;
    }
}
