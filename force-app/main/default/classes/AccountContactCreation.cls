public with sharing class AccountContactCreation {
    public static void createAccountWithContact(String accountName, String contactFirstName, String contactLastName, String contactEmail){
        Account newAccount = new Account();
         newAccount.Name = accountName;
         insert newAccount;

         Contact newContact = new Contact();
         newContact.FirstName = contactFirstName;
         newContact.LastName = contactLastName;
         newContact.Email = contactEmail;
         newContact.AccountId = newAccount.Id;
         insert newContact;

         System.debug('account and contact created successfully');
    }

    public static void createLeadsInBulk(Integer numberOfLeads) {
        List<Lead> leadsToCreate = new List<Lead>();
        
        // Default values for the leads
        // String defaultLastName = 'Test 1';
        String defaultCompany = '4i apps';
        // String defaultEmail = 'test.test@4iapps.com';
        String defaultPhone = '1234567890';
        
        for (Integer i = 0; i < numberOfLeads; i++) {
            Lead newLead = new Lead();
            newLead.LastName = 'Test' + i;
            newLead.Company = defaultCompany;
            newLead.Email = newLead.LastName + '@4iapps.com';
            newLead.Phone = defaultPhone;
            
            leadsToCreate.add(newLead);
        }
        
        // Insert the leads in bulk
        if (!leadsToCreate.isEmpty()) {
            insert leadsToCreate;
            System.debug(numberOfLeads + ' Leads created successfully!');
        }
    }

	
	 
}