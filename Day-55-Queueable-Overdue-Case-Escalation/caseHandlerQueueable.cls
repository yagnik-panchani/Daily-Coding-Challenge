public with sharing class caseHandlerQueueable implements Queueable{
    Set<Id> caseIds = new Set<Id>();
    public caseHandlerQueueable(Set<Id> caseIds)
    {
        this.caseIds = caseIds;

    }
    public void execute(QueueableContext context)
    {   List<Case> caseList = new List<Case>();
        List<Case> cases = [SELECT Id,Escalated__c,Priority FROM Case WHERE Id IN : caseIds];
        if(!cases.isEmpty())
        {
            for(Case c : cases)
            {
                c.Escalated__c = true;
                c.Priority = 'High';
                caseList.add(c);
            }
        }

        if(!caseList.isEmpty())
        {
            update caseList;
        }
    }
}
