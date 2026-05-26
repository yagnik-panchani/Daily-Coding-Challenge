public class OLIHandler {

    public static void createAsset(
        List<OpportunityLineItem> oliList
    ) {

        Set<Id> oppIds = new Set<Id>();


        for(OpportunityLineItem oli : oliList) {

            oppIds.add(oli.OpportunityId);
        }


        List<Asset> assets = new List<Asset>();


        for(Opportunity opp : [

            SELECT Id,
                   AccountId,
                   Account.Name
            FROM Opportunity
            WHERE Id IN :oppIds
        ]) {

            Asset a = new Asset();

            a.Name = opp.Account.Name;

            a.AccountId = opp.AccountId;

            assets.add(a);
        }


        if(!assets.isEmpty()) {

            insert assets;
        }
    }
}
