public class ContactTriggerHandler1 {
    public static void method(Map <Id, String> conMap){
        integer numOfCallContactTrigger= 0; // To check recursion
        List<Account> accList = new List<Account>();
        for(Account a: [SELECT ID, Industry from Account where Id IN: conMap.keySet()]){
            if(a.Industry != conMap.get(a.Id)){  // To handle recursion
                a.Industry = conMap.get(a.Id);
                accList.add(a);
            }
        }
        if(accList.size()>0){
            upsert accList;
        }
        numOfCallContactTrigger = numOfCallContactTrigger +1;  // To check recursion
        system.debug('===numOfCallContactTrigger==='+numOfCallContactTrigger); 
    }
    
}