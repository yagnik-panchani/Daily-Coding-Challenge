public with sharing class EmployeeController {

    @AuraEnabled(cacheable=true)
    public static List<Employee__c> getEmployees() {

        return [
            SELECT Id,
                   EmployeeName__c,
                   LeaveType__c,
                   Status__c,
                   ManagerComment__c
            FROM Employee__c
            ORDER BY CreatedDate DESC
        ];
    }


    @AuraEnabled
    public static void approveLeave(Id employeeId) {

        Employee__c emp = new Employee__c(
            Id = employeeId,
            Status__c = 'Approved'
        );

        update emp;
    }


    @AuraEnabled
    public static void rejectLeave(
        Id employeeId,
        String comment
    ) {

        Employee__c emp = new Employee__c(
            Id = employeeId,
            Status__c = 'Rejected',
            ManagerComment__c = comment
        );

        update emp;
    }
}
