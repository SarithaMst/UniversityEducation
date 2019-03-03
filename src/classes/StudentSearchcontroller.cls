public with sharing class StudentSearchcontroller {
 public List<Application__c> apps {set;get;}  
    //public list<Account> app{set;get;}
    public string email {set;get;}
    public string applicationId {set;get;}
    public date dateofbirth {set;get;}
    public string applicationNumber;
    
    public StudentSearchcontroller()
    {
        
    }
    public void getdata(){
        try{
        if(email!=null && dateofbirth!=null)
          {apps=[Select Id,Name,First_Name__c,Last_Name__c,Email__c,Status__c from Application__c 
          WHERE Email__c = :email AND DOB__c=:dateofbirth];
          //[SELECT Name,Email__C,DOB__c,OpportunityName__r.Name,OpportunityName__r.StageName,OpportunityName__r.Interested_Course__c FROM Application__c
             }
          }
        catch(DmlException ex)
        {ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,'Student Application Not Found'));} 
      }
    
    
}