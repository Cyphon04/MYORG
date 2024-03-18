public class EcomExpressHelper {
    @future
    public static void contactDataFetched(String newData)
    {
        System.debug('Comes In-->');
        List<Consignment_Case__c> consignmentList = (List<Consignment_Case__c>) JSON.deserialize(newData,List<Consignment_Case__c>.class);
        Set<Id> contactId = new Set<Id>();
        for(Consignment_Case__c con : consignmentList)
        {
            contactId.add(con.Name__c);
        }
        
        Map<Id,Contact> contactmap = new Map<Id,Contact>([SELECT Id, Email, MailingStreet, MailingCity, MailingState, MailingPostalCode, MailingCountry, MailingAddress FROM Contact WHERE id IN :contactId]);
        
        for(Consignment_Case__c con : consignmentList)
        {
            System.debug('Comes 1-->');
            if(contactmap.containsKey(con.Name__c))
            {
                System.debug('Comes 2-->');
                con.Email__c = contactmap.get(con.Name__c).Email;
                System.debug('Comes 3--> '+con);
            }
        }
        
        System.debug('Program Execution Finished');
    }
}