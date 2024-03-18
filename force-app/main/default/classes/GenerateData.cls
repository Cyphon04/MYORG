/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 01-25-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public without sharing class GenerateData {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts() {
        return [SELECT Name FROM Account];
    }

    @AuraEnabled(cacheable = true)
    public static List<Account> fetchAccounts() {
        return [SELECT Name,CreatedDate FROM Account];
    }


    // My New data
    @AuraEnabled(cacheable=true)
    public static Map<String, Object> getContactRecords(Integer pageSize, Integer page) {
        Integer offset = Math.max(0, (page - 1) * pageSize);
        List<Account> accList = [SELECT Name,CreatedDate FROM Account LIMIT :pageSize OFFSET :offset];
        Integer totalRecords = [SELECT COUNT() FROM Contact];
        
        Map<String, Object> result = new Map<String, Object>();
        result.put('contacts', accList);
        result.put('totalRecords', totalRecords);
        return result;
    }
}