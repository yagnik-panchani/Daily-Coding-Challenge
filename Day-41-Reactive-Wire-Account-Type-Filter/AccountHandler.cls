public with sharing class AccountHandler {
  @AuraEnabled(Cacheable=true)
  public static List<Account> getData(String addType)
  {
    return [SELECT ID,Name,Type,Rating FROM Account WHERE Type =: addType]; 
  }
  
}
