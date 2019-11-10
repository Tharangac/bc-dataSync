table 55200 "DS_Data Sync Master"
{
    Caption = 'Data Sync Master';
    DataClassification = CustomerContent;
    LookupPageId = "DS_Data Sync Master List";

    fields
    {
        field(1; "Code"; Code[20])
        {
            DataClassification = CustomerContent;

        }
        field(2; "Table ID"; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(3; "Endpoint Type"; Option)
        {
            DataClassification = CustomerContent;
            OptionMembers = "Internal","Azure Event Grid","Azure Function","HTTP Call";
            Caption = 'Endpoint Type';
        }
        field(4; "Endpoint Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Endpoint Code';
            TableRelation = "EH_API Endpoint".Code;
        }
        field(5; "Event Topic"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Event Topic';
        }
        field(6; "Event Subject"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Event Subject';
        }
        field(7; "Data Exch. Def Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Data Exch. Def Code';
            TableRelation = "Data Exch. Def";
        }
        field(8; "Integ. Event Source"; Text[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Source';
        }
        field(9; "Integ. Event Destination"; Text[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Destination';
        }
        field(10; "Integ. Msg. Version"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Version';
        }
        Field(11; Default; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Default';
        }
    }

    keys
    {
        key(PK; Code)
        {
            Clustered = true;
        }
    }
}