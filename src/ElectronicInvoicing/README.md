# Electronic Invoicing Serbia Extension

This extension provides functionality to link Incoming Documents with Purchase E-Invoices in Microsoft Dynamics 365 Business Central.

## Features

### New Tables
- **Purchase E-Invoice (76000)**: Stores purchase e-invoice information with links to incoming documents

### New Pages
- **Purchase E-Invoices (76000)**: List page for purchase e-invoices
- **Purchase E-Invoice Card (76001)**: Card page for individual purchase e-invoice details

### Extensions
- **Incoming Documents List Extension**: Adds "Purchase E-Invoice" action to navigate to related e-invoice
- **Incoming Document Card Extension**: Adds "Purchase E-Invoice" action and fields for e-invoice information
- **Incoming Document Table Extension**: Adds fields for e-invoice linking

### Functionality
- Navigate from Incoming Document to related Purchase E-Invoice
- Navigate from Purchase E-Invoice to related Incoming Document (IncomingDocCard action)
- Automatic linking between documents
- Support for multiple e-invoices per incoming document

## Usage

1. **From Incoming Document List**: Select an incoming document and use the "Purchase E-Invoice" action to view related e-invoices
2. **From Incoming Document Card**: Use the "Purchase E-Invoice" action in the actions menu or navigation area
3. **From Purchase E-Invoice**: Use the "Incoming Document" action to view the related incoming document

## Implementation Details

- **Table ID Range**: 76000-76999
- **Page ID Range**: 76000-76999
- **Codeunit ID Range**: 76000-76999
- **Page Extension ID Range**: 76000-76999
- **Table Extension ID Range**: 76000-76999

## Testing

The extension includes unit tests to verify:
- Purchase E-Invoice creation from Incoming Documents
- Finding Purchase E-Invoices by Incoming Document
- Proper linking between documents