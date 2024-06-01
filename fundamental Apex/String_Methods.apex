public class collections {

    public void StringMethod(){
        //charAt();
        String MyString  = 'Hello world';
        //system.debug('charater at Index:: '+ MyString.charAt(2));
        
        
        //contains();
        String str  = 'SalesForce';
        String str2 = 'Sales';
        Boolean flag = str.contains(str2);
        //System.debug('contains or not:: '+ flag);
       
        
        //equals();
        String Mystring1 = 'Sam';
        String Mystring2 = 'Sam';
        Boolean  result = Mystring.equals(Mystring2);
        //System.debug('Equal String:: '+ result);
        
        
        //equalsIgnoreCase();
        String Mystring3 = 'Name';
        String Mystring4 = 'name';
        Boolean result1 = Mystring3.equalsIgnoreCase(Mystring4);
        //System.debug('equalIgnoreCase funcion result:: '+ result1);        

        
        //remove();
        String Mystring5 = 'This is my company Plus91 Labs';
        String stringToRemoiave = 'is my';
        string resultantString  = Mystring5.remove(stringToRemoiave);
        //System.debug('After removal string Remove:: ' + resultantString);
        
        
        //Split();
        string con1 = 'Plus91 Labs';
        List<String>res = con1.split(' ');
        //System.debug('Splitinf the String:: '+ res);
       
        
        // substring();
        String s1 = 'Plus91 Labs Gwaliior';
        String res1 = s1.substring(0,6);
       // System.debug('Substring Method:: '+ res1);
       
        
        //trim();
        String s2 = '    Plus91 Labs   ';
        string r = s2.trim();
       // System.debug('whitespace omitted::' + r);
        
        
        //toUpperCase();
        String up = 'kevin';
        string res2 = up.toUpperCase();
        //System.debug('Uppercase Letters String:: '+ res2);
        
        
        
        // Ascii charater charAt();
        String str7 = 'CRSINFOSOLUTIONS'; 
        // System.debug('>>>>>>>  '+ str7.charAt(2)); 
        
    }
    
}

/* anonymous Window code.  
 
 collections obj  = new collections();
 obj.StringMethod();

*/