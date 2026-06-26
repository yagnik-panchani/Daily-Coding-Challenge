public with sharing class OpportunityHandler {

    public static void getData(
        List<Opportunity> oppList,
        Map<Id, Opportunity> oldMap
    ) {

        List<Id> oppIds = new List<Id>();

        for(Opportunity opp : oppList)
        {
            if(
                opp.Discount__c > 30 &&
                opp.Approval_Status__c == 'Pending' &&
                (
                    oldMap.get(opp.Id).Discount__c != opp.Discount__c ||
                    oldMap.get(opp.Id).Approval_Status__c != opp.Approval_Status__c
                )
            )
            {
                oppIds.add(opp.Id);
            }
        }

        if(!oppIds.isEmpty())
        {
            System.enqueueJob(
                new OpportunityQueueable(oppIds)
            );
        }
    }
}
