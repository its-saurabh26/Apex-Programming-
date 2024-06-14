// Ques. Make Two file CloseWon or CLoseLost on Account and Show all the 
// Account realted Opportunity to the field on Account Object.



 public class OpportunityCountvViaAccount {
 
    public static void updateAccountOpportunityCounts(List<Opportunity>newOpps,List<Opportunity>oldOpps){
      set<Id>accountIds = new set<Id>();
        
        if(newOpps != NULL){
            for(Opportunity opp:newOpps){
                if(opp.AccountId != NULL){
                    accountIds.add(opp.AccountId);
                }   
            }
        }
        if(oldOpps != NULL){
            for(Opportunity opp: oldOpps){
                if(opp.AccountId != NULL){
                    accountIds.add(opp.AccountId);
                }
            }
        }
        
        if(accountIds.isEmpty()){
            return;
        }
        
        List<Opportunity> opportunityRecord = [
            select Id,StageName,AccountId
            from Opportunity
            where AccountId IN :accountIds
        ];
        Map<Id,Integer>closeWonCountMap = new Map<Id,Integer>();
        Map<Id,Integer>closeLostCountMap = new Map<Id,Integer>();
        

        // Iterate through the opportunities and count the Closed Won and Closed Lost opportunities        
        for(Opportunity opp: opportunityRecord){
            if(opp.StageName == 'Closed Won'){
                if(closeWonCountMap.containsKey(opp.AccountId)){
                    closeWonCountMap.put(opp.AccountId,closeWonCountMap.get(opp.AccountId) + 1);
                }
                else{
                    //Initialize count to 1
                    closeWonCountMap.put(opp.AccountId,1);
                }
            }else if(opp.StageName == 'Closed Lost'){
                if(closeLostCountMap.containsKey(opp.AccountId)){
                     closeLostCountMap.put(opp.AccountId,closeLostCountMap.get(opp.AccountId)+1);
                }else{
                    //Initialize count to 1
                    closeLostCountMap.put(opp.AccountId,1);
                }
            }
         }
     // List to hold the accounts to be updated
     List<Account>accountsToUpdate = new List<Account>();
    
    
    // Iterate through the account IDs to create Account records to update
        for(Id accountId :accountIds){
       // Create a new Account instance with the current Account ID
            Account acc = new Account(Id = accountId);
            
            // Set the CloseWonOppTotalCount__c field
            if(closeWonCountMap.containsKey(accountId)){
                
                //Main
                acc.CloseWonOppToatalcount__c = closeWonCountMap.get(accountId); 
            }else{
                acc.CloseWonOppToatalcount__c = 0;
            }
            
            // Set the CloseLostOppTotalCount__c field 
            //Main
            if(closeLostCountMap.containsKey(accountId)){
                acc.CloseLostOppTotalCount__c = closeLostCountMap.get(accountId); 
            }else{
                acc.CloseLostOppTotalCount__c = 0;
            }
            
            accountsToUpdate.add(acc);
        } 
        
        // Update the accounts if there are any to update
        if(!accountsToUpdate.isEmpty()){
            update accountsToUpdate;
        }
    }  
}



// Trigger
trigger OpportuntiyTrigger on Opportunity (after insert, after update, after delete, after undelete) { 
    OpportunityCountvViaAccount.updateAccountOpportunityCounts(Trigger.new,Trigger.old);
       
}


Q2 Make Product filed in Opportunity and  if user add new product form opportunitie product then this product 
// should be autopopulate to the that field which we created on the Opportunity object 
// every time when new product is add then comma should be added automatically 

public class OpportunityProductHelper {
    public static void updateProductNames(List<OpportunityLineItem>newItems,Map<Id,OpportunityLineItem>oldLineItemsMap){
        
        set<Id>opportunityIds = new Set<Id>();
        
        for(OpportunityLineItem oppList:newItems){
            opportunityIds.add(oppList.OpportunityId);
        }
        
        // Add Opportunity IDs from old line items if trigger event is update or delete
        if(oldLineItemsMap != NULL){ 
            for(OpportunityLineItem opplist: oldLineItemsMap.values()){
                opportunityIds.add(opplist.OpportunityId);
            }
        }
        
        // Map to store Opportunity IDs and their corresponding Product Names        
        Map<Id,String>opportunityProductNames = new Map<Id,String>();
        
        // Query to get existing OpportunityLineItems
        List<OpportunityLineItem>relatedLineItems=[
            select OpportunityId,Product2.Name from OpportunityLineItem where OpportunityId IN :opportunityIds];
        
        for(OpportunityLineItem opplist: relatedLineItems){
            
            // Append product name to existing product names
            if(opportunityProductNames.containsKey(opplist.OpportunityId)){
                opportunityProductNames.put(opplist.OpportunityId,opportunityProductNames.get(opplist.OpportunityId) + ','+ opplist.Product2.Name);  
            } 
            else{
                // Initialize the product names string
                opportunityProductNames.put(opplist.OpportunityId,opplist.Product2.Name);
            }
        }
        
        // List to store Opportunities to be updated
        List<Opportunity>opportunitiesToUpdate = new List<Opportunity>();
        
        for(ID oppID:opportunityProductNames.keySet()){
            Opportunity opp = new Opportunity(Id = oppID,Product_Name__c = opportunityProductNames.get(oppId));   
            opportunitiesToUpdate.add(opp);
        }
        // update opportunity 
        if(!opportunitiesToUpdate.isEmpty()){
            update opportunitiesToUpdate;
        }
        
    } 
}


trigger OpportunityProductTrigger on OpportunityLineItem (before insert,after insert, after update, after delete) {
    
 OpportunityProductHelper.updateProductNames(Trigger.new, Trigger.oldMap);
}