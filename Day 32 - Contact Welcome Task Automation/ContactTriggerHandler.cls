public class ContactTriggerHandler {

    public static void createTask(
        List<Contact> conList
    ) {

        List<Task> taskList =
            new List<Task>();


        for(Contact con : conList) {

            if(con.Email != null) {

                Task t = new Task();

                t.Subject =
                    'Welcome Call';

                t.Status =
                    'Not Started';

                t.Priority =
                    'Normal';

                t.WhoId =
                    con.Id;

                taskList.add(t);
            }
        }


        if(!taskList.isEmpty()) {

            insert taskList;
        }
    }
}
