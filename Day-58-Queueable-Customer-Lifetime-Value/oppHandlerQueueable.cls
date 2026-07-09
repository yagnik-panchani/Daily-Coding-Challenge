public with sharing class oppHandlerQueueable implements Queueable{
    Set<Id> accIds = new Set<Id>();
    public oppHandlerQueueable(Set<Id> accIds)
    {
        this.accIds = accIds;

    }

    public void execute(QueueableContext context)
    {
        List<AggregateResult> opp = [SELECT AccountId,SUM(Amount) amount FROM Opportunity 
        WHERE StageName = 'Closed Won' AND AccountId IN : accIds GROUP BY AccountId];
        Map<Id,Decimal> accTotals = new Map<Id,Decimal>();
        
        List<Account> acc = new List<Account>();
            for(AggregateResult r : opp)
            {
                accTotals.put((Id)r.get('AccountId'),(Decimal)r.get('amount'));
            }

           for(Account a : acc)
           {
            if(accTotals.containsKey(a.Id))
    {
        a.Customer_Lifetime_Value__c =
            accTotals.get(a.Id);
    }
           }
        a

        update acc;
    }

    
}
