public class CaseTaskHandler {

    public static void syncTask(
        List<Case> caseList,
        Map<Id, Case> oldMap
    ) {

        Set<Id> accIds = new Set<Id>();

        Set<Id> caseIds = new Set<Id>();


        // Detect Status Change
        for(Case cs : caseList) {

            if(
                oldMap.get(cs.Id).Status !=
                cs.Status
            ) {

                caseIds.add(cs.Id);

                if(cs.AccountId != null) {

                    accIds.add(cs.AccountId);
                }
            }
        }


        // Update Account Description
        List<Account> updatedAcc =
            new List<Account>();


        for(Case cs : caseList) {

            if(accIds.contains(cs.AccountId)) {

                Account acc = new Account();

                acc.Id = cs.AccountId;

                acc.Description =
                    'Latest Case Number : ' +
                    cs.CaseNumber +
                    ' | Latest Status : ' +
                    cs.Status;

                updatedAcc.add(acc);
            }
        }


        // Update Task Status
        List<Task> taskList = [

            SELECT Id,
                   Status,
                   WhatId
            FROM Task
            WHERE WhatId IN :caseIds
        ];


        Map<Id, String> caseStatusMap =
            new Map<Id, String>();


        for(Case cs : caseList) {

            caseStatusMap.put(
                cs.Id,
                cs.Status
            );
        }


        for(Task t : taskList) {

            t.Status =
                caseStatusMap.get(
                    t.WhatId
                );
        }


        // DML
        if(!updatedAcc.isEmpty()) {

            update updatedAcc;
        }


        if(!taskList.isEmpty()) {

            update taskList;
        }
    }
}
