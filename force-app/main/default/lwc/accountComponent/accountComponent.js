import { LightningElement , api} from 'lwc';
import listOfAccounts from '@salesforce/apex/AccountLWCHelper.listOfAccounts';

export default class AccountComponent extends LightningElement {
    accountsList;
    @api acctName;
    

    connectedCallback(){
        listOfAccounts()
        .then(data=>{
            console.log(data);
            this.accountsList = data;
        })
        .catch(error=>{
            console.log(error);            
        })
    }

    handleClick(event){
        this.acctName = event.target.label;
        console.log(this.acctName);
        console.log(event.target.label);
    }

}