public class ValidateAddressUSPSController {
String url = 'http://production.shippingapis.com/ShippingAPI.dll?API=Verify&XML=';
 /*TODO return address back to calling method*/
 public void parseDomResponse(Address addrToVerify){
 
 String XMLToAttach = '<AddressValidateRequest USERID="<YOUR USERID>">';
 
 String addr = cleanAddress(addrToVerify);
 XMLToAttach = XMLToAttach + addr;
 System.debug('XML To send ['+XMLToAttach+']');
 
 Http h = new Http();
 HttpRequest request = new HttpRequest();
 request.setEndpoint(url);
 request.setMethod('GET');
 try{
     HttpResponse res = h.send(request);
     //Dom.Document head = res.getHeader();
     System.debug('Log the status code '+res.getStatusCode());
     System.debug('log the res body '+res.getBody());
     Dom.Document doc = res.getBodyDocument();
 
     Dom.XMLNode address = doc.getRootElement();
 
     String name = address.getChildElement('name', null).getText();
     String state = address.getChildElement('state', null).getText();
     // print out specific elements
     System.debug('Name: ' + name);
     System.debug('State: ' + state);
 
     // Alternatively, loop through the child elements.
     // This prints out all the elements of the address
     for(Dom.XMLNode child : address.getChildElements()) {
     System.debug(child.getText());
     }
 }catch(Exception e)
 {
     System.debug('Error calling webservice -' +e.getMessage());
 }
 
 }
 /*The address may be dirty before we validate it. Use your own business rules to clean the address prior to sending it to the vendor for validation */
 private String cleanAddress(Address address){
 String xmlAddress = '';
 String streetAddr1 = '';
 String streetAddr2 = '';
 String city = '';
 String state = '';
 String postalCode = '';
 if(address.street.indexOfChar(44)>0)
 {
 System.debug('address contains commas');
 address.street.replaceAll(',',',');
 }
 
 if(address.street.indexOfChar(10)>0)
 {
 System.debug('contains new line character');
 List<String> streetStrings = address.street.split('\n');
 
 if(streetStrings.size()>2)
 {
 System.debug('RROR too many lines for the street address');
 }
 else if(streetStrings.size()==1)
 {
 
 streetAddr1 = streetStrings[0];
 streetAddr2 = '';
 
 }
 else
 {
 streetAddr1 = streetStrings[0];
 streetAddr2 = streetStrings[1];
 }
 
 }
 else
 {
 streetAddr1 = address.street;
 }
 
 city = address.city;
 state = address.state;
 postalCode = address.postalCode;
 
 
 xmlAddress = '<Address><Address1>'+streetAddr1+'</Address1><Address2>'+streetAddr2+'</Address2>';
 xmlAddress += '<City>'+city+'</City><State>'+state+'</State><Zip5>'+postalCode+'</Zip5><Zip4></Zip4></Address></AddressValidateRequest>';
 return xmlAddress;
 }
}