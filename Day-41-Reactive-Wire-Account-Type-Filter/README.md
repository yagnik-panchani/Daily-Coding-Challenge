# Day 41 - Reactive Wire Account Type Filter

## 📌 Scenario

Build an Account Filter Dashboard using the @wire decorator and reactive parameters.

The application allows users to select an Account Type from a dropdown and automatically fetch matching Account records without requiring a button click.

This challenge demonstrates the power of Salesforce Wire Service and reactive data loading.

---

## 🚀 Business Requirements

Display a dropdown containing Account Types:

* Customer
* Partner
* Prospect

When the user selects a value:

* Automatically call Apex
* Fetch matching Account records
* Display records dynamically

No button should be required.

---

## 🔗 Object Used

### Account

Fields:

* Name
* Type
* Rating

---

## 🚀 What This Application Does

✅ Displays Account Type Filter

✅ Uses Reactive @wire Parameters

✅ Automatically Calls Apex

✅ Dynamically Refreshes Data

✅ Displays Matching Account Records

✅ Eliminates Manual Refresh Logic

---

## 🧠 Technical Concepts Used

* Lightning Web Components
* @wire Decorator
* Reactive Parameters
* Wire Service
* lightning-combobox
* lightning-datatable
* Apex Integration
* Dynamic Filtering

---

## 💡 Business Use Case

Many Salesforce applications require users to filter data dynamically.

Examples:

* Customer Dashboards
* Opportunity Reports
* Case Management Systems
* Sales Performance Dashboards

Reactive @wire allows Salesforce to automatically refresh data whenever filter values change.

---

## 🔥 Key Learning Outcome

Through this challenge, I learned:

* How reactive parameters work
* How to pass values from LWC to Apex using @wire
* How to dynamically refresh data without imperative Apex
* How to use lightning-combobox with Wire Service
* How Salesforce automatically re-executes Apex methods

---

## 🚀 Salesforce Concepts Practiced

✔ @wire Decorator

✔ Reactive Parameters

✔ Dynamic Filtering

✔ lightning-combobox

✔ Apex Integration

✔ Wire Service

✔ Datatable Rendering

✔ Automatic Data Refresh

---

## 🔄 Application Flow

User Selects Account Type

↓

selectedType Changes

↓

Reactive @wire Executes

↓

Apex Method Runs

↓

Matching Accounts Retrieved

↓

Datatable Updates Automatically

---

## 📋 Example

Selected Type:

Customer

Returned Records:

| Account Name    | Type     | Rating |
| --------------- | -------- | ------ |
| Tata Motors     | Customer | Hot    |
| Reliance Retail | Customer | Warm   |

User Changes Filter:

Partner

Returned Records:

| Account Name           | Type    | Rating |
| ---------------------- | ------- | ------ |
| Salesforce Partner Ltd | Partner | Hot    |
| Tech Solutions         | Partner | Warm   |

The datatable updates automatically without clicking any button.

---

## ⭐ Why This Scenario Is Important

Reactive @wire is one of the most frequently used features in Lightning Web Components.

Understanding this pattern helps developers build responsive and efficient Salesforce applications with minimal code.

This challenge serves as the foundation for advanced dashboards, filters, reports, and analytics applications.

---

⭐ Daily Salesforce LWC Practice Journey

Learning Salesforce one concept at a time 🚀
