public with sharing class AccountController {
    
    public static void getData(List<Case> caseList,Map<Id,Case> oldMap)
    {   List<Id> caseId = new List<Id>();
        if(!caseList.isEmpty())
        {   
            for(Case c : caseList)
            {
                if((c.Status != oldMap.get(c.Id).Status) && c.Status == 'Closed')
                {
                       caseId.add(c.Id);
                }
            }

            if(!caseId.isEmpty())
            {
                updateRelatedTasks(caseId);
            }
        }

    }
    @future
        public static void updateRelatedTasks(List<Id> csId)
        {
            List<Task> tsk = [SELECT WhatId,OwnerId,Status,Subject FROM Task WHERE WhatId IN : csId];
            List<Task> updatedtsk = new List<Task>();
            for(Task t : tsk)
            {
                t.Status = 'Completed';
                updatedtsk.add(t);
            }

            if(!updatedtsk.isEmpty())
            {
                update updatedtsk;
            }
}
