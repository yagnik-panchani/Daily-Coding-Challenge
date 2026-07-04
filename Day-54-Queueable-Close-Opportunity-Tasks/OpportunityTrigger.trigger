trigger OpportunityTrigger on Opportunity (after update) {

    if (Trigger.isAfter && Trigger.isUpdate) {
        OpportunityHandler.opportunityChecker(Trigger.new, Trigger.oldMap);
    }

}
