trigger CaseTrigger
on Case
(
    after update
)
{
    if(
        Trigger.isAfter &&
        Trigger.isUpdate
    )
    {
        AccountController.getData(
            Trigger.new,
            Trigger.oldMap
        );
    }
}
