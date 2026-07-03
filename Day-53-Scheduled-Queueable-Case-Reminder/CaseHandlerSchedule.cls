public with sharing class CaseHandlerSchedule implements Scheduleable

{
    public void execute(ScheduleableContext sc)
    {   Set<Id> caseIds = new Set<Id>();
        List<Case> cases = [SELECT Id,Priority,Status,OwnerId FROM Case WHERE Priority = 'High' AND Status != 'Closed'];
        for(Case c : cases)
        {
            caseIds.add(c.Id);
        }

     System.enqueueJob(new TskHandlerBatch(caseIds));
    }
}
