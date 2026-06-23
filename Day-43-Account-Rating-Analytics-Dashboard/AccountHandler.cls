public with sharing class AccountController {
    @AuraEnabled(Cacheable=true)
    public static List<Account> getData()
    {
        return [SELECT Id,Name,Type,Rating FROM Account];
    }
    
}
