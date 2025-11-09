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

LUI.CoDMetrics.GetGroupsIDList = function ( f6_arg0 )
	local f6_local0 = Engine.GetGroupIDList( f6_arg0, Enum.GroupBufferType.GROUP_BUFFER_TYPE_SELF )
	if f6_local0 == nil or #f6_local0 == 0 then
		return "0"
	end
	local f6_local1 = Engine.Int64AsString( f6_local0[1] )
	for f6_local2 = 2, #f6_local0, 1 do
		f6_local1 = f6_local1 .. "," .. Engine.Int64AsString( f6_local0[f6_local2] )
	end
	return f6_local1
end

LUI.CoDMetrics.ScreenView = function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3 )
	Engine.RecordComScoreEvent( f7_arg0, "screen_view", "group_id", LUI.CoDMetrics.GetGroupsIDList( f7_arg0 ), "screen_id", f7_arg1, "screen_duration", f7_arg2, "button_presed", f0_local0( f7_arg0 ), "crm_message_id", f7_arg3 )
end

LUI.CoDMetrics.StoreEntry = function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3 )
	local f8_local0 = Engine.GetSkuRegion()
	local f8_local1, f8_local2 = Engine.RecordStoreSessionEntry( f8_arg1 )
	Engine.RecordComScoreEvent( f8_arg1, "store_entry", "group_id", LUI.CoDMetrics.GetGroupsIDList( f8_arg1 ), "store_source", f8_arg3.name, "store_gamemode", Engine.GetModeName(), "store_action_source", f8_arg2, "store_region", f8_local0, "store_session_id", tostring( f8_local1 ), "store_transaction_id", tostring( f8_local2 ) )
end

LUI.CoDMetrics.StoreItemViewed = function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3 )
	local f9_local0 = Engine.CreateModel( Engine.GetModelForController( f9_arg1 ), "StoreRoot" )
	Engine.RecordComScoreEvent( f9_arg1, "store_item_browse", "group_id", LUI.CoDMetrics.GetGroupsIDList( f9_arg1 ), "store_source", Engine.GetModelValue( Engine.CreateModel( f9_local0, "storeSource", true ) ), "store_gamemode", Engine.GetModeName(), "store_action_source", Engine.GetModelValue( Engine.CreateModel( f9_local0, "actionSource", true ) ), "product_id", f9_arg2, "product_browse_duration", f9_arg3, "store_region", Engine.GetSkuRegion() )
end

LUI.CoDMetrics.InventoryItemPurchased = function ( f10_arg0, f10_arg1, f10_arg2, f10_arg3, f10_arg4 )
	local f10_local0 = Engine.GetSkuRegion()
	if not Engine.IsDedicatedServer() then
		local f10_local1, f10_local2 = Engine.GetStoreSessionAndTransactionID( f10_arg0 )
		Engine.RecordComScoreEvent( f10_arg0, "dw_inventory_item_purchase", "group_id", LUI.CoDMetrics.GetGroupsIDList( f10_arg0 ), "store_source", f10_arg2, "store_gamemode", Engine.GetModeName(), "product_name", f10_arg1, "product_cost_cp", f10_arg3, "store_region", f10_local0, "PurchaseCompleted", f10_arg4, "store_session_id", tostring( f10_local1 ), "store_transaction_id", tostring( f10_local2 ) )
		Engine.IncrementStoreTransaction( f10_arg0 )
	end
end

LUI.CoDMetrics.InventoryItemEquipped = function ( f11_arg0, f11_arg1, f11_arg2, f11_arg3 )
	Engine.RecordComScoreEvent( f11_arg0, "dw_inventory_item_equip", "group_id", LUI.CoDMetrics.GetGroupsIDList( f11_arg0 ), "store_gamemode", Engine.GetModeName(), "product_name", f11_arg1, "product_id", f11_arg2, "product_equip_location", f11_arg3, "store_region", Engine.GetSkuRegion() )
end

LUI.CoDMetrics.AccountCreated = function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3 )
	Engine.RecordComScoreEvent( f12_arg1, "create_account", "group_id", LUI.CoDMetrics.GetGroupsIDList( f12_arg1 ), "opt_in_flag", f12_arg2, "account_source", f12_arg3 )
end

