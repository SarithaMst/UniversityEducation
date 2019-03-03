trigger LeadTriggerHandler on Lead (after insert) {
//Instantiate an object called cc from the class LeadHandler
    LeadHandler cc = new LeadHandler();
    //Invoke the method updateLead and send a List of Leads as an input parameter
    if(Trigger.isAfter)
    cc.updateLead(Trigger.new);
}