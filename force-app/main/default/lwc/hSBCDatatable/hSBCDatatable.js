import { LightningElement,wire,track} from 'lwc';
import getOpportunityData from '@salesforce/apex/FetchingOpportunityData.getOpportunityData';

import getFilteredOpportunityStringSearch from '@salesforce/apex/FetchingOpportunityData.getFilteredOpportunityStringSearch';
// import getFilteredOpportunityAmountSearch from '@salesforce/apex/FetchingOpportunityData.getFilteredOpportunityAmountSearch';
import getFilteredOpportunityDataSearch from '@salesforce/apex/FetchingOpportunityData.getFilteredOpportunityDataSearch';
export default class HSBCDatatable extends LightningElement {

    @track resultData = [] ;
    newData = [];
    @track isShowModal = false;
    dataLength;

    dateField ;
    stageNameField;

    @track stageNames = [{label:'Prospecting',value:'Prospecting'},
                  {label:'Qualification',value:'Qualification'},
                  {label:'Needs Analysis',value:'Needs Analysis'},
                  {label:'Value Proposition',value:'Value Proposition'},
                  {label:'Id. Decision Makers',value:'Id. Decision Makers'},
                  {label:'Perception Analysis',value:'Perception Analysis'},
                  {label:'Proposal/PriceQuote',value:'Proposal/PriceQuote'},
                  {label:'Negotiation/Review',value:'Negotiation/Review'},
                  {label:'Closed Won',value:'Closed Won'},
                  {label:'Closed Lost',value:'Closed Lost'}];
    
                  handleDate(event)
                  {
                    console.log('Date Field',event.target.value);
                    this.dateField = event.target.value;
                  }

                  handleField(event)
                  {
                    this.stageNameField = event.target.value;
                    console.log('stageNameField Field',this.stageNameField);
                  }
    connectedCallback()
    {
        getOpportunityData().then((data)=>{
            console.log('Oppoty s is Here',data);
            this.resultData = data;
            this.dataLength = data.length;
            console.log('this.resultData',JSON.parse(JSON.stringify(this.resultData)));
            console.log('Result Data',JSON.stringify(this.resultData));
            this.addingColors();
        }).catch((err)=>{
            console.log('Error is Here',err);
        });
    }
    addingColors()
    {
        this.resultData = JSON.parse(JSON.stringify(this.resultData)).map(e=>{
            if(e.StageName == 'Closed Lost'){
                e.rowStyle = 'background-color:#F4B184;width:2px;padding:0px;';
                return e;
            }
            else if(e.StageName == 'Closed Won')
            {
                e.rowStyle = 'background-color:#ABCF8A;width:2px;padding:0px;';
                return e;
            }
            else{
                e.rowStyle = 'background-color:#FED966;width:2px;padding:0px;';
                return e;
            }
        });
    }
    // Code for Value
    handleInput(event)
    {
        console.log('Event Fire Hua ho',event.target.value);
        let Val = event.target.value;
        console.log('Valu',Val);
        getFilteredOpportunityStringSearch({Value : Val}).then(res=>{
           console.log('Data Searche Waala Millas',res);
           this.resultData = res;
           this.addingColors();
        }).catch(err=>{
           console.log('Error Aagaya',err);
        });
    }

    applyFilters()
    {
        // will be adding Three Conditions 
        //  1. StageName != NULL  &&  CloseDate == NULL
        //  2. StageName == NULL  &&  CloseDate != NULL
        //  3. StageName != NULL  &&  CloseDate != NULL
        console.log('StageName-->',this.stageNameField);
        console.log('dateField-->',this.dateField);

        if(this.stageNameField != null && this.dateField == null)
        {
            console.log('Function Execute Kiya');
            getFilteredOpportunityStringSearch({Value : this.stageNameField}).then(res=>{
                console.log('Data Filter Operator Waala',res);
                this.resultData = res;
                this.addingColors();
                this.isShowModal = false;
                this.stageNameField = null;
                this.dateField = null;
            }).catch(err=>{
                console.log('Error Aagaya',err);
            });
        }
        if(this.stageNameField == null && this.dateField != null){
            console.log('Else mein Aaya');
            getFilteredOpportunityDataSearch({Value : this.dateField}).then(res=>{
                console.log('Else Date Filter Operator Waala',res);
                this.resultData = res;
                this.addingColors();
                this.isShowModal = false;
                this.stageNameField = null;
                this.dateField = null;
            }).catch(err=>{
                console.log('Error Aagaya',err);
            });
        }
        
        


    }

    showModalBox() {  
        console.log('Modal is  Break');
        this.isShowModal = true;
    }

    hideModalBox() {  
        this.isShowModal = false;
    }
}