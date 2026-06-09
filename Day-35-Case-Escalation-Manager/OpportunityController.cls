public with sharing class OpportunityController {

    @AuraEnabled(cacheable=true)
    public static List<Case> getData() {

        return [

            SELECT Id,
                   CaseNumber,
                   Subject,
                   Priority,
                   Status

            FROM Case
        ];
    }


    @AuraEnabled
    public static void escalateCase(Id caseId) {

        Case c = new Case(

            Id = caseId,
            Status = 'Escalated'
        );

        update c;
    }
}
