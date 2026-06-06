trigger ContactTrigger on Contact (
    after insert
) {

    if(
        Trigger.isAfter &&
        Trigger.isInsert
    ) {

        ContactTriggerHandler.createTask(
            Trigger.new
        );
    }
}
