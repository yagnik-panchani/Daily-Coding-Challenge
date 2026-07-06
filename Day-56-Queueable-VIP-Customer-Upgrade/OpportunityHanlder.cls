public with sharing class OpportunityHanlder 

{
   public static void CaseUpdate(List<Opportunity> oppList,Map<Id,Opportunity> oldmap)
   {  Set<Id> accIds = new Set<Id>();

      if(!oppList.isEmpty()){
        for(Opportunity o : oppList)
        {
            if(o.StageName != oldmap.get(o.Id).StageName && o.Amount >= 1000000 && o.StageName == 'Closed Won')
            { accIds.add(o.AccountId);

            }
        }
      }

      if(!accIds.isEmpty())
      {
        System.enqueueJob(new accHandlerQueueable(accIds));
      }

   }
}
