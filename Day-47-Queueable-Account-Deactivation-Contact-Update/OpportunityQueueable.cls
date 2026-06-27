public with sharing class OpportunityQueueable implements Queueable{
    Set<Id> accIds = new Set<Id>();

    public OpportunityQueueable(Set<Id> accIds)
    {
        this.accIds = accIds;
    }

    public void execute(QueueableContext context)
    {
        List<Contact> con = [SELECT Id,Do_Not_Contact__c,MailingCity,AccountId FROM Contact WHERE AccountId IN : accIds];

        for(Contact c : con)
        {
            c.Do_Not_Contact__c = true;

        }

        if(!con.isEmpty())
        {
            update con;
        }
    }
}
