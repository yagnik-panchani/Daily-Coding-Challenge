trigger CaseTrigger on Case (
    after insert,
    after update,
    after delete,
    after undelete
) {

    if(Trigger.isAfter) {

        if(
            Trigger.isInsert ||
            Trigger.isUpdate ||
            Trigger.isUndelete
        ) {

            RatingHandler.updateRating(
                Trigger.new
            );
        }

        if(Trigger.isDelete) {

            RatingHandler.updateRating(
                Trigger.old
            );
        }
    }
}
