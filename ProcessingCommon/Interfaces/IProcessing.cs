namespace ProcessingCommon.Interfaces;

public interface IProcessing<TResult, TParameter>
{
    TResult Processing(TParameter data);
}
