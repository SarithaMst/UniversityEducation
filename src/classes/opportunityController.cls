public with sharing class opportunityController {
      public list<Opportunity> Opps{get;set;} 
      public opportunityController()
      {
          Opps= [select name,CloseDate,StageName,Interested_Course__c,DOB__c from Opportunity where Name='vilmaBrode'];
      }

      public pageReference oppList()
      {
      //if(selectedVal !=null) 
      //{
         //Opps= [select name,type,CloseDate,StageName from Opportunity where Name='vilmaBrode'];
      //}
      return null;

      } 
}