trigger AccountTrigger on Account (after insert,before insert) {
if(trigger.isinsert){
    AccountTriggerHandler t = new AccountTriggerHandler();
    if(trigger.isBefore){
    t.beforeinsert(trigger.new);
}
if(trigger.isAfter){
    t.afterinsert(trigger.new);
}
}
}