public class AccountHandler {

    public static void deactivateAccount(
        List<Account> accList,
        Map<Id, Account> oldMap
    ) {

        Set<Id> accIds = new Set<Id>();


        for(Account acc : accList) {

            if(
                oldMap.get(acc.Id).Status__c !=
                acc.Status__c &&
                acc.Status__c == 'Inactive'
            ) {

                accIds.add(acc.Id);
            }
        }


        List<Contact> conList = [

            SELECT Id,
                   Do_Not_Contact__c
            FROM Contact
            WHERE AccountId IN :accIds
        ];


        for(Contact c : conList) {

            c.Do_Not_Contact__c = true;
        }


        List<Opportunity> oppList = [

            SELECT Id
            FROM Opportunity
            WHERE AccountId IN :accIds
        ];


        if(!conList.isEmpty()) {

            update conList;
        }

        if(!oppList.isEmpty()) {

            delete oppList;
        }
    }
}
