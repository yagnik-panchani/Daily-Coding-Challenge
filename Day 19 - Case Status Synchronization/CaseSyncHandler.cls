public class CaseSyncHandler {

    public static void syncCaseStatus(
        List<Case> caseList,
        Map<Id, Case> oldMap
    ) {

        Set<Id> caseIds = new Set<Id>();


        for(Case cs : caseList) {

            if(
                oldMap.get(cs.Id).Status !=
                cs.Status
            ) {

                caseIds.add(cs.Id);
            }
        }


        List<Task> taskList = [

            SELECT Id,
                   Status,
                   WhatId
            FROM Task
            WHERE WhatId IN :caseIds
        ];


        Map<Id, String> statusMap =
            new Map<Id, String>();


        for(Case cs : caseList) {

            statusMap.put(
                cs.Id,
                cs.Status
            );
        }


        for(Task t : taskList) {

            t.Status =
                statusMap.get(
                    t.WhatId
                );
        }


        if(!taskList.isEmpty()) {

            update taskList;
        }
    }
}
