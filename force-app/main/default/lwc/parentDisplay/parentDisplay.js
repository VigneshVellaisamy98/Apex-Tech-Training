import { LightningElement } from 'lwc';
import getContacts from '@salesforce/apex/getTenContacts.getContacts';

export default class ParentDisplay extends LightningElement {

    contactName;
    contactPhone;
    contactList;

    connectedCallback(){
        getContacts()
        .then(data=>{
            this.contactList = data;
            console.log(data);
        })
        .catch(error=>{
            console.log(error);
        })
    }

    captureContactInformation(){
        console.log(this.contactName);
        console.log(this.contactPhone);
    }

}