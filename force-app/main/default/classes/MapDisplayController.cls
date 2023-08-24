// Author : Vignesh Vellaisamy  
// Created Date : 23-08-2023 03.10pm
// Description : this class will help us to get the address form the account object and it'll help to get the location in our map

public with sharing class MapDisplayController {
    @AuraEnabled(cacheable = true)
    public static List<AddressData> fetchAddresses(){

        List<AddressData> addresses = new List<AddressData>();

     //need to create two custom field in the account object , that are BillingLatitude & BillingLongitude.   
        List<Account> accountWithAddress = [SELECT Id , Name , BillingStreet , BillingCity , BillingState ,
                                            BillingPostalCode , BillingCountry , BillingLatitude , 
                                            BillingLogitude
                                            FROM Account 
                                            WHERE BillingLatitude != null 
                                            AND BillingLogitude != null
                                            LIMIT 10];

        for(Account account : accountWithAddress){

            AddressData address = new AddressDate();
            address.label = account.Name;
            address.latitude = account.BillingLatitude;
            address.longitude = account.BillingLongitude;
            addresses.add(address);
        }

        return addresses;      
       
    }

    public class AddressData{
        @AuraEnabled
        public String label{
            get ;
            set;
        }

        @AuraEnabled
        public Decimal latitude{
            get;
            set;
       }

       @AuraEnabled
       public Decimal longitude{
            get;
            set;
       }
    }
}