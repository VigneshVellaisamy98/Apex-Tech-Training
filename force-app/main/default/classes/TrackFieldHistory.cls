public  class TrackFieldHistory implements Queueable {
    public Lead lead;
    public Map<String , Object> oldFieldValues;

    public TrackFieldHistory(Lead lead , Map<String , Object> oldFieldValues) {
        this.lead = lead;
        
        this.oldFieldValues = oldFieldValues;

    }

    public void execute (QueueableContext context){
        System.debug(lead);
        System.debug(oldFieldValues);
        List<Lead_Field_History__c> fieldHistory = new List<Lead_Field_History__c> ();
            for(String field : oldFieldValues.keySet()){
                Object oldvalue = oldFieldValues.get(field);
                Object newValue = Lead.get(field);

                    if(oldvalue != newValue){
                        Lead_Field_History__c histroy = new Lead_Field_History__c();
                        histroy.Lead__c = Lead.Id;
                        histroy.Field__c = field;
                        histroy.Previous_Name__c = String.valueOf(oldvalue);
                        histroy.Field_Updated_Time__c = Datetime.now();
                        fieldHistory.add(histroy);
                    }
            }
                    if(!fieldHistory.isEmpty()){
                        insert fieldHistory;
                    }
            }
    
    }