import { LightningElement , api } from 'lwc';

export default class EmployeeDetails extends LightningElement {
    // firstName = 'Vignesh';
    // lastName = 'Vellaisamy';
    // email = 'vigneshvellaisamy21@gmail.com';
    // phone = 7397072252;
    // Company = '4i apps solutions';

    @api firstName;
    @api lastName;
    @api email;
    @api phone;
    @api Company;
}
