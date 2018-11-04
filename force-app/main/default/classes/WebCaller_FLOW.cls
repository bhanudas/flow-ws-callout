public with sharing class WebCaller_FLOW {
    
    @InvocableMethod ( label='Web Service Outbound Caller' description='Web Service Outbound Caller' )
	public static List < boolean > webCallerFlowInterface ( List < flowDataStructure > inputData ) {
        
        List < boolean > returnList = new List < boolean > ();

		System.debug ( 'flow output - entry' );

        for ( flowDataStructure fds : inputData ) {
            System.debug ( 'evaluating fds' );
            for ( string key : fds.getKeys ()) {
                System.debug ( 'key: ' + key + ' value:  ' + fds.get ( key ));
            }
            returnList.add ( true );
        }

        System.debug ( 'flow output - exit');
        return returnList;
	}

    public class flowDataStructure {

        @InvocableVariable public List < string > keys;
        @InvocableVariable public List < string > values;

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
