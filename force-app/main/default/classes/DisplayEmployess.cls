public with sharing class DisplayEmployess {
    @AuraEnabled
    public static Contact createContact(String firstName , String lastName , String phone, String email) {
        Contact newContact = new Contact();
        newContact.FirstName = firstName;
        newContact.LastName = lastName;
        newContact.Phone = phone;
        newContact.Email = email;
        insert newContact;
        return newContact;
        
    }
}