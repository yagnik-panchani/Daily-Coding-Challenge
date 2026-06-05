import { LightningElement, track } from 'lwc';

export default class Parent extends LightningElement {

    columns = [

        {
            label: 'Product',
            fieldName: 'Product',
            type: 'text'
        },

        {
            label: 'Price',
            fieldName: 'Price',
            type: 'currency'
        },

        {
            type: 'button',

            typeAttributes: {

                label: 'Add',
                name: 'add',
                variant: 'brand'
            }
        }
    ];



    data = [

        {
            id: 1,
            Product: 'Laptop',
            Price: 50000
        },

        {
            id: 2,
            Product: 'Mouse',
            Price: 500
        },

        {
            id: 3,
            Product: 'Keyboard',
            Price: 400
        },

        {
            id: 4,
            Product: 'Monitor',
            Price: 1000
        }
    ];


    @track display = [];

    selectedCount = 0;


    handleRowAction(event) {

        const actionName =
            event.detail.action.name;

        const row =
            event.detail.row;


        if(actionName === 'add') {

            this.display = [

                ...this.display,

                row
            ];

            this.selectedCount =
                this.display.length;
        }
    }
}
