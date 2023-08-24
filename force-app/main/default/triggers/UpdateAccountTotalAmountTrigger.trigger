trigger UpdateAccountTotalAmountTrigger on Opportunity (after insert, after update) {
    if (Trigger.isAfter) {
        if (Trigger.isInsert || Trigger.isUpdate) {
            Set<Id> accountIdsToUpdate = new Set<Id>();
            for (Opportunity opp : Trigger.new) {
                if (opp.StageName == 'Closed Won') {
                    accountIdsToUpdate.add(opp.AccountId);
                }
            }

            if (!accountIdsToUpdate.isEmpty()) {
                List<Account> accountsToUpdate = [SELECT Id FROM Account WHERE Id IN :accountIdsToUpdate];
                OpportunityTriggerHandler.updateCustomFieldInAccount(accountsToUpdate);
            }
        }
    }
}
