page 55251 "DS_GLAccount Entity"
{
    PageType = API;
    SourceTable = "G/L Account";
    APIPublisher = 'tc';
    APIGroup = 'dataSync';
    APIVersion = 'v1.0';
    EntityName = 'glAccount';
    EntitySetName = 'glAccounts';
    DelayedInsert = true;
    Caption = 'GL Account Entity';
    ODataKeyFields = "No.";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(number; "No.")
                {
                    Caption = 'number';
                    ApplicationArea = All;
                }
                field(id; Id)
                {
                    Caption = 'id';
                    ApplicationArea = All;
                }
                field(accountName; Name)
                {
                    Caption = 'accountName';
                    ApplicationArea = All;
                }
                field(accountType; "Account Type")
                {
                    Caption = 'accountType';
                    ApplicationArea = All;
                }
                field(indentation; Indentation)
                {
                    Caption = 'indentation';
                    ApplicationArea = All;
                }
            }
        }
    }

}
