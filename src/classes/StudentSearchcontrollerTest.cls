@isTest
public class StudentSearchcontrollerTest {
    static testMethod void testData()
    {
        //Application__c ac=[Select Name,First_Name__c,OpportunityName__c,Email__c,DOB__c from Application__c where Email__c='Test Account@abc.com'];
    }
static testMethod void testMethod1() 
    {
        Application__c testAccount = new Application__c();
        testAccount.Email__c='TestAccount@abc.com' ;
        testAccount.DOB__c=Date.newInstance(2002,1,12);
        testAccount.First_Name__c='Test1' ;
        testAccount.Last_Name__c='Test2' ;
        //testAccount.OpportunityName__c='Test1Test2' ;
        testAccount.Academic_Instution__c='Test Instution' ;
        testAccount.Instution_Street__c='2324 r' ;
        testAccount.Instution_City__c='Test Account' ;
        testAccount.Instution_State__c='Test Account' ;
        testAccount.Instution_PostalCode__c='56567';
        testAccount.Instution_Country__c='USA' ;
        insert testAccount;

        Attachment attach=new Attachment();     
        attach.Name='Unit Test Attachment';
        Blob bodyBlob=Blob.valueOf('Unit Test Attachment Body');
        attach.body=bodyBlob;
        attach.parentId=testAccount.id;
        insert attach;
        List<Application__c> acc = [select id,Name from Application__c];//Retrive the record
        integer ids = acc.size();
        system.assertEquals(1,ids);//Test that the record is inserted   
        
        Test.StartTest(); 

            ApexPages.currentPage().getParameters().put('Pid', String.valueOf(testAccount.Id));
            StudentSearchcontroller  testAccPlan = new StudentSearchcontroller();   
            testAccPlan.attachment.body=bodyBlob;
            testAccPlan.attachment.Name='Unit Test Attachment1';
            testAccPlan.upload();   
            //testAccPlan.deleteAttachmentId = attach.id;
            //testAccPlan.DeleteAttach();

        Test.StopTest();
    }
}