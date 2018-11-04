/**
* @author Bhanudas Tanaka
* @date November 1, 2018
*
* @group WebCallerConfig
* @group-content ../../ApexDocContent/WebCaller.htm
*
* @description Handles configuration loading and communications to rest of WebCaller tool
*/

public with sharing class WebCallerConfig {

    private boolean isValid;
    private string serviceAddress;
    private string endPointPath;
    private string port;
    private string protocol;

    /*******************************************************************************************************
    * @description Constructor.  Will look up an end point and load related configuration data
    * @param endPointId Unique identifier for an Endpoint (endpoints are children of Services)
    * @return void
    * @example
    * WebCaller caller = new WebCaller ( new WebCallerConfig ( 'xyz' ))
    */

    public WebCallerConfig ( string endpointId ) {

    }

    public boolean isValid () {
        return this.isValid;
    }

    public string fullyQualifiedURL () {
        string returnUrl = this.protocol + '://' + this.serviceAddress + '/' + this.endPointPath + ':' + port;
        return returnUrl;
    }
}
