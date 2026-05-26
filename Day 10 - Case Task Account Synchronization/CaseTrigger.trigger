trigger CaseTrigger on Case (
    after update
) {

    if(Trigger.isAfter &&
       Trigger.isUpdate) {

        CaseTaskHandler.syncTask(
            Trigger.new,
            Trigger.oldMap
        );
    }
}
