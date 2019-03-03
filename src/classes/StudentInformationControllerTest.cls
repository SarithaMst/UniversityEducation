@IsTest public with sharing class StudentInformationControllerTest {
    @isTest static void testMethodForException()//Checking Records for exception
    {
    Lead newCon = new Lead();//Insert Lead
        //testAccount.Name='Test Account' ;
        //insert testAccount;
        //Contact cont = new Contact();
        newCon.FirstName ='Test1';
        newCon.LastName ='Test2';
        newCon.Phone='4892304567';
        newCon.Email='TestAccount@abc.com';
        newCon.DOB__c=Date.newInstance(2002,1,12);
        newCon.Interested_Course__c='Civil';
        newCon.Street='2321 r';
        newCon.City='Mesa';
        newCon.State='AZ';
        newCon.PostalCode='89768';
 	    newCon.Country='USA';  
        insert newCon;
        ApexPages.StandardController sc = new ApexPages.StandardController(newCon);
        StudentInformationController contactextObj = new StudentInformationController();//Instantiate the Class
        try
        {
            contactextObj.save();//Call the Method
        }
        catch(Exception e)
        {}
        list<Lead> acc = [select id from Lead];//Retrive the record
        integer i = acc.size();
        system.assertEquals(1,i);//Test that the record is inserted        
         
}
}