trigger AccountAddressValidationTrigger on Account (after update) {
    List<UpdateAddressQueueable> queueableJobs = new List<UpdateAddressQueueable>();

    for (Account acc : Trigger.new) {
        if (acc.Address_Checked__c == false) {
            queueableJobs.add(new UpdateAddressQueueable(acc.Id));
        }
    }

    if (!queueableJobs.isEmpty()) {
        System.enqueueJob(queueableJobs);
    }
}
