public class OppHandler {

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


        List<Account> accList = [

            SELECT Id,
                   Type,
                   OwnerId
            FROM Account
            WHERE Id IN :accIds
        ];


        List<Task> taskList =
            new List<Task>();


        for(Account acc : accList) {

            acc.Type = 'VIP Customer';


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


        List<Opportunity> siblingOpps = [

            SELECT Id,
                   Description,
                   AccountId
            FROM Opportunity
            WHERE AccountId IN :accIds
        ];


        for(Opportunity opp : siblingOpps) {

            opp.Description =
                'Priority Customer';
        }


        if(!accList.isEmpty()) {

            update accList;
        }

        if(!taskList.isEmpty()) {

            insert taskList;
        }

        if(!siblingOpps.isEmpty()) {

            update siblingOpps;
        }
    }
}
