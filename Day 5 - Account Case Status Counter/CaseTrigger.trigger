trigger CaseTrigger on Case (
    after insert,
    after update,
    after delete
) {

    if(Trigger.isAfter) {

        if(Trigger.isInsert ||
           Trigger.isUpdate) {

            CaseHandler.updateCaseCount(
                Trigger.new
            );
        }

        if(Trigger.isDelete) {

            CaseHandler.updateCaseCount(
                Trigger.old
            );
        }
    }
}
