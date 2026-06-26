trigger OpportunityTrigger on Opportunity (after update) {

    if (Trigger.isAfter && Trigger.isUpdate) {
        OpportunityHandler.getData(
            Trigger.new,
            Trigger.oldMap
        );
    }

}
