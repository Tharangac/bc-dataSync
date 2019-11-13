codeunit 55202 "DS_Sync Vendor"
{
    procedure SyncVendorRecords(var Vendor: Record Vendor)
    var
        DataSyncMaster: Record "DS_Data Sync Master";
    begin
        GetDefaultDataSyncMaster(23, DataSyncMaster);
        SyncRecords(Vendor, DataSyncMaster);
    end;

    procedure SyncVendorRecords(var Vendor: Record Vendor; var DataSyncMaster: Record "DS_Data Sync Master")
    begin
        SyncRecords(Vendor, DataSyncMaster);
    end;

    local procedure GetDefaultDataSyncMaster(TableID: Integer; var DataSyncMaster: Record "DS_Data Sync Master")
    begin
        DataSyncMaster.SetRange("Table ID", TableID);
        DataSyncMaster.SetRange(Default, true);
        DataSyncMaster.FindFirst();
    end;

    local procedure SyncRecords(var Vendor: Record Vendor; var DataSyncMaster: Record "DS_Data Sync Master")
    var
        ManageDataExport: Codeunit "EH_Manage Data Export";
        IntEventhand: Codeunit "EH_Int. Event Entry Handler";
        JSONArray: JsonArray;
    begin
        IF Vendor.FindFirst() then
            repeat
                ManageDataExport.ExportToDataExchange(DataSyncMaster."Data Exch. Def Code", Vendor, JSONArray);
            Until Vendor.Next() = 0;

        IntEventhand.CreateIntegrationEventEntry(JSONArray, DataSyncMaster."Endpoint Type", DataSyncMaster."Endpoint Code", DataSyncMaster."Event Topic", DataSyncMaster."Event Subject", DataSyncMaster."Integ. Event Source", DataSyncMaster."Integ. Event Destination", DataSyncMaster."Integ. Msg. Version");
    end;

}