public class OpportunityHandler {

    public static void validateDuplicate(
        List<Opportunity> oppList
    ) {

        Set<Id> accIds = new Set<Id>();
        Set<String> products = new Set<String>();


        for(Opportunity opp : oppList) {

            if(
                opp.AccountId != null &&
                opp.Product_Name__c != null
            ) {

                accIds.add(opp.AccountId);
                products.add(opp.Product_Name__c);
            }
        }


        Set<String> existingKeys =
            new Set<String>();


        for(Opportunity opp : [

            SELECT Id,
                   AccountId,
                   Product_Name__c,
                   StageName
            FROM Opportunity
            WHERE AccountId IN :accIds
            AND Product_Name__c IN :products
            AND StageName != 'Closed Lost'

        ]) {

            String key =

                opp.AccountId +
                '-' +
                opp.Product_Name__c;

            existingKeys.add(key);
        }


        for(Opportunity opp : oppList) {

            String key =

                opp.AccountId +
                '-' +
                opp.Product_Name__c;


            if(existingKeys.contains(key)) {

                opp.addError(

                    'An active Opportunity already exists for this Account and Product.'
                );
            }
        }
    }
}
