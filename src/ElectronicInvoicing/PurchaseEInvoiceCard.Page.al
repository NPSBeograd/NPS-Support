page 76001 "Purchase E-Invoice Card"
{
    Caption = 'Purchase E-Invoice Card';
    PageType = Card;
    SourceTable = "Purchase E-Invoice";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the entry number of the purchase e-invoice.';
                    Editable = false;
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
                field("Status"; Rec."Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the status of the e-invoice.';
                }
                field("Created Date Time"; Rec."Created Date Time")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies when the e-invoice was created.';
                    Editable = false;
                }
            }
            
            group(Vendor)
            {
                Caption = 'Vendor Information';
                
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
            }
            
            group(Amounts)
            {
                Caption = 'Amounts';
                
                field("Amount"; Rec."Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the amount excluding VAT.';
                }
                field("Amount Including VAT"; Rec."Amount Including VAT")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the amount including VAT.';
                }
            }
            
            group(Dates)
            {
                Caption = 'Dates';
                
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
        area(navigation)
        {
            action(RelatedIncomingDoc)
            {
                Caption = 'Related';
                Image = Navigate;
                ApplicationArea = All;
                
                action(IncomingDocument)
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
}