public with sharing class OpportunityHandler {

    public static void opportunityChecker(List<Opportunity> oppList,
                                          Map<Id, Opportunity> oldMap) {

        Set<Id> oppIds = new Set<Id>();

        for (Opportunity opp : oppList) {

            if (opp.StageName == 'Closed Won' &&
                oldMap.get(opp.Id).StageName != 'Closed Won') {

                oppIds.add(opp.Id);
            }
        }

        if (!oppIds.isEmpty()) {
            System.enqueueJob(new OpportunityTaskQueueable(oppIds));
        }
    }
}
