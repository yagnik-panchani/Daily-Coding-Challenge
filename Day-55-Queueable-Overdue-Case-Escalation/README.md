# Day 55 - Queueable Apex Overdue Case Escalation

## 📌 Scenario

Build a Queueable Apex solution that automatically escalates overdue Cases.

Whenever a Case is updated, if the Due Date has passed and the Case is still open, Salesforce should process the Case asynchronously using Queueable Apex.

Instead of updating the Case directly inside the Trigger, the Trigger should enqueue a Queueable Apex job to perform the escalation.

---

## 🚀 Business Requirements

When a Case is updated:

- Due_Date__c < Today
- Status != Closed
- Escalated__c = False

Then:

- Collect Case Ids
- Start a Queueable Apex job
- Query Cases
- Update:

```
Priority = High
Escalated__c = True
```

---

## 🔗 Objects Used

### Case

Fields Used:

- Due_Date__c
- Status
- Priority
- Escalated__c

---

## 🚀 What This Application Does

✅ Detects overdue Cases

✅ Uses Trigger Handler Pattern

✅ Starts Queueable Apex asynchronously

✅ Queries latest Case records

✅ Updates Priority to High

✅ Marks Cases as Escalated

✅ Processes records using bulk-safe logic

---

## 🧠 Technical Concepts Used

- Apex Trigger
- Trigger Handler Pattern
- Queueable Apex
- Queueable Interface
- QueueableContext
- Constructor
- System.enqueueJob()
- SOQL
- Date Comparison
- Boolean Logic
- Bulk Processing
- DML Update

---

## 💡 Business Use Case

Customer support teams often work under Service Level Agreements (SLAs).

If a Case remains open after its Due Date, it should automatically be escalated so that support agents can prioritize it immediately.

Using Queueable Apex keeps the Trigger lightweight while allowing Salesforce to process escalations asynchronously.

---

## 🔥 Key Learning Outcome

Through this challenge, I learned:

- How Trigger and Queueable Apex work together
- How to pass record Ids using a Queueable constructor
- How Queueable Apex performs asynchronous processing
- How to query records inside execute()
- How to implement date-based business logic
- How to update records using bulk-safe processing

---

## 🚀 Salesforce Concepts Practiced

✔ Trigger Handler Pattern

✔ Queueable Apex

✔ Queueable Interface

✔ QueueableContext

✔ Constructor

✔ System.enqueueJob()

✔ SOQL

✔ Date Comparison

✔ Bulk Processing

✔ DML Operations

---

## 🔄 Application Flow

Opportunity Updated

↓

Trigger

↓

Handler

↓

Check Conditions

- Due Date < Today
- Status ≠ Closed
- Escalated = False

↓

Collect Case Ids

↓

System.enqueueJob()

↓

Queueable Constructor

↓

execute()

↓

Query Cases

↓

Priority = High

↓

Escalated = True

↓

Update Cases

---

## 📋 Example

### Before

| Case | Due Date | Status | Priority | Escalated |
|------|----------|--------|----------|-----------|
| 000101 | Yesterday | Working | Medium | False |
| 000102 | Tomorrow | Working | Low | False |
| 000103 | Last Week | Closed | Medium | False |

---

### After Queueable Execution

| Case | Priority | Escalated |
|------|----------|-----------|
| 000101 | High | True |
| 000102 | Low | False |
| 000103 | Medium | False |

---

## ⭐ Why Queueable Apex?

Queueable Apex executes business logic asynchronously, allowing Salesforce to process records outside the Trigger transaction.

This improves scalability, keeps Triggers lightweight, and reduces the risk of governor limit exceptions.

---

## 🎯 Interview Questions Practiced

### Why use Queueable Apex instead of updating Cases directly in the Trigger?

Queueable Apex performs asynchronous processing, reducing the amount of work done inside the Trigger transaction and making the application more scalable.

---

### Why pass only Case Ids to the Queueable class?

Passing only record Ids keeps the Queueable job lightweight. The Queueable class queries the latest records before applying updates.

---

### Why compare the Due Date with today's date?

This ensures that only overdue Cases are escalated according to the business requirement.

---

### Why use a Trigger Handler Pattern?

The Trigger Handler Pattern separates business logic from the Trigger, making the application easier to maintain, test, and extend.

---

## ⭐ Daily Salesforce Async Apex Journey

Building enterprise-level Salesforce solutions by mastering Queueable Apex and solving real-world business scenarios one challenge at a time. 🚀
