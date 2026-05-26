trigger OpportunityTrigger on Opportunity (
    after update
) {

    if(Trigger.isAfter &&
       Trigger.isUpdate) {

        OppHandler.trgmethod(
            Trigger.new,
            Trigger.oldMap
        );
    }
}
