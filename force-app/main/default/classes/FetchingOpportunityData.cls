/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 02-18-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/

public class FetchingOpportunityData {
    @AuraEnabled
    public static List<Opportunity> getOpportunityData() {
        return [SELECT CloseDate,Name,Account.Name,StageName,Amount FROM  Opportunity];
    }
    @AuraEnabled
    public static List<Opportunity> getFilteredOpportunityStringSearch(String Value)
    {
        Value = '%' + Value +'%';
        System.debug('Apex Class Function  Invoked');
        return [SELECT CloseDate,Name,Account.Name,StageName,Amount FROM  Opportunity WHERE Name Like :Value  OR Account.Name LIKE :Value OR StageName LIKE :Value];
    }
    
    public static List<Opportunity> getFilteredOpportunityAmountSearch(Integer Value)
    {
        return [SELECT CloseDate,Name,Account.Name,StageName,Amount FROM  Opportunity WHERE Amount = :Value ];
    }

    @AuraEnabled
    public static List<Opportunity> getFilteredOpportunityDataSearch(String Value)
    {
        Date val = Date.valueOf(Value);
        return [SELECT CloseDate,Name,Account.Name,StageName,Amount FROM  Opportunity WHERE CloseDate = :Val];
    }
}