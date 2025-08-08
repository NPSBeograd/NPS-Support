pageextension 76001 "Incoming Document Card Ext" extends "Incoming Document"
{
    layout
    {
        addafter("Document Date")
        {
            group(ElectronicInvoicing)
            {
                Caption = 'Electronic Invoicing';
                
                field("E-Invoice Entry No."; Rec."E-Invoice Entry No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the entry number of the related purchase e-invoice.';
                }
                field("E-Invoice ID"; Rec."E-Invoice ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the e-invoice ID from the portal.';
                }
            }
        }
    }
    
    actions
    {
        addafter(Release)
        {
            action(PurchaseEInvoice)
            {
                Caption = 'Purchase E-Invoice';
                Image = ElectronicDoc;
                ApplicationArea = All;
                ToolTip = 'View the related purchase e-invoice.';

                trigger OnAction()
                var
                    PurchaseEInvoice: Record "Purchase E-Invoice";
                    EInvoiceMgt: Codeunit "E-Invoice Management";
                begin
                    EInvoiceMgt.OpenPurchaseEInvoiceFromIncomingDoc(Rec);
                end;
            }
        }
        addafter(Navigate)
        {
            group(ElectronicInvoicing)
            {
                Caption = 'Electronic Invoicing';
                
                action(PurchaseEInvoiceNav)
                {
                    Caption = 'Purchase E-Invoice';
                    Image = ElectronicDoc;
                    ApplicationArea = All;
                    ToolTip = 'View the related purchase e-invoice.';

                    trigger OnAction()
                    var
                        PurchaseEInvoice: Record "Purchase E-Invoice";
                        EInvoiceMgt: Codeunit "E-Invoice Management";
                    begin
                        EInvoiceMgt.OpenPurchaseEInvoiceFromIncomingDoc(Rec);
                    end;
                }
            }
        }
    }
}