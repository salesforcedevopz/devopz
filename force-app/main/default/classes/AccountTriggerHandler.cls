public with sharing class AccountTriggerHandler {
    public AccountTriggerHandler() {

    }

    public beforeinsert(list<Account> acclist){
        for(Account a : acclist){
            if(a.numberofemployees == null){
                a.numberofemployees =1;
            }
        }
    }
    public afterinsert(list<Account> acclist){
        list<contact> test = new list<contact>();
        
        for(Account a : acclist){
            for(integer i=0;i<a.numberofemployees;i++){
                contact c = new contact();
                c.AccountId = a.id;
                c.lastname = a.name +'i';
                test.add(c);
            }
        }
        if(test.size()>0){
            insert test;
        }
    }
}
