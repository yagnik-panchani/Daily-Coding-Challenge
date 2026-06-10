# Day 36 - Bulk Opportunity Discount Approval Dashboard

## 📌 Scenario

Build a Bulk Opportunity Discount Approval Dashboard using Lightning Web Components (LWC) and Apex.

Sales Managers need an efficient way to review and approve multiple Opportunities that are waiting for discount approval.

Instead of approving records one by one, managers should be able to select multiple Opportunities and approve them in a single action.

---

## 🚀 Business Requirements

### Rule 1

Display all Opportunities where:

Approval_Status__c = Pending

---

### Rule 2

Display the following fields in a lightning-datatable:

* Opportunity Name
* Amount
* Discount
* Approval Status

---

### Rule 3

Allow users to select multiple Opportunity records using row selection checkboxes.

Example:

☑ Opportunity A

☑ Opportunity B

☑ Opportunity C

---

### Rule 4

Display an "Approve Selected" button when one or more rows are selected.

---

### Rule 5

When the button is clicked:

* Collect all selected Opportunity Ids
* Pass Ids to Apex
* Update Approval_Status__c = Approved

---

### Rule 6

Refresh the datatable after successful approval.

Approved Opportunities should disappear because only Pending Opportunities are displayed.

---

## 🚀 What This Application Does

✅ Displays Pending Opportunities

✅ Supports Multi-Record Selection

✅ Performs Bulk Updates

✅ Uses Imperative Apex Calls

✅ Refreshes Data Automatically

✅ Provides User Feedback Using Toast Messages

---

## 🧠 Technical Concepts Used

* Lightning Web Components
* Apex Controllers
* Datatable Row Selection
* JavaScript Array Methods
* map()
* Imperative Apex Calls
* Bulk Processing
* ShowToastEvent
* Dynamic UI Updates

---

## 💡 Business Use Case

Sales Managers frequently review discount requests before final approval.

Without bulk actions, managers must open each Opportunity individually, which is time-consuming.

This dashboard allows managers to approve multiple Opportunities simultaneously, improving productivity and reducing processing time.

---

## 🔥 Key Learning Outcome

Through this challenge, I learned:

* How to use lightning-datatable row selection
* How to capture selected records
* How to extract record Ids using JavaScript map()
* How to pass List<Id> values to Apex
* How to perform bulk record updates
* How to refresh UI after server-side operations

---

## 🚀 Salesforce Concepts Practiced

✔ Datatable Row Selection

✔ Selected Rows Handling

✔ JavaScript map()

✔ Imperative Apex

✔ Bulk DML Operations

✔ Apex Collections

✔ List<Id> Processing

✔ ShowToastEvent

✔ Dynamic Refresh

---

## 🔄 Application Flow

Pending Opportunities

↓

User Selects Multiple Records

↓

Approve Selected Button

↓

Collect Selected Ids

↓

Call Apex Method

↓

Bulk Update Opportunities

↓

Refresh Datatable

↓

Show Success Message

---

## ⭐ Why This Scenario Is Important

Most beginner projects focus on updating a single record.

Real Salesforce applications often require users to:

* Approve Multiple Records
* Process Work Queues
* Update Records in Bulk
* Manage Large Data Sets

This challenge introduces the Mass Action Pattern, which is widely used in enterprise Salesforce applications.

---

## 📋 Example

Before Approval:

| Opportunity | Status  |
| ----------- | ------- |
| Deal A      | Pending |
| Deal B      | Pending |
| Deal C      | Pending |

User Selects:

☑ Deal A

☑ Deal B

Click:

Approve Selected

After Approval:

| Opportunity | Status  |
| ----------- | ------- |
| Deal C      | Pending |

Deal A and Deal B are now Approved and no longer appear in the dashboard.

---

⭐ Daily Salesforce LWC Practice Journey

Building real-world Salesforce applications step by step 🚀
