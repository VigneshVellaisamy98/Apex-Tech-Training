trigger OpportunityName on Opportunity (before insert, before update) {
    if(trigger.isInsert && trigger.isBefore){

        OpportunityAutoNameHelper.autoNameCreation(trigger.new);

    }

    if(trigger.isUpdate && trigger.isBefore){

        OpportunityAutoNameHElper.autoNameCreation(trigger.new);

    }
}