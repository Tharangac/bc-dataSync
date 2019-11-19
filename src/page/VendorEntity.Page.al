page 55252 "DS_Vendor Entity"
{
    PageType = API;
    SourceTable = Vendor;
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
                field(eMail; "E-Mail")
                {
                    Caption = 'eMail';
                    ApplicationArea = All;
                }
            }
        }
    }

}
