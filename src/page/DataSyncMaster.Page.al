page 55200 "DS_Data Sync Master"
{

    PageType = Card;
    SourceTable = "DS_Data Sync Master";
    Caption = 'Data Synchronization';

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Code)
                {
                    ApplicationArea = All;
                }
                field("Table ID"; "Table ID")
                {
                    ApplicationArea = All;
                }
            }
            group("API Setup")
            {
                field("Endpoint Type"; "Endpoint Type")
                {
                    ApplicationArea = All;
                }
                field("Endpoint Code"; "Endpoint Code")
                {
                    ApplicationArea = All;
                }
                field("Event Subject"; "Event Subject")
                {
                    ApplicationArea = All;
                }
                field("Event Topic"; "Event Topic")
                {
                    ApplicationArea = All;
                }
                field("Integ. Event Destination"; "Integ. Event Destination")
                {
                    ApplicationArea = All;
                }
                field("Integ. Event Source"; "Integ. Event Source")
                {
                    ApplicationArea = All;
                }
                field("Integ. Msg. Version"; "Integ. Msg. Version")
                {
                    ApplicationArea = All;
                }
                field("Data Exch. Def Code"; "Data Exch. Def Code")
                {
                    ApplicationArea = All;
                }

                field(Default; Default)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(SyncRecords)
            {
                ApplicationArea = All;
                Caption = 'Sync All Record';
                trigger OnAction()
                var
                    rRef: RecordRef;
                    varRecRef: Variant;
                begin
                    CLEAR(rRef);
                    rRef.OPEN("Table ID", FALSE, COMPANYNAME());
                    varRecRef := rRef;
                    PAGE.RUN(0, varRecRef);
                end;
            }
        }
    }
}
