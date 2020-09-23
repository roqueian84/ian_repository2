public with sharing class AccountController2 {
        @AuraEnabled(Cacheable=true)
    public static Account[] getAccounts() {
        return [SELECT Id, Name, Type, accountLink2__c, Industry
            FROM Account ORDER BY LastModifiedDate DESC LIMIT 10];
    }
    
    @AuraEnabled
    public static Map<String, Object> upsertAccounts(Map<String,Object> data){
        List<Account> accountList = (List<Account>) JSON.deserialize(JSON.serialize(data.get('accountList')),List<Account>.class);
        /*List<Account> toInsert = new List<Account>();
        List<Account> toUpdate = new List<Account>();
        
        for(Account accountRecord : accountList){
            String accountRecordId = (String)accountRecord.Id;
            if(string.isBlank(accountRecordId)){
                accountRecord.Id = null;
                toInsert.add(accountRecord);
            }else{
                toUpdate.add(accountRecord);
            }
        }
        
        try{
            insert toInsert;
            update toUpdate;
        }catch(Exception ex){
        }*/
        upsert accountList;
        Map<String, Object> updateResults = new Map<String, Object>();
        updateResults.put('account', accountList);
        return updateResults;
    }
}