# Day 53 - Scheduled Apex Calling Queueable Apex for High Priority Case Reminders

## 📌 Scenario

Build an enterprise-level automation where a Scheduled Apex job automatically starts a Queueable Apex job every morning.

The company wants Salesforce to remind support agents about unresolved high-priority Cases by creating follow-up Tasks automatically.

Instead of creating Tasks directly inside the Scheduled Apex class, the scheduler should enqueue a Queueable job responsible for processing the Cases and creating reminder Tasks.

---

## 🚀 Business Requirements

Every day at **8:00 AM**:

* Scheduled Apex executes automatically.
* Query all Cases where:

  * Priority = High
  * Status ≠ Closed
* Collect the Case Ids.
* Enqueue a Queueable Apex job.
* Queueable Apex creates a follow-up Task for each Case.

Task Details:

* Subject = High Priority Case Follow-up
* Priority = High
* Status = Not Started
* Owner = Case Owner
* Related To = Case

---

## 🔗 Objects Used

### Case

Fields Used:

* Id
* Priority
* Status
* OwnerId

### Task

Fields Used:

* Subject
* Priority
* Status
* OwnerId
* WhatId

---

## 🚀 What This Application Does

✅ Runs automatically every morning

✅ Finds unresolved High Priority Cases

✅ Uses Scheduled Apex for scheduling

✅ Uses Queueable Apex for background processing

✅ Creates reminder Tasks automatically

✅ Assigns Tasks to the Case Owner

---

## 🧠 Technical Concepts Used

### Scheduled Apex

* Schedulable Interface
* execute(SchedulableContext)
* System.schedule()
* CRON Expression

### Queueable Apex

* Queueable Interface
* QueueableContext
* Constructor
* execute()
* System.enqueueJob()

### General Concepts

* SOQL
* Collections (Set<Id>)
* Bulk Processing
* DML Operations

---

## 💡 Business Use Case

Support teams often handle hundreds of Cases every day.

High Priority Cases should never be forgotten.

Instead of depending on support agents to remember every Case, Salesforce automatically creates reminder Tasks every morning.

This helps improve customer response time and ensures important Cases receive attention.

---

## 🔥 Key Learning Outcome

Through this challenge, I learned:

* How Scheduled Apex and Queueable Apex work together
* How to use System.enqueueJob()
* How to pass record Ids using a constructor
* How Queueable Apex processes records asynchronously
* How to create related Tasks in the background
* How enterprise Salesforce applications combine multiple Async Apex technologies

---

## 🚀 Salesforce Concepts Practiced

✔ Scheduled Apex

✔ Queueable Apex

✔ System.schedule()

✔ System.enqueueJob()

✔ Queueable Constructor

✔ Queueable execute()

✔ SOQL

✔ Bulk Processing

✔ Task Creation

---

## 🔄 Application Flow

System.schedule()

↓

Scheduled Apex Executes

↓

Query High Priority Cases

↓

Collect Case Ids

↓

System.enqueueJob()

↓

Queueable Apex Starts

↓

Constructor Receives Case Ids

↓

execute()

↓

Query Cases

↓

Create Reminder Tasks

↓

Insert Tasks

---

## 📋 Example

### Before Execution

| Case Number | Priority | Status  |
| ----------- | -------- | ------- |
| 000101      | High     | New     |
| 000102      | Medium   | Working |
| 000103      | High     | Working |

---

### After Scheduled Queueable Job

| Task Subject                 | Related Case |
| ---------------------------- | ------------ |
| High Priority Case Follow-up | 000101       |
| High Priority Case Follow-up | 000103       |

---

## ⭐ Why Combine Scheduled Apex and Queueable Apex?

Scheduled Apex determines **when** the automation should run.

Queueable Apex performs the business logic asynchronously.

This combination keeps the Scheduled Apex class lightweight while allowing more complex processing inside the Queueable class.

---

## 🎯 Interview Questions Practiced

### Why use Scheduled Apex?

To execute business logic automatically at a specific date and time.

---

### Why use Queueable Apex?

To execute asynchronous business logic with more flexibility than Future Methods.

---

### Why call Queueable Apex from Scheduled Apex?

Scheduled Apex decides **when** the process should run.

Queueable Apex performs the processing in the background, making the solution more scalable and maintainable.

---

### Which method starts the Queueable Job?

```java
System.enqueueJob(new CaseReminderQueueable(caseIds));
```

---

### What is the execution sequence?

```text
System.schedule()

↓

Scheduled Apex

↓

System.enqueueJob()

↓

Queueable Apex

↓

Constructor

↓

execute()

↓

Create Tasks
```

---

## 🌟 What I Learned Today

Today's challenge helped me understand how to combine Scheduled Apex and Queueable Apex in a real-world business scenario.

I learned that Scheduled Apex should focus only on scheduling and starting background jobs, while Queueable Apex handles the actual business logic.

This separation makes Salesforce applications easier to maintain, more scalable, and follows enterprise development best practices.

---

## ⭐ Daily Salesforce Async Apex Journey

Learning enterprise-level Salesforce development by combining multiple Async Apex technologies to build scalable, real-world automation solutions. 🚀
