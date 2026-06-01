trigger OpportunityTrigger on Opportunity (before insert) {

    if(Trigger.isBefore && Trigger.isInsert) {
        TrgClass.trgMethod(Trigger.New);
    }
}
