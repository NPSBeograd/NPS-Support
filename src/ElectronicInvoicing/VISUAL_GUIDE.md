# Visual Guide: Incoming Document to Purchase E-Invoice Navigation

## Incoming Documents List
```
Incoming Documents
┌─────────────────────────────────────────────────────────────┐
│ Entry No. │ Document No. │ Vendor Name    │ Status          │
├───────────┼──────────────┼────────────────┼─────────────────┤
│ 1001      │ INV-2024-001 │ ABC Company    │ Released        │
│ 1002      │ INV-2024-002 │ XYZ Supplier   │ Released        │
│ 1003      │ INV-2024-003 │ DEF Corp       │ Posted          │
└─────────────────────────────────────────────────────────────┘

Actions: [Process] [Release] [Purchase E-Invoice] ← NEW ACTION
```

## Incoming Document Card
```
Incoming Document Card - INV-2024-001
┌─────────────────────────────────────────────────────────────┐
│ General                                                     │
│ Entry No.: 1001                                            │
│ Document No.: INV-2024-001                                 │
│ Vendor No.: V001                                           │
│ Vendor Name: ABC Company                                   │
│ Document Date: 01/15/2024                                  │
│                                                            │
│ Electronic Invoicing                        ← NEW SECTION  │
│ E-Invoice Entry No.: 2001                                  │
│ E-Invoice ID: E-INV-20240115-001                          │
└─────────────────────────────────────────────────────────────┘

Actions: [Process] [Release] [Purchase E-Invoice] ← NEW ACTION
         Navigation: [Electronic Invoicing] → [Purchase E-Invoice] ← NEW
```

## Purchase E-Invoice Card (Target)
```
Purchase E-Invoice Card - E-INV-20240115-001
┌─────────────────────────────────────────────────────────────┐
│ General                                                     │
│ Entry No.: 2001                                            │
│ Document No.: E-INV-20240115-001                          │
│ E-Invoice ID: E-INV-20240115-001                          │
│ Status: Accepted                                           │
│                                                            │
│ Vendor Information                                         │
│ Vendor No.: V001                                           │
│ Vendor Name: ABC Company                                   │
│                                                            │
│ Amounts                                                    │
│ Amount: 1,000.00                                          │
│ Amount Including VAT: 1,200.00                            │
└─────────────────────────────────────────────────────────────┘

Actions: [Incoming Document] ← EXISTING REVERSE ACTION
         Related: [Incoming Document] ← EXISTING REVERSE ACTION
```

## Navigation Flow
```
Incoming Document List/Card
        ↓ [Purchase E-Invoice Action]
Purchase E-Invoice List/Card
        ↓ [Incoming Document Action] 
Incoming Document Card
```

This bidirectional navigation allows users to:
1. Start from any Incoming Document and quickly access related Purchase E-Invoices
2. Return from Purchase E-Invoice back to the source Incoming Document
3. Maintain full traceability of document relationships