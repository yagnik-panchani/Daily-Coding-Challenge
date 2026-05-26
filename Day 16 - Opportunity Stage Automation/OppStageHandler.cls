public class OppStageHandler {

    public static void updateStage(
        List<Opportunity> oppList
    ) {

        for(Opportunity opp : oppList) {

            if(
                opp.Amount != null &&
                opp.Amount > 50000
            ) {

                opp.StageName =
                    'Negotiation/Review';
            }
        }
    }
}
