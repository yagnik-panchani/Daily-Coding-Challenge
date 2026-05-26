public class ContactHandler {

    public static void validateDuplicateEmail(
        List<Contact> conList
    ) {

        Set<String> emails = new Set<String>();

        for(Contact c : conList) {

            if(c.Email != null) {

                emails.add(c.Email);
            }
        }


        Map<String, Contact> existingEmails =
            new Map<String, Contact>();


        for(Contact con : [

            SELECT Id, Email
            FROM Contact
            WHERE Email IN :emails
        ]) {

            existingEmails.put(
                con.Email,
                con
            );
        }


        for(Contact c : conList) {

            if(existingEmails.containsKey(c.Email)) {

                c.addError(
                    'Duplicate Email Found.'
                );
            }
        }
    }
}
