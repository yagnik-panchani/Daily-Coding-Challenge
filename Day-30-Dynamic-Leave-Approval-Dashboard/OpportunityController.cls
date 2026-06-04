public with sharing class OpportunityController {

    @AuraEnabled(cacheable=true)
    public static Map<String, Integer> getData() {

        Map<String, Integer> summary =
            new Map<String, Integer>();


        summary.put(
            'Total',
            [SELECT COUNT()
             FROM Employee__c]
        );

        summary.put(
            'Pending',
            [SELECT COUNT()
             FROM Employee__c
             WHERE Status__c = 'Pending']
        );

        summary.put(
            'Approved',
            [SELECT COUNT()
             FROM Employee__c
             WHERE Status__c = 'Approved']
        );

        summary.put(
            'Rejected',
            [SELECT COUNT()
             FROM Employee__c
             WHERE Status__c = 'Rejected']
        );

        return summary;
    }


    @AuraEnabled(cacheable=true)
    public static List<Employee__c>
    getSelectedData(String statusValue) {

        if(statusValue == 'All') {

            return [

                SELECT Id,
                       EmployeeName__c,
                       LeaveType__c,
                       Status__c
                FROM Employee__c
            ];
        }


        return [

            SELECT Id,
                   EmployeeName__c,
                   LeaveType__c,
                   Status__c
            FROM Employee__c
            WHERE Status__c = :statusValue
        ];
    }
}
