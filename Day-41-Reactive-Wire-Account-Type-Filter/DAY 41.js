import { LightningElement ,track,wire} from 'lwc';
import getData from '@salesforce/apex/AccountHandler.getData';


export default class Dashboard extends LightningElement {
get options(){
    return [
        {label:'Customers',value:'Customers'},
        {label:'Partners',value:'Partners'},
        {label:'Prospect',value:'Prospect'}
    ];
}

  selectedType = '';
  handleChange(event)
  {
    this.selectedType = event.detail.value;
  }   

  @wire(getData,{addType : '$selectedType'}) accounts;
  
   
}
