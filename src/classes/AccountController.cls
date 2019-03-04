public class AccountController {
    public AccountController(){}
    public void CheckDuplicateAccountName(List<account> accounts)
    {
        //Testing pull request
        Set<string> newList=new Set<string>();
        List<account> accList=[select Name from Account WHERE CreatedDate = LAST_N_DAYS:15];
    	for(Account A: accList)
    	{
        	newList.add(A.Name);
        }
    	Boolean B;
    	for(Account acc:accounts)
    	{
        	B=newList.contains(acc.Name);
            Account at=new Account();
        if(B==true)
        { 
            //Account at=new Account();
            at.Id=acc.Id;
            at.Name=acc.Name;
            update at;
            acc.adderror('duplicate account');
        }
                      
    }
    }
}
