public class MultiObjectHandler {

    public static void trgmethod(
        List<Account> accList,
        Map<Id, Account> oldMap
    ) {

        Set<Id> accIds = new Set<Id>();


        for(Account acc : accList) {

            if(
                oldMap.get(acc.Id).Type !=
                acc.Type &&
                acc.Type == 'Premium Customer'
            ) {

                accIds.add(acc.Id);
            }
        }


        List<Contact> conList = [

            SELECT Id,
                   Department
            FROM Contact
            WHERE AccountId IN :accIds
        ];


        for(Contact con : conList) {

            con.Department =
                'VIP Department';
        }


        List<Opportunity> oppList = [

            SELECT Id,
                   StageName
            FROM Opportunity
            WHERE AccountId IN :accIds
        ];


        for(Opportunity opp : oppList) {

            opp.StageName =
                'Negotiation/Review';
        }


        List<Case> caseList = [

            SELECT Id,
                   Priority
            FROM Case
            WHERE AccountId IN :accIds
        ];


        for(Case cs : caseList) {

            cs.Priority = 'High';
        }


        if(!conList.isEmpty()) {

            update conList;
        }

        if(!oppList.isEmpty()) {

            update oppList;
        }

        if(!caseList.isEmpty()) {

            update caseList;
        }
    }
}
