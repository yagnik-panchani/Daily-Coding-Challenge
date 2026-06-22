import { LightningElement, wire } from 'lwc';
import getData from '@salesforce/apex/AccountController.getData';

export default class Dashboard extends LightningElement {

    selectedValue = '';

    accounts = [];

    totalAccounts = 0;

    get options() {

        return [

            {
                label: 'Hot',
                value: 'Hot'
            },

            {
                label: 'Warm',
                value: 'Warm'
            },

            {
                label: 'Cold',
                value: 'Cold'
            }
        ];
    }

    handleChange(event) {

        this.selectedValue =
            event.detail.value;
    }

    columns = [

        {
            label: 'Name',
            fieldName: 'Name',
            type: 'text'
        },

        {
            label: 'Type',
            fieldName: 'Type',
            type: 'text'
        },

        {
            label: 'Rating',
            fieldName: 'Rating',
            type: 'text'
        }
    ];

    @wire(
        getData,
        {
            rating: '$selectedValue'
        }
    )
    wiredAccounts(result) {

        if(result.data) {

            this.accounts =
                result.data;

            this.totalAccounts =
                result.data.length;
        }

        else if(result.error) {

            console.error(
                result.error
            );
        }
    }
}
