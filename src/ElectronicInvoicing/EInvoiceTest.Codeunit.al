codeunit 76001 "E-Invoice Test"
{
    Subtype = Test;
    
    [Test]
    procedure TestPurchaseEInvoiceCreation()
    var
        PurchaseEInvoice: Record "Purchase E-Invoice";
        IncomingDocument: Record "Incoming Document";
        EInvoiceMgt: Codeunit "E-Invoice Management";
        EntryNo: Integer;
    begin
        // [GIVEN] An incoming document exists
        IncomingDocument.Init();
        IncomingDocument."Entry No." := 1;
        IncomingDocument."Document No." := 'TEST001';
        IncomingDocument.Insert();
        
        // [WHEN] Creating a purchase e-invoice from incoming document
        EntryNo := EInvoiceMgt.CreatePurchaseEInvoiceFromIncomingDoc(IncomingDocument);
        
        // [THEN] Purchase E-Invoice should be created with correct link
        PurchaseEInvoice.Get(EntryNo);
        if IncomingDocument."Entry No." <> PurchaseEInvoice."Incoming Document Entry No." then
            Error('Incoming document link should be set');
        if IncomingDocument."Document No." <> PurchaseEInvoice."Document No." then
            Error('Document number should match');
    end;
    
    [Test]
    procedure TestFindPurchaseEInvoiceByIncomingDoc()
    var
        PurchaseEInvoice: Record "Purchase E-Invoice";
        IncomingDocument: Record "Incoming Document";
        EInvoiceMgt: Codeunit "E-Invoice Management";
        FoundPurchaseEInvoice: Record "Purchase E-Invoice";
        Found: Boolean;
    begin
        // [GIVEN] An incoming document and linked purchase e-invoice exist
        IncomingDocument.Init();
        IncomingDocument."Entry No." := 2;
        IncomingDocument."Document No." := 'TEST002';
        IncomingDocument.Insert();
        
        PurchaseEInvoice.Init();
        PurchaseEInvoice."Incoming Document Entry No." := IncomingDocument."Entry No.";
        PurchaseEInvoice."Document No." := 'EINV002';
        PurchaseEInvoice.Insert(true);
        
        // [WHEN] Finding purchase e-invoice by incoming document
        Found := EInvoiceMgt.FindPurchaseEInvoiceByIncomingDoc(IncomingDocument."Entry No.", FoundPurchaseEInvoice);
        
        // [THEN] Purchase E-Invoice should be found
        if not Found then
            Error('Purchase E-Invoice should be found');
        if PurchaseEInvoice."Entry No." <> FoundPurchaseEInvoice."Entry No." then
            Error('Found e-invoice should match created one');
    end;
}