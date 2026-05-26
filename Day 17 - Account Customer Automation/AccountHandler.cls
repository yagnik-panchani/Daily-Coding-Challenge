public class AccountHandler {

    public static void trgmethod(
        List<Account> accList,
        Map<Id, Account> oldMap
    ) {

        Set<Id> accIds = new Set<Id>();


        for(Account acc : accList) {

            if(
                oldMap.get(acc.Id).Type !=
                acc.Type &&
                acc.Type == 'Customer'
            ) {

                accIds.add(acc.Id);
            }
        }


        List<Contact> conList = [

            SELECT Id,
                   MailingCity
            FROM Contact
            WHERE AccountId IN :accIds
        ];


        for(Contact con : conList) {

            con.MailingCity =
                'Ahmedabad';
        }


        List<Opportunity> oppList = [

            SELECT Id,
                   StageName
            FROM Opportunity
            WHERE AccountId IN :accIds
        ];


        for(Opportunity opp : oppList) {

            opp.StageName =
                'Prospecting';
        }


        if(!conList.isEmpty()) {

            update conList;
        }

        if(!oppList.isEmpty()) {

            update oppList;
        }
    }
}
