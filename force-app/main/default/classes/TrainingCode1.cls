public with sharing class TrainingCode1 {
    public static void divicibleBy() {
        for(Integer i = 0 ; i <= 100 ; i++){
            if(Math.mod(i, 9) != 0){
                System.debug(i);
            }
        }
    }
    public static void pattern(){
        Integer num = 1;
        for(integer i=1;i<=5;i++)
    {
        string s=' ';
        for(integer j=1;j<=10;j++)
        {
            if(j<=i )
            {
                s = s + num;
                num++;
            }
            // else
            // {
            //      s = s + '_';
            // }
        }
        
        system.debug(s);
        
    }
    }
    // public static void reverseWord(){
    //     String orignalName = 'Vignesh';
    //     String reversedName = orignalName.reverse();
    //     System.debug(reversedName);

    // }
    public static void primeNumber(){
        for(Integer prime = 1;prime<=100;prime++){
            Integer count = 0;
            for(Integer num = prime;num>=1; num-- ){
                if(Math.mod(prime, num)==0){
                    count++;
                }
                if(count==2 || count==1){
                    System.debug(prime);
                }
                else{
                    System.debug('Not a primeNumber');
                }
            }
        }
    }
    public static Lead createLeadRecord(String lastName,String email,String companyName,Date DateofBirth) {
        Lead leadRecordToInsert = new Lead(LastName =lastName,Email=email, Company=companyName );
        insert leadRecordToInsert;
        return leadRecordToInsert;
    }
    public static Lead createLeadRecord(Date DateofBirth,string lastName,string company)
    {
        if(DateofBirth == null){
            DateofBirth = Date.newInstance(1990, 01, 01);
        }
        Lead newLead = new Lead();
        newLead.Birthdate__c=DateofBirth;
        newLead.LastName=lastName;
        newLead.Company=company;
        insert newLead;
        return newLead;
    }
    //create account with contact
    public static void createAccountContact(String accountName,String contactFirstName,String contactLastName,String contactEmail){
        Account newAccount = new Account();
        newAccount.Name = accountName;
        insert newAccount;
        Contact  newContact = new Contact();
        newContact.FirstName = contactFirstName;
        newContact.LastName = contactLastName;
        newContact.Email = contactEmail;
        newContact.AccountId = newAccount.Id;
        insert newContact;
        System.debug('running successfully!!');
    }
    
    //create leads in bulk

    public static void leadsInBulk(Integer numofLeads){
        List<Lead> leadToCreate = new List<Lead>();

        String defaultCompany = '4i apps';
        String defaultFirstName = 'Test';

        for(Integer i = 0 ; i<numofLeads ; i++){
            Lead newlead = new Lead();
            newlead.FirstName = defaultFirstName;
            newlead.LastName = defaultFirstName + i;
            newlead.Email = defaultFirstName + '.' + defaultFirstName + i + '@4iapps.com';
            newlead.Company = defaultCompany;

            leadToCreate.add(newlead);
        }
        if(!leadToCreate.isEmpty()){
            insert leadToCreate;
            System.debug(numofLeads);
        }
    }
}
