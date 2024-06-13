[7:42 AM] Saurabh Rajak
trigger AccountTrigger on Account (before insert) {

    for(Account acc: Trigger.new){

        if(acc.ShippingStreet == null && acc.BillingStreet != null){

            acc.ShippingStreet = acc.BillingStreet;    

        }

        if (acc.ShippingCity == null && acc.BillingCity != null) {

            acc.ShippingCity = acc.BillingCity;

        }

        if (acc.ShippingState == null && acc.BillingState != null) {

            acc.ShippingState = acc.BillingState;

        }

        if (acc.ShippingPostalCode == null && acc.BillingPostalCode != null) {

            acc.ShippingPostalCode = acc.BillingPostalCode;

        }

        if (acc.ShippingCountry == null && acc.BillingCountry != null) {

            acc.ShippingCountry = acc.BillingCountry;

        }

    }

}
 





trigger ContactTrigger on Contact (before insert,before update ) {

    if(Trigger.isInsert){

        for (Contact con : Trigger.new) {

            if (con.Salutation != null) {

                if (con.Salutation == 'Mr.') {

                    con.Gender__c = 'Male';

                } else if (con.Salutation == 'Mrs.' || con.Salutation == 'Ms.') {

                    con.Gender__c = 'Female';

                }

            }

        }

    }





    if(Trigger.isUpdate||Trigger.isBefore){

        for(Contact co: Trigger.new){

            if(co.Country__c == 'India' && co.Country_Code__c!= '+91' ){

                co.Country_Code__c.adderror('Country code is not Matched :');

            }

        }

    }

}
 

trigger OpportuntiyTrigger on Opportunity (before insert,before update) {
 
    for(Opportunity opp: Trigger.new){

        if(opp.Amount>=100000 && opp.Manager_Approval__c =='Reject'){

           opp.Manager_Approval__c.adderror('Approve the Record  By manager');

        }

    }


}