public class RatingHandler {

    public static void updateRating(
        List<Case> caseList
    ) {

        Set<Id> accIds = new Set<Id>();


        // Collect Account Ids
        for(Case cs : caseList) {

            if(cs.AccountId != null) {

                accIds.add(cs.AccountId);
            }
        }


        // Stop if no Accounts found
        if(accIds.isEmpty()) {

            return;
        }


        List<Account> updatedAcc =
            new List<Account>();


        // Fetch Accounts with related Cases
        for(Account acc : [

            SELECT Id,
                   Rating,
                   (
                       SELECT Id,
                              Status
                       FROM Cases
                   )
            FROM Account
            WHERE Id IN :accIds
        ]) {

            Integer closedCount = 0;


            // Count Closed Cases
            for(Case cs : acc.Cases) {

                if(cs.Status == 'Closed') {

                    closedCount++;
                }
            }


            // Apply Business Logic
            if(closedCount < 2) {

                acc.Rating = 'Hot';
            }

            else if(closedCount <= 5) {

                acc.Rating = 'Warm';
            }

            else {

                acc.Rating = 'Cold';
            }


            updatedAcc.add(acc);
        }


        // Update Accounts
        if(!updatedAcc.isEmpty()) {

            update updatedAcc;
        }
    }
}
