trigger OLITrigger on OpportunityLineItem (after insert) {

    if(Trigger.isAfter && Trigger.isInsert) {

        OLIHandler.createAsset(
            Trigger.new
        );
    }
}
