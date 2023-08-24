public with sharing class getTenContacts {
    @AuraEnabled
    public static List<Contact> getContacts(){
       List<Contact> contactList = [SELECT Name, Phone 
                                    FROM Contact
                                    LIMIT 10];
        
        return contactList;                            
    }
}