trigger LeadTrigger on Lead (after update) {

    if(Trigger.isAfter &&
       Trigger.isUpdate) {

        LeadHandler.createTask(
            Trigger.new,
            Trigger.oldMap
        );
    }
}
