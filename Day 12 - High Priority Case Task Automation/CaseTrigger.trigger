trigger CaseTrigger on Case (
    after insert,
    after update
) {

    if(Trigger.isAfter) {

        CaseTriggerHandler.createTask(
            Trigger.new,
            Trigger.oldMap
        );
    }
}
