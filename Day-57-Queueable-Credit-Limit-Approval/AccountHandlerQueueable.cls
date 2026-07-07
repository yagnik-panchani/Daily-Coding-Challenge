public with sharing class AccountHandlerQueueable
implements Queueable {

    private Set<Id> accIds;

    public AccountHandlerQueueable(Set<Id> accIds) {
        this.accIds = accIds;
    }

    public void execute(QueueableContext context) {

        List<Account> accounts = [
            SELECT Id,
                   Customer_Type__c,
                   Credit_Review_Status__c,
                   Description
            FROM Account
            WHERE Id IN :accIds
        ];

        for (Account acc : accounts) {

            acc.Customer_Type__c = 'Premium';
            acc.Credit_Review_Status__c = 'Approved';
            acc.Description =
                'Credit Limit Automatically Approved.';
        }

        if (!accounts.isEmpty()) {
            update accounts;
        }
    }
}
