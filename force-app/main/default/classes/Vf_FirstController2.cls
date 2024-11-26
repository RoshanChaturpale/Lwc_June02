/*
1. Query and display all the accounts in a tabular format on a visualforce page. 2. Display the columns name, phone, address. 3. The name should be a hyperlink and on click of the link display contact
1. Query and display all the accounts in a tabular format on a visualforce page.
2. Display the columns name, phone, address.
3. The name should be a hyperlink and on click of the link display contacts and opportunity records
related to the account in different page block tables.
4. The page should be partially rendered and it should not reload. 
*/



public class Vf_FirstController2 {
    
    
    public string recid{get;set;}    
    public list<Account> Acclst{get;set;}
    public List<Contact> contacts {get; set;}
    public List<Opportunity> opportunities {get; set;}
    
    public Vf_FirstController2(){
        Acclst = [SELECT Id, Name, Phone, BillingCountry, BillingPostalCode, BillingState, BillingCity, BillingStreet FROM Account LIMIT 10];
        contacts=null;
        opportunities=null;
    }
    
    public void showDetails() {
        contacts=[SELECT Id, FirstName, LastName, Email FROM Contact WHERE AccountId=:recId];
        opportunities=[SELECT Id, Name, StageName, CloseDate FROM Opportunity WHERE AccountId=:recId];
    }
}