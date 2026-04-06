using Microsoft.Extensions.Logging;
using ProcessingCommon.Models.Data;
using System.Reflection;
using System.Runtime.InteropServices.JavaScript;
using System.Security.AccessControl;
using System.Text.RegularExpressions;
using System.Xml;
using System.Xml.Linq;
using System.Xml.Schema;
using System.Xml.Xsl;
using XsltProcessor.Extensions;

namespace XsltProcessor.Processing;

public class XsltBuilder
{
    private readonly ILogger _logger;
    private readonly XElement _xml;
    private const string ContainerName = "ED_Container";
    private List<string> _resultsHtml = new();

    public IEnumerable<string> GetResultHtmls => _resultsHtml.ToList();

    public XsltBuilder(string xml, ILogger logger)
    {
        _logger = logger;
        _xml = XElement.Parse(xml);
    }
    public XsltBuilder BasicBuild()
    {
        _resultsHtml.Clear();
        
        XElement document = GetDocumentWithoutSignature();
        if (document == default)
        {
            throw new ArgumentNullException("Empty document!");
        }
        if (document.Name.LocalName != ContainerName)
        {
            _resultsHtml.Add(GenerateDocument(document));
        }
        else
        {
            var documents = GetAllDocumentFromContainer(document);
            foreach (var innerDocument in documents)
            {
                _resultsHtml.Add(GenerateDocument(innerDocument));
            }
        }
        return this;
    }

    private Dictionary<string, string> _dictCountry;
    public XsltBuilder ExtensionEsad(ExtensionEsadData data)
    {
        try
        {
            _dictCountry = data.DictCountry??new Dictionary<string, string>();
           
            List<string> editData = new List<string>();
            if (_resultsHtml.Any())
            {
                foreach (var html in _resultsHtml)
                {
                    string result = html; 
                    int lastReplacementPosition = 0;
                    result = AddExtFieldTdNumber(data.DocumentType, data.TdRegNumber ?? String.Empty, result, ref lastReplacementPosition);
                    if (data.DocumentType == "EsadOut_CU")
                    {
                        result = AddExtField3("ОРГАН ОТПРАВЛЕНИЯ", "1." + data.CustomCode, result, ref lastReplacementPosition);
                        result = AddExtField3("ОРГАН ОТПРАВЛЕНИЯ", "2." + data.StatusName, result, ref lastReplacementPosition);
                        result = AddExtField3("ОРГАН ОТПРАВЛЕНИЯ", data.CustomsOffical, result, ref lastReplacementPosition);

                        result = AddExtField2("Наложенные пломбы:", data.Seal, result, ref lastReplacementPosition);
                        result = ReplaceExtFieldDesc("Срок доставки (дата):", "Срок транзита (дата):", result, ref lastReplacementPosition);
                        result = AddExtField2("Срок транзита (дата):", data.TransitDateLimit, result, ref lastReplacementPosition);
                        result = AddExtField2("Подпись:", data.CustomsOffical, result, ref lastReplacementPosition);
                    }
                    else
                    {
                        var postAddress = CopyElements("Таможенный орган назначения", result, lastReplacementPosition, "Почтовый");
                        result = ReplaceCodeCountry(result);
                        result = AddExtField3("Таможенный орган отправления", data.CustomCode, result, ref lastReplacementPosition);
                        result = AddExtField3("Таможенный орган отправления", data.StatusName, result, ref lastReplacementPosition);
                        result = AddExtField3("Таможенный орган отправления",data.CustomsOffical, result, ref lastReplacementPosition);

                        result = DeleteElements("Таможенный орган назначения", result, ref lastReplacementPosition);
                        result = AddElement("Таможенный орган назначения", data.DestinationCustom, result, ref lastReplacementPosition);
                        result = AddElement("Таможенный орган назначения", data.DestinationPlaceCertificate, result, ref lastReplacementPosition);
                        result = AddElement("Таможенный орган назначения", data.DestinationStation, result, ref lastReplacementPosition);
                        result = AddElement("Таможенный орган назначения", postAddress, result, ref lastReplacementPosition);

                        result = AddExtField3("Отметки таможенного органа отправления", "1:" + data.DestinationPlace, result, ref lastReplacementPosition);
                        result = AddExtField3("Отметки таможенного органа отправления", "2:Срок таможенного транзита: " + data.TransitDateLimit, result, ref lastReplacementPosition);
                        result = AddExtField3("Отметки таможенного органа отправления", "4:Средства идентификации:" + data.Seal, result, ref lastReplacementPosition);
                        result = AddExtFieldTdNumberExtPages(data.DocumentType, data.TdRegNumber, result, ref lastReplacementPosition);
                    }

                    //source = AddExtField3("ОРГАН ОТПРАВЛЕНИЯ", data.CustomCode ?? String.Empty, 
                    //    source, ref lastReplacementPosition);
                    //source = AddExtField3("ОРГАН ОТПРАВЛЕНИЯ", data.StatusName ?? String.Empty, 
                    //    source, ref lastReplacementPosition);
                    //source = AddExtField3("ОРГАН ОТПРАВЛЕНИЯ", data.CustomsOffical ?? String.Empty, 
                    //    source, ref lastReplacementPosition);
                    //source = AddExtField2("Наложенные пломбы:", data.Seal ?? String.Empty, 
                    //    source, ref lastReplacementPosition);
                    //source = ReplaceExtFieldDesc("Срок доставки (дата):", "Срок транзита (дата):", 
                    //    source, ref lastReplacementPosition);
                    //source = AddExtField2("Срок транзита (дата):", data.TransitDateLimit ?? String.Empty, 
                    //    source, ref lastReplacementPosition);
                    //source = AddExtField2("Подпись:", data.Signature ?? String.Empty, 
                    //    source, ref lastReplacementPosition);
                    editData.Add(result);
                }
            }
            _resultsHtml.Clear();
            _resultsHtml = new List<string>(editData);
        }
        catch (Exception ex)
        {
            _logger.LogError("Ошибка при формировании расширенного EsadOut: {ex}",ex);
        }

        return this;
    }
    

