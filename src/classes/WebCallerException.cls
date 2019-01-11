public class WebCallerException extends Exception {

    public string message;
    public string method;
    public string code;

    public WebCallerException ( string method, String code, Exception e ) {
        this.message =  e.getMessage ();
        this.method = method;
        this.code = code;
    }
}