public class OppTrgHandler {

    public static void trgmethod(
        List<Opportunity> oppList,
        Map<Id, Opportunity> oldMap
    ) {

        Set<Id> accIds = new Set<Id>();


        // Detect Closed Won
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


        if(accIds.isEmpty()) {

            return;
        }


        Map<Id, Decimal> revenueMap =
            new Map<Id, Decimal>();


        Map<Id, Decimal> largestDealMap =
            new Map<Id, Decimal>();


        // SUM Amount
        for(AggregateResult ar : [

            SELECT AccountId accId,
                   SUM(Amount) totalRevenue
            FROM Opportunity
            WHERE AccountId IN :accIds
            AND StageName = 'Closed Won'
            GROUP BY AccountId

        ]) {

            revenueMap.put(

                (Id)ar.get('accId'),

                (Decimal)ar.get('totalRevenue')
            );
        }


        // MAX Amount
        for(AggregateResult ar : [

            SELECT AccountId accId,
                   MAX(Amount) largestDeal
            FROM Opportunity
            WHERE AccountId IN :accIds
            AND StageName = 'Closed Won'
            GROUP BY AccountId

        ]) {

            largestDealMap.put(

                (Id)ar.get('accId'),

                (Decimal)ar.get('largestDeal')
            );
        }


        List<Account> updatedAcc =
            new List<Account>();


        List<Task> taskList =
            new List<Task>();


        for(Account acc : [

            SELECT Id,
                   OwnerId,
                   Total_Revenue__c,
                   Largest_Deal__c
            FROM Account
            WHERE Id IN :accIds

        ]) {

            Decimal totalRevenue =

                revenueMap.containsKey(acc.Id)

                ? revenueMap.get(acc.Id)

                : 0;


            Decimal largestDeal =

                largestDealMap.containsKey(acc.Id)

                ? largestDealMap.get(acc.Id)

                : 0;


            acc.Total_Revenue__c =
                totalRevenue;

            acc.Largest_Deal__c =
                largestDeal;

            updatedAcc.add(acc);


            // Strategic Customer
            if(totalRevenue > 1000000) {

                Task t = new Task();

                t.Subject =
                    'Strategic Customer Review';

                t.Priority =
                    'High';

                t.Status =
                    'Not Started';

                t.OwnerId =
                    acc.OwnerId;

                taskList.add(t);
            }
        }


        if(!updatedAcc.isEmpty()) {

            update updatedAcc;
        }


        if(!taskList.isEmpty()) {

            insert taskList;
        }
    }
}
