trigger CaseTrigger on Case (
    after update
) {

    if(Trigger.isAfter &&
       Trigger.isUpdate) {

        CaseSyncHandler.syncCaseStatus(
            Trigger.new,
            Trigger.oldMap
        );
    }
}
