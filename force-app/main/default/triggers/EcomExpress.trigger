trigger EcomExpress on Consignment_Case__c (after insert) {
    if(Trigger.isAfter)
    {
        if(Trigger.isInsert)
        {
            String newList = JSON.serialize(Trigger.new);
            EcomExpressHelper.contactDataFetched(newList);
        }
    }
}