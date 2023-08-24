trigger AccountTrigger on Account (after insert ,after update ) {

    // public class AccConRandomNo implements Database.Batchable<sObject> {
    //     public Database.QueryLocator start(Database.BatchableContext BC) {
    //         String query = 'SELECT Id FROM Account WHERE Custom_Random_Number__c = null LIMIT 1';
    //         return Database.getQueryLocator(query);
    //     }

    //     public void execute(Database.BatchableContext BC, List<Account> scope) {
    //         if (scope.isEmpty()) {
    //             return;
    //         }

    //         Integer randomNumber = generateRandomNumber();

    //         Account acc = new Account();
    //         acc.Custom_Random_Number__c = randomNumber;
    //         insert acc;

    //         Contact con = new Contact();
    //         con.AccountId = acc.Id; // Assign the Account's ID to the Contact's AccountId
    //         con.Custom_Random_Number__c = randomNumber;
    //         insert con;
    //     }

    //     public void finish(Database.BatchableContext BC) {
    //     }
    // }

    // public static Integer generateRandomNumber() {
    //     return (Integer)Math.floor(Math.random() * 10001);
    // }

    // AccAndConRandomNumberBatch batch = new AccAndConRandomNumberBatch();

    // Database.executeBatch(batch);
}
