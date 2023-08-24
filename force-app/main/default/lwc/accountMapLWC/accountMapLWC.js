import { LightningElement, api, wire } from 'lwc';
import getBillingAddress from '@salesforce/apex/AccountBillingAddressHelper.getBillingAddress';

export default class AccountMapLWC extends LightningElement {
    @api accountId;
    billingAddress = '';

    @wire(getBillingAddress, { accountId: '$accountId' })
    wiredBillingAddress({ error, data }) {
        if (data) {
            this.billingAddress = data;
            this.initializeMap();
        } else if (error) {
            console.error(error);
        }
    }

    initializeMap() {
        // Initialize the OpenStreetMap using Leaflet.js
        const map = L.map(this.template.querySelector('.map')).setView([0, 0], 2); // Default center and zoom
        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            attribution: '© OpenStreetMap contributors'
        }).addTo(map);
    }
}
