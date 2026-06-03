trigger ContactTrigger on Contact (
    before insert
) {

    if(
        Trigger.isBefore &&
        Trigger.isInsert
    ) {

        ContactTriggerHandler.populateDefaults(
            Trigger.new
        );
    }
}
