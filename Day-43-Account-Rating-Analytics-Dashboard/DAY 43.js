import { LightningElement ,wire,track} from 'lwc';
import getData from '@salesforce/apex/AccountController.getData';

export default class HelloWorld extends LightningElement {
    accounts = [];
    totalaccounts=0;

    @wire(getData)
    accountData(result)
    {
        if(result.data)
        {   this.hotting = 0;
            this.warming = 0;
            this.colding = 0;

           this.accounts = result.data;
           this.totalaccounts = result.data.length;

           for (let i = 0; i < this.accounts.length; i++) {
        const rating = this.accounts[i].Rating;

        if (rating === 'Hot') {
           this.hotting++;
        } else if (rating === 'Warm') {
            this.warming++;
        } else if (rating === 'Cold') {
            this.colding++;
        }
    }

           
        }
        else if(result.error)
        {
            console.error('We can not find the data',result.error);
        }
    }
    hotting = 0;
    warming = 0;
    colding = 0;






}
