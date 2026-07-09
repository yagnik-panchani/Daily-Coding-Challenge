trigger OpportunityTrigger on Opportunity (after update) {

    if (Trigger.isAfter && Trigger.isUpdate) {
        OpportunityHandler.oppUpdate(Trigger.new, Trigger.oldMap);
    }

}
