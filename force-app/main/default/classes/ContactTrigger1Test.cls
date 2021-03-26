@isTest
public class ContactTrigger1Test {
    @isTest
    public static void testContactTriggerForAccount(){
        Test.startTest();
        Account acc = new Account (Name = 'AccountName', Industry = 'Agriculture');
        insert acc;
        Contact con1 = new Contact (LastName = 'Contact1Name', AccountId = acc.Id, Industry__c = 'Banking');
        insert con1;
        List<Account> accList = [SELECT Industry FROM Account WHERE Id=: acc.Id];
        System.assertEquals(con1.Industry__c, [SELECT Industry FROM Account WHERE Id=: acc.Id].Industry); // To check for Insert Contact
        
        con1.Industry__c = 'Insurance';
        update con1;
        accList.clear();
        accList = [SELECT Industry FROM Account WHERE Id=: acc.Id];
        System.assertEquals(con1.Industry__c, [SELECT Industry FROM Account WHERE Id=: acc.Id].Industry); // To check for Update Contact
        Test.stopTest();
    }

}