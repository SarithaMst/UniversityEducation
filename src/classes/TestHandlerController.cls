public class TestHandlerController {
public User currentuser{get;set;} 
  public List<Test__c> apps{get;set;}
  Public List<Test__c> appList;
  public string applicationNumber;
    
  public TestHandlerController(){
       currentuser=new User();
      if(UserInfo.getuserId()!=null){
          //currentuser=[Select Id,Name,FirstName,LastName,Email from User where Id='0051U000002FK4Y']; //:userinfo.getuserId()];
          //0051U000002FK4Y
         currentuser=[Select Id,FirstName,LastName,Name,Email from User where Id=:UserInfo.getUserId()];
         string strName =currentuser.FirstName+' '+currentuser.LastName;
         apps= oppData(strName);  
         if(apps.size()>0)
         {
             Test__c ap=new Test__c();
            for(Test__c a:apps)
            {
            //ap.Name=a.Name;
            ap.Id=a.Id;
            if(ap.Id!=null)
            applicationNumber=ap.Id;
            }
            }
            else
            ApexPages.addMessage(new ApexPages.message(ApexPages.severity.INFO,'Applications Not Found'));
      }
      }
     public Attachment attachment {
        get {
                if (attachment == null)
                attachment = new Attachment();
                return attachment;
             }
        set;
        }

    Public List<Test__c> oppData(string uname)
  {
          try{
          if(uname!=null && uname!='')
          {
              appList=null;//[SELECT Name,,OpportunityName__r.Name,OpportunityName__r.Interested_Course__c,OpportunityName__r.StageName FROM Test__c
                //WHERE OpportunityName__r.Name ='VilmaBrode'];
                  //[SELECT Name,Email__C,DOB__c,Status__c,Academic_Instution__c,Contact_Name__r.Name,Contact_Name__r.Interested_Course__c FROM Application__c
                //WHERE Contact_Name__r.Name =:uname];   OpportunityName__r.Email__c           
          
			}
          }
          catch (System.DMLException e)
          {ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,'Student Application Not Found'));}
          return appList;
      } 
    public PageReference upload() {
        attachment.OwnerId = UserInfo.getUserId();
        attachment.ParentId = applicationNumber;//'a001U000002o1Nl'; // the record the file is attached to
        attachment.IsPrivate = true;
    try {
            insert attachment;
        } catch (DMLException e) {
        ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,'Error uploading attachment'));
        return null;
        } finally {
        attachment = new Attachment(); 
        }
        ApexPages.addMessage(new ApexPages.message(ApexPages.severity.INFO,'Attachment uploaded successfully'));
        return null;
    }
    
}