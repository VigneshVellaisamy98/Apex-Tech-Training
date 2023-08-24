public with sharing class CountryWebServiceImpl {
    
    public static void FullCountryInfo(){
        CountryWebService.CountryInfoServiceSoap countryInfo = new CountryWebService.CountryInfoServiceSoap();
        CountryWebService.tCountryInfo countryInfoResponse = countryInfo.FullCountryInfo('US');
        CountryWebService.ArrayOftLanguage countryLanguages = countryInfoResponse.Languages;
        System.debug(countryInfoResponse.sISOCode);
        System.debug(countryInfoResponse.sName);
        System.debug(countryInfoResponse.sCapitalCity);
        System.debug(countryInfoResponse.sPhoneCode);
        System.debug(countryInfoResponse.sContinentCode);
        System.debug(countryInfoResponse.sCurrencyISOCode);
        System.debug(countryInfoResponse.sCountryFlag);
    }
    public static void getListOfCurrenciesByCode()
    {
        CountryWebService.CountryInfoServiceSoap countryInfo =  new CountryWebService.CountryInfoServiceSoap();
        CountryWebService.ArrayOftCurrency getArrayOftCurrency = countryInfo.ListOfCurrenciesByCode();
        List<CountryWebService.tCurrency> getTCurrency = getArrayOftCurrency.tCurrency;
        for(CountryWebService.tCurrency currentCurrencyCode : getTCurrency)
        {
            System.debug('Currency Code : '+currentCurrencyCode.sISOCode);
        }
    }
    public static void  ListOfCurrenciesByName(){
        CountryWebService.CountryInfoServiceSoap listOfCurrencies = new CountryWebService.CountryInfoServiceSoap();
        CountryWebService.ArrayOftCurrency getArrayOfTCurrency = listOfCurrencies.ListOfCurrenciesByName();
        list<CountryWebService.tCurrency> getCurrency = getArrayOfTCurrency.tCurrency;
        for(CountryWebService.tCurrency currentCurrencyCode : getCurrency)
        {
            System.debug('Currency Code : '+currentCurrencyCode.sISOCode);
        }
    }
    public static void ListOfLanguagesByCode(){
        CountryWebService.CountryInfoServiceSoap languageCode = new CountryWebService.CountryInfoServiceSoap();
        CountryWebService.ArrayOftLanguage arrayOftLanguage = languageCode.ListOfLanguagesByCode();
        List<CountryWebService.tLanguage> getLanguages = arrayOftLanguage.tLanguage;
        for(CountryWebService.tLanguage langCode : getLanguages){
            System.debug(langCode.sISOCode);
            System.debug(langCode.sName);
        }
    }
    public static void ListOfLanguagesByName(){
        CountryWebService.CountryInfoServiceSoap languageName = new CountryWebService.CountryInfoServiceSoap();
        CountryWebService.ArrayOftLanguage arrayOftLanguage = languageName.ListOfLanguagesByName();
        List<CountryWebService.tLanguage> getLanguages = arrayOftLanguage.tLanguage;
        for(CountryWebService.tLanguage langCode : getLanguages){
            System.debug(langCode.sISOCode);
            System.debug(langCode.sName);
        }
    }
    public static void getListOfCountryNamesByName()
    {
        CountryWebService.CountryInfoServiceSoap countryInfo =  new CountryWebService.CountryInfoServiceSoap();
        CountryWebService.ArrayOftCountryCodeAndName getCountryCodeAndName = countryInfo.ListOfCountryNamesByName();
        List<CountryWebService.tCountryCodeAndName> tCountryCodeAndName = getCountryCodeAndName.tCountryCodeAndName;
        for(CountryWebService.tCountryCodeAndName currentCountryCodeAndName : tCountryCodeAndName)
        {
            System.debug('Country Name : '+currentCountryCodeAndName.sName);
        }
    }
    public static void ListOfContinentsByName(){
        CountryWebService.CountryInfoServiceSoap listOfContinents =  new CountryWebService.CountryInfoServiceSoap();
        CountryWebService.ArrayOftContinent getArrayOfContinets = listOfContinents.ListOfContinentsByName();
        List<CountryWebService.tContinent> tContinentName = getArrayOfContinets.tContinent;
        for (countryWebService.tContinent continentName : tContinentName) {
            System.debug(continentName.sName);
        }
    }
    public static void ListOfContinentsByCode(){
        CountryWebService.CountryInfoServiceSoap listOfContinents =  new CountryWebService.CountryInfoServiceSoap();
        CountryWebService.ArrayOftContinent getArrayOfContinets = listOfContinents.ListOfContinentsByCode();
        List<CountryWebService.tContinent> tContinentName = getArrayOfContinets.tContinent;
        for (countryWebService.tContinent continentName : tContinentName) {
            System.debug(continentName.sCode);
        }
    }
    public static void CountryCurrency(){
        CountryWebService.CountryInfoServiceSoap getCurrency = new CountryWebService.CountryInfoServiceSoap();
        CountryWebService.tCurrency currencyName = getCurrency.CountryCurrency('US');
        System.debug(currencyName.sISOCode);
    }

    public void countryLanguages()
    {
        CountryWebService.CountryInfoServiceSoap countryLanguage =new CountryWebService.CountryInfoServiceSoap();
        CountryWebService.ArrayOftLanguage getCode = countryLanguage.ListOfLanguagesByCode();
        CountryWebService.tLanguage languageResponse = getCode.tLanguage.get(0);
        System.debug(languageResponse.sISOCode);
        System.debug(languageResponse.sName);
    }
    public static void CountryName(){
        CountryWebService.CountryInfoServiceSoap counName =new CountryWebService.CountryInfoServiceSoap();
        System.debug(counName.CountryName('IN'));
    }
    public static void CountryIntPhoneCode(){
       CountryWebService.CountryInfoServiceSoap counyName =new CountryWebService.CountryInfoServiceSoap();
       System.debug(counyName.CountryIntPhoneCode('IN'));
    }
    public static void CurrencyName(){
        CountryWebService.CountryInfoServiceSoap counam =new CountryWebService.CountryInfoServiceSoap();
        System.debug(counam.CurrencyName('INR'));
    }
    public static void LanguageISOCode(){
        CountryWebService.CountryInfoServiceSoap counlan =new CountryWebService.CountryInfoServiceSoap();
        System.debug(counlan.LanguageISOCode('TAMIL'));
    }
    public static void CapitalCity(){
        CountryWebService.CountryInfoServiceSoap councap =new CountryWebService.CountryInfoServiceSoap();  
        System.debug(councap.CapitalCity('IN'));
    }
    public static void  LanguageName(){
        CountryWebService.CountryInfoServiceSoap langNam=new CountryWebService.CountryInfoServiceSoap();
        System.debug(langNam.LanguageName('ENG'));
    }
    public static void CountryISOCode(){
        CountryWebService.CountryInfoServiceSoap counIso =new CountryWebService.CountryInfoServiceSoap();
        System.debug(counIso.CountryISOCode('IND'));
    }

}