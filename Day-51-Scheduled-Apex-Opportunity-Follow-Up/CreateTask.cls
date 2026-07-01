public with sharing class CreateTask implements Schedulable{
   
   
    public void execute(SchedulableContext sc)
    {
        List<Opportunity> oppList = [SELECT Id,StageName,OwnerId FROM Opportunity WHERE StageName = 'Prospecting'];
        List<Task> task = new List<Task>();
        for(Opportunity o : oppList)
        {
            Task t = new Task();
            t.Subject = 'Follow Up Prospect';
            t.Priority = 'Normal';
            t.Status = 'Not Started';
            t.OwnerId = o.OwnerId;
            t.WhatId = o.Id;
            task.add(t);

        }

        if(!task.isEmpty())
        {
            insert task;
        }
    }
   }
