codeunit 76000 "E-Invoice Management"
{
    procedure OpenPurchaseEInvoiceFromIncomingDoc(IncomingDocument: Record "Incoming Document")
    var
        PurchaseEInvoice: Record "Purchase E-Invoice";
        PurchaseEInvoices: Page "Purchase E-Invoices";
        PurchaseEInvoiceCard: Page "Purchase E-Invoice Card";
    begin
        // Find related Purchase E-Invoice based on Incoming Document Entry No.
        PurchaseEInvoice.SetRange("Incoming Document Entry No.", IncomingDocument."Entry No.");
        
        if PurchaseEInvoice.FindFirst() then begin
            // If only one record found, open the card directly
            if PurchaseEInvoice.Count = 1 then begin
                PurchaseEInvoiceCard.SetRecord(PurchaseEInvoice);
                PurchaseEInvoiceCard.Run();
            end else begin
                // If multiple records found, open the list filtered
                PurchaseEInvoices.SetTableView(PurchaseEInvoice);
                PurchaseEInvoices.Run();
            end;
        end else begin
            // No related Purchase E-Invoice found
            Message('No related Purchase E-Invoice found for this Incoming Document.');
        end;
    end;
    
    procedure LinkIncomingDocToPurchaseEInvoice(var PurchaseEInvoice: Record "Purchase E-Invoice"; IncomingDocEntryNo: Integer)
    begin
        PurchaseEInvoice."Incoming Document Entry No." := IncomingDocEntryNo;
        PurchaseEInvoice.Modify();
    end;
    
    procedure CreatePurchaseEInvoiceFromIncomingDoc(IncomingDocument: Record "Incoming Document"): Integer
    var
        PurchaseEInvoice: Record "Purchase E-Invoice";
        Vendor: Record Vendor;
    begin
        PurchaseEInvoice.Init();
        PurchaseEInvoice."Incoming Document Entry No." := IncomingDocument."Entry No.";
        PurchaseEInvoice."Document No." := IncomingDocument."Document No.";
        PurchaseEInvoice."Created Date Time" := CurrentDateTime;
        
        // Try to get vendor information from the incoming document
        if IncomingDocument."Vendor No." <> '' then begin
            PurchaseEInvoice."Vendor No." := IncomingDocument."Vendor No.";
            if Vendor.Get(IncomingDocument."Vendor No.") then
                PurchaseEInvoice."Vendor Name" := Vendor.Name;
        end;
        
        PurchaseEInvoice.Insert(true);
        exit(PurchaseEInvoice."Entry No.");
    end;
    
    procedure FindPurchaseEInvoiceByIncomingDoc(IncomingDocEntryNo: Integer; var PurchaseEInvoice: Record "Purchase E-Invoice"): Boolean
    begin
        PurchaseEInvoice.SetRange("Incoming Document Entry No.", IncomingDocEntryNo);
        exit(PurchaseEInvoice.FindFirst());
    end;
}