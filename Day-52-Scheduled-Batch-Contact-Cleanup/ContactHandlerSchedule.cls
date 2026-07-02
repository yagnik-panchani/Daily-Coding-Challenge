public with sharing class ContactHandlerSchedule implements Scheduleable

{
    public void execute(ScheduleableContext sc)
    {
        Database.executeBatch(new ContactHandlerBatch(),200);
    }
}
