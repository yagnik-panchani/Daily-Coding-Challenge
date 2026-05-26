trigger ContactTrigger on Contact (
    before insert,
    before update
) {

    if(Trigger.isBefore) {

        DefaultEmailHandler.setDefaultEmail(
            Trigger.new
        );
    }
}
