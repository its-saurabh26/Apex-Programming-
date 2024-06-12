public class ApexFunctions {
    // Write a apex function which accepts a list of integer and return a list in ascending order
    public static List<Integer> sortList(List<Integer> listData) {
        Integer n = listData.size();
        for (Integer i = 0; i < n - 1; i++) {
            for (Integer j = i + 1; j < n; j++) {
                if (listData[i] > listData[j]) {
                    Integer temp = listData[i];
                    listData[i] = listData[j];
                    listData[j] = temp;
                }
            }
        }
        return listData;
    }
    
    
    
    
//Write a apex function which accepts a list of integer 
//and return even and odd values in maps. Example -> {'Even':[2,4,6,8],'Odd':[1,3,5,7]}
    
    public static Map<String,List<Integer>>EvenOdd(List<Integer>inputList){
        
       Map<String, List<Integer>> resultMap = new Map<String, List<Integer>>();
        List<Integer> evenList = new List<Integer>();
        List<Integer> oddList = new List<Integer>();
        
        for(Integer num: inputList){
            if(Math.mod(num,2) == 0){
               evenList.add(num); 
            }
            else{
              oddList.add(num);  
            }
        }
        resultMap.put('Even', evenList);
        resultMap.put('Odd', oddList);  
        
        return resultMap;
    }  
    
}

   
// Write an apex function which accepts a date and returns boolean based on leap year
    public static boolean isLeapYear(Integer year){
    return (Math.mod(year, 400) == 0) || (Math.mod(year, 4) == 0 && Math.mod(year, 100) != 0);     
        
    }

   
// write an apex function which accept a string and return the reverse order of the string    
    public static String reveseString(string inputString){
        String outputString = '';
        
        for (Integer i = inputString.length() - 1; i >= 0; i--) {
            outputString += inputString.substring(i, i + 1);
        }
        return outputString;
        
    }
    
    
    public static String reveseStringTwoPointer(string inputString){
        List<String> charArray = new List<String>();
        
         // Convert the input string to a character array
        for (Integer i = 0; i < inputString.length(); i++) {
            charArray.add(inputString.substring(i, i + 1));
        }
        
        Integer left = 0;
        Integer right = charArray.size()-1;
        
        while(left<right){
            String temp = charArray[left];
            charArray[left] = charArray[right];
            charArray[right] = temp;
            left++;
            right--;
        }
        String reverseString = '';
        for(String charater:charArray){
            reverseString += charater;
        }
        return reverseString;
    }





// write a apex function which will accept a list of string and return
 // character concatenating all elements of list    
    public static string concatenateStrings(List<string>inputList){
        
        String concatenatedString = '';
        
        for (String str : inputList) {
            concatenatedString += str;
        }
        return concatenatedString;
    }





//write an apex function which will accept a integer and return a string of random unique character
    
    public static String generateRandomString(Integer inputIntege){
        String Allcharacter ='abcdefghijklmnopqrstuvwxyz';
        String randomString = '';    
       
    
        for(Integer i =0; i<inputIntege; i++){
            Integer randomIndex = (Integer)Math.floor(Math.random() * Allcharacter.length());
            randomString += Allcharacter.substring(randomIndex, randomIndex + 1);
        }
        return randomString;
    }








// if Method is statc than don't need to create instance variable.
// anonymous Window code.

List<Integer> numbers = new List<Integer>{6, 3, 1, 4, 2};
List<Integer> sortedNumbers = ApexFunctions.sortList(numbers);
//Log the output
System.debug('Sorted Numbers: ' + sortedNumbers);





List<Integer>numbers = new List<Integer>{1,2,3,4,5,6,7,8};
Map<String,List<Integer>>result = ApexFunctions.EvenOdd(numbers);
// Log the output
System.debug('Even Numbers: ' + result.get('Even'));
System.debug('Odd Numbers: ' + result.get('Odd'));






Integer year1 = 2020;
Integer year2 = 2021;
Integer year3 = 1900;
Integer year4 = 2020;
Integer year5 = 2024;

Boolean result1 = ApexFunctions.isLeapYear(year1);
Boolean result2 = ApexFunctions.isLeapYear(year2);
Boolean result3 = ApexFunctions.isLeapYear(year3);
Boolean result4 = ApexFunctions.isLeapYear(year4);
Boolean result5 = ApexFunctions.isLeapYear(year5);

// Log the output
System.debug('Year ' + year1 + ' is a leap year: ' + result1);
System.debug('Year ' + year2 + ' is a leap year: ' + result2);
System.debug('Year ' + year3 + ' is a leap year: ' + result3);
System.debug('Year ' + year4 + ' is a leap year: ' + result4);
System.debug('Year ' + year5 + ' is a leap year: ' + result5);








// Sample string to test
String testString = 'hello world';
String reversedString = ApexFunctions.reveseString(testString);

//Log the Result
System.debug('Original String: ' + testString);
System.debug('Reversed String: ' + reversedString);

//Two pointer apporach 
String testString = 'hello world';
String reversedString = ApexFunctions.reveseStringTwoPointer(testString);
//Log the Result
System.debug('Original String: ' + testString);
System.debug('Reversed String: ' + reversedString);



List<String> stringList = new List<String>{'hello', ' ', 'world', '!', ' Welcome', ' to', ' Apex'};
String concatenatedString  =  ApexFunctions.concatenateStrings(stringList);
// Log the ans
System.debug('Concatenated String: ' + concatenatedString);




String randomString = ApexFunctions.generateRandomString(5);
// Log the ans
System.debug('Random String: ' + randomString);
