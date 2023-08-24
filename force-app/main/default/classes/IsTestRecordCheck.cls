public with sharing class IsTestRecordCheck {
    public static Boolean identifyTestLeads(Id TestLead) {
        Lead cLead = [SELECT Id , FirstName , LastName , Test_Leads__c FROM Lead WHERE Id = :Testlead];
        String firstname = cLead.FirstName;
        String lastname = cLead.LastName;

        Boolean firstnameHasTest = firstname.contains('Test');
        Boolean lastnameHasTest = lastname.contains('Test');

        if (firstnameHasTest == true && lastnameHasTest == true) {
            return true;
           // System.debug('Value is True');
           
        }
        return false;
        //System.debug('value is False');
        
    }
    
}