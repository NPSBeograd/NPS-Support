page 76000 "Purchase E-Invoices"
{
    Caption = 'Purchase E-Invoices';
    PageType = List;
    SourceTable = "Purchase E-Invoice";
    UsageCategory = Lists;
    ApplicationArea = All;
    CardPageID = "Purchase E-Invoice Card";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the entry number of the purchase e-invoice.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the document number of the purchase e-invoice.';
                }
                field("E-Invoice ID"; Rec."E-Invoice ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the e-invoice ID from the portal.';
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the vendor number.';
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the vendor name.';
                }
                field("Invoice Date"; Rec."Invoice Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the invoice date.';
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the due date.';
                }
                field("Amount Including VAT"; Rec."Amount Including VAT")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the amount including VAT.';
                }
                field("Status"; Rec."Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the status of the e-invoice.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(IncomingDocCard)
            {
                Caption = 'Incoming Document';
                Image = Document;
                ApplicationArea = All;
                ToolTip = 'View the related incoming document.';

                trigger OnAction()
                var
                    IncomingDocument: Record "Incoming Document";
                begin
                    if Rec."Incoming Document Entry No." <> 0 then begin
                        IncomingDocument.Get(Rec."Incoming Document Entry No.");
                        PAGE.Run(PAGE::"Incoming Document", IncomingDocument);
                    end else
                        Message('No incoming document is linked to this e-invoice.');
                end;
            }
        }
    }
}