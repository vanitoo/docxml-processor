using System.Net;
using DocumentXmlProcessorAPI.Models;

namespace DocumentXmlProcessorAPI.Middleware;

public class ExceptionHandlingMiddleware
{
    private readonly RequestDelegate _next;

    public ExceptionHandlingMiddleware(RequestDelegate next)
    {
        _next = next;
    }

    public async Task InvokeAsync(HttpContext httpContext, ILogger<ExceptionHandlingMiddleware> logger)
    {
        try
        {
            await _next(httpContext);
        }
        catch (Exception ex)
        {
            logger.LogCritical(ex, "Неперехваченная ошибка при обработке запроса");
            await HandleExceptionAsync(httpContext, ex);
        }
    }

    private static async Task HandleExceptionAsync(HttpContext httpContext, Exception exception)
    {
        httpContext.Response.ContentType = "application/json";
        httpContext.Response.StatusCode = (int)HttpStatusCode.InternalServerError;
        await httpContext.Response.WriteAsync("Произошла ошибка");
    }
}
