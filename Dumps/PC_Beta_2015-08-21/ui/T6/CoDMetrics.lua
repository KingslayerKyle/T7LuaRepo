LUI.CoDMetrics = {}
local f0_local0 = function ( f1_arg0 )
	for f1_local0 = 1, Enum.LUIButton.LUI_BUTTON_COUNT, 1 do
		local f1_local3 = Engine.GetModel( Engine.GetModelForController( f1_arg0 ), "ButtonBits." .. f1_local0 )
		if f1_local3 and CoD.BitUtility.IsBitwiseAndNonZero( Engine.GetModelValue( f1_local3 ), Enum.LUIButtonFlags.FLAG_DOWN ) then
			return f1_local0
		end
	end
	return Enum.LUIButton.LUI_KEY_NONE
end

LUI.CoDMetrics.LobbyInit = function ()
	if not LUI.CoDMetrics.lobbyElement then
		LUI.CoDMetrics.lobbyElement = LUI.UIElement.new()
		LUI.CoDMetrics.lobbyElement:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
			local modelValue = Engine.GetModelValue( model )
			if LUI.CoDMetrics.menuID ~= nil and modelValue ~= LUI.CoDMetrics.menuID then
				local f3_local1 = 0
				local f3_local2 = LobbyData:UITargetFromId( LUI.CoDMetrics.menuID )
				LUI.CoDMetrics.ScreenView( f3_local1, f3_local2.name, Engine.milliseconds() - LUI.CoDMetrics.openTime, nil )
			end
			LUI.CoDMetrics.menuID = modelValue
			LUI.CoDMetrics.openTime = Engine.milliseconds()
		end )
	end
end

LUI.CoDMetrics.OpenMenu = function ( f4_arg0 )
	f4_arg0.openTime = Engine.milliseconds()
end

LUI.CoDMetrics.CloseMenu = function ( f5_arg0 )
	local f5_local0 = f5_arg0:getOwner()
	if f5_local0 == nil then
		f5_local0 = 0
	end
	local f5_local1 = 0
	if f5_arg0.openTime then
		f5_local1 = Engine.milliseconds() - f5_arg0.openTime
	end
	LUI.CoDMetrics.ScreenView( f5_local0, f5_arg0.menuName, f5_local1, f5_arg0.crm_message_id )
end

LUI.CoDMetrics.ScreenView = function ( f6_arg0, f6_arg1, f6_arg2, f6_arg3 )
	Engine.RecordComScoreEvent( f6_arg0, "screen_view", "screen_id", f6_arg1, "screen_duration", f6_arg2, "button_presed", f0_local0( f6_arg0 ), "crm_message_id", f6_arg3 )
end

LUI.CoDMetrics.StoreEntry = function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3 )
	Engine.RecordComScoreEvent( f7_arg1, "store_entry", "store_source", f7_arg3.name, "store_gamemode", Engine.GetModeName(), "store_action_source", f7_arg2, "sore_region", Engine.GetSkuRegion() )
end

LUI.CoDMetrics.StoreItemViewed = function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3 )
	local f8_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "StoreRoot" )
	Engine.RecordComScoreEvent( f8_arg1, "store_item_browse", "store_source", Engine.GetModelValue( Engine.CreateModel( f8_local0, "storeSource", true ) ), "store_gamemode", Engine.GetModeName(), "store_action_source", Engine.GetModelValue( Engine.CreateModel( f8_local0, "actionSource", true ) ), "product_id", f8_arg2, "product_browse_duration", f8_arg3, "sore_region", Engine.GetSkuRegion() )
end

LUI.CoDMetrics.AccountCreated = function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3 )
	Engine.RecordComScoreEvent( f9_arg1, "create_account", "opt_in_flag", f9_arg2, "account_source", f9_arg3 )
end

LUI.CoDMetrics.CRMMessageImpression = function ( f10_arg0, f10_arg1, f10_arg2 )
	local f10_local0 = Engine.GetMarketingMessage( f10_arg1, f10_arg2 )
	if not f10_local0 then
		return 
	end
	local f10_local1 = 0
	if f10_arg0.openTime then
		f10_local1 = Engine.milliseconds() - f10_arg0.openTime
	end
	Engine.RecordComScoreEvent( f10_arg1, "crm_message_view", "crm_message_id", f10_local0.messageID, "crm_screen_id", f10_local0.locationID, "crm_message_duration", f10_local1 )
end

LUI.CoDMetrics.CRMMessageInteraction = function ( f11_arg0, f11_arg1, f11_arg2, f11_arg3, f11_arg4 )
	local f11_local0 = Engine.GetMarketingMessage( f11_arg1, f11_arg2 )
	if not f11_local0 then
		return 
	elseif not f11_arg3 then
		f11_arg3 = ""
	end
	if not f11_arg4 then
		f11_arg4 = ""
	end
	Engine.RecordComScoreEvent( f11_arg1, "crm_message_click", "crm_message_id", f11_local0.messageID, "crm_screen_id", f11_local0.locationID, "interaction_type", f11_arg3, "interaction_details", f11_arg4 )
end

LUI.CoDMetrics.PaintshopEvent = function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3, f12_arg4, f12_arg5 )
	Engine.RecordComScoreEvent( f12_arg0, "paint_shop", "operation", f12_arg1, "duration", f12_arg2, "weapon_id", f12_arg3, "paint_job_title", f12_arg4, "assets_used", f12_arg5 )
end

