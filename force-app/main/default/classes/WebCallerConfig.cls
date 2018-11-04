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
    private string address;
    private string path;
    private string port;
    private string protocol;
    private string method;
    private string data;

    /*******************************************************************************************************
    * @description Constructor.  Will look up an end point and load related configuration data
    * @param endPointId Unique identifier for an Endpoint (endpoints are children of Services)
    * @return void
    * @example
    * WebCaller caller = new WebCaller ( new WebCallerConfig ( 'xyz' ))
    */

    public WebCallerConfig () {

    }

    public boolean load ( string serviceId ) {

        try {
            // query the Service Record 
            Web_Caller_Service__mdt service = [ SELECT ID, QualifiedApiName, Web_Caller_Endpoint__c, Data__c, Method__c, Path__c FROM Web_Caller_Service__mdt WHERE QualifiedApiName =: serviceId ];

            // query the Endpoint record
            Web_Caller_Endpoint__mdt endPoint = [ SELECT ID, Address__c, Port__c, Protocol__c FROM Web_Caller_Endpoint__mdt WHERE ID =: service.Web_Caller_Endpoint__c ];

            // set attributes
            this.address = endPoint.Address__c;
            this.path = service.Path__c;
            this.port = endPoint.Port__c;
            this.protocol = endPoint.Protocol__c;
            this.data = service.Data__c;
            this.method = service.Method__c;

            // validate
            this.isValid = true;

        } catch ( Exception e ) {
            this.isValid = false;
            throw new WebCallerException ( 'WebCallerConfig.load ()', '000', e );
        }

        return this.isValid;
    }

    public boolean isValid () {
        return this.isValid;
    }

    public string fullyQualifiedURL () {
        string returnUrl = this.protocol + '://' + this.address + '/' + this.path + ':' + port;
        return returnUrl;
    }

    public string getData () {
        return this.data;
    }
}
