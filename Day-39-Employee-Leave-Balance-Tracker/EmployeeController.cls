public with sharing class EmployeeController {

    @AuraEnabled(cacheable=true)
    public static List<Employee__c> getEmployees()
    {
        return [
            SELECT Id,
                   EmployeeName__c,
                   Total_Leave__c,
                   Used_Leave__c,
                   Remaining_Leave__c
            FROM Employee__c
        ];
    }

    @AuraEnabled
    public static void calculateBalance()
    {
        List<Employee__c> empList =
        [
            SELECT Id,
                   Total_Leave__c,
                   Used_Leave__c,
                   Remaining_Leave__c
            FROM Employee__c
        ];

        for(Employee__c emp : empList)
        {
            Integer totalLeave =
                emp.Total_Leave__c == null
                ? 0
                : Integer.valueOf(emp.Total_Leave__c);

            Integer usedLeave =
                emp.Used_Leave__c == null
                ? 0
                : Integer.valueOf(emp.Used_Leave__c);

            emp.Remaining_Leave__c =
                totalLeave - usedLeave;
        }

        if(!empList.isEmpty())
        {
            update empList;
        }
    }
}