    public XsltBuilder ExtensionPi(ExtensionPIData data)
    {
        try
        {
            List<string> editData = new List<string>();
            if (_resultsHtml.Any())
            {
                foreach (var html in _resultsHtml)
                {
                    string source = html;
                    source = source.Replace("</head>", data.BarcodeHeadHtml + "</head>");
                    editData.Add(source);
                }
            }
            _resultsHtml.Clear();
            _resultsHtml = new List<string>(editData);
        }
        catch (Exception ex)
        {
            _logger.LogError("Ошибка при формировании расширенного EsadOut: {ex}",ex);
        }

        return this;
    }
    /* Методы вставки дополнительных данных в html*/

    private string ReplaceCodeCountry(string result)
    {
        var consignorRef = @"ConsignorDetails[0]/SubjectAddressDetails[0]/UnifiedCountryCode[0]";
        var consigneeRef = @"ConsigneeDetails[0]/SubjectAddressDetails[0]/UnifiedCountryCode[0]";
        var carrierRef = @"CarrierDetails[0]/SubjectAddressDetails[0]/UnifiedCountryCode[0]";
        var declarantRef = @"DeclarantDetails[0]/SubjectAddressDetails[0]/UnifiedCountryCode[0]";

        var departRef = @"DepartureCountryCode[0]";
        var destinRef = @"DestinationCountryCode[0]";
        int lastReplacementPosition = 0;
        result = ReplaceElementCountry(consignorRef, result, ref lastReplacementPosition);
        result = ReplaceElementCountry(consigneeRef, result, ref lastReplacementPosition);
        result = ReplaceElementCountry(declarantRef, result, ref lastReplacementPosition);
        result = ReplaceElementCountry(departRef, result, ref lastReplacementPosition);
        result = ReplaceElementCountry(destinRef, result, ref lastReplacementPosition);
        result = ReplaceElementCountry(carrierRef, result, ref lastReplacementPosition);
        return result;
    }
    private string getCountryName(string code)
    {
        string result = string.Empty;
        try
        {
            result = _dictCountry[code];
        }
        catch
        {
            result = code;
        }

        return result;
    }
    private string ReplaceElementCountry(string refValue, string result, ref int lastReplacementPosition)
    {
        int _base = result.IndexOf(refValue, lastReplacementPosition);
        if (_base >= 0)
        {
            lastReplacementPosition = _base;
            int start = result.IndexOf(">", _base);
            int end = result.IndexOf("</", _base);
            string el = result.Substring(start + 1, end - start - 1);
            var replaceValue = getCountryName(el);
            return result.Substring(0, start + 1) + replaceValue + result.Substring(end);
        }
        else
            return result;
    }
    private string AddExtFieldTdNumber(string type, string insertValue, string result, ref int lastReplacementPosition)
    {
        if (type == null) { type = "TransitDeclaration"; }

        if (!new string[] { "EsadOut_CU", "TransitDeclaration" }.Contains(type))
            throw new Exception("Неизвестный бланк");

        string refValue = ">ДЕКЛАРАЦИЯ";
        var replaceValue = $"<td class=\"graphMain\" align=\"center\" valign=\"center\" rowspan=\"3\" style=\"width:60.6mm;border-left:solid 0.8pt black;border-bottom:solid 0.8pt black;\">{insertValue}</td>";
        int _base = result.IndexOf(refValue, lastReplacementPosition);
        int start = result.IndexOf("<td", _base);
        int end = type == "EsadOut_CU" ? result.IndexOf("/>", start) + 2 : result.IndexOf("/td>", start) + 4;
        lastReplacementPosition = _base;
        result = result.Remove(start, end - start).Insert(start, replaceValue);
        return result;
    }
    private string AddExtField2(string refValue, string replaceValue, string result, ref int lastReplacementPosition)
    {
        int _base = result.IndexOf(refValue, lastReplacementPosition);
        if (_base >= 0)
        {
            int start = result.IndexOf("<tr>", _base - 160);
            int end = result.IndexOf("</tr>", _base) + 5;
            lastReplacementPosition = _base;
            return result.Substring(0, start) +
                   "<tr>" +
                   "<td class=\"graph\" style=\"width:20mm;\">" +
                   $"<span class=\"graph\">{refValue}</span>" +
                   "</td>" +
                   $"<td class=\"graph\" align=\"left\">{replaceValue}</td>" +
                   "</tr>"
                   + result.Substring(end);
        }
        else { return result; }
    }

