trigger OpportunityTrigger on Opportunity (
    after update
) {

    if(
        Trigger.isAfter &&
        Trigger.isUpdate
    ) {

        OppTrgHandler.trgmethod(
            Trigger.new,
            Trigger.oldMap
        );
    }
}
