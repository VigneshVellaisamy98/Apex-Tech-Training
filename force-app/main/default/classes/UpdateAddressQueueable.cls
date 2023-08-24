public with sharing class UpdateAddressQueueable implements Queueable , Database.AllowsCallouts {
    Id accountId;

    public UpdateAddressQueueable(Id accountId) {
        this.accountId = accountId;
    }

    public void execute(QueueableContext context) {
        Account acc = [SELECT Id, BillingStreet, BillingCity, BillingState, BillingPostalCode FROM Account WHERE Id = :accountId LIMIT 1];

        Http httpConnection = new Http();
        HttpRequest request = new HttpRequest();
        HttpResponse response = new HttpResponse();
        request.setEndpoint('https://www.toptal.com/developers/postbin/1691563854361-4803441718686');
        request.setMethod('POST');
        request.setBody(logRecord.Request_Body__c);
        response = httpConnection.send(request);
        
        String completeAddress = acc.BillingStreet + ', ' + acc.BillingCity + ', ' + acc.BillingState + ' ' + acc.BillingPostalCode;

        acc.Address_Checked__c = true;

        update acc;
    }
}










// Call Google Maps API here to validate and update the address
        // In this example, we'll just set the Address_Checked__c field to true