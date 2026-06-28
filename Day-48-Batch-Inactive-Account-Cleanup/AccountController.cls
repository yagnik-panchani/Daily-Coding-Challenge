public with sharing class AccountController implements Database.Batchable<Account>{
    public Database.QueryLocator start(Database.BatchableContext bc)
    {
        return Database.getQueryLocator('SELECT Id,Status__c,Description FROM Account WHERE Status__c = 'Inactive'');

    }

    public void execute(Database.BatchableContext bc,List<Account> record)  
    {
        for(Account a : record)
        {
            a.Description = 'Archived on '+Date.Today();
        }

        update record;
    }


    public void finish(Database.BatchableContext bc)
    {
        System.debug('Feched the Successfully');
    }
}
