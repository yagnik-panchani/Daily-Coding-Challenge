public class LeadHandler {

    public static void createTask(
        List<Lead> leadList,
        Map<Id, Lead> oldMap
    ) {

        List<Task> taskList =
            new List<Task>();


        for(Lead l : leadList) {

            if(
                oldMap.get(l.Id).IsConverted !=
                l.IsConverted &&
                l.IsConverted
            ) {

                Task t = new Task();

                t.Subject =
                    'Lead Conversion Follow Up';

                t.Status =
                    'Not Started';

                t.Priority =
                    'Normal';

                t.Description =
                    'Converted Lead : ' +
                    l.Name;

                taskList.add(t);
            }
        }


        if(!taskList.isEmpty()) {

            insert taskList;
        }
    }
}
