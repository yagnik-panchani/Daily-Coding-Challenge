public class OppTrgHandler {

    public static void trgmethod(
        List<Opportunity> oppList,
        Map<Id, Opportunity> oldMap
    ) {

        Set<Id> accIds = new Set<Id>();


        // Detect Closed Won Opportunities
        for(Opportunity opp : oppList) {

            if(
                oldMap.get(opp.Id).StageName !=
                opp.StageName &&
                opp.StageName == 'Closed Won'
            ) {

                if(opp.AccountId != null) {

                    accIds.add(opp.AccountId);
                }
            }
        }


        // Stop if no Accounts found
        if(accIds.isEmpty()) {

            return;
        }


        List<Account> updatedAcc =
            new List<Account>();

        List<Task> taskList =
            new List<Task>();

        List<Opportunity> updatedOpps =
            new List<Opportunity>();


        // Fetch Accounts with Closed Won Opportunities
        List<Account> accList = [

            SELECT Id,
                   Name,
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
        ];


        // Apply Customer Level Logic
        for(Account acc : accList) {

            Integer totalWonOpps =
                acc.Opportunities.size();


            // Silver Level
            if(
                totalWonOpps >= 1 &&
                totalWonOpps <= 2
            ) {

                acc.Customer_Level__c =
                    'Silver';
            }


            // Gold Level
            else if(
                totalWonOpps >= 3 &&
                totalWonOpps <= 5
            ) {

                acc.Customer_Level__c =
                    'Gold';
            }


            // Platinum Level
            else if(totalWonOpps > 5) {

                acc.Customer_Level__c =
                    'Platinum';


                // Create VIP Task
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


        // Fetch ALL sibling Opportunities
        List<Opportunity> opps = [

            SELECT Id,
                   Description,
                   AccountId
            FROM Opportunity
            WHERE AccountId IN :accIds
        ];


        // Update Description
        for(Opportunity opp : opps) {

            opp.Description =
                'Priority Customer Account';

            updatedOpps.add(opp);
        }


        // Update Accounts
        if(!updatedAcc.isEmpty()) {

            update updatedAcc;
        }


        // Insert Tasks
        if(!taskList.isEmpty()) {

            insert taskList;
        }


        // Update Opportunities
        if(!updatedOpps.isEmpty()) {

            update updatedOpps;
        }
    }
}
