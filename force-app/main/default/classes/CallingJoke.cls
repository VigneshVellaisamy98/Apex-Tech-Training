public with sharing class CallingJoke {
    // public CallingJoke() {

    // }
    public static String getJoke(){

        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://official-joke-api.appspot.com/random_joke');
        req.setMethod('GET');
        Http http = new Http();
        HttpResponse res = http.send(req);
        
        WrapperGetJokeFromWeb getJoke = (WrapperGetJokeFromWeb) JSON.deserialize(res.getBody(),CallingJoke.WrapperGetJokeFromWeb.class);
        return getJoke.setup+getJoke.punchline;
    }
    public class WrapperGetJokeFromWeb{
        public String type{get; set;}
        public String setup{get; set;}
        public String punchline{get; set;}
        public Integer id{get;set;}
    }
}
