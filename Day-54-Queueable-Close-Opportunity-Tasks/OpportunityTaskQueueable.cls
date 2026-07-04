public with sharing class OpportunityTaskQueueable
implements Queueable {

    private Set<Id> oppIds;

    public OpportunityTaskQueueable(Set<Id> oppIds) {
        this.oppIds = oppIds;
    }

    public void execute(QueueableContext context) {

        List<Task> taskList = [
            SELECT Id,
                   Status,
                   WhatId
            FROM Task
            WHERE WhatId IN :oppIds
            AND Status != 'Completed'
        ];

        for (Task t : taskList) {
            t.Status = 'Completed';
        }

        if (!taskList.isEmpty()) {
            update taskList;
        }
    }
}
