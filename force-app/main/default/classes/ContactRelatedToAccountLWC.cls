public with sharing class ContactRelatedToAccountLWC {
    @AuraEnabled(cacheable = true)
    public static List<Contact> getRelatedContacts(String accountName) {
        List<Contact> relatedContacts = new List<Contact>();
        
        if (String.isNotBlank(accountName)) {
            relatedContacts = [SELECT Id, FirstName, LastName, Email, Phone
                               FROM Contact
                               WHERE Account.Name = :accountName
                               LIMIT 10];
        }
        
        return relatedContacts;
    }

}












// public static List<Contact> getContactsRelatedToAccounts(String acctId){
    //     System.debug('acc :'+ acctId);
    //     return [SELECT Id, FirstName , LastName , Email , Phone 
    //             FROM Contact
    //             WHERE AccountId =: acctId];
    // }