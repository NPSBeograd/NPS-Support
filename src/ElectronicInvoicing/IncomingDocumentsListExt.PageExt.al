pageextension 76000 "Incoming Documents List Ext" extends "Incoming Documents"
{
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
    }
}