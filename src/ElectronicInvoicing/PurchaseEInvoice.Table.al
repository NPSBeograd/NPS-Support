table 76000 "Purchase E-Invoice"
{
    Caption = 'Purchase E-Invoice';
    LookupPageID = "Purchase E-Invoices";
    DrillDownPageID = "Purchase E-Invoices";

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            AutoIncrement = true;
        }
        field(2; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(3; "Vendor No."; Code[20])
        {
            Caption = 'Vendor No.';
            TableRelation = Vendor;
        }
        field(4; "Vendor Name"; Text[100])
        {
            Caption = 'Vendor Name';
        }
        field(5; "Invoice Date"; Date)
        {
            Caption = 'Invoice Date';
        }
        field(6; "Due Date"; Date)
        {
            Caption = 'Due Date';
        }
        field(7; "Amount"; Decimal)
        {
            Caption = 'Amount';
        }
        field(8; "Amount Including VAT"; Decimal)
        {
            Caption = 'Amount Including VAT';
        }
        field(9; "Status"; Option)
        {
            Caption = 'Status';
            OptionMembers = " ",Accepted,Rejected,Pending;
            OptionCaption = ' ,Accepted,Rejected,Pending';
        }
        field(10; "E-Invoice ID"; Text[50])
        {
            Caption = 'E-Invoice ID';
        }
        field(11; "Incoming Document Entry No."; Integer)
        {
            Caption = 'Incoming Document Entry No.';
            TableRelation = "Incoming Document";
        }
        field(12; "Created Date Time"; DateTime)
        {
            Caption = 'Created Date Time';
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; "Incoming Document Entry No.")
        {
        }
        key(Key3; "E-Invoice ID")
        {
        }
    }
}