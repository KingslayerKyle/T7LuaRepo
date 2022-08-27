-- 8be8f094b7d517a27bd047ff31ec7bea
-- This hash is used for caching, delete to decompile the file again

if not CoD.ModsUtility then
	CoD.ModsUtility = {}
end
CoD.ModsUtility.Mods_Lists_Refresh = function ( f1_arg0 )
	if f1_arg0 == LuaEnums.MODS_BASE_PATH then
		Engine.Mods_Lists_UpdateMods()
	elseif f1_arg0 == LuaEnums.USERMAP_BASE_PATH then
		Engine.Mods_Lists_UpdateUsermaps()
	end
end

CoD.ModsUtility.NeedToUnload = function ( f2_arg0, f2_arg1, f2_arg2 )
	OpenSystemOverlay( f2_arg0, f2_arg2, f2_arg1, "Mods_NeedToUnload", nil )
end

CoD.OverlayUtility.AddSystemOverlay( "Mods_NeedToUnload", {
	menuName = CoD.OverlayUtility.AutoSizeMenuFromDescription( "Mods_NeedToUnload" ),
	categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
	title = Engine.Localize( "PLATFORM_MODS_NEED_TO_UNLOAD" ),
	description = Engine.Localize( "PLATFORM_MODS_NEED_TO_UNLOAD_DESC", Mods_UsingModsUgcName() ),
	[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack,
	listDatasource = function ( f3_arg0 )
		DataSources.Mods_NeedToUnloadButtonList = DataSourceHelpers.ListSetup( "Mods_NeedToUnloadButtonList", function ( f4_arg0 )
			local f4_local0 = {}
			local f4_local1 = function ( f5_arg0, f5_arg1 )
				return {
					models = {
						displayText = f5_arg0
					},
					properties = {
						action = f5_arg1
					}
				}
			end
			
			table.insert( f4_local0, f4_local1( "PLATFORM_MODS_UNLOAD", function ( f6_arg0, f6_arg1, f6_arg2, f6_arg3, f6_arg4 )
				Mods_Unload( f6_arg2, f6_arg1 )
				GoBack( f6_arg4, f6_arg2 )
			end ) )
			table.insert( f4_local0, f4_local1( "MENU_CANCEL", CoD.OverlayUtility.DefaultButtonAction ) )
			return f4_local0
		end, true )
		return "Mods_NeedToUnloadButtonList"
	end
} )
