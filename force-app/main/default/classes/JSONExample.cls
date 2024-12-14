public class JSONExample {
    
    Public static void JSONExample1(){
        
        StaticResource st = [select id, name, body from StaticResource where name =: 'Json_format'];
        
        system.debug('JSON data from Java(System1) ===>' +st.body.tostring());
        
    }

}