public with sharing class DeleteSpamLeads implements Schedulable {
    public DeleteSpamLeads() {

    }

    public void execute(SchedulableContext Context){
        List<Lead> spamLeads = [SELECT Id FROM Lead WHERE Name = 'Test' LIMIT 300];

        if(!spamLeads.isEmpty()){
            delete spamLeads;

            sendNotification('Spam Leads','  Deleted Sucessfully' + spamLeads.size() + 'spamLeads');
        }
    }

    private void sendNotification(String subject, String message){

        List<User> adminUser = [SELECT Id FROM User WHERE Profile.Name = 'System Administrator'];

        List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();

        for(User admin : adminUser){

            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            email.setToAddresses(new List<String>{admin.Email});
            email.setSubject(subject);
            email.setPlainTextBody(message);
            emails.add(email);
        }
        Messaging.sendEmail(emails);
    }
}