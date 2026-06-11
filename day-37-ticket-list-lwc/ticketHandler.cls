public with sharing class ticketHandler {
    @AuraEnabled(Cacheable=true)
    public static List<	Ticket__c> getData()
    {
        return [SELECT Id,Name,Subject__c,Status__c,Priority__c FROM Ticket__c];
    }
}
