/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 03-11-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
trigger AccountSalaryTrigger on Account_Salary__c (after insert,after update,after delete , after undelete) {
    if(Trigger.isAfter)
    {
        if(Trigger.isInsert || Trigger.isDelete)
        {
            AccountHelper.accountUpdations(Trigger.new);
        }
        else if(Trigger.isUndelete)
        {
            AccountHelper.accountUpdations(Trigger.old);
        }
        else if(Trigger.isUpdate)
        {
            // For updating only those Records whoe's accountSalary has been modified
            List<Account_Salary__c> accountsToUpdate = new List<Account_Salary__c>();
            for(Id accountSalId : Trigger.newMap.keySet())
            {
                if(Trigger.oldMap.get(accountSalId).Salary_c__c != Trigger.newMap.get(accountSalId).Salary_c__c)
                {
                    Account_Salary__c accSalary = Trigger.newMap.get(accountSalId);
                    accountsToUpdate.add(accSalary);
                }
            }
            AccountHelper.accountUpdations(accountsToUpdate);
        }
    }
}