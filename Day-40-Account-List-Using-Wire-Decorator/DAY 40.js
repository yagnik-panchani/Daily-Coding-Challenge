import { LightningElement ,track,wire} from 'lwc';
import getData from '@salesforce/apex/AccountHandler.getData';

export default class Dashboard extends LightningElement {

    columns = [
        {label:'Name',fieldName:'Name',type:'text'},
        {label:'Type ',fieldName:'Type',type:'text'},
        {label:'Rating ',fieldName:'Rating',type:'text'},
        
    ];

   
    @wire(getData) Accounts;
  
   
}
