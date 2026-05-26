public class OppTrgHandler {

    public static void trgmethod(
        List<Opportunity> oppList,
        Map<Id, Opportunity> oldMap
    ) {

        Set<Id> accIds = new Set<Id>();


        for(Opportunity opp : oppList) {

            if(
                oldMap.get(opp.Id).StageName !=
                opp.StageName &&
                opp.StageName == 'Closed Won'
            ) {

                accIds.add(opp.AccountId);
            }
        }


        List<Account> updatedAcc =
            new List<Account>();

        List<Task> taskList =
            new List<Task>();


        for(Account acc : [

            SELECT Id,
                   OwnerId,
                   Customer_Level__c,
                   (
                       SELECT Id,
                              StageName
                       FROM Opportunities
                       WHERE StageName = 'Closed Won'
                   )
            FROM Account
            WHERE Id IN :accIds
        ]) {

            Integer totalWonOpps =
                acc.Opportunities.size();


            if(totalWonOpps >= 1 &&
               totalWonOpps <= 2) {

                acc.Customer_Level__c =
                    'Silver';
            }

            else if(totalWonOpps >= 3 &&
                    totalWonOpps <= 5) {

                acc.Customer_Level__c =
                    'Gold';
            }

            else if(totalWonOpps > 5) {

                acc.Customer_Level__c =
                    'Platinum';


                Task t = new Task();

                t.Subject =
                    'VIP Customer Follow Up';

                t.Status =
                    'Not Started';

                t.Priority =
                    'High';

                t.OwnerId =
                    acc.OwnerId;

                taskList.add(t);
            }


            updatedAcc.add(acc);
        }


        List<Opportunity> siblingOpps = [

            SELECT Id,
                   Description
            FROM Opportunity
            WHERE AccountId IN :accIds
        ];


        for(Opportunity opp : siblingOpps) {

            opp.Description =
                'Priority Customer Account';
        }


        if(!updatedAcc.isEmpty()) {

            update updatedAcc;
        }

        if(!taskList.isEmpty()) {

            insert taskList;
        }

        if(!siblingOpps.isEmpty()) {

            update siblingOpps;
        }
    }
}
