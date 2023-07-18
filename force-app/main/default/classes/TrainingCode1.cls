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
    // public static void reverseWord(){
    //     String orignalName = 'Vignesh';
    //     String reversedName = orignalName.reverse();
    //     System.debug(reversedName);

    // }
    public static void primeNumber(){
        for(Integer prime = 1;prime<=100;prime++){
            Integer count = 0;
            for(Integer num = prime;num>=1; num-- ){
                if(Math.mod(prime, num)==0){
                    count++;
                }
                if(count==2 || count==1){
                    System.debug(prime);
                }
                else{
                    System.debug('Not a primeNumber');
                }
            }
        }
    }
    
}