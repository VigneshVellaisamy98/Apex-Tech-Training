SELECT 
    Id, FirstName, LastName, Email
FROM 
    Contact
WHERE 
    AccountId = NULL


SELECT 
    Id, Name
FROM 
    Account
WHERE 
    Id 
NOT IN 
    (SELECT 
        AccountId 
    FROM 
        Contact)



List<Account> accList = new List<Account>();

-- Declaring the variable and call it in the soql query
String accName = 'vicky';
-- Null Check
if(!accList.isEmpty()){
    for(Account a : accList){
        
    }
}
accList = [SELECT Id,Name FROM Account WHERE Name =: accName]
System.debug(accList);
