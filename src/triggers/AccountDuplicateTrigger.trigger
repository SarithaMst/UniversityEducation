trigger AccountDuplicateTrigger on Account (before insert,before update) {
List<Account> allaccounts = Trigger.new;
    //List<String> ls = new List<String>();
    AccountController ac=new AccountController();
    ac.CheckDuplicateAccountName(allaccounts);
    if((Trigger.isInsert)||(Trigger.isUpdate)){
         ac.CheckDuplicateAccountName(allaccounts); }
    

}