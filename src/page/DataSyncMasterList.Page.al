page 55201 "DS_Data Sync Master List"
{
    PageType = List;
    SourceTable = "DS_Data Sync Master";
    Caption = 'Data Synchronization Master List';
    ApplicationArea = All;
    UsageCategory = Lists;
    CardPageId = "DS_Data Sync Master";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Code"; Code)
                {
                    ApplicationArea = All;
                }
                field("Table ID"; "Table ID")
                {
                    ApplicationArea = All;
                }
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

}
