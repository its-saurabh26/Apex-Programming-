Q-1 Find all the Account where at least one context ext.
sol.   select Id,Name from Account 
       where Id IN (select AccountId from contact) 


Q-2 Write SOQL Query to get the 10 recentview records.   
sol.   select Id,Name from RecentlyViewed
       order by LastViewedDate DESC
       Limit 10    

Q-3  Find the opportunity with the due date in next 7 days
sol.    select Id,Name from Opportunity
        where CloseDate = NEXT_N_DAYS:7 


Q-4 Find the all opportunity with no action in past 30 days.
sol.   SELECT Id, Name, CloseDate
       FROM Opportunity 
       WHERE LastActivityDate < LAST_N_DAYS:30

Q-5 Find opportunity with close won stage and Account created one month ago.
sol- select Id,Name from Opportunity 
     where StageName = 'Closed Won' AND Account.CreatedDate = LAST_N_MONTHS:1 
       