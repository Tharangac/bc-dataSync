pageextension 55201 "DS_EH_Chart Of Accounts" extends "Chart of Accounts" //MyTargetPageId
{
    actions
    {

        addafter("&Balance")
        {
            action("DS_EH_Push To EG")
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    GLAccountRec: Record "G/L Account";
                    SyncGLAccount: Codeunit "DS_Sync GL Account";
                begin
                    CurrPage.SetSelectionFilter(GLAccountRec);

                    IF GLAccountRec.FindFirst() then
                        SyncGLAccount.SyncGLAccountRecords(GLAccountRec);
                end;
            }
        }
    }
}