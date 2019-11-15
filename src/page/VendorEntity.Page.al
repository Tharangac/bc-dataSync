page 55252 "DS_Vendor Entity"
{
    PageType = API;
    SourceTable = customer;
    APIPublisher = 'tc';
    APIGroup = 'dataSync';
    APIVersion = 'v1.0';
    EntityName = 'vendor';
    EntitySetName = 'vendors';
    DelayedInsert = true;
    Caption = 'Vendor Entity';
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
                field(eMail; "E-Mail")
                {
                    Caption = 'eMail';
                    ApplicationArea = All;
                }
                field(creditLimitLCY; "Credit Limit (LCY)")
                {
                    Caption = 'creditLimitLCY';
                    ApplicationArea = All;
                }
            }
        }
    }

}
