public class VerifyPhoneNumberApi {

    Public static phoneNumberWrapper invokePhoneAPI(String mobNumber){
    
        string Apikey = '1524C9C067E840F0B3A80B0D684C4778';
        
        Http htp = new Http();
        
        HttpRequest request = new HttpRequest();
        request.setEndPoint('https://api.veriphone.io/v2/verify?phone='+mobNumber+'&key='+Apikey);
        request.setMethod('GET');
        request.setTimeOut(60000);
        
        HttpResponse response = new HttpResponse();
        response = htp.send(request);
        
        phoneNumberWrapper phoneWrap = (phoneNumberWrapper) JSON.deserialize(response.getBody() , phoneNumberWrapper.Class);
        
        system.debug('phoneWrap' +phoneWrap);
        
        return phoneWrap;
        
        
    }
    
    @AuraEnabled
    Public static string verifyPhoneAndUpdateAccount(id accountId){
                
        
        Account acc = [SELECT Id, Phone FROM Account WHERE Id = :accountId LIMIT 1];
        system.debug(acc.Phone);

        if (String.isBlank(acc.Phone)) {
            throw new AuraHandledException('Phone number is not available.');
        }

        phoneNumberWrapper result = invokePhoneAPI(acc.Phone);

        Boolean isValid = false;
        if (result != null && result.phone_valid == 'true') {
            isValid = true;
            acc.Phone_Verified__c = true;
        } else {
            acc.Phone_Verified__c = false;
        }

        update acc;
        
        if (isValid) {
            return 'Phone number is valid and verified successfully!';
        } else {
            return 'Phone number is invalid.';
        }
        
        
        
    }
    
    
    
    
    Public class phoneNumberWrapper{
        
        
        Public string status;
        Public string phone;
        public string phone_valid;
        public string phone_type;
        public string phone_region;
        public string country;
        public string country_code;
        public string country_prefix;
        public string international_number;
        public string local_number;
        public string e164;
        public string carrier;
      }

}