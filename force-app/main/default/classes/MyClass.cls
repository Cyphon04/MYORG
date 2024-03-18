/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 01-26-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class MyClass {
    public static void getAccounts(List<Id> conId){
        Set<Id> idSet = new Set<Id>();
       	idSet.addAll(conId);
       	List<account> accList =  [SELECT Name FROM Account WHERE Id IN (SELECT AccountId FROM Contact WHERE AccountId != null AND Id IN :idSet)];
        System.debug('accList-->'+accList);
    }
    public static void getWrapperdata()
    {
        String wrapJSONData = '{"accounting" : [ { "firstName" : "John", "lastName" : "Doe","age" : 23 },{ "firstName" : "Mary","lastName" : "Smith","age" : 32 }],"sales" : [{ "firstName" : "Sally","lastName" : "Green","age" : 27 },{   "firstName" : "Jim","lastName" : "Galley","age" : 41 }]}'; 
        
        Hell_Wrapper deserializeData =  (Hell_Wrapper) JSON.deserialize(wrapJSONData,Hell_Wrapper.class);
        
        //System.debug(deserializeData.accounting[0].firstName);
    }
    
    
    public static void  createGenericsObject()
    {
        
        List<sObject> allObject = new List<sObject>();
        
        
        Contact con1 = new Contact(FirstName='Matt',LastName='Henry');
        allObject.add(con1);    
        
        Contact con2 = new Contact(FirstName='Rory',LastName='Burns');
        allObject.add(con2);    
        
        Contact con3 = new Contact(FirstName='Trent',LastName='Boult');
        allObject.add(con3);
        
        // Creating Refrences for Accounts
        Account accreference = new Account(ExternalID__c = 'SAP000010');
        con1.Account = accreference;
        con2.Account = accreference;
        Account acc = new Account(Name='Ericcson Consulting Pvt Ltd', ExternalID__c = 'SAP000010');
        allObject.add(acc);
        
        Account accreference2 = new Account(ExternalID__c = 'SAP000011');
        con3.Account = accreference2;
        Account acc2 = new Account(Name='Amazon Web Services Pvt Ltd', ExternalID__c = 'SAP000011');
        allObject.add(acc2);
        
       
        
        System.debug('sObject---->'+allObject);
        insert allObject;
    }

    @AuraEnabled
    public static List<sObject>  moreObjectData()
    {
        List<sobject> allObjectData = new List<sObject>();

        List<Account> accList = [SELECT Name FROM  Account];
        List<Contact> conList = [SELECT LastName FROM  Contact];

        allObjectData.addAll(accList);
        allObjectData.addAll(conList);

        return allObjectData;
    }
}