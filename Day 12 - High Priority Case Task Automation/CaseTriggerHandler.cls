public class CaseTriggerHandler {

    public static void createTask(
        List<Case> caseList,
        Map<Id, Case> oldMap
    ) {

        List<Task> taskList =
            new List<Task>();


        for(Case cs : caseList) {

            Boolean priorityChanged =
                oldMap == null ||
                cs.Priority !=
                oldMap.get(cs.Id).Priority;


            if(
                cs.Priority == 'High' &&
                priorityChanged
            ) {

                Task t = new Task();

                t.Subject =
                    'Urgent Case Follow Up';

                t.Priority =
                    'High';

                t.Status =
                    'Not Started';

                t.WhatId = cs.Id;

                taskList.add(t);
            }
        }


        if(!taskList.isEmpty()) {

            insert taskList;
        }
    }
}
