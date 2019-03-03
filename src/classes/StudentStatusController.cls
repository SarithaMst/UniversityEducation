public with sharing class StudentStatusController {

  public User currentuser{get;set;} 
  public List<Application__c> apps{get;set;}
  Public List<Application__c> appList;
  public string applicationNumber;
    
  public StudentStatusController(){
       currentuser=new User();
      if(UserInfo.getuserId()!=null){
          //currentuser=[Select Id,Name,FirstName,LastName,Email from User where Id='0051U000002FK4Y']; //:userinfo.getuserId()];
          //0051U000002FK4Y
         currentuser=[Select Id,FirstName,LastName,Name,Email from User where Id=:UserInfo.getUserId()];
         string strName =currentuser.FirstName+currentuser.LastName;
         apps= oppData(strName);  
         if(apps.size()>0)
         {
             Application__c ap=new Application__c();
            for(Application__c a:apps)
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

  Public List<Application__c> oppData(string uname)
  {
          try{
          if(uname!=null && uname!='')
          {
              appList=[SELECT Name,Email__C,DOB__c,Education__c,Academic_Instution__c,Status__c,First_Name__c,Last_Name__c FROM Application__c
               WHERE First_Name__c =:currentuser.FirstName AND Last_Name__c=:currentuser.LastName];             
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