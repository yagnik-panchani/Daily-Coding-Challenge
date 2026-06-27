# Day 47 - Queueable Apex Account Deactivation Contact Update

## 📌 Scenario

Build an asynchronous automation using Queueable Apex.

Whenever an Account is updated and its status changes to **Inactive**, Salesforce should automatically update all related Contacts in the background.

Instead of updating Contacts directly inside the Trigger, the records are processed asynchronously using Queueable Apex.

---

## 🚀 Business Requirements

When an Account is updated:

* Previous Status ≠ Inactive
* New Status = Inactive

Then:

* Collect Account Ids.
* Enqueue a Queueable Job.
* Query all Contacts related to those Accounts.
* Update:

  * Do_Not_Contact__c = true

---

## 🔗 Objects Used

### Account

Fields Used:

* Status__c

Values:

* Active
* Inactive

---

### Contact

Fields Used:

* AccountId
* Do_Not_Contact__c
* MailingCity

---

## 🚀 What This Application Does

✅ Detects Account Status changes

✅ Identifies Inactive Accounts

✅ Uses Queueable Apex for asynchronous processing

✅ Retrieves related Contacts

✅ Marks Contacts as "Do Not Contact"

✅ Processes records in the background

---

## 🧠 Technical Concepts Used

* Apex Trigger
* Trigger.new
* Trigger.oldMap
* Queueable Apex
* Queueable Interface
* QueueableContext
* Constructor
* System.enqueueJob()
* Parent-Child Relationship
* SOQL
* Bulk Processing
* DML Operations

---

## 💡 Business Use Case

When a customer account becomes inactive, the company may stop marketing or sales communication with that customer.

Instead of manually updating every Contact, Salesforce automatically updates all related Contacts.

Example:

* Customer Account Closed
* Business Relationship Ends
* Marketing Emails Stop
* Sales Calls Stop

This automation ensures all related Contacts are marked as **Do Not Contact**.

---

## 🔥 Key Learning Outcome

Through this challenge, I learned:

* How Queueable Apex works
* How to enqueue asynchronous jobs
* How constructors pass data to Queueable classes
* How execute() performs background processing
* How to update child records based on parent record changes
* How to process records using bulk-safe logic

---

## 🚀 Salesforce Concepts Practiced

✔ Queueable Apex

✔ Queueable Interface

✔ QueueableContext

✔ System.enqueueJob()

✔ Constructor

✔ Trigger Framework

✔ Parent-Child Relationship

✔ SOQL

✔ Bulk Processing

✔ Asynchronous Processing

---

## 🔄 Application Flow

Account Updated

↓

Status Changed

↓

Status = Inactive

↓

Collect Account Ids

↓

System.enqueueJob()

↓

Queueable Job Created

↓

Constructor Stores Account Ids

↓

execute() Runs

↓

Query Related Contacts

↓

Update Do_Not_Contact__c = true

↓

Save Contacts

---

## 📋 Example

### Before Update

#### Account

| Account Name     | Status |
| ---------------- | ------ |
| ABC Technologies | Active |

#### Contacts

| Contact | Do Not Contact |
| ------- | -------------- |
| Rahul   | False          |
| Amit    | False          |
| Neha    | False          |

---

### User Updates

Account Status → Inactive

---

### Queueable Job Executes

#### Contacts

| Contact | Do Not Contact |
| ------- | -------------- |
| Rahul   | True           |
| Amit    | True           |
| Neha    | True           |

---

## ⭐ Why Queueable Apex?

Queueable Apex is ideal for asynchronous business logic because it allows developers to:

* Process large amounts of data in the background
* Pass data using constructors
* Organize code into dedicated Queueable classes
* Chain additional Queueable jobs when required
* Track job execution using Salesforce Async Jobs

---

## 🎯 Interview Questions Practiced

### Why use Queueable Apex?

Queueable Apex executes business logic asynchronously, improving performance and providing greater flexibility than Future Methods.

---

### Why use System.enqueueJob()?

System.enqueueJob() places a Queueable job into Salesforce's asynchronous processing queue.

---

### What is the purpose of the constructor?

The constructor receives data (such as Account Ids) from the Trigger Handler and stores it in the Queueable class for later use inside the execute() method.

---

### What is the purpose of execute()?

The execute() method contains the asynchronous business logic that Salesforce runs after the Queueable job starts.

---

## 📚 What I Learned Today

This challenge helped me understand the complete Queueable Apex lifecycle:

Trigger

↓

Handler

↓

System.enqueueJob()

↓

Queueable Constructor

↓

execute()

↓

Query Records

↓

Update Records

I also learned how to update child records (Contacts) based on changes made to a parent record (Account) while following Salesforce best practices for asynchronous processing.

---

## ⭐ Daily Salesforce Async Apex Journey

Building enterprise-level Salesforce solutions by mastering asynchronous Apex, one real-world scenario at a time. 🚀
