trigger AccountTrigger on Account (
    after update
) {

    if(Trigger.isAfter &&
       Trigger.isUpdate) {

        AccountHandler.trgmethod(
            Trigger.new,
            Trigger.oldMap
        );
    }
}
