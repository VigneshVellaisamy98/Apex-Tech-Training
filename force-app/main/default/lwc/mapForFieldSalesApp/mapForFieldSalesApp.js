import { LightningElement } from 'lwc';

export default class MapForFieldSalesApp extends LightningElement {
    mapMarkers;
    zoomLevel;
    listView;

    connectedCallback(){
        this.mapMarkers = [
            {
               location:{Street: "Saravanampatti" , City : "Coimbatore", State : "Tamil Nadu" , Postalcode : "641035"}
              
            },
            {
                location:{Street: "Cooperative nagar" , City : "Dindigul", State : "Tamil Nadu" , Postalcode : "624005"}
            }

        ];

        this.zoomLevel = 10;
        this.listView = "visible";
    }
}