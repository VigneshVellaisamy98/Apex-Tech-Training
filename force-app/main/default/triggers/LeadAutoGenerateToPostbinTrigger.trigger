trigger LeadAutoGenerateToPostbinTrigger on Lead (after insert) {
    public static final String POSTBIN_URL = 'https://www.toptal.com/developers/postbin/b/1691559529014-5857123641762'; // Replace with your actual Postbin URL
    
    List<Lead> newLeads = Trigger.new;
    List<String> leadInfoList = new List<String>();
    
    for (Lead lead : newLeads) {
        // Construct the lead information as a JSON payload
        Map<String, Object> leadInfo = new Map<String, Object>();
        leadInfo.put('Name', lead.Name);
        leadInfo.put('Email', lead.Email);
        // Add other relevant lead fields
        
        String leadInfoJson = JSON.serialize(leadInfo);
        leadInfoList.add(leadInfoJson);
    }
    
    // Send the JSON payloads to Postbin using an HTTP callout
    Http http = new Http();
    HttpRequest request = new HttpRequest();
    request.setEndpoint(POSTBIN_URL);
    request.setMethod('POST');
    request.setHeader('Content-Type', 'application/json');
    request.setBody(String.join(leadInfoList, '\n'));
    
    HttpResponse response = http.send(request);
    // Handle the response if needed
}