    private static string AddElement(string refValue, string addValue, string result, ref int lastReplacementPosition)
    {
        int _base = result.IndexOf(refValue, lastReplacementPosition);
        if (_base >= 0)
        {
            int start = result.IndexOf("</td>", _base);
            return result.Substring(0, start) + "<div><element>" + addValue + "</element></div>" + result.Substring(start);
        }
        else
            return result;
    }

    private static string DeleteElements(string refValue, string result, ref int lastReplacementPosition)
    {
        int _base = result.IndexOf(refValue, lastReplacementPosition);
        int start = _base;
        int end = result.IndexOf("</td>", _base);
        string str = result.Substring(start, end - start);
        string pattern = @"(?:<element\b[^>]*>.*?</element>\s*|,?\s*<br\s*/?>\s*|,\s*)";
        str = Regex.Replace(str, pattern, string.Empty, RegexOptions.Singleline);
        lastReplacementPosition = _base;
        return result.Substring(0, start) + $"{str}" + result.Substring(end);
    }
    private static string CopyElements(string refValue, string result, int lastReplacementPosition, string startValue)
    {
        int _base = result.IndexOf(refValue, lastReplacementPosition);
        int start = result.IndexOf(startValue, _base);
        int end = result.IndexOf("</td>", _base);
        string str = result.Substring(start, end - start);
        return str;
    }
    private static string AddExtField3(string refValue, string replaceValue, string result, ref int lastReplacementPosition)
    {
        int _base = result.IndexOf(refValue, lastReplacementPosition);
        int start = result.IndexOf("</td>", _base);
        int end = start;
        lastReplacementPosition = _base;
        return result.Substring(0, start) + $"<div class=\"graph\">{replaceValue}</div>" + result.Substring(end);
    }
    private static string ReplaceExtFieldDesc(string refValue, string replaceValue, string result, ref int lastReplacementPosition)
    {
        int _base = result.IndexOf(refValue, lastReplacementPosition);
        if (_base >= 0)
        {
            lastReplacementPosition = _base;
            int start = _base;
            int end = start + refValue.Length;
            return result.Substring(0, start) + replaceValue + result.Substring(end);
        }
        else
            return result;
    }
    private static string AddExtFieldTdNumberExtPages(string type, string insertValue, string result, ref int lastReplacementPosition)
    {
        var refValue = "Таможенный орган отправления";
        var replaceValue = $"<br/><br/><div class=\"graphMain\" align=\"center\" valign=\"center\" style=\"\">{insertValue}</div>";
        while (result.IndexOf(refValue, lastReplacementPosition) > 0)
        {
            int _base = result.IndexOf(refValue, lastReplacementPosition);
            int start = result.IndexOf("</td>", _base);

            result = result.Insert(start, replaceValue);
            lastReplacementPosition = start + replaceValue.Length;
        }

        return result;
    }
    /* Системные методы */
    private string GenerateDocument(XElement document)
    {
        using (MemoryStream memory = new MemoryStream())
        {
            string documentType = document.Name.LocalName;
            string xsdPath = $"{documentType}.xsd";
            string xsltPath = string.Empty;
            if (documentType == "TransitDeclaration")
            {
                xsdPath = "EEC_" + xsdPath;
                xsltPath = "EEC_" + documentType +".xslt";
            }
            else
            {
                string documentModeId = document.Attribute("DocumentModeID").Value;
                xsltPath = $"{((String.IsNullOrWhiteSpace(documentModeId) == false) ? $"{documentModeId}_" : String.Empty)}{documentType}.xslt";

            }
               
            string version = GetValidVersion(document, xsdPath, GetPossibleVersion(_xml, documentType));
            string xslt_schema = Path.Combine(GetCurrentAppDirectory(),"xslt", version, xsltPath);
            Guid generateProcessId = Guid.NewGuid();
            
            _logger.LogInformation($"Start generate document {generateProcessId} {DateTime.Now}: {xsdPath}");
            AppContext.SetSwitch("Switch.System.Xml.AllowDefaultResolver", true);
            XslCompiledTransform xslt = new XslCompiledTransform();
            XsltSettings sets = new XsltSettings(true, true);
            xslt.Load(xslt_schema, sets, new XmlUrlResolver());
            xslt.Transform(document.ToXmlDocument().CreateNavigator(), null, memory);
            memory.Seek(0, SeekOrigin.Begin);
            StreamReader reader = new StreamReader(memory);
            _logger.LogInformation($"Complete generate document {generateProcessId} {DateTime.Now}: {xsdPath}");
            return reader.ReadToEnd();
        }
    }
    private string GetValidVersion(XElement document, string xsd, string? startAlbum = null)
    {
        var versions = GetAllKnownVersion();

        if (startAlbum != default)
        {
            return startAlbum;
        }

        foreach (var version in versions.OrderByDescending(d => d))
        {
            var correctVersion = version;
            if (startAlbum != default && correctVersion == startAlbum)
                continue;
            if (CheckValidVersion(document, xsd, correctVersion) == true)
                return correctVersion;
        }
        _logger.LogError("Не найдена подходящая версия альбома для документа {Name}", document.Name.LocalName);
        throw new ArgumentException("Не найдена подходящая версия альбома для документа {Name}", document.Name.LocalName);
    }
    private bool CheckValidVersion(XElement document, string xsd, string version)
    {
        try
        {
            var namespaces = document.ToXmlDocument().SelectNodes(@"//namespace::*[not(. = ../../namespace::*)]");
            XmlSchemaSet schemas = new XmlSchemaSet();
            schemas.XmlResolver = new XmlUrlResolver();
            string mainNamespace = document.GetDefaultNamespace().NamespaceName;
            schemas.Add(mainNamespace, Path.Combine(GetCurrentAppDirectory(),"xsd", version, xsd));
            bool errors = false;
            XDocument validateDocument = new XDocument(document);
            validateDocument.Validate(schemas, (o, e) =>
            {
                errors = true;
            });
            return !errors;
        }
        catch (Exception exception)
        {
            _logger.LogError("При проверке подходящей версии произошла ошибка, {exception}", exception.ToString());
            return false;
        }
    }
    private string? GetPossibleVersion(XElement document, string documentType) 
    {
        XElement possibleVersion = null;
        document.TryGetFirstSubElementIgnoringNameSpaces("SoftVersion", out possibleVersion);
        if(possibleVersion != default)
        {
            return possibleVersion.Value?.Split("/").FirstOrDefault();
        }
        if (possibleVersion == default && String.IsNullOrWhiteSpace(documentType) == false)
        {
            var knownVersions = GetAllKnownVersion();
            var rawData = document.ToString();
            foreach (var knownVersion in knownVersions)
            {
                if (rawData.Contains($"{documentType}:{knownVersion}"))
                    return knownVersion;
            }
        }
        return null;
    }
    private XElement GetDocumentWithoutSignature()
    {
        if (_xml.Name.LocalName == "Envelope")
        {
            XElement Body;
            XElement BodyObject;
            _xml.TryGetFirstSubElementIgnoringNameSpaces("Body", out Body);
            Body.TryGetFirstSubElementIgnoringNameSpaces("Object", out BodyObject);
            return BodyObject.Elements().FirstOrDefault();
        }
        return _xml;
    }
    private List<XElement> GetAllDocumentFromContainer(XElement container)
    {
        var elements = container.GetSubElementsIgnoringNameSpaces("Object");
        List<XElement> documents = new();
        foreach(var element in elements)
        {
            var needElement = element.Elements().FirstOrDefault();
            if (needElement != default)
            {
                documents.Add(needElement);
            }
        }
        return documents;
    }
    private IEnumerable<string> GetAllKnownVersion()
    {
       var xsd = Directory.GetDirectories(Path.Combine(GetCurrentAppDirectory(), "xsd"), "*", SearchOption.AllDirectories);
       List<string> list = new List<string>();
       foreach (var s in xsd)
       {
           string separator = (s.Contains("\\") == true) ? "\\" : "/";
           var pathSplit = s.Split(separator, StringSplitOptions.RemoveEmptyEntries);
           var version = pathSplit.LastOrDefault();
           if (String.IsNullOrWhiteSpace(version) == false)
           {
               list.Add(version);
           }
       }
       
       _logger.LogInformation($"All known version: {String.Join(";", list)}");
       return list;
    }

    private string GetCurrentAppDirectory()
    {
        _logger.LogInformation($"Directory path: {Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location)}");
        return Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location);
    }
}