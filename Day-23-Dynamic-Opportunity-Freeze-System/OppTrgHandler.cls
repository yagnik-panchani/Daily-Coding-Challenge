public class OppTrgHandler {

    public static void trgmethod(
        List<Opportunity> oppList,
        Map<Id, Opportunity> oldMap
    ) {

        // Get Current User Profile
        Profile p = [

            SELECT Id,
                   Name
            FROM Profile
            WHERE Id =
            :UserInfo.getProfileId()
        ];


        for(Opportunity opp : oppList) {

            // Freeze Logic
            if(
                opp.Amount != null &&
                opp.Amount > 500000
            ) {

                opp.Freeze_Record__c =
                    true;

                opp.Reason__c =
                    'High Value Deal - Approval Required';
            }


            // Restrict Editing
            if(
                oldMap != null &&
                opp.Freeze_Record__c &&
                p.Name !=
                'System Administrator'
            ) {

                Boolean amountChanged =

                    opp.Amount !=
                    oldMap.get(opp.Id).Amount;


                Boolean stageChanged =

                    opp.StageName !=
                    oldMap.get(opp.Id).StageName;


                Boolean closeDateChanged =

                    opp.CloseDate !=
                    oldMap.get(opp.Id).CloseDate;


                if(
                    amountChanged ||
                    stageChanged ||
                    closeDateChanged
                ) {

                    opp.addError(

                        'You cannot modify Amount, StageName or CloseDate because this Opportunity is frozen.'
                    );
                }
            }
        }
    }
}
