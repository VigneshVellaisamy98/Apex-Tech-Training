public class LeadContactMatching {
    public static void updateContactEmail(Id contactID){

        try{

            Contact contactFromId = [Select Id,Name, Email from Contact where Id=:contactID];
            Lead leadstoCheck = [Select Id,Name, Email from Lead where email=:contactFromId.Email];
            contactFromId.Lead__c = leadstoCheck.Id;
            update contactFromId;
            system.debug('Linked with lead ---> '+contactFromId.Lead__c);
        }
        catch(Exception exceptError){
            system.debug(exceptError.getMessage());
        }

        }
}
