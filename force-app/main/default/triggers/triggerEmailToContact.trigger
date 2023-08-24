trigger triggerEmailToContact on Contact (before insert) {
    List<id> acctId = new list<id>();

    List<Messaging.SingleEmailMessage> email = new List<Messaging.SingleEmailMessage>();

    for(Contact cont : trigger.new){
        if(cont.AccountId != null){
            List<Account> acctlist = [SELECT (SELECT Email FROM Contacts) FROM Account WHERE Id = :cont.AccountId];
            
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                List<String> sendTo = new List<String>();
                for (Account acct : acctlist) {
                    for (Contact con : acct.Contacts) {
                        if (con.Email != null) {
                            sendTo.add(con.Email);
                        }
                    }
                }
                
                // Send an email if there are email addresses in the sendTo list
                if (!sendTo.isEmpty()) {
                    Messaging.SingleEmailMessage mails = new Messaging.SingleEmailMessage();
                    mails.setToAddresses(sendTo);
                    mails.setSubject('Welcome to Our Company');
                    mails.setReplyTo('vigneshdv21@gmail.com');
                    mails.setSenderDisplayName('Contact Created');
                    String body = 'Dear'; // You should add the recipient name here dynamically, e.g., 'Dear ' + recipientName;
                    mail.setHtmlBody(body);
            
                    Messaging.sendEmail(new List<Messaging.Email> {mail});
                }
            }
        }
    }