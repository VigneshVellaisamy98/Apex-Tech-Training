import { LightningElement } from 'lwc';
import createContact from '@salesforce/apex/DisplayEmployess.createContact';

export default class DisplayEmployess extends LightningElement {
    firstName;
    lastName;
    email;
    phone;
    generatedContactId;

    connectedCallback(){
        console.log(this.firstName)
        console.log(this.lastName)
        console.log(this.email)
        console.log(this.phone)
    }
    dataForm(event){
        this[event.target.name] = event.target.value;
    }
    handleClick(){
        console.log(this.firstName)
        console.log(this.lastName)
        console.log(this.email)
        console.log(this.phone)

        createContact({firstName:this.firstName,lastName:this.lastName ,email:this.email , phone:this.phone})
        .then(data=>{
            console.log(data);
            this.generatedContactId = data.Id;
        })
        .catch(error=>{
            console.log(error)
        })
    }
}