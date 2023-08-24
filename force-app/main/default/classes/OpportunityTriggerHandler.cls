public with sharing class OpportunityTriggerHandler {
    public static void updateCustomFieldInAccount(List<Account> accountsToUpdate) {
        Map<Id, Decimal> accountIdToOpportunityWonTotal = new Map<Id, Decimal>();

        for (Account acc : accountsToUpdate) {
            accountIdToOpportunityWonTotal.put(acc.Id, 0);
        }

        List<AggregateResult> totalAmounts = [SELECT AccountId, SUM(Amount) totalAmounts
                                           FROM Opportunity
                                           WHERE AccountId IN :accountIdToOpportunityWonTotal.keySet()
                                           AND StageName = 'Closed Won'
                                           GROUP BY AccountId];

        for (AggregateResult result : totalAmounts) {
            Id accountId = (Id)result.get('AccountId');
            Decimal wonTotal = (Decimal)result.get('totalAmounts');
            accountIdToOpportunityWonTotal.put(accountId, wonTotal);
        }

        List<Account> accountsToUpdateWithTotal = new List<Account>();
        for (Account acc : accountsToUpdate) {
            acc.OpportunityWonTotal__c = accountIdToOpportunityWonTotal.get(acc.Id);
            accountsToUpdateWithTotal.add(acc);
        }

        update accountsToUpdateWithTotal;
    }
}
