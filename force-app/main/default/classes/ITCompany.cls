public with sharing class ITCompany {
    public ITCompany() {

    }
    public static List<Human> onBoardEmployees(){
        List<Human> allHumans = new  List<Human>();

        Human create1 = new Human('Stacy' , 'gwenstacy@gmail.com', 23 , 'female');
        allHumans.add(create1);

        Human create2 = new Human('Parker' , 'peterparker@gmail.com' , 25 , 'male');
        allHumans.add(create2);

        Human create3 = new Human('ben' , 'uncleben@gmail.com' , 50 , 'male');
        allHumans.add(create3);

        Human create4 = new Human('May' , 'auntmay@gmail.com' , 45, 'female');
        allHumans.add(create4);

        Human create5 = new Human('Wick' , 'johnathanwick@gmail.com' , 45 , 'male');
        allHumans.add(create5);

        Human create6 = new Human('winston' , 'continentalwinstion@gmail.com' , 65 ,  ' male');
        allHumans.add(create6);

        Human create7 = new Human('pav' , 'pavkiller@gmail.com' , 27 , 'female');
        allHumans.add(create7);

        Human create8 = new Human('athreya' , 'akalaivan@gmail.com' , 24 , 'male');
        allHumans.add(create8);

        Human create9 = new Human('nesika' ,  'aaradhyanesi@gmail.com' , 26 , 'female');
        allHumans.add(create9);

        Human create10 = new Human('aardhya' , 'nesiaradhya@gmail.com' , 2 , 'female');
        allHumans.add(create10);

        Human create11 = new Human('white' , 'walterwhite@gmail.com', 55 ,  'male');
        allHumans.add(create11);

        Human create12 = new Human('martha' , 'marthawindon@gmail.com' , 24 , 'female');
        allHumans.add(create12);

        Human create13 = new Human('alphonse' , 'alphonse@gmail.com' , 43 , 'male');
        allHumans.add(create13);

        Human create14 = new Human('evans' , 'evans@gmail.com' , 1600 , 'male');
        allHumans.add(create14);

        Human create15 = new Human('wayne', 'waynenterprise@gmail.com' , 45 , 'male');
        allHumans.add(create15);

        return allHumans;
    }

    public static List<Human> identifySuperHuman(){
        List<Human> storeOnBoardEmpValues = onBoardEmployees();
        List<Human> weeklySuperHumanUpdates = new List<Human>();

        String lastWorkingDayOfWeek = ITCompanyUtility.giveMeTheDayToday();
        for (Human totalHumans : storeOnBoardEmpValues) {
            if (lastWorkingDayOfWeek == 'Fri') {
                Human superHumanUpdates = new Human(totalHumans.lastName , totalHumans.email , totalHumans.age ,totalHumans.genderSex);
                    if(superHumanUpdates != null){
                        if     (  totalHumans.firstName == 'A' || totalHumans.lastName == 'A'
                              ||  totalHumans.firstName == 'M' || totalHumans.lastName == 'M' 
                              ||  totalHumans.firstName == 'D' || totalHumans.lastName == 'D'
                              ||  totalHumans.firstName == 'P' || totalHumans.lastName == 'P'
                              ||  totalHumans.firstName == 'V' || totalHumans.lastName = 'V')
                               {
                                superHumanUpdates.activateSuperHumanCapability();
                                weeklySuperHumanUpdates.add(superHumanUpdates);
                            
                        }
                    }                
            }
        }
        return weeklySuperHumanUpdates;
    }
}