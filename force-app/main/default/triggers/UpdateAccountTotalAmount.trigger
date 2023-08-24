trigger UpdateAccountTotalAmount on Opportunity (after insert, after update, after delete, after undelete) {
        Set<Id> accountIdsToUpdate = new Set<Id>();
        
        // Check if Opportunities are closed-won and get their related Account IDs
        for (Opportunity opp : [SELECT Id, AccountId, StageName, Amount FROM Opportunity WHERE AccountId IN :Trigger.newMap.keySet()]) {
            if (opp.StageName == 'Closed Won') {
                accountIdsToUpdate.add(opp.AccountId);
            }
        }
    
        // If there are Account IDs to update, calculate the sum and update the custom field on the Account object
        if (!accountIdsToUpdate.isEmpty()) {
            List<Account> accountsToUpdate = new List<Account>();
    
            for (AggregateResult result : [SELECT AccountId, SUM(Amount) totalAmount FROM Opportunity WHERE AccountId IN :accountIdsToUpdate AND StageName = 'Closed Won' GROUP BY AccountId]) {
                Account acc = new Account(Id = (Id)result.get('AccountId'));
                acc.OpportunityWonTotal__c = (Decimal)result.get('totalAmount');
                accountsToUpdate.add(acc);
            }
    
            // Update the Account records with the calculated sum
            update accountsToUpdate;
        }
    }
    

