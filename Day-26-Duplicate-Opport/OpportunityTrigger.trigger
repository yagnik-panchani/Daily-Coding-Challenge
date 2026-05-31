trigger OpportunityTrigger on Opportunity (
    before insert
) {

    if(
        Trigger.isBefore &&
        Trigger.isInsert
    ) {

        OpportunityHandler.validateDuplicate(
            Trigger.new
        );
    }
}
