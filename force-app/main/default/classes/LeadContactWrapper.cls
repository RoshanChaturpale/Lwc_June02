//Wrapper Class Code:


public class LeadContactWrapper {
    
    Public id recordId{get;set;}
 public string fName {get;set;}
 public string lName {get;set;}
 Public string emailId {get;set;}
 Public string contactNumber {get;set;}
 Public string faxNumber {get;set;} 
 Public boolean isSelected {get;set;}

    
    // Create a Constructor, which will convert the Lead record 
    // into our own custom datatype
    Public LeadContactWrapper(Lead ldRecord, boolean isChecked){
        
        recordId = ldRecord.Id;
 fName = ldrecord.FirstName;
 lName = ldRecord.LastName;
 contactNumber = ldRecord.Phone;
 emailId = ldrecord.Email;
 faxNumber = ldrecord.Fax;
 isSelected = isChecked;

    }
    
    // Create a Constructor, which will convert the Contact record 
   // into our own custom datatype
   Public LeadContactWrapper(Contact con, Boolean isChecked){
     
 recordId = con.id;
 fName = con.FirstName;
 lName = con.LastName;
 emailId = con.Email;
 faxNumber = con.Fax;
 contactNumber = con.Phone;
 isSelected = isChecked;
}
}