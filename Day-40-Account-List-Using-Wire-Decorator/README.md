# Day 40 - Account List Using Wire Decorator

## 📌 Scenario

Build an Account List component using the @wire decorator.

The component should automatically fetch Account records when the page loads and display them in a lightning-datatable.

This challenge focuses on understanding the Wire Service and how Salesforce automatically retrieves data without requiring button clicks or imperative Apex calls.

---

## 🚀 Business Requirements

Display all Account records.

Show:

* Account Name
* Account Type
* Account Rating

Display the records inside a lightning-datatable.

---

## 🔗 Object Used

### Account

Fields:

* Name
* Type
* Rating

---

## 🚀 What This Application Does

✅ Automatically loads Account records

✅ Uses the Wire Service

✅ Displays records in a lightning-datatable

✅ Handles loading and error states

✅ Eliminates the need for manual Apex calls

---

## 🧠 Technical Concepts Used

* Lightning Web Components
* @wire Decorator
* Apex Integration
* Wire Service
* lightning-datatable
* Reactive Data Loading
* Error Handling

---

## 💡 Business Use Case

Many Salesforce applications display data immediately when a page loads.

Examples:

* Customer Lists
* Opportunity Dashboards
* Case Management Screens
* Contact Directories

Using @wire improves performance and simplifies data retrieval.

---

## 🔥 Key Learning Outcome

Through this challenge, I learned:

* How the @wire decorator works
* How to connect Apex with LWC using @wire
* How to display data automatically without button clicks
* How to use lightning-datatable with wired data
* How to handle data and error states

---

## 🚀 Salesforce Concepts Practiced

✔ @wire Decorator

✔ Wire Service

✔ Apex Integration

✔ lightning-datatable

✔ Reactive Data Loading

✔ Error Handling

---

## 🔄 Application Flow

Page Loads

↓

@wire Executes Apex Method

↓

Account Records Retrieved

↓

Data Stored in Accounts.data

↓

Display Records in Datatable

---

## ⭐ Why This Scenario Is Important

The Wire Service is one of the most frequently used features in Lightning Web Components.

Understanding @wire is essential for building responsive and efficient Salesforce applications.

This challenge serves as a foundation for advanced wire scenarios involving filters, reactive parameters, and dashboard applications.

---

⭐ Daily Salesforce LWC Practice Journey

Learning one Salesforce concept at a time 🚀
