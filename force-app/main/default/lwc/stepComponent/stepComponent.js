import { LightningElement , track ,api} from 'lwc';
import getAccounts from '@salesforce/apex/FetchingAccountData.getAccounts';
export default class StepComponent extends LightningElement {
    @track current='2';

    tonext(event)
    {
        console.log('OUTPUT : ');
        this.current++;
    }


    // Lookup Functionalities
    data;
    combobox = this.template.querySelector('.slds-combobox');
    value = "";

    isSearch = false;
    connectedCallback() {
        getAccounts().then(res=>{
            console.log('Account Data',res);
            this.data = res;
        }).catch(err=>{
            console.log('Error');
        });
    }


    handleClick()
    {
        if(this.template.querySelector('.slds-combobox').getAttribute("class") == 'slds-combobox slds-dropdown-trigger slds-dropdown-trigger_click')
        {
            this.template.querySelector('.slds-combobox').setAttribute("class" , 'slds-combobox slds-dropdown-trigger slds-dropdown-trigger_click slds-is-open');
        }
        else{
            this.template.querySelector('.slds-combobox').setAttribute("class" , 'slds-combobox slds-dropdown-trigger slds-dropdown-trigger_click');
        }
    }


    closeList()
    {
        this.template.querySelector('.slds-combobox').setAttribute("class" , 'slds-combobox slds-dropdown-trigger slds-dropdown-trigger_click');
        this.value = event.target.dataset.business;
        this.isSearch = true;
        console.log('Aakhir Aagaya');
    }
}