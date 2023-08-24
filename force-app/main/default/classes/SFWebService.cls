global with sharing class SFWebService {
    webService static List<Account> getAccount(string accountName) {
        accountName = '%'+accountName+'%';
        List<Account>getAllAccount = [select Id,Name From Account Where Name Like : accountName];
        
        return getAllAccount;
    }
}