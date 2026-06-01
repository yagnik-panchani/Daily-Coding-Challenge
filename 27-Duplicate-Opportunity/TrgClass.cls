public class TrgClass {

    public static void trgMethod(List<Opportunity> oppList) {

        Set<Id> accountIds = new Set<Id>();

        for(Opportunity opp : oppList) {
            if(opp.AccountId != null && opp.Name != null) {
                accountIds.add(opp.AccountId);
            }
        }

        Set<String> existingKeys = new Set<String>();

        for(Opportunity opp : [
            SELECT Id, AccountId, Name
            FROM Opportunity
            WHERE AccountId IN :accountIds
        ]) {
            existingKeys.add(
                opp.AccountId + '-' + opp.Name.toLowerCase()
            );
        }

        for(Opportunity opp : oppList) {

            if(opp.AccountId != null && opp.Name != null) {

                String key = opp.AccountId + '-' + opp.Name.toLowerCase();

                if(existingKeys.contains(key)) {
                    opp.addError(
                        'Duplicate Opportunity Name already exists for this Account.'
                    );
                }
            }
        }
    }
}
