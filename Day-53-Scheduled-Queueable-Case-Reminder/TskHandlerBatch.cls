public with sharing class TskHandlerBatch implements Queueable{

    public void execute(QueueableContext context){

    Set<Id> id = new Set<Id>();

    public TskHandlerBatch(Set<Id> ids)
    {
        this.id = ids;
    }
    List<Task> tsk = new List<Task>();
    List<Case> ccc = [SELECT Id,OwnerId FROM Case WHERE Id IN : id];
    if(!ccc.isEmpty())
    {
        for(Case c : ccc)
        {
            Task t = new Task();
            t.OwnerId = c.OwnerId;
            t.WhatId = c.Id;
            t.Status = 'Not Started';
            t.Priority = 'High';
            t.Subject = 'High Priority Case Follow-up';
           tsk.add(t);
        }
    }

    if(!tsk.isEmpty())
    {
        insert tsk;
    }
   }
}
