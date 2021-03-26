trigger ContactTrigger1 on Contact (after insert, after update){
    Map <Id, String> conMap = new Map <Id, String>();
    List <Contact> conList = new List<Contact>();
     for(Contact c: trigger.new){
        conMap.put(c.AccountId, c.Industry__c);    
    }
    ContactTriggerHandler1.method(conMap); // To update Account's Industry as same as Contact's Industry
}