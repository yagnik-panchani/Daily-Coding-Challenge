public class ContactTriggerHandler {

    public static void validateContactLimit(List<Contact> conList) {

        Set<Id> accIds = new Set<Id>();

        for(Contact c : conList) {

            if(c.AccountId != null) {

                accIds.add(c.AccountId);
            }
        }

        Map<Id, Integer> contactCountMap =
            new Map<Id, Integer>();


        for(Contact con : [

            SELECT Id, AccountId
            FROM Contact
            WHERE AccountId IN :accIds
        ]) {

            Integer countValue =
                contactCountMap.containsKey(con.AccountId)
                ? contactCountMap.get(con.AccountId)
                : 0;

            contactCountMap.put(
                con.AccountId,
                countValue + 1
            );
        }


        for(Contact c : conList) {

            Integer existingCount =
                contactCountMap.containsKey(c.AccountId)
                ? contactCountMap.get(c.AccountId)
                : 0;

            if(existingCount >= 2) {

                c.addError(
                    'Only two Contacts are allowed per Account.'
                );
            }
        }
    }
}
