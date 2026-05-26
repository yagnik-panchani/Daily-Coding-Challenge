public class LeadConversionHandler {

    public static void updateRecords(
        List<Lead> leadList,
        Map<Id, Lead> oldMap
    ) {

        List<Account> accList =
            new List<Account>();

        List<Contact> conList =
            new List<Contact>();

        List<Opportunity> oppList =
            new List<Opportunity>();


        // Detect Lead Conversion
        for(Lead l : leadList) {

            if(
                oldMap.get(l.Id).IsConverted !=
                l.IsConverted &&
                l.IsConverted
            ) {

                // Update Account
                if(l.ConvertedAccountId != null) {

                    Account a = new Account();

                    a.Id =
                        l.ConvertedAccountId;

                    a.Active__c = 'Yes';

                    accList.add(a);
                }


                // Update Contact
                if(l.ConvertedContactId != null) {

                    Contact c = new Contact();

                    c.Id =
                        l.ConvertedContactId;

                    c.Lead_Contact__c =
                        true;

                    conList.add(c);
                }


                // Update Opportunity
                if(l.ConvertedOpportunityId != null) {

                    Opportunity o =
                        new Opportunity();

                    o.Id =
                        l.ConvertedOpportunityId;

                    o.Description =
                        'Converted Lead : ' +
                        l.Name;

                    oppList.add(o);
                }
            }
        }


        // Update Accounts
        if(!accList.isEmpty()) {

            update accList;
        }


        // Update Contacts
        if(!conList.isEmpty()) {

            update conList;
        }


        // Update Opportunities
        if(!oppList.isEmpty()) {

            update oppList;
        }
    }
}
