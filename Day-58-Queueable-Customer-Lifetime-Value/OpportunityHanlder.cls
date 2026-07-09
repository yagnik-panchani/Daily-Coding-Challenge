public with sharing class OpportunityHanlder 

{
   public static void OppUpdate(List<Opportunity> oppList,Map<Id,Opportunity> oldmap)
{   Set<Id> accIds = new Set<Id>();

     if(!oppList.isEmpty())
     {
        for(Opportunity o : oppList)
        {
            if(o.StageName == 'Closed Won' && o.StageName != oldmap.get(o.Id).StageName)
            {
                    accIds.add(o.AccountId);
            }
        }
     }

     if(!accIds.isEmpty())
     {
        System.enqueueJob(new oppHandlerQueueable(accIds));
     }
}
}
