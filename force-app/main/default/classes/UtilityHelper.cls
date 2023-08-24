public with sharing class UtilityHelper {
//     public static String generateRandomString() {
//     Integer ranNum = Integer.valueOf((Math.random() *100));
//     System.debug(ranNum);
//     return ranNum;
// }



public static Boolean validateLoggedInUserHasCreateAccessToObject(String objName) {

    // Check if the current user has create access on the specified object
    // Get the SObjectType of the object
    Schema.SObjectType objType = Schema.getGlobalDescribe().get(objName);//Schema which is used to perform metadata operations.
    //SObjtype used to store the description of a sf object
    //if the current user has create permission on the object
        if (objType != null && objType.getDescribe().IsCreateable()) {
            system.debug('This User have access to create an object');
            // The user has create access on the object
            return objType.getDescribe().IsCreateable();
        }
    // If the object does not exist or the user doesn't have create access
    System.debug('This User Not Have an Access to Create an Object');
    return false;
}

}
