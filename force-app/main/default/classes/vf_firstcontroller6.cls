public class vf_firstcontroller6 {
    Public ApexPages.StandardSetController controller {
        Get {
            if(controller == null) {
                String query = 'SELECT Id, Name, Rating, Industry, AnnualRevenue, Type, Phone, Fax, Active__c FROM Account';
                if (searchKeyword != null && searchKeyword != '') {
                    query += ' WHERE Name LIKE \'%' + searchKeyword + '%\'';
                }
                query += ' ORDER BY Name';
                controller = new ApexPages.StandardSetController(Database.getQueryLocator(query));
            }
            return controller;
        }
        Set;
    }

    Public String searchKeyword { get; set; }

    Public List<Account> getAccounts() {
        controller.SetPageSize(5);
        return (List<Account>) controller.GetRecords();
    }

    Public PageReference clearSearch() {
        searchKeyword = '';
        return null;
    }
}