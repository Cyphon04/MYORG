/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 02-26-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
trigger OpportunityTrigger on Opportunity (after insert) {
    if(Trigger.isAfter)
    {
        if(Trigger.isUpdate || Trigger.isInsert) 
        {
            OpportunityHelper.createOpportunity(Trigger.newmap);
        }
    }
}