public with sharing class CreateCountryState {
    public static String CreateCountryState(String cityName) {
        Map<String, String> cityToState = new Map<String, String>();
        Map<String, String> stateToCountry = new Map<String, STirng>();

        for (State__c state : [Select State_Name__c,State_Captial__c from State__c]) {
            cityToState.put(state.State_Captial__c, state.State_Name__c) ;  
        }
        for (Country__c country : [Select Country_name__c,  State_Name_for_country__c from Country__c]) {
            stateToCountry.put(country.Country_Captial__c,country.Country_name__c);
        }
        try{
                String relatedState = cityToState.get(cityName);
                String relatedCountry = stateToCountry.get(relatedState);
                return relatedCountry;
        }
        catch(NullPointerException expcet){
            return 'NullPointerException';
        }
        catch(Exception excepti){
            return 'Default exception';
        }
    }
}