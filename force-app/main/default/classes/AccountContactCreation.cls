public with sharing class AccountContactCreation {
    public static void createAccountContact(String accountName, String contactFirstName, String contactLastName, String contactEmail){
        Account newAccount = new Account();
         newAccount.Name = accountName;
         insert newAccount;

         Contact newContact = new Contact();
         newContact.FirstName = contactFirstName;
         newContact.LastName = contactLastName;
         newContact.Email = contactEmail;
         newContact.AccountId = newAccount.Id;
         insert newContact;

         System.debug('Successfully Created!!');
    }

    public static void LeadsInBulk(Integer numberOfLeads) {
        List<Lead> leadsToCreate = new List<Lead>();
        
        String defaultCompany = '4i apps';
        String defaultPhone = '1234567890';
        
        for (Integer i = 0; i < numberOfLeads; i++) {
            Lead newLead = new Lead();
            newLead.LastName = 'Test' + i;
            newLead.Company = defaultCompany;
            newLead.Email = newLead.LastName + '@4iapps.com';
            newLead.Phone = defaultPhone;
            
            leadsToCreate.add(newLead);
        }
        
        // Insert the leads in bulk in the lead object
        if (!leadsToCreate.isEmpty()) {
            insert leadsToCreate;
            System.debug(numberOfLeads + ' Leads created successfully!');
        }
    }

	
	 
}