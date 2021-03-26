@isTest
public class AccountTrigger1Test {
    
    @isTest
    public static void testAccountTriggerForContact(){
        Test.startTest();
        Account acc = new Account (Name = 'AccountName', Industry = 'Agriculture');
        insert acc;
        Contact con1 = new Contact (LastName = 'Contact1Name', AccountId = acc.Id, Industry__c = 'Banking');
        insert con1;
        Contact con2 = new Contact (LastName = 'Contact2Name', AccountId = acc.Id, Industry__c = 'Education');
        insert con2; 
        acc.Industry = 'Healthcare';
        update acc;
        List<Contact> conList = [SELECT Industry__c FROM Contact WHERE AccountId =: acc.Id];
        System.assertEquals(acc.Industry, conList[0].Industry__c);
        System.assertEquals(acc.Industry, conList[1].Industry__c);
        Test.stopTest();
    }
    
}