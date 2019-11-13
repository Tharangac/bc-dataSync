pageextension 55201 "DS_EH_Chart Of Accounts" extends "Chart of Accounts"
{
    actions
    {

        addafter("&Balance")
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
                    GLAccountRec: Record "G/L Account";
                    SyncGLAccount: Codeunit "DS_Sync GL Account";
                begin
                    if not Confirm('Do you want to Synchronize selected records?', true) then
                        exit;

                    CurrPage.SetSelectionFilter(GLAccountRec);

                    IF GLAccountRec.FindFirst() then
                        SyncGLAccount.SyncGLAccountRecords(GLAccountRec);

                    Message('Synchronize complete');
                end;
            }
        }
    }
}