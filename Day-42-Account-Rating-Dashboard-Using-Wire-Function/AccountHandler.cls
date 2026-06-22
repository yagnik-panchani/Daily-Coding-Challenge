public with sharing class AccountController {

    @AuraEnabled(cacheable=true)
    public static List<Account> getData(String rating)
    {
        return [
            SELECT Id,
                   Name,
                   Type,
                   Rating
            FROM Account
            WHERE Rating = :rating
        ];
    }
}
