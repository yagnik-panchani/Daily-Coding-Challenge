trigger OpportunityTrigger on Opportunity (

    before insert,
    before update

) {

    if(Trigger.isBefore) {

        OpportunityTrgHandler.trgmethod(

            Trigger.new,
            Trigger.oldMap
        );
    }
}
