public with sharing class OpportunityController {

    @AuraEnabled(cacheable=true)
    public static List<Account> getData(String Name) {

        String name = '%' + Name + '%';

        List<Account> acc = [

            SELECT Id,
                   Name,
                   Industry,
                   Rating,
                   (
                       SELECT Id,
                              Name,
                              Amount,
                              StageName
                       FROM Opportunities
                   )
            FROM Account
            WHERE Name LIKE :name
        ];

        return acc;
    }
}
