public with sharing class OpportunityAutoNameHelper {
    public static void autoNameCreation(List<Opportunity> opportunities) {
 
        For(Opportunity newOpportunity: opportunities){
            Datetime closeDateField = newOpportunity.CloseDate;
            String monthName = closeDateField.format('MMM');
            newOpportunity.Name = newOpportunity.Account.Name +' '+monthName+' '+newOpportunity.StageName;

        }

    }
}