trigger OpportunityTrigger on Opportunity (
    before insert,
    before update
) {

    if(Trigger.isBefore) {

        OppStageHandler.updateStage(
            Trigger.new
        );
    }
}
