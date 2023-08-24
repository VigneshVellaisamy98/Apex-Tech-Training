@isTest
public class TestTriggerEmailToContact {
    @isTest
    static void testTriggerEmailToContact() {
        // Create an Account
        Account testAccount = new Account(Name = 'Test Account');
        insert testAccount;
        
        // Create a Contact associated with the Account
        Contact testContact = new Contact(FirstName = 'New', LastName = 'Ton', AccountId = testAccount.Id);
        insert testContact;
        
        // Test the trigger logic
        Test.startTest();
        // Since the trigger is "before insert," we need to insert the Contact again to invoke the trigger
        Contact newContact = new Contact(FirstName = 'John', LastName = 'Wick', AccountId = testAccount.Id);
        insert newContact;
        Test.stopTest();
        
        // Verify that the email was sent
        List<Messaging.SingleEmailMessage> sentEmails = Messaging.getsentEmails();
        System.assertEquals(1, sentEmails.size(), 'One email should have been sent');
        
        Messaging.SingleEmailMessage sentEmail = sentEmails[0];
        System.assertEquals(1, sentEmail.getToAddresses().size(), 'One recipient email address should be included');
        System.assertEquals('Welcome to Our Company', sentEmail.getSubject(), 'Email subject should match');
        System.assertEquals('vigneshdv21@gmail.com', sentEmail.getReplyTo(), 'Reply-to address should match');
        System.assertEquals('Contact Created', sentEmail.getSenderDisplayName(), 'Sender display name should match');
        System.assertEquals('Dear', sentEmail.getHtmlBody().substring(0, 4), 'Email body should start with "Dear"');
        // You can add more assertions to check the content of the email body if needed.
    }
}
