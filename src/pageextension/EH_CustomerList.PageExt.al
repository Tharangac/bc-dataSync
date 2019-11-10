pageextension 55200 "DS_EH_Customer List" extends "Customer List" //MyTargetPageId
{
    actions
    {

        addafter("Bank Accounts")
        {
            action("DS_EH_Push To EG")
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    CustomerRec: Record Customer;
                    SyncCustomer: Codeunit "DS_Sync Customer";
                begin
                    CurrPage.SetSelectionFilter(CustomerRec);

                    IF CustomerRec.FindFirst() then
                        SyncCustomer.SyncCustomerRecords(CustomerRec);
                end;
            }
        }
    }
}