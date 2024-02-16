-- af3bba2c3a0877f82a5bf66c1f6390e7
-- This hash is used for caching, delete to decompile the file again

if not CoD.StarterPackUtil then
	CoD.StarterPackUtil = {}
end
CoD.StarterPackUtil.UpgradeNotice = function ( f1_arg0, f1_arg1, f1_arg2 )
	OpenSystemOverlay( f1_arg0, f1_arg2, f1_arg1, "StarterPack_Upgrade", nil )
end

CoD.OverlayUtility.AddSystemOverlay( "StarterPack_Upgrade", {
	menuName = CoD.OverlayUtility.AutoSizeMenuFromDescription( "StarterPack_Upgrade" ),
	categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
	image = "starterpack_purchase_dialog_pc",
	title = Engine.Localize( "PLATFORM_STARTER_PACK_UPGRADE_TITLE" ),
	description = Engine.Localize( "PLATFORM_STARTER_PACK_UPGRADE_DESC" ),
	[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack,
	listDatasource = function ( f2_arg0 )
		DataSources.StarterPack_UpgradeButtonList = DataSourceHelpers.ListSetup( "StarterPack_UpgradeButtonList", function ( f3_arg0 )
			local f3_local0 = {}
			local f3_local1 = function ( f4_arg0, f4_arg1 )
				return {
					models = {
						displayText = f4_arg0
					},
					properties = {
						action = f4_arg1
					}
				}
			end
			
			table.insert( f3_local0, f3_local1( "PLATFORM_STARTER_PACK_UPGRADE_TITLE", function ( f5_arg0, f5_arg1, f5_arg2, f5_arg3, f5_arg4 )
				OpenSteamStore( f5_arg0, f5_arg1, f5_arg2, 437351, previousMenu )
				GoBack( f5_arg4, f5_arg2 )
			end ) )
			table.insert( f3_local0, f3_local1( "MENU_CANCEL", CoD.OverlayUtility.DefaultButtonAction ) )
			return f3_local0
		end, true )
		return "StarterPack_UpgradeButtonList"
	end
} )
