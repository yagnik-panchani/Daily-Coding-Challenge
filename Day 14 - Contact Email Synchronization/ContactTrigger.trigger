trigger ContactTrigger on Contact (
    after update
) {

    if(Trigger.isAfter &&
       Trigger.isUpdate) {

        ContactHandler.trgmethod(
            Trigger.new,
            Trigger.oldMap
        );
    }
}
