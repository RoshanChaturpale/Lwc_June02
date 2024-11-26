public class InvocableMethodwithApex_Account_01 {
    
    @InvocableMethod(Label='checkedAccouId')
    Public static void invocableWithAccountRecords(list<id> setids){
        
        system.debug('setid with invocable method is ===> ' +setids);
    }

}