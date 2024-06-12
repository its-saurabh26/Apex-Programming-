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