public class AccountBillingAddressHelper {
    public static String getBillingAddress(Id accountId) {
        String billingAddress = '';
        
        // Query the Account's billing address fields
        Account acc = [SELECT BillingStreet, BillingCity, BillingState, BillingPostalCode, BillingCountry
                       FROM Account
                       WHERE Id = :accountId];
        
        // Construct the billing address string
        if (acc.BillingStreet != null) {
            billingAddress += acc.BillingStreet + '\n';
        }
        if (acc.BillingCity != null) {
            billingAddress += acc.BillingCity + ', ';
        }
        if (acc.BillingState != null) {
            billingAddress += acc.BillingState + ' ';
        }
        if (acc.BillingPostalCode != null) {
            billingAddress += acc.BillingPostalCode + '\n';
        }
        if (acc.BillingCountry != null) {
            billingAddress += acc.BillingCountry;
        }
        
        return billingAddress;
    }
}
