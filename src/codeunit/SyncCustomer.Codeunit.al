codeunit 55200 "DS_Sync Customer"
{
    procedure SyncCustomerRecords(var Customer: Record Customer)
    var
        DataSyncMaster: Record "DS_Data Sync Master";
    begin
        GetDefaultDataSyncMaster(18, DataSyncMaster);
        SyncRecords(Customer, DataSyncMaster);
    end;

    procedure SyncCustomerRecords(var Customer: Record Customer; var DataSyncMaster: Record "DS_Data Sync Master")
    begin
        SyncRecords(Customer, DataSyncMaster);
    end;

    local procedure GetDefaultDataSyncMaster(TableID: Integer; var DataSyncMaster: Record "DS_Data Sync Master")
    begin
        DataSyncMaster.SetRange("Table ID", TableID);
        DataSyncMaster.SetRange(Default, true);
        DataSyncMaster.FindFirst();
    end;

    local procedure SyncRecords(var Customer: Record Customer; var DataSyncMaster: Record "DS_Data Sync Master")
    var
        ManageDataExport: Codeunit "EH_Manage Data Export";
        IntEventhand: Codeunit "EH_Int. Event Entry Handler";
        JSONArray: JsonArray;
    begin
        IF Customer.FindFirst() then
            repeat
                ManageDataExport.ExportToDataExchange(DataSyncMaster."Data Exch. Def Code", Customer, JSONArray);
            Until Customer.Next() = 0;

        IntEventhand.CreateIntegrationEventEntry(JSONArray, DataSyncMaster."Endpoint Type", DataSyncMaster."Endpoint Code", DataSyncMaster."Event Topic", DataSyncMaster."Event Subject", DataSyncMaster."Integ. Event Source", DataSyncMaster."Integ. Event Destination", DataSyncMaster."Integ. Msg. Version");
    end;

}