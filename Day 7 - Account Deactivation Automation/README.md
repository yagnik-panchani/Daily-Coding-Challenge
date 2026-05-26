# Day 7 - Account Deactivation Automation

## Scenario
Whenever Account Status becomes Inactive:

- Delete related Opportunities
- Update related Contacts:
  Do_Not_Contact__c = true

## Concepts Used
- Apex Trigger
- Trigger.oldMap
- Cross Object DML
- Delete DML
