import { LightningElement } from 'lwc';

import createEmployee
from '@salesforce/apex/EmployeeController.createEmployee';

import { ShowToastEvent }
from 'lightning/platformShowToastEvent';

export default class EmployeeWizard extends LightningElement {

    step = 1;

    employeeName = '';
    email = '';
    phone = '';

    department = '';
    designation = '';
    salary;

    get isStep1() {
        return this.step === 1;
    }

    get isStep2() {
        return this.step === 2;
    }

    get isStep3() {
        return this.step === 3;
    }

    get departmentOptions() {
        return [
            { label: 'IT', value: 'IT' },
            { label: 'HR', value: 'HR' },
            { label: 'Finance', value: 'Finance' }
        ];
    }

    nextStep() {
        this.step++;
    }

    previousStep() {
        this.step--;
    }

    handleEmployeeName(event) {
        this.employeeName = event.target.value;
    }

    handleEmail(event) {
        this.email = event.target.value;
    }

    handlePhone(event) {
        this.phone = event.target.value;
    }

    handleDepartment(event) {
        this.department = event.target.value;
    }

    handleDesignation(event) {
        this.designation = event.target.value;
    }

    handleSalary(event) {
        this.salary = event.target.value;
    }

    handleSubmit() {

        createEmployee({

            employeeName: this.employeeName,
            email: this.email,
            phone: this.phone,
            department: this.department,
            designation: this.designation,
            salary: this.salary

        })
        .then(() => {

            this.dispatchEvent(

                new ShowToastEvent({

                    title: 'Success',
                    message: 'Employee Created Successfully',
                    variant: 'success'
                })
            );
        });
    }
}
