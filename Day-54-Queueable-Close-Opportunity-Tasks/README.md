
📌 Scenario

Whenever an Opportunity is marked as Closed Won, Salesforce should automatically complete all related open Tasks.

Instead of updating Tasks directly from the Trigger, the Trigger should enqueue a Queueable Apex job to process the related Tasks asynchronously.

🚀 Business Requirements

When an Opportunity is updated:

Stage changes to Closed Won

Then:

Collect Opportunity Ids
Start a Queueable Apex job
Query related Tasks
Update all open Tasks
Set Status = Completed
🔗 Objects Used
Opportunity

Fields Used

StageName
Task

Fields Used

WhatId
Status
🚀 What This Application Does
Detects when an Opportunity becomes Closed Won
Uses a Trigger Handler pattern
Starts a Queueable Apex job
Retrieves all related open Tasks
Marks every Task as Completed
Updates Tasks in bulk
🧠 Salesforce Concepts Practiced
Apex Trigger
Trigger Handler Pattern
Queueable Apex
Queueable Constructor
QueueableContext
System.enqueueJob()
Parent → Child Relationship
SOQL
Bulk Processing
DML Update
🔄 Application Flow
Opportunity Updated

↓

Stage Changed

↓

Closed Won

↓

Trigger

↓

Handler

↓

Collect Opportunity Ids

↓

System.enqueueJob()

↓

Queueable Constructor

↓

execute()

↓

Query Related Tasks

↓

Update Status = Completed

↓

Save Tasks
📋 Example
Before
Opportunity
Name	Stage
ABC Software	Prospecting
Tasks
Subject	Status
Call Customer	Not Started
Send Proposal	In Progress
Schedule Demo	Waiting
User Updates
Stage = Closed Won
After Queueable Executes
Subject	Status
Call Customer	Completed
Send Proposal	Completed
Schedule Demo	Completed
⭐ Why Queueable Apex?

Queueable Apex is used to move related record processing into a separate asynchronous transaction. This keeps the Trigger lightweight and helps avoid governor limit issues when updating many related records.

🎯 Interview Questions Practiced
Why use Queueable Apex instead of updating Tasks directly in the Trigger?

Updating related Tasks inside a Trigger increases the amount of work done in the same transaction. Queueable Apex processes the updates asynchronously, improving scalability and reducing the chance of hitting governor limits.

Why compare Trigger.new with Trigger.oldMap?

To ensure the Queueable job runs only when the Opportunity Stage actually changes to Closed Won, avoiding unnecessary processing.

Why query Tasks instead of creating new ones?

The business requirement is to complete existing Tasks, not create additional Tasks. Therefore, the Queueable class queries related Tasks and updates their status.

🌟 What I Learned Today

In this challenge, I learned how to combine an Apex Trigger with Queueable Apex to process related records asynchronously. I also learned how to use Trigger.oldMap to detect field changes, pass record IDs through a Queueable constructor, and update existing child records in a bulk-safe manner.
