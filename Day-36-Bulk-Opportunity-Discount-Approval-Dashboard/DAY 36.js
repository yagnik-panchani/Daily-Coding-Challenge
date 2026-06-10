import { LightningElement, track }
from 'lwc';

import getData
from '@salesforce/apex/OpportunityController.getData';

import approveOpportunities
from '@salesforce/apex/OpportunityController.approveOpportunities';

import { ShowToastEvent }
from 'lightning/platformShowToastEvent';

export default class OpportunityApprovalDashboard
extends LightningElement {

    @track data = [];

    @track selectedRows = [];

    selectedCount = 0;


    columns = [

        {
            label:'Opportunity Name',
            fieldName:'Name',
            type:'text'
        },

        {
            label:'Amount',
            fieldName:'Amount',
            type:'currency'
        },

        {
            label:'Discount',
            fieldName:'Discount__c',
            type:'number'
        },

        {
            label:'Approval Status',
            fieldName:'Approval_Status__c',
            type:'text'
        }
    ];


    connectedCallback() {

        this.loadOpportunities();
    }


    loadOpportunities() {

        getData()

        .then(result => {

            this.data = result;
        })

        .catch(error => {

            console.error(error);
        });
    }


    handleRowSelection(event) {

        this.selectedRows =
            event.detail.selectedRows;

        this.selectedCount =
            this.selectedRows.length;
    }


    handleClick() {

        const oppIds =

            this.selectedRows.map(

                row => row.Id
            );


        approveOpportunities({

            oppIds : oppIds

        })

        .then(() => {

            this.dispatchEvent(

                new ShowToastEvent({

                    title : 'Success',

                    message :
                    'Selected Opportunities Approved',

                    variant :
                    'success'
                })
            );

            this.selectedRows = [];

            this.selectedCount = 0;

            this.loadOpportunities();
        })

        .catch(error => {

            console.error(error);
        });
    }
}
