public class LeadHandler {
    List<Lead> leadsNewRecords=new List<Lead>();
    public LeadHandler()
    {
        //leadsNewRecords =[Select Id, Name,Interested_Course__c,Company From Lead WHERE Company ='[not provided]' AND Interested_Course__c!=NULL];
    }
    Public void updateLead(List<Lead> leadsFromTrigger)
    {
        List<Lead> leadList = new List<Lead>();  
        integer cu=leadsFromTrigger.Size();
        system.debug('leads count :'+ cu);
        //Declare a For list loop to loop through the input parameter list leadsFromTrigger with an iterationvariable called currentLead
        for(Lead currentLead:leadsFromTrigger){
            //Instantiate an object called con from the sObject class Lead
            Lead newLead = new Lead();
            //Set the attribute LeadID of the newLead object to the value of the Id attribute of the currentLead object           
            if(currentLead.FirstName!=null && currentLead.LastName!=null)
            {
            if(currentLead.Interested_Course__c!=null && currentLead.Company=='[not provided]'){
                //Set the attribute Company of the newLead object to the value of the Interested_Course__c attribute of the currentLead object
                newLead.Id = currentLead.Id;
                newLead.Company = currentLead.FirstName+currentLead.LastName;
                leadList.add(newLead);
            }
            }
            //Add the newLead object to the leadList           
        }       
        //Persist the leadList to the database
        Database.update(leadList);
    }
}