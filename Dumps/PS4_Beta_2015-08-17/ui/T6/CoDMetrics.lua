LUI.CoDMetrics = {}
local GetButtonPressed = function ( controller )
	for i = 1, Enum.LUIButton.LUI_BUTTON_COUNT, 1 do
		local buttonBitModel = Engine.GetModel( Engine.GetModelForController( controller ), "ButtonBits." .. i )
		if buttonBitModel and CoD.BitUtility.IsBitwiseAndNonZero( Engine.GetModelValue( buttonBitModel ), Enum.LUIButtonFlags.FLAG_DOWN ) then
			return i
		end
	end
	return Enum.LUIButton.LUI_KEY_NONE
end

LUI.CoDMetrics.LobbyInit = function ()
	if not LUI.CoDMetrics.lobbyElement then
		LUI.CoDMetrics.lobbyElement = LUI.UIElement.new()
		LUI.CoDMetrics.lobbyElement:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
			local menuID = Engine.GetModelValue( model )
			if LUI.CoDMetrics.menuID ~= nil and menuID ~= LUI.CoDMetrics.menuID then
				local controller = 0
				local target = LobbyData:UITargetFromId( LUI.CoDMetrics.menuID )
				local duration = Engine.milliseconds() - LUI.CoDMetrics.openTime
				LUI.CoDMetrics.ScreenView( controller, target.name, duration, nil )
			end
			LUI.CoDMetrics.menuID = menuID
			LUI.CoDMetrics.openTime = Engine.milliseconds()
		end )
	end
end

LUI.CoDMetrics.OpenMenu = function ( self )
	self.openTime = Engine.milliseconds()
end

LUI.CoDMetrics.CloseMenu = function ( self )
	local controller = self:getOwner()
	if controller == nil then
		controller = 0
	end
	local duration = 0
	if self.openTime then
		duration = Engine.milliseconds() - self.openTime
	end
	LUI.CoDMetrics.ScreenView( controller, self.menuName, duration, self.crm_message_id )
end

LUI.CoDMetrics.ScreenView = function ( controller, menuName, duration, crm_message_id )
	local buttonPressed = GetButtonPressed( controller )
	Engine.RecordComScoreEvent( controller, "screen_view", "screen_id", menuName, "screen_duration", duration, "button_presed", buttonPressed, "crm_message_id", crm_message_id )
end

LUI.CoDMetrics.StoreEntry = function ( menu, controller, actionSource, currentLobbyMenu )
	local region = Engine.GetSkuRegion()
	Engine.RecordComScoreEvent( controller, "store_entry", "store_source", currentLobbyMenu.name, "store_gamemode", Engine.GetModeName(), "store_action_source", actionSource, "sore_region", region )
end

LUI.CoDMetrics.StoreItemViewed = function ( self, controller, itemId, itemDuration )
	local rootModel = Engine.CreateModel( Engine.GetGlobalModel(), "StoreRoot" )
	local actionSource = Engine.GetModelValue( Engine.CreateModel( rootModel, "actionSource", true ) )
	local storeSource = Engine.GetModelValue( Engine.CreateModel( rootModel, "storeSource", true ) )
	local region = Engine.GetSkuRegion()
	Engine.RecordComScoreEvent( controller, "store_item_browse", "store_source", storeSource, "store_gamemode", Engine.GetModeName(), "store_action_source", actionSource, "product_id", itemId, "product_browse_duration", itemDuration, "sore_region", region )
end

LUI.CoDMetrics.AccountCreated = function ( self, controller, opt_in_flag, account_source )
	Engine.RecordComScoreEvent( controller, "create_account", "opt_in_flag", opt_in_flag, "account_source", account_source )
end

LUI.CoDMetrics.CRMMessageImpression = function ( self, controller, crm_message_name )
	local data = Engine.GetMarketingMessage( controller, crm_message_name )
	if not data then
		return 
	end
	local duration = 0
	if self.openTime then
		duration = Engine.milliseconds() - self.openTime
	end
	Engine.RecordComScoreEvent( controller, "crm_message_view", "crm_message_id", data.messageID, "crm_screen_id", data.locationID, "crm_message_duration", duration )
end

LUI.CoDMetrics.CRMMessageInteraction = function ( self, controller, crm_message_name, interaction_type, interaction_details )
	local data = Engine.GetMarketingMessage( controller, crm_message_name )
	if not data then
		return 
	elseif not interaction_type then
		interaction_type = ""
	end
	if not interaction_details then
		interaction_details = ""
	end
	Engine.RecordComScoreEvent( controller, "crm_message_click", "crm_message_id", data.messageID, "crm_screen_id", data.locationID, "interaction_type", interaction_type, "interaction_details", interaction_details )
end

LUI.CoDMetrics.PaintshopEvent = function ( controller, operation, duration, weaponIndex, paintjobName, assets_used )
	Engine.RecordComScoreEvent( controller, "paint_shop", "operation", operation, "duration", duration, "weapon_id", weaponIndex, "paint_job_title", paintjobName, "assets_used", assets_used )
end

