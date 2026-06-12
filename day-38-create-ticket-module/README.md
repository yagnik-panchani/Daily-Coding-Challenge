# Day 38 - Customer Support Management System (Create Ticket Module)

## Overview

Today I implemented the Create Ticket module for my Salesforce Customer Support Management System portfolio project.

This module allows users to create support tickets through a Lightning Web Component and save them into the Ticket__c custom object using Apex.

## Features Implemented

* Create Ticket Lightning Web Component
* Apex method for ticket creation
* Customer dropdown populated from Customer2__c records
* Priority selection using Lightning Combobox
* Ticket creation using Apex DML
* Auto-generated Ticket Number
* Default Status value set to "New"
* Form field handling using JavaScript

## Objects Used

### Ticket__c

Fields used:

* Subject__c
* Description__c
* Priority__c
* Customer2__c

### Customer2__c

Fields used:

* Name

## Apex Methods

### getCustomers()

Retrieves Customer2__c records for the customer dropdown.

### createTicket()

Creates a new Ticket__c record and returns the created record Id.

## Technologies Used

* Salesforce Apex
* Lightning Web Components (LWC)
* SOQL
* DML Operations
* JavaScript
* Lightning Combobox
* Lightning Input Components

## Project Structure

classes/

* ticketHandler.cls

lwc/

* createTicket

  * createTicket.html
  * createTicket.js
  * createTicket.js-meta.xml

## Learning Outcomes

Through this challenge I practiced:

* Passing data from LWC to Apex
* Creating records using DML
* Working with custom objects and lookup relationships
* Populating combobox options dynamically
* Handling user input in LWC
* Returning values from Apex methods
* Building reusable Salesforce UI components

## Future Enhancements

* Success Toast Messages
* Form Validation
* Ticket Detail View
* Ticket Status Updates
* Agent Assignment Module

## Author

Yagnik Panchani

Salesforce Developer Portfolio Project

Day 38 Coding Challenge
