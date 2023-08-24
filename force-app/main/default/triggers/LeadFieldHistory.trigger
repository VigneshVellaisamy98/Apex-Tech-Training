trigger LeadFieldHistory on Lead (after update) {
    List<LeadNameChangeLogger> loggersToEnqueue = new List<LeadNameChangeLogger>();

    for (Integer i = 0; i < Trigger.new.size(); i++) {
        Lead newLead = Trigger.new[i];
        Lead oldLead = Trigger.old[i];

        if (oldLead.FirstName != newLead.FirstName) {
            loggersToEnqueue.add(new LeadNameChangeLogger(
                newLead.Id,
                oldLead.FirstName,
                newLead.FirstName
            ));
        }

        if (oldLead.LastName != newLead.LastName) {
            loggersToEnqueue.add(new LeadNameChangeLogger(
                newLead.Id,
                oldLead.LastName,
                newLead.LastName
            ));
        }
    }

    // if (!loggersToEnqueue.isEmpty()) {
    //     System.enqueueJob(loggersToEnqueue);
    // }
}
