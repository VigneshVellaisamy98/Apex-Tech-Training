public with sharing class AccountLWCHelper {
    @AuraEnabled
    public static List<Account> listOfAccounts(){
       List<Account> newList = [SELECT Id, Name
                                FROM Account
                                LIMIT 5];

          return newList;                      
    }
}