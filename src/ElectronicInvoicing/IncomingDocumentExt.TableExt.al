tableextension 76000 "Incoming Document Ext" extends "Incoming Document"
{
    fields
    {
        field(76000; "E-Invoice Entry No."; Integer)
        {
            Caption = 'E-Invoice Entry No.';
            ToolTip = 'Specifies the entry number of the related purchase e-invoice.';
            TableRelation = "Purchase E-Invoice"."Entry No.";
            
            trigger OnValidate()
            var
                PurchaseEInvoice: Record "Purchase E-Invoice";
            begin
                if "E-Invoice Entry No." <> 0 then begin
                    if PurchaseEInvoice.Get("E-Invoice Entry No.") then begin
                        PurchaseEInvoice."Incoming Document Entry No." := Rec."Entry No.";
                        PurchaseEInvoice.Modify();
                    end;
                end;
            end;
        }
        field(76001; "E-Invoice ID"; Text[50])
        {
            Caption = 'E-Invoice ID';
            ToolTip = 'Specifies the e-invoice ID from the portal.';
        }
    }
}