trigger OpportunityTrigger on Opportunity (

    before update,
    after update

) {

    if(
        Trigger.isBefore &&
        Trigger.isUpdate
    ) {

        OppTrgHandler.trgmethod(

            Trigger.new,
            Trigger.oldMap
        );
    }


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
