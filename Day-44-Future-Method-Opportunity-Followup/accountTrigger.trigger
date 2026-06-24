trigger accountTrigger on Account (after update) {

  if(Trigger.isAfter)
  {
    if(Trigger.isUpdate)
    {
        AccountController.getData(Trigger.new,Trigger.oldMap);
    }
  }

}
