public class ContactHandler {

    public static void updateAccountType(
        List<Contact> conList
    ) {

        Set<Id> accIds = new Set<Id>();


        for(Contact con : conList) {

            if(con.AccountId != null) {

                accIds.add(con.AccountId);
            }
        }


        List<Account> updatedAcc =
            new List<Account>();


        for(Account acc : [

            SELECT Id,
                   Type,
                   (
                       SELECT Id
                       FROM Contacts
                   )
            FROM Account
            WHERE Id IN :accIds
        ]) {

            Integer totalContacts =
                acc.Contacts.size();


            if(totalContacts > 3) {

                acc.Type =
                    'Premium Customer';

                updatedAcc.add(acc);
            }
        }


        if(!updatedAcc.isEmpty()) {

            update updatedAcc;
        }
    }
}
