public with sharing class ContactHandlerBatch implements Database.batchable<Contact>{
public Database.QueryLocator start(Database.BatchableContext bc)
{
return Database.getQueryLocator('SELECT Id,Status__c,Description FROM Contact WHERE Status__c = false');

}   

public void execute(Database.batchableContext bc,List<Contact> conList)

{
for(Contact c : conList)
{
    c.Descriptipon = 'Archived by nightly cleanup';
}

update conList;
}

public void finish(Database.BatchableContext bc)
{
    System.System.debug('Nightly Contact Cleanup Completed');
}
   
   }
