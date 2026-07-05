public with sharing class OpportunityHanlder 

{
   public static void CaseUpdate(List<Case> caseList,Map<Id,Case> oldmap)
   {Set<Id> caseIds = new Set<Id>();
    if(!caseList.isEmpty())
    {
        for(Case c : caseList)
        {
            if(c.Due_Date__c != oldmap.get(c.Id).Due_Date__c ||
               c.Status != oldmap.get(c.Id).Status ||
               c.Escalated__c != oldmap.get(c.Id).Escalated__c)
            {
                if(c.Due_Date__c < Date.today() && c.Status != 'Closed' && c.Escalated__c == false)
                {
                    caseIds.add(c.Id);
                }
            }
        }
    }

    if(!caseIds.isEmpty())
    {
        System.enqueueJob(new caseHandlerQueueable(caseIds));
    }
   }
}
