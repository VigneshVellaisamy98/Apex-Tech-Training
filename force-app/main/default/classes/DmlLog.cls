public with sharing class DmlLog implements LogManager
{
    // class is declared as public with sharing,  sharing rule
    public static void createLog()
    {
        Contact newContactRecord = new Contact();
        // Creating a new Contact record: A new Contact record is created and assigned to the variable newContactRecord.

        newContactRecord.LastName='bat';

        Database.SaveResult result =Database.insert(newContactRecord);

        system.debug(result);

 

        DML_Log__c newDmlLogRecord = new DML_Log__c();
        // The code checks if the DML operation was successful using the isSuccess()

        // If the insertion is not successful, it sets the SaveResult__c field to a 
        //message indicating that the record was not created, including the error messages obtained from result.getErrors().
        if(result.isSuccess()==true)

        {

            newDmlLogRecord.SaveResult__c='Record Created Sucessfully,Id is '+result.getId();

        }

        else {
            newDmlLogRecord.SaveResult__c='Record is not created ,error is '+result.getErrors();
        }

        insert newDmlLogRecord;
        //After logging the result, the DML_Log__c record is inserted into Salesforce to save the DML

    }
}