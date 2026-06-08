public with sharing class EmployeeController {

    @AuraEnabled
    public static void createEmployee(
        String employeeName,
        String email,
        String phone,
        String department,
        String designation,
        Decimal salary
    ) {

        Employee__c emp = new Employee__c();

        emp.EmployeeName__c = employeeName;
        emp.Email__c = email;
        emp.Phone__c = phone;
        emp.Department__c = department;
        emp.Designation__c = designation;
        emp.Salary__c = salary;

        insert emp;
    }
}
