public with sharing class CheckLeadStatus {
    public static void triggerQualifiedLeads(List<Lead> qualifiedLeads) {
        List<Account> accountCreation = new List<Account>();
        List<Contact> contactCreation = new List<Contact>();
        List<Opportunity> oppCreation = new List<Opportunity>();

        for(Lead lead : qualifiedLeads){
            Account existingAccount = [SELECT Id , Name 
                                       FROM Account
                                       WHERE Phone =: lead.Phone
                                       ];
            
            Contact existingContact = [SELECT Id, Name 
                                        FROM Contact
                                        WHERE Email =: lead.Email
                                        ]; 
             if(existingAccount != null){
                existingAccount.Name = lead.Name;
                existingAccount.Phone = lead.Phone;
                //existingAccount.isUpdated__C = True; 
             } 
             
             if(existingContact != null){
                existingContact.LastName = lead.Name;
                existingContact.Email = lead.Email;
             }

             Opportunity newOpp = new Opportunity();
             newOpp.Name = lead.Name;
             newOpp.CloseDate = Date.today();
             newOpp.StageName = 'Prospecting';
             newOpp.AccountId = existingAccount != null ? existingAccount.Id : null;
             newOpp.ContactId = existingContact != null ? existingContact.id : null; 
        }
        update accountCreation;
        update contactCreation;
        insert oppCreation;
    }
}