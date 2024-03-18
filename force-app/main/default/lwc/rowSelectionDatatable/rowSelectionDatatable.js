import { LightningElement ,track } from 'lwc';
import getAccounts from '@salesforce/apex/GenerateData.getAccounts';
export default class RowSelectionDatatable extends LightningElement {

    column = [
        { label: 'Name', fieldName: 'Name' }
    ];
    data;
    @track rowsSelect = [];
    connectedCallback()
    {
        getAccounts().then((res)=>{
            console.log('Data : ',res);
            this.data = res;
            console.log('Data is Here',JSON.stringify(this.data));
            this.rowsSelect.push(this.data[2].Id);
            this.rowsSelect.push(this.data[5].Id);
            console.log('Selected Data-->',this.rowsSelect);
        }).catch(err=>{
            console.log('Error-->:',err);
        });
    }


}