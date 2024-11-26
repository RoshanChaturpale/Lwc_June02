public class InvocableMethodwithApex {
    
  /*  @InvocableMethod
    Public static List<String> Method1(List<id> ids){
        
        List<String> AccountName = new List<String>();
        
        List<Account> accounts = [select Name From Account where id In : ids];
        
        For(Account acc : accounts){
            AccountName.add(acc.Name);
        }
        return AccountName;
    }
    */
     @InvocableMethod
    Public static List<Decimal> Method2(List<id> ids){
        
        List<Opportunity> oppList =[select AccountId, Amount from Opportunity where id =: ids[0]];
        
        List<Account> accList = [Select AnnualRevenue from Account where id =: oppList[0].AccountId];
        
        List<Decimal> AnnualRevenueList = new List<Decimal>();
        
        accList[0].AnnualRevenue = accList[0].AnnualRevenue + oppList[0].Amount;
        
        Update accList;
        
        AnnualRevenueList.add(accList[0].AnnualRevenue);
        return AnnualRevenueList;
        
        
    }
    

}