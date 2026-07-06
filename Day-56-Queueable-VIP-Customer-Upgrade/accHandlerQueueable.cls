public with sharing class accHandlerQueueable implements Queueable{
    Set<Id> accIds = new Set<Id>();
    public accHandlerQueueable(Set<Id> accIds)
    {
        this.accIds = accIds;

    }

    public void execute(QueueableContext context)
    {
        List<Account> acc = [SELECT Id,Customer_Type__c FROM Account WHERE Id IN : accIds];
        if(!acc.isEmpty())
        {
            for(Account a : acc)
            {
                a.Customer_Type__c = 'VIP';
            }
            update acc;
        }

    

    }
    
}
