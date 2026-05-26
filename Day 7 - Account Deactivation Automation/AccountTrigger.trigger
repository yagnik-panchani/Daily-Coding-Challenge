trigger AccountTrigger on Account (
    after update
) {

    if(Trigger.isAfter &&
       Trigger.isUpdate) {

        AccountHandler.deactivateAccount(
            Trigger.new,
            Trigger.oldMap
        );
    }
}
