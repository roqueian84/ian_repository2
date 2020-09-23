public with sharing class AccountController3 {
    @AuraEnabled(Cacheable=true)
    public static Account[] getAccounts() {
        return [SELECT Id, Name, Type, accountLink2__c, Industry
            FROM Account ORDER BY LastModifiedDate DESC LIMIT 10];
    }
    
    
}