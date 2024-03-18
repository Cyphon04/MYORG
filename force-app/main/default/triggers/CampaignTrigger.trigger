trigger CampaignTrigger on Campaign (before insert) {
    if(Trigger.isBefore)
    {
        if(Trigger.isInsert)
        {
            CampaignHelper.CampaignNameSuffix(Trigger.New);
        }
    }
}