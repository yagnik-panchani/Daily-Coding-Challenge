public with sharing class AccountController {
    
    public static void getData(List<Opportunity> oppList,Map<Id,Opportunity> oldMap)
    {   List<Id> oppIds = new List<Id>();
        if(!oppList.isEmpty())
        {
            for(Opportunity o : oppList)
            {
                if((o.StageName != oldMap.get(o.Id).StageName) && o.StageName == 'Closed Won')

                {   
                   oppIds.add(o.Id);
                }
            }
        }
      if(!oppIds.isEmpty())
      {
        performList(oppIds);
      }
        
    }

        @future
        public static void performList(List<Id> oppIds)
        {   List<Task> tskList = new List<Task>();

            List<Opportunity> opps = [SELECT Id,Name,OwnerId FROM Opportunity WHERE Id IN : oppIds];
            for(Opportunity  o : opps)
            {
                Task t = new Task();
                 t.Priority = 'High';
                 t.Status = 'Not Started';
                 t.Subject = 'Customer Follow Up';
                 t.OwnerId = opp.OwnerId;
                 tskList.add(t);
            }
            
            if(!tskList.isEmpty())
            {
                insert tskList;
            }
        }

        
}
