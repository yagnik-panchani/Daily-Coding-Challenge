public class DefaultEmailHandler {

    public static void setDefaultEmail(
        List<Contact> conList
    ) {

        for(Contact con : conList) {

            if(con.Email == null) {

                con.Email =
                    'default@gmail.com';
            }
        }
    }
}
