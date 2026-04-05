using System.Xml.Linq;

namespace XsltProcessor.Extensions;

public static class MemoryExtensions
{
    public static MemoryStream ToStream(this XElement xml)
    {
        var stream = new MemoryStream();
        xml.Save(stream);
        stream.Seek(0, SeekOrigin.Begin);
        return stream;
    }
}
