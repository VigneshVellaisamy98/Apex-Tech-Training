public with sharing class ITCompanyUtility {
    public static String giveMeTheDayToday()
    {
        Datetime todayDate = Datetime.now();
        String lastWorkingDayOfWeek = todayDate.format('EEE');
        return lastWorkingDayOfWeek;
    }
}