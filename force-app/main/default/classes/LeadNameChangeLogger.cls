public class LeadNameChangeLogger implements Queueable {

    private Id leadId;
    private String oldName;
    private String newName;

    public LeadNameChangeLogger(Id leadId, String oldName, String newName) {
        this.leadId = leadId;
        this.oldName = oldName;
        this.newName = newName;
    }

    public void execute(QueueableContext context) {
        System.debug('Executing LeadNameChangeLogger for Lead Id: ' + leadId);
        
        Lead_Field_History__c log = new Lead_Field_History__c();
        log.Lead_Name_Change_Log__c = leadId;
        log.Previous_Name__c = oldName;
        log.Field__c = newName;
        log.OwnerId = UserInfo.getUserId();
        log.Field_Updated_Time__c = System.now();

        insert log;
        
        System.debug('LeadNameChangeLogger: Lead Field History inserted for Lead Id: ' + leadId);
    }
}
