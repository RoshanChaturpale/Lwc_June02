public class QueryContact {
  public static Id getContactID(String lastName, String title) {
    try {
      Contact myContact = Database.query(
        'SELECT ID FROM Contact WHERE lastName = :lastName AND title = :title LIMIT 1'
      );
      return myContact.Id;
    } catch (Exception ex) {
      return null;
    }
  }

 public static Id getContactIDWithBinds(Map<String, Object> bindVars) {
    String query = 'SELECT ID from Contact where LastName =: lastname AND Title =: title limit 1';
     List<Contact> contacts = Database.querywithBinds(query, bindVars, AccessLevel.USER_MODE);
     
     if(contacts != null && !contacts.isEmpty()){
         return contacts[0].Id;
         
     }else{
         return null;
     }
}
    
}