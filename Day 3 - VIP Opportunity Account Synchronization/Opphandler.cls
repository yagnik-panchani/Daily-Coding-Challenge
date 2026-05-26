public class OppHandler {

    public static void trgmethod(
        List<Opportunity> oppList,
        Map<Id, Opportunity> oldMap
    ) {

        Set<Id> accIds = new Set<Id>();


        for(Opportunity opp : oppList) {

            if(
                oldMap.get(opp.Id).StageName != opp.StageName &&
                opp.StageName == 'Closed Won' &&
                opp.Amount > 100000
            ) {

                accIds.add(opp.AccountId);
            }
        }


        List<Account> accList = [

            SELECT Id, Type
            FROM Account
            WHERE Id IN :accIds
        ];


        for(Account acc : accList) {

            acc.Type = 'VIP';
        }


        if(!accList.isEmpty()) {

            update accList;
        }
    }
}
