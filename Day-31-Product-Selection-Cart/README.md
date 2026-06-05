# Day 31 - Product Selection Cart

## 📌 Scenario

Build a Product Selection Cart using Lightning Web Components (LWC).

The application displays a list of available products and allows users to add products into a shopping cart.

The selected products are displayed inside a child component, demonstrating Parent-to-Child communication in LWC.

---

## 🚀 Business Requirement

Display a list of available products:

* Laptop
* Mouse
* Keyboard
* Monitor

Each product contains:

* Product Name
* Price
* Add Button

When the user clicks the Add button:

* The selected product should be added to the cart.
* The child component should update automatically.
* The total number of selected products should be displayed.

---

## 🔗 Component Architecture

Parent Component

* Displays Available Products
* Handles Add button click
* Maintains selected product list

Child Component

* Receives selected products using @api
* Displays selected products
* Displays total product count

---

## 🚀 What This Application Does

✅ Displays product list in lightning-datatable

✅ Uses row action buttons

✅ Adds products dynamically into cart

✅ Updates child component automatically

✅ Displays total selected products

✅ Demonstrates component communication

---

## 🧠 Technical Concepts Used

* Lightning Web Components
* Parent to Child Communication
* @api Decorator
* lightning-datatable
* Row Actions
* JavaScript Arrays
* Spread Operator (...)
* Dynamic Rendering
* Getter Methods
* Event Handling

---

## 💡 Business Use Case

This type of functionality is commonly used in:

* Shopping Cart Applications
* Product Configuration Systems
* Salesforce CPQ Solutions
* Order Management Systems
* Inventory Management Applications

Users can dynamically select products and view their cart without refreshing the page.

---

## 🔥 Key Learning Outcome

Through this challenge, I learned:

* How Parent Components communicate with Child Components
* How to pass data using @api properties
* How lightning-datatable row actions work
* How to manage arrays dynamically in JavaScript
* How to render records using for:each
* How to build reusable LWC components

---

## 🚀 Salesforce Concepts Practiced

✔ Parent to Child Communication

✔ @api Properties

✔ lightning-datatable

✔ Row Action Events

✔ JavaScript Arrays

✔ Spread Operator

✔ Dynamic UI Updates

✔ Event Handling

✔ Component Reusability

---

## ⭐ Why This Scenario Is Important

Many real-world Salesforce applications require communication between multiple components.

Understanding Parent-to-Child communication is a fundamental skill for building scalable and reusable Lightning Web Components.

This challenge provides hands-on experience with state management and component interaction.

---

⭐ Daily Salesforce LWC Practice Journey

Building real-world Salesforce applications step by step 🚀
