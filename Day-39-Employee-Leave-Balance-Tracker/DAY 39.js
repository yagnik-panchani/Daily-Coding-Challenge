import { LightningElement, track }
from 'lwc';

import getEmployees
from '@salesforce/apex/EmployeeController.getEmployees';

import calculateBalance
from '@salesforce/apex/EmployeeController.calculateBalance';

import { ShowToastEvent }
from 'lightning/platformShowToastEvent';

export default class EmployeeLeaveTracker
extends LightningElement {

    @track employeeData = [];

    columns = [

        {
            label:'Employee Name',
            fieldName:'EmployeeName__c',
            type:'text'
        },

        {
            label:'Total Leave',
            fieldName:'Total_Leave__c',
            type:'number'
        },

        {
            label:'Used Leave',
            fieldName:'Used_Leave__c',
            type:'number'
        },

        {
            label:'Remaining Leave',
            fieldName:'Remaining_Leave__c',
            type:'number'
        }
    ];

    connectedCallback()
    {
        this.loadData();
    }

    loadData()
    {
        getEmployees()
        .then(result => {

            this.employeeData = result;

        })
        .catch(error => {

            console.error(error);

        });
    }

    handleCalculate()
    {
        calculateBalance()
        .then(() => {

            this.dispatchEvent(

                new ShowToastEvent({

                    title:'Success',

                    message:
                    'Leave Balance Updated',

                    variant:'success'
                })
            );

            this.loadData();

        })
        .catch(error => {

            console.error(error);

        });
    }
}
