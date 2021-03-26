public class AccountTriggerhandler1 {
    public static void method(Map <Id, String> accMap){
        integer numOfCallAccountTrigger= 0; // To check recursion
        List<Contact> conList = new List<Contact>();
        for(Contact c: [SELECT ID, Industry__c, AccountId from Contact where AccountId IN: accMap.keySet()]){
            if(c.Industry__c != accMap.get(c.Accountid)){  // To handle recursion
                c.Industry__c = accMap.get(c.Accountid);
                conList.add(c);
            }
        }
        if(conList.size()>0){
            update conList;
        }
        numOfCallAccountTrigger = numOfCallAccountTrigger +1;  // To check recursion
        system.debug('===numOfCallAccountTrigger==='+numOfCallAccountTrigger);
    }
}