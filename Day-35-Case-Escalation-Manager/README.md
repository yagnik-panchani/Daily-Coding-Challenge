# Day 35 - Case Escalation Manager

## 📌 Scenario

Build a Case Escalation Manager using Lightning Web Components and Apex.

Support Managers need a quick way to escalate high-priority Cases without opening each Case record manually.

The application displays Cases in a datatable and allows users to escalate High Priority Cases through a confirmation modal.

---

## 🚀 Business Requirements

### Rule 1

Display all Cases in a lightning-datatable.

Fields:

* Case Number
* Subject
* Priority
* Status

---

### Rule 2

If Priority = High

Display:

Escalate Button

Otherwise hide the button.

---

### Rule 3

When the user clicks Escalate:

Open a confirmation modal.

Display:

"Are you sure you want to escalate Case XXXX?"

---

### Rule 4

When the user confirms:

Update:

Status = Escalated

---

### Rule 5

Refresh the datatable automatically.

---

## 🚀 What This Application Does

✅ Displays Case records

✅ Uses Datatable Row Actions

✅ Opens Modal Popups

✅ Updates records using Apex

✅ Refreshes UI Automatically

✅ Demonstrates Service Cloud style functionality

---

## 🧠 Technical Concepts Used

* Lightning Web Components
* Apex Controllers
* Datatable Row Actions
* Modal Popups
* Imperative Apex Calls
* Conditional Button Visibility
* Record Updates
* Dynamic UI Refresh

---

## 💡 Business Use Case

Customer support teams often need to escalate urgent Cases.

Instead of navigating through multiple screens, managers can escalate Cases directly from a dashboard.

This improves:

* Response Time
* Support Efficiency
* SLA Compliance
* User Experience

---

## 🔥 Key Learning Outcome

Through this challenge, I learned:

* How to use lightning-datatable row actions
* How to build modal popups
* How to call Apex imperatively
* How to update records dynamically
* How to refresh data after updates

---

## 🚀 Salesforce Concepts Practiced

✔ Datatable

✔ Row Actions

✔ Modal Popup

✔ Imperative Apex

✔ Record Update

✔ Event Handling

✔ Dynamic Refresh

✔ Service Cloud UI Patterns

---

⭐ Daily Salesforce LWC Practice Journey

Building real-world Salesforce applications step by step 🚀