LUI.CoDMetrics.CRMMessageImpression = function ( f13_arg0, f13_arg1, f13_arg2 )
	local f13_local0 = nil
	if f13_arg2 == "crm_featured" then
		local f13_local1 = Engine.GetModel( Engine.GetModel( Engine.GetModelForController( f13_arg1 ), "FeaturedCards" ), Engine.GetModelValue( Engine.GetModel( Engine.GetModel( Engine.GetGlobalModel(), "FeaturedCardsRoot" ), "CardSequence" ) ) + 1 )
		if not f13_local1 then
			return 
		end
		local f13_local2 = Engine.GetModelValue( Engine.GetModel( f13_local1, "index" ) )
		local f13_local3 = Engine.GetFeaturedCard( f13_local2 )
		if not f13_local3 then
			return 
		elseif f13_local3.type ~= Enum.FeaturedCardType.FEATURED_CARD_TYPE_CRM then
			return 
		end
		f13_local0 = Engine.GetMarketingMessage( f13_arg1, f13_arg2, f13_local2 )
	else
		f13_local0 = Engine.GetMarketingMessage( f13_arg1, f13_arg2 )
	end
	if not f13_local0 then
		return 
	end
	local f13_local4 = 0
	if f13_arg0.openTime then
		f13_local4 = Engine.milliseconds() - f13_arg0.openTime
	end
	Engine.RecordComScoreEvent( f13_arg1, "crm_message_view", "group_id", LUI.CoDMetrics.GetGroupsIDList( f13_arg1 ), "crm_message_id", f13_local0.messageID, "crm_screen_id", f13_local0.locationID, "crm_message_duration", f13_local4 )
end

LUI.CoDMetrics.CRMMessageInteraction = function ( f14_arg0, f14_arg1, f14_arg2, f14_arg3, f14_arg4 )
	local f14_local0 = nil
	if f14_arg2 == "crm_featured" then
		local f14_local1 = Engine.GetModel( Engine.GetModel( Engine.GetModelForController( f14_arg1 ), "FeaturedCards" ), Engine.GetModelValue( Engine.GetModel( Engine.GetModel( Engine.GetGlobalModel(), "FeaturedCardsRoot" ), "CardSequence" ) ) + 1 )
		if not f14_local1 then
			return 
		end
		local f14_local2 = Engine.GetModelValue( Engine.GetModel( f14_local1, "index" ) )
		local f14_local3 = Engine.GetFeaturedCard( f14_local2 )
		if not f14_local3 then
			return 
		elseif f14_local3.type ~= Enum.FeaturedCardType.FEATURED_CARD_TYPE_CRM then
			return 
		end
		f14_local0 = Engine.GetMarketingMessage( f14_arg1, f14_arg2, f14_local2 )
	else
		f14_local0 = Engine.GetMarketingMessage( f14_arg1, f14_arg2 )
	end
	if not f14_local0 then
		return 
	elseif not f14_arg3 then
		f14_arg3 = ""
	end
	if not f14_arg4 then
		f14_arg4 = ""
	end
	Engine.RecordComScoreEvent( f14_arg1, "crm_message_click", "group_id", LUI.CoDMetrics.GetGroupsIDList( f14_arg1 ), "crm_message_id", f14_local0.messageID, "crm_screen_id", f14_local0.locationID, "interaction_type", f14_arg3, "interaction_details", f14_arg4 )
end

LUI.CoDMetrics.PaintshopEvent = function ( f15_arg0, f15_arg1, f15_arg2, f15_arg3, f15_arg4, f15_arg5, f15_arg6, f15_arg7 )
	Engine.RecordComScoreEvent( f15_arg0, "paint_shop", "group_id", LUI.CoDMetrics.GetGroupsIDList( f15_arg0 ), "operation", f15_arg1, "duration", f15_arg2, "weapon_id", f15_arg3, "paint_job_title", f15_arg4, "assets_used", f15_arg5, "slots_used", f15_arg6, "total_slots", f15_arg7 )
end

LUI.CoDMetrics.GunsmithEvent = function ( f16_arg0, f16_arg1, f16_arg2, f16_arg3, f16_arg4, f16_arg5, f16_arg6, f16_arg7 )
	Engine.RecordComScoreEvent( f16_arg0, "gunsmith", "group_id", LUI.CoDMetrics.GetGroupsIDList( f16_arg0 ), "operation", f16_arg1, "duration", f16_arg2, "weapon_id", f16_arg3, "weapon_title", f16_arg4, "attachments_used", f16_arg5, "slots_used", f16_arg6, "total_slots", f16_arg7 )
end

LUI.CoDMetrics.EmblemEvent = function ( f17_arg0, f17_arg1, f17_arg2, f17_arg3, f17_arg4 )
	Engine.RecordComScoreEvent( f17_arg0, "save_emblem", "group_id", LUI.CoDMetrics.GetGroupsIDList( f17_arg0 ), "duration", f17_arg1, "assets_used", f17_arg2, "slots_used", f17_arg3, "total_slots", f17_arg4 )
end

LUI.CoDMetrics.PrestigeEvent = function ( f18_arg0, f18_arg1, f18_arg2, f18_arg3 )
	Engine.RecordComScoreEvent( f18_arg0, "prestige", "group_id", LUI.CoDMetrics.GetGroupsIDList( f18_arg0 ), "old_prestige", f18_arg1, "new_prestige", f18_arg2, "game_mode", f18_arg3 )
end

LUI.CoDMetrics.WatchVideoEvent = function ( f19_arg0, f19_arg1 )
	Engine.RecordComScoreEvent( f19_arg0, "watch_video", "group_id", LUI.CoDMetrics.GetGroupsIDList( f19_arg0 ), "video_id", f19_arg1.fileID, "video_length", f19_arg1.duration, "video_author", f19_arg1.authorName, "video_ispooled", f19_arg1.isPooled )
