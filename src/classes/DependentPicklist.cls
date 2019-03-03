public class DependentPicklist {
    public String strCountryName { get; set; } 
    public String strStateName { get; set; }   
    public List<SelectOption> getCountries() 
    { 
        List<SelectOption> lstOption = new List<SelectOption>(); 
        lstOption.add(new SelectOption('None', 'Select')); 
        lstOption.add(new SelectOption('IN', 'India')); 
        lstOption.add(new SelectOption('US', 'United Sate'));   
        return lstOption; 
    }   
    public List<SelectOption> getStates() {
        List<SelectOption> lstOption = new List<SelectOption>();   
        if(strCountryName != null && strCountryName == 'IN') 
        { 
            lstOption.add(new SelectOption('DL', 'Delhi')); 
            lstOption.add(new SelectOption('SRE', 'Saharanpur')); 
            lstOption.add(new SelectOption('MZN', 'Muzzafarnagar')); 
        } 
        else if(strCountryName != null && strCountryName == 'US') 
        {   lstOption.add(new SelectOption('CO','Colorado')); 
         lstOption.add(new SelectOption('NE','Nevada')); 
         lstOption.add(new SelectOption('TE','Texas')); 
        } 
        else {
            lstOption.add(new SelectOption('None','Select')); 
        } 
        return lstOption;
    }
}