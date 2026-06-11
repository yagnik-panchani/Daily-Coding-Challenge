import { LightningElement ,track} from 'lwc';
import getData from '@salesforce/apex/ticketHandler.getData';
export default class TicketList extends LightningElement {


  data = [];

columns = [
    {label:'Ticket Number',fieldName:'Name',type:'text'},
    {label:'Subject',fieldName:'Subject__c',type:'text'},
    {label:'Status',fieldName:'Status__c',type:'text'},
    {label:'Priority',fieldName:'Priority__c',type:'text'}

];

connectedCallback()
{
    getData()
    .then(result=>{
        this.data = result;


    })
   .catch(error => {
                console.error(error);
            });
}

}
