public with sharing class TrainingCode1 {
    public static void divicibleBy() {
        for(Integer i = 0 ; i <= 100 ; i++){
            if(Math.mod(i, 9) != 0){
                System.debug(i);
            }
        }
    }
    public static void pattern(){
        Integer num = 1;
        for(integer i=1;i<=5;i++)
    {
        string s=' ';
        for(integer j=1;j<=10;j++)
        {
            if(j<=i )
            {
                s = s + num;
                num++;
            }
            // else
            // {
            //      s = s + '_';
            // }
        }
        
        system.debug(s);
        
    }
    }
    public static void reverseWord(){
        String orignalName = 'Vignesh';
        String reversedName = orignalName.reverse();
        System.debug(reversedName);

    }
    
}