public class Soql { 
    public static void  Main(){
        Query();
        
    }
    public static void Query(){
        List<Account>NameOfAcconts = [select Name from Account];
     
        
        for(Account acc : NameOfAcconts){
            System.debug('Name of Account is ::' + acc);
        }
    }
    
}

 // if Method is statc than don't need to create instance variable.
 // anonymous Window code.
  
Soql.Main();
 
