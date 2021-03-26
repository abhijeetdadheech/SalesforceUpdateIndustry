trigger AccountTrigger1 on Account (after update) {
    Map <Id, String> accMap = new Map <Id, String>();
    for(Account a: trigger.new){
        if(trigger.newMap.get(a.Id).Industry != trigger.oldMap.get(a.Id).Industry){
            accMap.put(a.id, a.Industry);
        }
    }
    AccountTriggerhandler1.method(accMap);
}