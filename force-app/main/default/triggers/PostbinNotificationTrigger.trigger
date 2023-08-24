trigger PostbinNotificationTrigger on Integration_Log__c (before insert) {


    List<Integration_Log__c> newNotifications = Trigger.new;
    List<Integration_Log__c> logsToInsert = new List<Integration_Log__c>();
    
    for (Integration_Log__c notification : newNotifications) {
        Integration_Log__c logEntry = new Integration_Log__c();
        logEntry.Response_Body__c = notification.Response_Body__c; // Assuming your notification object has a "Message__c" field
        
        logsToInsert.add(logEntry);
    }
    
    insert logsToInsert;
}