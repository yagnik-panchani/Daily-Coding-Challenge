trigger AccountTrigger on Account (
    after update
) {

    if(Trigger.isAfter &&
       Trigger.isUpdate) {

        MultiObjectHandler.trgmethod(
            Trigger.new,
            Trigger.oldMap
        );
    }
}
