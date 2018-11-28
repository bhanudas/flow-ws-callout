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

    private WebCallerConfig config;

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
    * @description executeOutbound
    * @param WebCallerFlow.FlowDataStructure instance of a Flow Data Structure
    * @return void
    * @example
    * executeOutbound ()
    */
    public void executeOutbound ( WebCallerFlow.FlowDataStructure fds ) {

        // load config settings
        this.config.load ( fds.getServiceId ());

        // create HTTP/Request items
        Http h = new Http ();
        HttpRequest req = new HttpRequest ();
        req.setEndpoint ( this.config.fullyQualifiedURL ());
        req.setMethod ( this.config.httpMethod ());

        // make request
        HttpResponse resp;
        try {
            resp = h.send ( req );
        } catch ( Exception e ) {
            throw new WebCallerException ( 'WebCaller.executeOutbound ()', '000', e );
        }

        // inspect resp and process
    }

    /*******************************************************************************************************
    * @description Public interface for web service outbound call implementations
    */
    public interface Outbound {

        void call ( WebCallerConfig wcc );

    }
}
