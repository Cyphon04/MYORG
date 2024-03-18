import { LightningElement } from 'lwc';
import ParagParikhIcon from '@salesforce/resourceUrl/ParagParikhIcon';
import ICICIIcon from '@salesforce/resourceUrl/ICICIIcon';
export default class DinoFinance extends LightningElement {

    ICICI_Icon = ICICIIcon;
    ParagParikh_Icon = ParagParikhIcon;


    showFundDetails = false;
    handleFund(event)
    {
        if(event.target.dataset.fund == 'Parag_Parikh')
        {
            this.showFundDetails = true;
        }
    }
}