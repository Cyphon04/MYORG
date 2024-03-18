public class ExternalIdExample {
    public static void myMethod()
    {
        Opportunity newOpportunity = new Opportunity(
    	Name='Test Opportunity 1000',
    	StageName='Prospecting',
    	CloseDate=Date.today().addDays(7));
        
        Account accountReference = new Account(ExternalID__c = 'SAP000005');
        
        newOpportunity.Account = accountReference;
        
        Account parentAccount = new Account(Name='Viv Richards', ExternalID__c = 'SAP000005');
        
        List<sObject> mList = new List<sObject>();
        mList.add(newOpportunity);
        mList.add(parentAccount);
        insert mList;
        
        //Database.SaveResult[] results = Database.insert(new SObject[] {parentAccount, newOpportunity});
       // for (Integer i = 0; i < results.size(); i++) {
    	//		if (results[i].isSuccess()) {
        //			System.debug('Successfully Created ID: '+ results[i].getId());
    		//	} 
	//	}
    }
}