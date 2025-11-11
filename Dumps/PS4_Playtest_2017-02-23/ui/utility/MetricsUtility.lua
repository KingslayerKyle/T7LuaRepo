CoD.MetricsUtility = {}
CoD.MetricsUtility.LobbyInit = function ()
	if not CoD.MetricsUtility.lobbyElement then
		CoD.MetricsUtility.lobbyElement = LUI.UIElement.new()
		CoD.MetricsUtility.lobbyElement:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
			local menuID = Engine.GetModelValue( model )
			if CoD.MetricsUtility.menuID ~= nil and menuID ~= CoD.MetricsUtility.menuID then
				local controller = 0
				local target = LobbyData.GetLobbyMenuByID( CoD.MetricsUtility.menuID )
				local duration = Engine.milliseconds() - CoD.MetricsUtility.openTime
				CoD.MetricsUtility.ScreenView( controller, target.name, duration, nil )
			end
			CoD.MetricsUtility.menuID = menuID
			CoD.MetricsUtility.openTime = Engine.milliseconds()
		end )
	end
end

CoD.MetricsUtility.OpenMenu = function ( self )
	self.openTime = Engine.milliseconds()
end

CoD.MetricsUtility.CloseMenu = function ( self )
	local controller = self:getOwner()
	if controller == nil then
		controller = 0
	end
	local duration = 0
	if self.openTime then
		duration = Engine.milliseconds() - self.openTime
	end
	CoD.MetricsUtility.ScreenView( controller, self.menuName, duration, self.crm_message_id )
end

CoD.MetricsUtility.ScreenView = function ( controller, menuName, duration, crm_message_id )
	local buttonPressed = Enum.LUIButton.LUI_KEY_NONE
	for i = 1, Enum.LUIButton.LUI_BUTTON_COUNT, 1 do
		local buttonBitModel = Engine.GetModel( Engine.GetModelForController( controller ), "ButtonBits." .. i )
		if buttonBitModel and CoD.BitUtility.IsBitwiseAndNonZero( Engine.GetModelValue( buttonBitModel ), Enum.LUIButtonFlags.FLAG_DOWN ) then
			buttonPressed = i
		end
	end
	Engine.RecordComScoreEvent( controller, "screen_view", "screen_id", menuName, "screen_duration", duration, "button_presed", buttonPressed, "crm_message_id", crm_message_id )
end

CoD.MetricsUtility.StoreEntry = function ( menu, controller, actionSource, currentLobbyMenu )
	local region = Engine.GetSkuRegion()
	Engine.RecordComScoreEvent( controller, "store_entry", "store_source", currentLobbyMenu.name, "store_gamemode", Engine.GetModeName(), "store_action_source", actionSource, "store_region", region )
end

CoD.MetricsUtility.StoreItemViewed = function ( self, controller, itemId, itemDuration )
	local rootModel = Engine.CreateModel( Engine.GetGlobalModel(), "StoreRoot" )
	local actionSource = Engine.GetModelValue( Engine.CreateModel( rootModel, "actionSource", true ) )
	local storeSource = Engine.GetModelValue( Engine.CreateModel( rootModel, "storeSource", true ) )
	local region = Engine.GetSkuRegion()
	Engine.RecordComScoreEvent( controller, "store_item_browse", "store_source", storeSource, "store_gamemode", Engine.GetModeName(), "store_action_source", actionSource, "product_id", itemId, "product_browse_duration", itemDuration, "store_region", region )
end

CoD.MetricsUtility.AccountCreated = function ( self, controller, opt_in_flag, account_source )
	Engine.RecordComScoreEvent( controller, "create_account", "opt_in_flag", opt_in_flag, "account_source", account_source )
end

CoD.MetricsUtility.CRMMessageImpression = function ( self, controller, crm_message_name )
	local data = nil
	if crm_message_name == "crm_featured" then
		local featuredRoot = Engine.GetModel( Engine.GetGlobalModel(), "FeaturedCardsRoot" )
		local cardSequence = Engine.GetModelValue( Engine.GetModel( featuredRoot, "CardSequence" ) )
		local cardDataModelRoot = Engine.GetModel( Engine.GetModelForController( controller ), "FeaturedCards" )
		local cardDataModel = Engine.GetModel( cardDataModelRoot, cardSequence + 1 )
		if not cardDataModel then
			return 
		end
		local cardIndex = Engine.GetModelValue( Engine.GetModel( cardDataModel, "index" ) )
		local card = Engine.GetFeaturedCard( cardIndex )
		if not card then
			return 
		elseif card.type ~= Enum.FeaturedCardType.FEATURED_CARD_TYPE_CRM then
			return 
		end
		data = Engine.GetMarketingMessage( controller, crm_message_name, cardIndex )
	else
		data = Engine.GetMarketingMessage( controller, crm_message_name )
	end
	if not data then
		return 
	end
	local duration = 0
	if self.openTime then
		duration = Engine.milliseconds() - self.openTime
	end
	Engine.RecordComScoreEvent( controller, "crm_message_view", "crm_message_id", data.messageID, "crm_screen_id", data.locationID, "crm_message_duration", duration )
