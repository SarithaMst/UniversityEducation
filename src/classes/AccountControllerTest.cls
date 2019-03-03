@isTest
public class AccountControllerTest {
//test for PreventDuplicate trigger on Time Estimating
   Static testMethod Void PreventDuplicate()
   {
      Boolean result = false;   
      try{
            Account Account1 = new Account(Name='Test');                         
            Account Account2 = new Account(Name='Test');
            Account[] Accounts = new Account[] {Account1, Account2};
      	    insert Accounts;
      		AccountController firstAcc = new AccountController();      
      		firstAcc.CheckDuplicateAccountName(Accounts);
      		//insert firstAcc;
       }catch(DmlException ex){ result = true;}
      System.assert(result);
   }
}