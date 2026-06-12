import { LightningElement } from 'lwc';

import getCustomers from '@salesforce/apex/ticketHandler.getCustomers';
import createTicket from '@salesforce/apex/ticketHandler.createTicket';

export default class CreateTicket extends LightningElement {

    subject = '';
    description = '';
    priority = '';
    customerId = '';

    customerOptions = [];

    priorityOptions = [
        { label: 'Low', value: 'Low' },
        { label: 'Medium', value: 'Medium' },
        { label: 'High', value: 'High' },
        { label: 'Critical', value: 'Critical' }
    ];

    connectedCallback() {
        this.loadCustomers();
    }

    loadCustomers() {
        getCustomers()
            .then(result => {

                this.customerOptions = result.map(customer => {
                    return {
                        label: customer.Name,
                        value: customer.Id
                    };
                });

            })
            .catch(error => {
                console.error(error);
            });
    }

    handleSubject(event) {
        this.subject = event.target.value;
    }

    handleDescription(event) {
        this.description = event.target.value;
    }

    handlePriority(event) {
        this.priority = event.target.value;
    }

    handleCustomer(event) {
        this.customerId = event.target.value;
    }

    createTicketRecord() {

        const ticketRecord = {
            Subject__c: this.subject,
            Description__c: this.description,
            Priority__c: this.priority,
            Customer2__c: this.customerId
        };

        createTicket({ ticketRecord })
            .then(result => {

                console.log('Created Ticket Id:', result);

                this.subject = '';
                this.description = '';
                this.priority = '';
                this.customerId = '';

            })
            .catch(error => {
                console.error(error);
            });
    }
}
