public with sharing class StudentApplicationController {
        //Public Contact con{get;set;}
    //Testing purpose
    public Application__C app {get; set;}
    public string fName{get;set;}
    public string lName{get;set;}
    public string email{get;set;}
    public Date dateOfBirth{get;set;}
    
    public string education{get;set;}
    public string instutionName{get;set;}
    public integer score{get;set;}
    public integer year{get;set;}
    
    public string employerName{get;set;}
    public string designation{get;set;}
    public date startDate{get;set;}
    public date endDate{get;set;}
    public string description{get;set;}
    
    public string street{get;set;}
    public string city{get;set;}
    public string state{get;set;}
    public string country{get;set;}
    public string postalCode{get;set;}
    
    
    public StudentApplicationController()
    {}
  
    public List<SelectOption> getItems() {
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('BA','BA'));
        options.add(new SelectOption('BCom','BCom'));
        options.add(new SelectOption('BCom','BCom'));
        options.add(new SelectOption('BTech','BTech'));
        options.add(new SelectOption('BZC','BZC'));      
        return options;
    }
    
    public PageReference save() 
    {try{
        Application__c app=new Application__c();
            app.First_Name__c=fName;
            app.Last_Name__c=lName;
            app.Email__c=email;
            app.DOB__c=dateOfBirth;
            
            app.Education__c=education;
            app.Academic_Instution__c=instutionName;
            app.GPA_Score__c=score;
            app.CompletedYear__c=year;
        
            app.Instution_Street__c=street;
            app.Instution_City__c=city;
            app.Instution_State__c=state;
            app.Instution_PostalCode__c=postalCode;
            app.Instution_Country__c=country; 
        
            app.EmployerName__c=employerName;
            app.Designation__c=designation;
            app.Job_StartDate__c=startDate;
            app.Job_EndDate__c=endDate;
            app.Description__c=description; 
            //app.Contact_Name__c=fName+' '+lName;
            insert app;
            PageReference p = apexPages.currentPage();
            ApexPages.Message msg=new ApexPages.Message(ApexPages.Severity.CONFIRM,'Record Created Successfully.Thank you!');
            ApexPages.addMessage(msg);
            ClearText();
            return p;
    }
     catch(DMLException ex)
     {ApexPages.addMessages(ex);}
     return null;
    }
    public void ClearText()
    {
            fName='';
            lName='';
            email='';
            dateOfBirth=null;
            street='';
             city='';
             state='';
            postalCode='';
            country='';  
            employerName='';
            startDate=null;endDate=null;
            designation='';
            description='';
            instutionName='';
            score=null;
            year=null;
    }   

}
