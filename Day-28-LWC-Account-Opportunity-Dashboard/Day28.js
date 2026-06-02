import { LightningElement, track } from 'lwc';

import getData
from '@salesforce/apex/OpportunityController.getData';

export default class Child extends LightningElement {

    data;

    @track display;

    @track oppData = [];

    columns = [

        {
            label: 'Opportunity Name',
            fieldName: 'Name',
            type: 'text'
        },

        {
            label: 'Amount',
            fieldName: 'Amount',
            type: 'currency'
        },

        {
            label: 'Stage Name',
            fieldName: 'StageName',
            type: 'text'
        }

    ];

    handleChange(event) {

        this.data =
            event.target.value;
    }

    handleClick() {

        getData({

            Name: this.data

        })

        .then(result => {

            this.display = result;

            this.oppData = [];

            result.forEach(acc => {

                if(acc.Opportunities) {

                    this.oppData = [

                        ...this.oppData,

                        ...acc.Opportunities
                    ];
                }
            });

        })

        .catch(error => {

            console.error(error);
        });
    }
}
