public class OppTrgHandler {

    public static void trgmethod(
        List<Opportunity> oppList,
        Map<Id, Opportunity> oldMap
    ) {

        List<Task> taskList =
            new List<Task>();


        for(Opportunity opp : oppList) {

            Opportunity oldOpp =
                oldMap.get(opp.Id);


            // Increment Approval Count
            if(
                opp.Amount > 250000 &&
                opp.Approval_Status__c == 'Pending' &&
                (
                    oldOpp.Amount != opp.Amount ||
                    oldOpp.Approval_Status__c
                    != opp.Approval_Status__c
                )
            ) {

                if(opp.Approval_Count__c == null) {

                    opp.Approval_Count__c = 0;
                }

                opp.Approval_Count__c++;
            }


            // Auto Reject
            if(
                opp.Approval_Count__c != null &&
                opp.Approval_Count__c >= 3
            ) {

                opp.Approval_Status__c =
                    'Rejected';
            }


            // Prevent Amount Change
            if(
                oldOpp.Approval_Status__c ==
                'Approved' &&

                oldOpp.Amount !=
                opp.Amount
            ) {

                opp.addError(

                    'Amount cannot be modified after approval.'
                );
            }


            // Create Task
            if(
                oldOpp.Approval_Status__c
                != 'Approved' &&

                opp.Approval_Status__c
                == 'Approved'
            ) {

                Task t = new Task();

                t.Subject =
                    'Approved Opportunity Review';

                t.Priority =
                    'High';

                t.Status =
                    'Not Started';

                t.OwnerId =
                    opp.OwnerId;

                taskList.add(t);
            }
        }


        if(!taskList.isEmpty()) {

            insert taskList;
        }
    }
}
