public class CaseHandler {
            if(cs.AccountId != null) {

                accIds.add(cs.AccountId);
            }
        }


        List<Account> updatedAcc =
            new List<Account>();


        for(Account acc : [

            SELECT Id,
                   (SELECT Id, Status FROM Cases)
            FROM Account
            WHERE Id IN :accIds
        ]) {

            Integer newCount = 0;
            Integer workingCount = 0;
            Integer escalatedCount = 0;


            for(Case cs : acc.Cases) {

                if(cs.Status == 'New') {

                    newCount++;
                }

                else if(cs.Status == 'Working') {

                    workingCount++;
                }

                else if(cs.Status == 'Escalated') {

                    escalatedCount++;
                }
            }


            acc.Number_of_New_Cases__c =
                newCount;

            acc.Number_of_Working_Cases__c =
                workingCount;

            acc.Number_of_Escalated_Cases__c =
                escalatedCount;

            updatedAcc.add(acc);
        }


        if(!updatedAcc.isEmpty()) {

            update updatedAcc;
        }
    }
}
