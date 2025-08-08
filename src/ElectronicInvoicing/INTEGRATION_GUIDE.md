# Integration Guide: Electronic Invoicing Serbia Extension

## Overview
This extension adds bidirectional navigation between Incoming Documents and Purchase E-Invoices, addressing the requirement from issue #246.

## Key Components

### 1. Core Table
**Purchase E-Invoice (Table 76000)**
- Stores purchase e-invoice data
- Links to Incoming Documents via "Incoming Document Entry No." field
- Supports multiple e-invoices per incoming document

### 2. User Interface
**New Actions Added:**
- Incoming Documents List: "Purchase E-Invoice" action
- Incoming Document Card: "Purchase E-Invoice" action (in both main actions and navigation)

**New Fields Added:**
- Incoming Document Card: E-Invoice Entry No., E-Invoice ID

### 3. Navigation Logic
**E-Invoice Management Codeunit (76000)**
```al
procedure OpenPurchaseEInvoiceFromIncomingDoc(IncomingDocument: Record "Incoming Document")
```
- Finds related Purchase E-Invoices
- Opens single record in card view or multiple records in list view
- Shows appropriate message if no related e-invoice found

### 4. Data Relationships
```
Incoming Document (1) ←→ (0..*) Purchase E-Invoice
```
- One Incoming Document can have multiple Purchase E-Invoices
- Each Purchase E-Invoice links to exactly one Incoming Document

## Installation

1. Import the extension into Business Central
2. Compile and deploy
3. The new actions will automatically appear on Incoming Document pages

## Usage Scenarios

### Scenario 1: Navigate from Incoming Document
1. Open Incoming Documents list or card
2. Select a document
3. Click "Purchase E-Invoice" action
4. System opens related e-invoice(s)

### Scenario 2: Navigate from Purchase E-Invoice (existing)
1. Open Purchase E-Invoice
2. Click "Incoming Document" action
3. System opens related incoming document

### Scenario 3: Create New Relationships
```al
// Example: Link existing e-invoice to incoming document
EInvoiceMgt: Codeunit "E-Invoice Management";
EInvoiceMgt.LinkIncomingDocToPurchaseEInvoice(PurchaseEInvoice, IncomingDocEntryNo);
```

## Error Handling
- If no related Purchase E-Invoice found: Shows user-friendly message
- If multiple e-invoices found: Opens filtered list view
- If single e-invoice found: Opens card view directly

## Testing
Run the included unit tests:
- TestPurchaseEInvoiceCreation
- TestFindPurchaseEInvoiceByIncomingDoc

## Compatibility
- Microsoft Dynamics 365 Business Central 20.0+
- Requires Base Application and System Application
- Uses object ID range 76000-76999