namespace XsltProcessor.Interfaces;

public interface IProcessing<R, T>
{
    R Processing(T data);
}
