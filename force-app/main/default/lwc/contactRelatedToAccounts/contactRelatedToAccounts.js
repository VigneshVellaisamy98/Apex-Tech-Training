import { LightningElement , track , wire  } from 'lwc';
import getRelatedContacts from '@salesforce/apex/ContactRelatedToAccountLWC.getRelatedContacts';

export default class ContactRelatedToAccounts extends LightningElement {
    @track accountName = '';
    @track contacts = [];
    @track showNoResults = false;

    handleAccountChange(event) {
        this.accountName = event.target.value;
        console.log(this.accountName);
    }

    retrieveContacts() {
        getRelatedContacts({ accountName: this.accountName })
            .then(result => {
                console.log(result);
                this.contacts = result;
                this.showNoResults = result.length === 0;
            })
            .catch(error => {
                console.error('Error fetching contacts:', error);
            });
    }
}




















// @api recordId;
    // @track contacts;
    // @track columns = [  { label: 'First Name', fieldName: 'FirstName', type: 'text' },
    //                     { label: 'Last Name', fieldName: 'LastName', type: 'text' },
    //                     { label: 'Email', fieldName: 'Email'}];

    // @wire(getContactsRelatedToAccounts, {acctId : '$recordId'})
    // contactRecords(error , data){
    //     if(data){
    //         this.contacts = data;
    //         this.error = undefined;
    //     }
    //     else{
    //         this.error = error;
    //         this.contacts = undefined;
    //     }
    // }