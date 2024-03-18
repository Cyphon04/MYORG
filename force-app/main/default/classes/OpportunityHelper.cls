/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 02-26-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class OpportunityHelper {
    public static void createOpportunity(Map<Id,Opportunity> oppMap)
    {
        Set<Id> accountId = new Set<Id>();
        for(Opportunity opp : oppMap.values())
        {
            accountId.add(opp.AccountID);
        }
     
        AggregateResult[] aggregate = [SELECT SUM(Amount), Count(ID), AccountId FROM Opportunity GROUP BY AccountId HAVING AccountId IN :accountId];

        Map<Id,Account> accMap = new Map<Id,Account>([SELECT Name,Total_Amount__c,Total_Opportunity__c FROM Account WHERE ID In :accountId]);
        

        for(AggregateResult arr : aggregate)
        {
            accMap.get((Id) arr.get('AccountId')).Total_Amount__c = (Decimal) arr.get('sum(Id)');
            accMap.get((Id) arr.get('AccountId')).Total_Opportunity__c = (Integer) arr.get('count(Id)');
        }

        update accMap.values();
    }
}