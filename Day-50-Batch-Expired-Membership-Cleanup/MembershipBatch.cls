public with sharing class MembershipBatch implements Database.Batchable<Contact>{
   public Database.QueryLocator start(Database.BatchableContext bc)
   {Date d = System.Today();
    return Database.getQueryLocator('SELECT Id,Membership_Expiry_Date__c,
    Membership_Status__c,Description 
    FROM Contact WHERE Membership_Expiry_Date__c < :d');
   }

   public void execute(Database.BatchableContext bc,List<Contact> conList)
   {
    for(Contact c : conList)
    {
        c.Membership_Status__c = 'Expired';
        c.Description = 'Membership expired on '+System.Today();
    }

    update conList;
   }

   public void finish(Database.BatchableContext bc)
   {
    System.debug('All past Data are Marked as Expired as SuccessFully');
   }
}
