/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 03-04-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
trigger AccountTrigger on Account (after insert) {
    if(Trigger.isAfter)
    {
        if(Trigger.isInsert ||Trigger.isUpdate)
        {
           // stripeapi.makestripeapiCallout(JSON.serialize(Trigger.new));
           AccountHelper.getAccounts(Trigger.new);
        }
    }
}