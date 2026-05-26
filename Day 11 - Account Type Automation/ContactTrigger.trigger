trigger ContactTrigger on Contact (
    after insert,
    after update
) {

    if(Trigger.isAfter) {

        ContactHandler.updateAccountType(
            Trigger.new
        );
    }
}
