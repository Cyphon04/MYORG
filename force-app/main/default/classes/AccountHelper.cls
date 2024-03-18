/**
 * @description       : Account
Total_Salary__c (Number)
Max_Salary__c (Number)



Account_Salary__c
Account__c (lookup)
Name (String)
Salary__c (Number)


An Account can have multiple Account_Salary__c records that look up to an Account by the Account__c.

Write a trigger that would update the Account Total_Salary__c, Max_Salary__c when a new Account salary record is:
Inserted
Update
Deleted
Undelete
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 03-11-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class AccountHelper {
    public static void accountUpdations(List<Account_Salary__c> accountSalaries)
    {
        Set<Id> accountIds = new Set<Id>();
        for(Account_Salary__c accountSalary : AccountSalaries)
        {
            accountIds.add(accountSalary.Account__c);
        }
        AggregateResult[] aggResults = [SELECT SUM(Salary_c__c) sum, Max(Salary_c__c) max, Account__c
                                       FROM Account_Salary__c  
                                       GROUP BY Account__c 
                                       HAVING Account__c IN :accountIds];
        List<Account> accountUpdates = new List<Account>();
        for(AggregateResult aggregate : aggResults)
        {
            Account account = new Account();
            account.Id = (Id) aggregate.get('Account__c');
            account.Total_Salary_c__c = (Decimal) aggregate.get('sum');
            account.Max_Salary_c__c = (Decimal) aggregate.get('max');

            accountUpdates.add(account);
        }
        if(accountUpdates.size() > 0)
        {
            Database.SaveResult[] srresult = Database.update(accountUpdates,false); 
        }
    }
        
}