end

CoD.MetricsUtility.CRMMessageInteraction = function ( self, controller, crm_message_name, interaction_type, interaction_details )
	local data = nil
	if crm_message_name == "crm_featured" then
		local featuredRoot = Engine.GetModel( Engine.GetGlobalModel(), "FeaturedCardsRoot" )
		local cardSequence = Engine.GetModelValue( Engine.GetModel( featuredRoot, "CardSequence" ) )
		local cardDataModelRoot = Engine.GetModel( Engine.GetModelForController( controller ), "FeaturedCards" )
		local cardDataModel = Engine.GetModel( cardDataModelRoot, cardSequence + 1 )
		if not cardDataModel then
			return 
		end
		local cardIndex = Engine.GetModelValue( Engine.GetModel( cardDataModel, "index" ) )
		local card = Engine.GetFeaturedCard( cardIndex )
		if not card then
			return 
		elseif card.type ~= Enum.FeaturedCardType.FEATURED_CARD_TYPE_CRM then
			return 
		end
		data = Engine.GetMarketingMessage( controller, crm_message_name, cardIndex )
	else
		data = Engine.GetMarketingMessage( controller, crm_message_name )
	end
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

CoD.MetricsUtility.PaintshopEvent = function ( controller, operation, duration, weaponIndex, paintjobName, assets_used, slotsUsed, totalSlots )
	Engine.RecordComScoreEvent( controller, "paint_shop", "operation", operation, "duration", duration, "weapon_id", weaponIndex, "paint_job_title", paintjobName, "assets_used", assets_used, "slots_used", slotsUsed, "total_slots", totalSlots )
end

CoD.MetricsUtility.GunsmithEvent = function ( controller, operation, duration, weaponIndex, weaponTitle, attachments_used, slotsUsed, totalSlots )
	Engine.RecordComScoreEvent( controller, "gunsmith", "operation", operation, "duration", duration, "weapon_id", weaponIndex, "weapon_title", weaponTitle, "attachments_used", attachments_used, "slots_used", slotsUsed, "total_slots", totalSlots )
end

CoD.MetricsUtility.EmblemEvent = function ( controller, duration, assets_used, slotsUsed, totalSlots )
	Engine.RecordComScoreEvent( controller, "save_emblem", "duration", duration, "assets_used", assets_used, "slots_used", slotsUsed, "total_slots", totalSlots )
end

CoD.MetricsUtility.PrestigeEvent = function ( controller, oldPrestige, newPrestige, gameMode )
	Engine.RecordComScoreEvent( controller, "prestige", "old_prestige", oldPrestige, "new_prestige", newPrestige, "game_mode", gameMode )
end

CoD.MetricsUtility.WatchVideoEvent = function ( controller, info )
	Engine.RecordComScoreEvent( controller, "watch_video", "video_id", info.fileID, "video_length", info.duration, "video_author", info.authorName, "video_ispooled", info.isPooled )
end

CoD.MetricsUtility.ScreenshotEvent = function ( controller, operation, category, slotsUsed, totalSlots )
	Engine.RecordComScoreEvent( controller, "screenshot", "operation", operation, "slotsUsed", slotsUsed, "totalSlots", totalSlots )
end

CoD.MetricsUtility.ClipsEvent = function ( controller, operation, category, slotsUsed, totalSlots )
	Engine.RecordComScoreEvent( controller, "clip", "operation", operation, "slotsUsed", slotsUsed, "totalSlots", totalSlots )
end

CoD.MetricsUtility.FileshareEvent = function ( controller, operation, category, slotsUsed, totalSlots )
	Engine.RecordComScoreEvent( controller, "fileshare", "category", category, "operation", operation, "slotsUsed", slotsUsed, "totalSlots", totalSlots )
end

