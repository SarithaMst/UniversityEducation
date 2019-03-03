public with sharing class StudentInformationController {
    // Variables
    //Public Contact con{get;set;}
    //public Account acc {get; set;}
    public Lead acc {get; set;}
    public string fName{get;set;}
    public string lName{get;set;}
    public string courseName{get;set;}
    public Date dateOfBirth{get;set;}
    public string email{get;set;}
    public string phone{get;set;}
    public string street{get;set;}
    public string city{get;set;}
    public string state{get;set;}
    public string country{get;set;}
    public string postalCode{get;set;}
    
    public StudentInformationController()
    {}
    Public List<SelectOption> getintrestedCourseList()
    {
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('Aerospace','Aerospace'));
        options.add(new SelectOption('Agricultural','Agricultural'));
        options.add(new SelectOption('Biomedical','Biomedical'));
        options.add(new SelectOption('Chemical','Chemical'));
        options.add(new SelectOption('Civil','Civil'));
        options.add(new SelectOption('Computer systems','Computer systems'));
        options.add(new SelectOption('Electrical','Electrical'));
        options.add(new SelectOption('Biotechnology','Biotechnology'));
        options.add(new SelectOption('Environmental','Environmental'));
        options.add(new SelectOption('Industrial','Industrial'));
        /*for(Lead s: leadCourse )
       {
            if(s.Interested_Course__c!=null)
            options.add(new SelectOption(s.Interested_Course__c,s.Interested_Course__c));
        }*/
        return options;    
    }
    public PageReference save() {
     try{/*
            Contact newCon=new Contact();
            newCon.FirstName=fName;
            newCon.LastName=lName;
            newCon.Phone=phone;
            newCon.Email=email;
            newCon.DOB__c=dateOfBirth;
            newCon.Interested_Course__c=courseName;
            newCon.MailingStreet=street;
            newCon.MailingCity=city;
            newCon.MailingState=state;
            newCon.MailingPostalCode=postalCode;
            newCon.MailingPostalCode=country;          
            insert newCon;
            PageReference p = apexPages.currentPage();
            ApexPages.Message msg=new ApexPages.Message(ApexPages.Severity.CONFIRM,'Record Created Successfully.Thank you!');
            ApexPages.addMessage(msg);
            ClearText();
            return p;*/
         //---------------------------
         Lead newlead=new Lead();
            newlead.FirstName=fName;
            newlead.LastName=lName;
           newlead.Phone=phone;
           newlead.Email=email;
           newlead.DOB__c=dateOfBirth;
            newlead.Interested_Course__c=courseName;
            newlead.Street=street;
            newlead.City=city;
            newlead.State=state;
            newlead.PostalCode=postalCode;
            newlead.Country=country;  
            newlead.Company=fName+lName;  
            insert newlead;
            PageReference p = apexPages.currentPage();
            ApexPages.Message msg=new ApexPages.Message(ApexPages.Severity.CONFIRM,'Record Created Successfully.Thank you!');
            ApexPages.addMessage(msg);
            ClearText();
            return p;
        }    
        catch(DmlException ex)
        {ApexPages.addMessages(ex);}         
        return null;
    }
    public void ClearText()
    {
            fName='';
            lName='';
            phone='';
            email='';
            dateOfBirth=null;
            street='';
             city='';
             state='';
            postalCode='';
            country='';
            
    }   
   /*
    public List<SelectOption> getaccIndustryList()
    {
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('select a value','select a value'));
        for(Account s: accounts )
        {
            if(s.Industry!=null)
            options.add(new SelectOption(s.id,s.Industry));
        }
        return options;
        
    }
public List<SelectOption> getStateList() {
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('Alabama','Alabama'));
        options.add(new SelectOption('Alaska','US'));
        options.add(new SelectOption('Arizona','Arizona'));
        options.add(new SelectOption('California','California'));
        options.add(new SelectOption('Colorado','Colorado'));
        options.add(new SelectOption('Florida','Florida'));
        options.add(new SelectOption('Indiana','Indiana'));
        options.add(new SelectOption('Kansas','Kansas'));
        options.add(new SelectOption('Ohio','Ohio'));
        return options;
    }
    */
       
}