end

LUI.CoDMetrics.ScreenshotEvent = function ( f20_arg0, f20_arg1, f20_arg2, f20_arg3, f20_arg4 )
	Engine.RecordComScoreEvent( f20_arg0, "screenshot", "group_id", LUI.CoDMetrics.GetGroupsIDList( f20_arg0 ), "operation", f20_arg1, "slotsUsed", f20_arg3, "totalSlots", f20_arg4 )
end

LUI.CoDMetrics.ClipsEvent = function ( f21_arg0, f21_arg1, f21_arg2, f21_arg3, f21_arg4 )
	Engine.RecordComScoreEvent( f21_arg0, "clip", "group_id", LUI.CoDMetrics.GetGroupsIDList( f21_arg0 ), "operation", f21_arg1, "slotsUsed", f21_arg3, "totalSlots", f21_arg4 )
end

LUI.CoDMetrics.FileshareEvent = function ( f22_arg0, f22_arg1, f22_arg2, f22_arg3, f22_arg4 )
	Engine.RecordComScoreEvent( f22_arg0, "fileshare", "group_id", LUI.CoDMetrics.GetGroupsIDList( f22_arg0 ), "category", f22_arg2, "operation", f22_arg1, "slotsUsed", f22_arg3, "totalSlots", f22_arg4 )
end

LUI.CoDMetrics.DailyChallengeAbandonedEvent = function ( f23_arg0, f23_arg1, f23_arg2, f23_arg3, f23_arg4, f23_arg5 )
	Engine.RecordComScoreEvent( f23_arg0, "daily_challenge_abandoned", "group_id", LUI.CoDMetrics.GetGroupsIDList( f23_arg0 ), "challenge_id", f23_arg1, "challenge_start_time", f23_arg2, "challenge_progress", f23_arg3, "challenge_time_ingame", f23_arg4, "challenge_games_played", f23_arg5 )
end

LUI.CoDMetrics.CookGobbleGumRecipeEvent = function ( f24_arg0, f24_arg1 )
	Engine.RecordComScoreEvent( f24_arg0, "cook_gobblegum_recipe", "group_id", LUI.CoDMetrics.GetGroupsIDList( f24_arg0 ), "recipe_id", f24_arg1 )
end

LUI.CoDMetrics.JoinGroupEvent = function ( f25_arg0, f25_arg1, f25_arg2 )
	Engine.RecordComScoreEvent( f25_arg0, "join_group", "group_id", LUI.CoDMetrics.GetGroupsIDList( f25_arg0 ), "group", Engine.Int64AsString( f25_arg1 ), "group_join_type", f25_arg2 )
end

LUI.CoDMetrics.LeaveGroupEvent = function ( f26_arg0, f26_arg1, f26_arg2 )
	Engine.RecordComScoreEvent( f26_arg0, "leave_group", "group_id", LUI.CoDMetrics.GetGroupsIDList( f26_arg0 ), "group", Engine.Int64AsString( f26_arg1 ), "group_deleted", f26_arg2 )
end

LUI.CoDMetrics.CreateGroupEvent = function ( f27_arg0, f27_arg1, f27_arg2 )
	Engine.RecordComScoreEvent( f27_arg0, "create_group", "group_id", LUI.CoDMetrics.GetGroupsIDList( f27_arg0 ), "group", Engine.Int64AsString( f27_arg1 ), "group_type", f27_arg2 )
end

LUI.CoDMetrics.VialsSpentSuccessEvent = function ( f28_arg0, f28_arg1, f28_arg2, f28_arg3 )
	Engine.RecordComScoreEvent( f28_arg0, "spend_vials_success", "group_id", LUI.CoDMetrics.GetGroupsIDList( f28_arg0 ), "vials_spent", f28_arg1, "vials_before", f28_arg2, "vials_after", f28_arg3 )
end

LUI.CoDMetrics.VialsSpentFailureEvent = function ( f29_arg0, f29_arg1, f29_arg2, f29_arg3 )
	Engine.RecordComScoreEvent( f29_arg0, "spend_vials_failure", "group_id", LUI.CoDMetrics.GetGroupsIDList( f29_arg0 ), "vials_spent", f29_arg1, "vials_before", f29_arg2, "vials_after", f29_arg3 )
end

LUI.CoDMetrics.ExperimentPromoFeatureCardEvent = function ( f30_arg0, f30_arg1 )
	Engine.RecordComScoreEvent( f30_arg0, "black_market_experiment_featured", "group_id", LUI.CoDMetrics.GetGroupsIDList( f30_arg0 ), "exp_group_number", f30_arg1 )
end

LUI.CoDMetrics.BlackmarketExperimentEvent = function ( f31_arg0, f31_arg1, f31_arg2, f31_arg3 )
	Engine.RecordComScoreEvent( f31_arg0, "black_market_experiment", "promo", f31_arg1, "status", f31_arg2, "exp_group_number", f31_arg3 )
end

