public class BulkRecordCreator {

        public static void addRecordsUsingMap() {
            List<Country__c> records = new List<Country__c>();
    
            // Creating records for Custom_Object__c and adding them to the list
            // for (Integer i = 0; i < 5; i++) {
            //     Custom_Object__c record = new Custom_Object__c();
            //     record.Name = 'Record ' + i;
            //     // Set other fields for Custom_Object__c as needed
            //     records.add(record);
            // }
    
            // Using Map function to insert records in bulk
            Map<Database.Country_Name__c, Id> CountryName = new Map<Database.Country_Name__c, Id>();
            CountryName.putAll(Database.insert(records, false));
    
            // Handling the results
            for (Database.Country_Name__c sr : CountryName.keySet()) {
                if (sr.isSuccess()) {
                    System.debug('Record with ID ' + CountryName.get(sr) + ' was inserted successfully.');
                } else {
                    for (Database.Error err : sr.getErrors()) {
                        System.debug('Error occurred while inserting a record: ' + err.getMessage());
                    }
                }
            }
            Map<Database.Country_Captial__c, Id> CountryCap = new Map<Database.Country_Captial__c, Id>();
            CountryCap.putAll(Database.insert(records, false));
    
            // Handling the results
            for (Database.Country_Captial__c sr : CountryCap.keySet()) {
                if (sr.isSuccess()) {
                    System.debug('Record with ID ' + CountryCap.get(sr) + ' was inserted successfully.');
                } else {
                    for (Database.Error err : sr.getErrors()) {
                        System.debug('Error occurred while inserting a record: ' + err.getMessage());
                    }
                }
            }
        }
    
}
