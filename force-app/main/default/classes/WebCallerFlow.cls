public class WebCallerFlow {
    
    @InvocableMethod ( label='Web Service Outbound Caller' description='Web Service Outbound Caller' )
	public static List < boolean > webCallerFlowInterface ( List < FlowDataStructure > inputData ) {
        
        List < boolean > returnList = new List < boolean > ();

		System.debug ( 'flow output - entry' );

        // for each FlowDataStructure sent in, process a Web Caller routine
        for ( FlowDataStructure fds : inputData ) {
            System.debug ( 'evaluating fds' );
            for ( string key : fds.getKeys ()) {
                System.debug ( 'key: ' + key + ' value:  ' + fds.get ( key ));
            }

            WebCallerConfig wcc = new WebCallerConfig ();

            try {
                // load the config
                wcc.load ( fds.serviceId );
                WebCaller wc = new WebCaller ( wcc );
                wc.executeOutbound ( fds );
            } catch ( Exception e ) {
                returnList.add ( false );
                return returnList;
            }

            returnList.add ( true );

        }

        System.debug ( 'flow output - exit');
        return returnList;
	}

    public class FlowDataStructure {

        @InvocableVariable public List < string > keys;
        @InvocableVariable public List < string > values;
        @InvocableVariable public string serviceId;

        public List < string > getKeys () {
            return this.keys;
        }

        public string get ( string key ) {
            integer i = 0;
            integer foundIdx = null;
            for ( i = 0; i < keys.size (); i++ ) {
                if ( keys[i] == key ) {
                    foundIdx = i;
                    break;
                }
            }

            if ( foundIdx != null ) {
                return values[ foundIdx ];
            } else {
                return null;
            }
        }
    }

}
