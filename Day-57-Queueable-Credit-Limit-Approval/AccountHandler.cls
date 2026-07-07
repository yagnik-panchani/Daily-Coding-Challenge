public with sharing class AccountHandler {

    public static void accUpdate(List<Account> accList,
                                 Map<Id, Account> oldMap) {

        Set<Id> accIds = new Set<Id>();

        for (Account acc : accList) {

            if (
                acc.AnnualRevenue >= 10000000 &&
                acc.Customer_Type__c == 'Regular' &&
                acc.Credit_Review_Status__c == 'Pending' &&

                (
                    acc.AnnualRevenue != oldMap.get(acc.Id).AnnualRevenue ||
                    acc.Customer_Type__c != oldMap.get(acc.Id).Customer_Type__c ||
                    acc.Credit_Review_Status__c != oldMap.get(acc.Id).Credit_Review_Status__c
                )
            ) {
                accIds.add(acc.Id);
            }
        }

        if (!accIds.isEmpty()) {
            System.enqueueJob(new AccountHandlerQueueable(accIds));
        }
    }
}
