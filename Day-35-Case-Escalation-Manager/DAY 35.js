import { LightningElement, track }
from 'lwc';

import getData
from '@salesforce/apex/OpportunityController.getData';

import escalateCase
from '@salesforce/apex/OpportunityController.escalateCase';

import { ShowToastEvent }
from 'lightning/platformShowToastEvent';

export default class CaseEscalationManager
extends LightningElement {

    @track data = [];

    @track selectedCase = {};

    isModalOpen = false;


    columns = [

        {
            label:'Case Number',
            fieldName:'CaseNumber',
            type:'text'
        },

        {
            label:'Subject',
            fieldName:'Subject',
            type:'text'
        },

        {
            label:'Priority',
            fieldName:'Priority',
            type:'text'
        },

        {
            label:'Status',
            fieldName:'Status',
            type:'text'
        },

        {
            type:'button',

            typeAttributes: {

                label:'Escalate',

                name:'escalate',

                variant:'brand'
            }
        }
    ];


    connectedCallback() {

        this.loadCases();
    }


    loadCases() {

        getData()

        .then(result => {

            this.data = result;
        })

        .catch(error => {

            console.error(error);
        });
    }


    handleRowAction(event) {

        const actionName =
            event.detail.action.name;

        const row =
            event.detail.row;

        if(actionName === 'escalate') {

            this.selectedCase =
                row;

            this.isModalOpen =
                true;
        }
    }


    closeModal() {

        this.isModalOpen =
            false;

        this.selectedCase = {};
    }


    confirmEscalate() {

        escalateCase({

            caseId:
            this.selectedCase.Id

        })

        .then(() => {

            this.dispatchEvent(

                new ShowToastEvent({

                    title:'Success',

                    message:
                    'Case Escalated Successfully',

                    variant:'success'
                })
            );

            this.loadCases();

            this.closeModal();
        })

        .catch(error => {

            console.error(error);
        });
    }
}
