public with sharing class AccountController {
    public static void getData(List<Account> acc,Map<Id,Account> oldmap)
   {    Set<Id> accIds = new Set<Id>();
        if(!acc.isEmpty())
        {
            for(Account a : acc)
            {
                if(a.Status__c == 'Inactive' && (a.Status__c != oldmap.get(a.Id).Status__c))
                {
                     accIds.add(a.Id);
                }
            }
        }

        if(!accIds.isEmpty())
        {
            System.enqueueJob(new OpportunityQueueable(new Set<Id>(accIds)));
        }

   }

}
