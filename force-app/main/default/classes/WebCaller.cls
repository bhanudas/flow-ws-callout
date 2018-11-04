/**
* @author Bhanudas Tanaka
* @date November 1, 2018
*
* @group WebCaller
* @group-content ../../ApexDocContent/WebCaller.htm
*
* @description Main class for business rules and controller logic for WebCaller - a Flow based
* invocable outbound web service tool.
* Also contains primary handler interface for creating outbound web service calls
*/

public class WebCaller {

    /*******************************************************************************************************
    * @description Constructor
    * @param config Instance of WebCallerConfig to handle configuration details
    * @return void
    * @example
    * WebCaller caller = new WebCaller ( new WebCallerConfig ( 'xyz' ))
    */
    public WebCaller ( WebCallerConfig config ) {

    }

    /*******************************************************************************************************
    * @description Public interface for web service outbound call implementations
    */
    public interface Outbound {

        void call ();

    }
}
