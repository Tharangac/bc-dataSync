pageextension 55200 "DS_EH_Customer List" extends "Customer List"
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
                    CustomerRec: Record Customer;
                    SyncCustomer: Codeunit "DS_Sync Customer";
                begin
                    if not Confirm('Do you want to Synchronize selected records?', true) then
                        exit;

                    CurrPage.SetSelectionFilter(CustomerRec);

                    IF CustomerRec.FindFirst() then
                        SyncCustomer.SyncCustomerRecords(CustomerRec);

                    Message('Synchronize complete');
                end;
            }
        }
    }
}