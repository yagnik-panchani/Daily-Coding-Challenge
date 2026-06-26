public with sharing class OpportunityQueueable
implements Queueable
{

    private List<Id> oppIds;

    public OpportunityQueueable(
        List<Id> oppIds
    )
    {
        this.oppIds = oppIds;
    }

    public void execute(
        QueueableContext context
    )
    {

        List<Opportunity> oppList =
        [
            SELECT Id,
                   Approval_Status__c,
                   Approved_Date__c
            FROM Opportunity
            WHERE Id IN :oppIds
        ];

        for(Opportunity opp : oppList)
        {
            opp.Approval_Status__c = 'Approved';

            opp.Approved_Date__c =
                Date.today();
        }

        if(!oppList.isEmpty())
        {
            update oppList;
        }

    }

}
