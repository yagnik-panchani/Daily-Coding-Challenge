public with sharing class AccountController implements Database.Batchable<Account>{
    public Database.QueryLocator start(Database.BatchableContext bc)
    {
        return Database.getQueryLocator('SELECT Id,AnnualRevenue,Loyalty_Status__c FROM Account WHERE AnnualRevenue != null ');
    }

    public void execute(Database.BatchableContext bc,List<Account> acc)
    {
        for(Account a : acc)
        {
            if(a.AnnualRevenue >= 1000000)
            {
                a.Loyalty_Status__c = 'Platinum';
            }
            else if(a.AnnualRevenue >= 500000)
            {
                a.Loyalty_Status__c = 'Gold';
            }
            else
            {
                a.Loyalty_Status__c = 'Silver';
            }
        }

        update acc;
    }


    public void finish(Database.BatchableContext bc)
    {
        System.debug('Batch Job Successfully finished');
    }
}
