using System.Xml;
using System.Xml.Linq;
using System.Xml.XPath;

namespace XsltProcessor.Extensions;

public static class XmlExtensions
{
    public static bool TryGetFirstSubElementIgnoringNameSpaces(this XElement xmlData, string key, out XElement? xElement)
    {
        IEnumerable<XElement> value = xmlData.XPathSelectElements($".//*[local-name() = '{(object)key}']");
        if (value.Any())
        {
            xElement = value.First();
            return true;
        }

        xElement = null;
        return false;
    }

    public static XmlDocument ToXmlDocument(this XElement xElement)
    {
        var xmlDocument = new XmlDocument();
        xmlDocument.Load(xElement.ToStream());
        return xmlDocument;
    }

    public static IEnumerable<XElement> GetSubElementsIgnoringNameSpaces(this XElement xmlData, string key)
    {
        return xmlData.XPathSelectElements($".//*[local-name() = '{(object)key}']");
    }

}
