import { LightningElement } from 'lwc';

import getData
from '@salesforce/apex/OpportunityController.getData';

import getSelectedData
from '@salesforce/apex/OpportunityController.getSelectedData';

export default class Child extends LightningElement {

    total = 0;
    approved = 0;
    pending = 0;
    rejected = 0;

    selectedLeave = 'All';

    leaveData = [];


    columns = [

        {
            label: 'Employee Name',
            fieldName: 'EmployeeName__c',
            type: 'text'
        },

        {
            label: 'Leave Type',
            fieldName: 'LeaveType__c',
            type: 'text'
        },

        {
            label: 'Status',
            fieldName: 'Status__c',
            type: 'text'
        }
    ];


    connectedCallback() {

        this.loadSummary();
        this.loadData();
    }


    loadSummary() {

        getData()

        .then(result => {

            this.total =
                result.Total;

            this.pending =
                result.Pending;

            this.approved =
                result.Approved;

            this.rejected =
                result.Rejected;
        })

        .catch(error => {

            console.error(error);
        });
    }


    loadData() {

        getSelectedData({

            statusValue:
            this.selectedLeave

        })

        .then(result => {

            this.leaveData =
                result;
        })

        .catch(error => {

            console.error(error);
        });
    }


    get leaveOptions() {

        return [

            {
                label: 'All',
                value: 'All'
            },

            {
                label: 'Pending',
                value: 'Pending'
            },

            {
                label: 'Approved',
                value: 'Approved'
            },

            {
                label: 'Rejected',
                value: 'Rejected'
            }
        ];
    }


    handleChange(event) {

        this.selectedLeave =
            event.detail.value;

        this.loadData();
    }
}
