codeunit 55201 "DS_Sync GL Account"
{
    procedure SyncGLAccountRecords(var GLAccount: Record "G/L Account")
    var
        DataSyncMaster: Record "DS_Data Sync Master";
    begin
        GetDefaultDataSyncMaster(15, DataSyncMaster);
        SyncRecords(GLAccount, DataSyncMaster);
    end;

    procedure SyncGLAccountRecords(var GLAccount: Record "G/L Account"; var DataSyncMaster: Record "DS_Data Sync Master")
    begin
        SyncRecords(GLAccount, DataSyncMaster);
    end;

    local procedure GetDefaultDataSyncMaster(TableID: Integer; var DataSyncMaster: Record "DS_Data Sync Master")
    begin
        DataSyncMaster.SetRange("Table ID", TableID);
        DataSyncMaster.SetRange(Default, true);
        DataSyncMaster.FindFirst();
    end;

    local procedure SyncRecords(var GLAccount: Record "G/L Account"; var DataSyncMaster: Record "DS_Data Sync Master")
    var
        ManageDataExport: Codeunit "EH_Manage Data Export";
        IntEventhand: Codeunit "EH_Int. Event Entry Handler";
        JSONArray: JsonArray;
    begin
        IF GLAccount.FindFirst() then
            repeat
                ManageDataExport.ExportToDataExchange(DataSyncMaster."Data Exch. Def Code", GLAccount, JSONArray);
            Until GLAccount.Next() = 0;

        IntEventhand.CreateIntegrationEventEntry(JSONArray, DataSyncMaster."Endpoint Type", DataSyncMaster."Endpoint Code", DataSyncMaster."Event Topic", DataSyncMaster."Event Subject", DataSyncMaster."Integ. Event Source", DataSyncMaster."Integ. Event Destination", DataSyncMaster."Integ. Msg. Version");
    end;

}