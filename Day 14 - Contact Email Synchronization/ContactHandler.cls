public class ContactHandler {

    public static void trgmethod(
        List<Contact> conList,
        Map<Id, Contact> oldMap
    ) {

        Set<Id> accIds = new Set<Id>();


        for(Contact con : conList) {

            if(
                oldMap.get(con.Id).Email !=
                con.Email &&
                con.AccountId != null
            ) {

                accIds.add(con.AccountId);
            }
        }


        List<Account> updatedAcc =
            new List<Account>();

        List<Task> taskList =
            new List<Task>();


        for(Account acc : [

            SELECT Id,
                   Description,
                   OwnerId
            FROM Account
            WHERE Id IN :accIds
        ]) {

            acc.Description =
                'Customer Email Updated';

            updatedAcc.add(acc);


            Task t = new Task();

            t.Subject =
                'Customer Email Updated';

            t.Status =
                'Not Started';

            t.OwnerId =
                acc.OwnerId;

            taskList.add(t);
        }


        if(!updatedAcc.isEmpty()) {

            update updatedAcc;
        }

        if(!taskList.isEmpty()) {

            insert taskList;
        }
    }
}
