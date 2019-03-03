@isTest
public class LeadHandlerTest {
   Static testMethod Void getLeads()
   { Boolean result = false;
      try{
            Lead Account1 = new Lead(FirstName='Test1',LastName='Test1',Interested_Course__c='Java',Company='[not provided]',DOB__c=Date.newInstance(2008,11,20));                         
            Lead Account2 = new Lead(FirstName='Test2',LastName='Test2',Interested_Course__c='Dotnet',Company='[not provided]',DOB__c=Date.newInstance(2008,12,25));
            Lead[] leads = new Lead[] {Account1, Account2};
      	    insert leads;
          	LeadHandler firstAcc = new LeadHandler();      
      		firstAcc.updateLead(leads);
         }catch(DmlException ex){ result = true;}
      System.assert(result);
   }
}