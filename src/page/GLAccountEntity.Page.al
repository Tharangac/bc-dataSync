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
                field(no; "No.")
                {
                    Caption = 'no';
                    ApplicationArea = All;
                }
                field(id; Id)
                {
                    Caption = 'id';
                    ApplicationArea = All;
                }
                field(name; Name)
                {
                    Caption = 'name';
                    ApplicationArea = All;
                }
            }
        }
    }

}
