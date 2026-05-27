public class OpportunityTrgHandler {

    public static Boolean pattern = false;


    public static void trgmethod(
        List<Opportunity> oppList,
        Map<Id, Opportunity> oldMap
    ) {

        if(pattern) {

            return;
        }

        pattern = true;


        for(Opportunity opp : oppList) {

            // Discount Logic
            if(
                opp.Discount__c != null &&
                opp.Discount__c > 20
            ) {

                opp.Approval_Status__c =
                    'Pending Approval';
            }

            if(
                opp.Amount != null &&
                opp.Discount__c != null
            ) {

                Decimal finalAmount =

                    opp.Amount -

                    (
                        opp.Amount *
                        opp.Discount__c / 100
                    );


                opp.Final_Amount__c =
                    finalAmount;
            }


            if(
                oldMap != null &&
                oldMap.get(opp.Id).StageName !=
                opp.StageName &&
                opp.StageName == 'Closed Won' &&
                opp.Approval_Status__c !=
                'Approved'
            ) {

                opp.addError(
                    'Opportunity cannot be Closed Won until approved.'
                );
            }
        }

        pattern = false;
    }
}
