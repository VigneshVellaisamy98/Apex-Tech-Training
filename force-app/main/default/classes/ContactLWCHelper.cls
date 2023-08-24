public with sharing class ContactLWCHelper {
    @AuraEnabled
    public static List<Contact> getContactFromAccount(String accountId){
       List<Contact> contactList = [SELECT Id , Name
                                    FROM Contact    
                                    WHERE AccountId =:  accountId];

        return contactList;                           
    }   
}