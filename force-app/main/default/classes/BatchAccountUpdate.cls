public with sharing class BatchAccountUpdate implements Database.Batchable<sObject> {
    public BatchAccountUpdate() {

    }
    public  Database.QueryLocator start(Database.BatchableContext context){
        String accountsToUpdate = 'SELECT Id, isUpdated__c from Account WHERE isUpdated__c = true';
        return Database.getQueryLocator(accountsToUpdate);
    }

    public void execute(Database.BatchableContext context , List<sObject> accountsToUpdate){
        for(Account accountToUpdate : (List<Account>)accountsToUpdate){
            accountToUpdate.isUpdated__c = false;
        }
        update accountsToUpdate;
    }
    
    public void finish(Database.BatchableContext context){
        
    }

}
// -------- 
// -------- 
// --------
// --------
// --------
// --------
// --------
// --------
// --------
