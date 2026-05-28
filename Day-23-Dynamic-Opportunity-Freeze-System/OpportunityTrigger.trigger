trigger OpportunityTrigger on Opportunity (

    before insert,
    before update

) {

    if(Trigger.isBefore) {

        OppTrgHandler.trgmethod(

            Trigger.new,
            Trigger.oldMap
        );
    }
}
