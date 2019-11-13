pageextension 55202 "DS_EH_Vendor List" extends "Vendor List" //MyTargetPageId
{
    actions
    {
        addafter("Bank Accounts")
        {
            action("DS_EH_Push To EG")
            {
                ApplicationArea = All;
                Caption = 'Synchronize Selected Records';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                Image = Intercompany;

                trigger OnAction()
                var
                    VendorRec: Record Vendor;
                    SyncVendor: Codeunit "DS_Sync Vendor";
                begin
                    if not Confirm('Do you want to Synchronize selected records', true) then
                        exit;

                    CurrPage.SetSelectionFilter(VendorRec);

                    IF VendorRec.FindFirst() then
                        SyncVendor.SyncVendorRecords(VendorRec);

                    Message('Synchronize complete');
                end;
            }
        }
    }
}