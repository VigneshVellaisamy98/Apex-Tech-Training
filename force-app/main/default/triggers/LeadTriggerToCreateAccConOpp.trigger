trigger LeadTriggerToCreateAccConOpp on Lead (after update) {
    List<Lead> qualifiedLeads = new List<Lead>();

    for(Lead lead : trigger.new){
        if (Lead.Status == 'Closed - Converted') {
                qualifiedLeads.add(lead);
        }

        if (!qualifiedLeads.isEmpty()) {
            CheckLeadStatus.triggerQualifiedLeads(qualifiedLeads);
        }
    }
}