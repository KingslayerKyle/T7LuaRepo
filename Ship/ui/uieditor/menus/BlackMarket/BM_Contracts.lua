-- 964606c5f1fa9a938d992e771aa0926c
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.playercard.SelfIdentityBadge" )
require( "ui.uieditor.widgets.Footer.fe_FooterContainer_NOTLobby" )
require( "ui.uieditor.widgets.BlackMarket.BM_Contracts_WeeklyContractsWidget" )
require( "ui.uieditor.widgets.BlackMarket.BM_Contracts_BlackjackInfoWidget" )
require( "ui.uieditor.widgets.BlackMarket.BM_Contracts_DailyContractWidget" )
require( "ui.uieditor.widgets.BlackMarket.BM_Contracts_SpecialContractWidget" )
require( "ui.uieditor.menus.BlackMarket.BM_SpecialContracts" )
require( "ui.uieditor.widgets.BlackMarket.BM_Contracts_CommunityButton" )
require( "ui.uieditor.menus.ZMHD.ZMHD_Community_Theme" )
require( "ui.uieditor.widgets.BlackMarket.BM_LogoContracts" )

DataSources.BlackMarketSpecialContract = {
	getModel = function ( f1_arg0 )
		local f1_local0 = Engine.CreateModel( Engine.GetModelForController( f1_arg0 ), "BlackMarketSpecialContract" )
		local f1_local1 = Engine.GetDStat( f1_arg0, "weaponContractData", "currentValue" )
		local f1_local2 = Engine.DvarInt( nil, "weapon_contract_target_value" )
		local f1_local3 = 0
		if f1_local2 > 0 then
			f1_local3 = f1_local1 / f1_local2
		end
		Engine.SetModelValue( Engine.CreateModel( f1_local0, "percent" ), f1_local3 )
		Engine.SetModelValue( Engine.CreateModel( f1_local0, "fractionText" ), Engine.Localize( "MPUI_X_SLASH_Y", f1_local1, f1_local2 ) )
		local f1_local4 = Engine.SetModelValue
		local f1_local5 = Engine.CreateModel( f1_local0, "isComplete" )
		local f1_local6
		if f1_local2 <= 0 or f1_local2 > f1_local1 then
			f1_local6 = false
		else
			f1_local6 = true
		end
		f1_local4( f1_local5, f1_local6 )
		return f1_local0
	end
}
DataSources.BlackMarketDailyContracts = ListHelper_SetupDataSource( "BlackMarketDailyContracts", function ( f2_arg0 )
	local f2_local0 = {}
	local f2_local1 = CoD.GetContractStatValuesForIndex( f2_arg0, LuaUtils.BMContracts.dailyContractIndex )
	local f2_local2 = table.insert
	local f2_local3 = f2_local0
	local f2_local4 = {}
	local f2_local5 = {
		index = f2_local1.index,
		title = Engine.Localize( f2_local1.titleRef ),
		description = Engine.Localize( f2_local1.descRef, f2_local1.targetValue ),
		percentComplete = f2_local1.progress / f2_local1.targetValue,
		fractionText = Engine.Localize( "MPUI_X_SLASH_Y", f2_local1.progress, f2_local1.targetValue )
	}
	local f2_local6
	if f2_local1.targetValue > f2_local1.progress or f2_local1.targetValue <= 0 then
		f2_local6 = false
	else
		f2_local6 = true
	end
	f2_local5.isComplete = f2_local6
	f2_local4.models = f2_local5
	f2_local2( f2_local3, f2_local4 )
	return f2_local0
end, nil, nil, function ( f3_arg0, f3_arg1, f3_arg2 )
	if Engine.DvarBool( nil, "contracts_enabled_mp" ) and not f3_arg1.dailyUpdateSubscription then
		f3_arg1.dailyUpdateSubscription = f3_arg1:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "contractDailyIndex" ), function ()
			f3_arg1:updateDataSource()
		end, false )
	end
end )
DataSources.BlackMarketWeeklyContracts = ListHelper_SetupDataSource( "BlackMarketWeeklyContracts", function ( f5_arg0 )
	local f5_local0 = {}
	local f5_local1 = {}
	table.insert( f5_local1, CoD.GetContractStatValuesForIndex( f5_arg0, LuaUtils.BMContracts.weeklyContractIndex1 ) )
	table.insert( f5_local1, CoD.GetContractStatValuesForIndex( f5_arg0, LuaUtils.BMContracts.weeklyContractIndex2 ) )
	for f5_local6, f5_local7 in ipairs( f5_local1 ) do
		local f5_local8 = table.insert
		local f5_local9 = f5_local0
		local f5_local10 = {}
		local f5_local11 = {
			index = f5_local7.index,
			title = Engine.Localize( f5_local7.titleRef ),
			description = Engine.Localize( f5_local7.descRef, f5_local7.targetValue ),
			percentComplete = f5_local7.progress / f5_local7.targetValue,
			fractionText = Engine.Localize( "MPUI_X_SLASH_Y", f5_local7.progress, f5_local7.targetValue )
		}
		local f5_local5
		if f5_local7.targetValue > f5_local7.progress or f5_local7.targetValue <= 0 then
			f5_local5 = false
		else
			f5_local5 = true
		end
		f5_local11.isComplete = f5_local5
		f5_local10.models = f5_local11
		f5_local8( f5_local9, f5_local10 )
	end
	return f5_local0
end, nil, nil, function ( f6_arg0, f6_arg1, f6_arg2 )
	if Engine.DvarBool( nil, "contracts_enabled_mp" ) then
		if not f6_arg1.weeklyUpdateSubscriptionA then
			f6_arg1.weeklyUpdateSubscriptionA = f6_arg1:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "contractWeeklyAIndex" ), function ()
				f6_arg1:updateDataSource()
			end, false )
		end
		if not f6_arg1.weeklyUpdateSubscriptionB then
			f6_arg1.weeklyUpdateSubscriptionB = f6_arg1:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "contractWeeklyBIndex" ), function ()
				f6_arg1:updateDataSource()
			end, false )
		end
	end
end )
local PreLoadFunc = function ( self, controller )
	local f9_local0 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "autoevents" ), "cycled" )
end

local PostLoadFunc = function ( f10_arg0, f10_arg1 )
	f10_arg0:registerEventHandler( "contracts_time_remaining_tick", function ( element, event )
		LuaUtils.CycleContracts()
	end )
	f10_arg0:addElement( LUI.UITimer.new( 250, "contracts_time_remaining_tick", false, f10_arg0 ) )
	LuaUtils.CycleContracts()
	local f10_local0 = Engine.StorageGetBuffer( f10_arg1, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	if f10_local0 then
		f10_local0.ui_seen_new_contracts:set( 1 )
		if Dvar.ui_enablePromoMenu:get() then
			f10_local0.ui_seen_community_contract:set( 1 )
			f10_local0.ui_community_contract_milestone:set( CoD.GetThermometerUnlockIndex() )
		end
		if IsTrifectaContractBreadcrumbActive( f10_arg1 ) then
			f10_local0.extraBytes[3]:set( Engine.DvarInt( nil, "loot_trifecta_breadcrumb_index" ) )
		end
		local f10_local1 = function ( f12_arg0 )
			LUI.OverrideFunction_CallOriginalSecond( f10_arg0, "close", function ()
				if f10_arg0.currentAlias then
					Engine.StopSound( f10_arg0.currentAlias )
				end
			end )
			SendFrontendControllerZeroMenuResponse( f10_arg1, "BlackMarket", "stopsounds" )
			Engine.PlaySound( f12_arg0 )
			f10_arg0.currentAlias = f12_arg0
		end
		
		local f10_local2 = function ( f14_arg0 )
			return f14_arg0.targetValue <= f14_arg0.progress
		end
		
		local f10_local3 = function ( f15_arg0 )
			local f15_local0 = 0
			local f15_local1 = 100
			while true do
				local f15_local2 = Engine.GetLootItems( f15_arg0, Enum.eModes.MODE_MULTIPLAYER, f15_local0, f15_local1 )
				if f15_local2 == nil or #f15_local2 == 0 then
					return nil
				end
				for f15_local6, f15_local7 in ipairs( f15_local2 ) do
					local f15_local8 = CoDShared.GetLootItemCategory( f15_local7.id )
					if f15_local8 == "weapon" or f15_local8 == "melee_weapon" then
						return f15_local7.datetime
					end
				end
				f15_local0 = f15_local0 + f15_local1
			end
		end
		
		local f10_local4 = CoD.GetContractStatValuesForIndex( f10_arg1, LuaUtils.BMContracts.dailyContractIndex )
		local f10_local5 = CoD.GetContractStatValuesForIndex( f10_arg1, LuaUtils.BMContracts.weeklyContractIndex1 )
		local f10_local6 = CoD.GetContractStatValuesForIndex( f10_arg1, LuaUtils.BMContracts.weeklyContractIndex2 )
		local f10_local7 = f10_local2( f10_local4 )
		local f10_local8 = f10_local2( f10_local5 )
		if f10_local8 then
			f10_local8 = f10_local2( f10_local6 )
		end
		local f10_local9 = not CoD.SafeGetModelValue( DataSources.SideBetCurrentChallenge.getModel( f10_arg1 ), "isLocked" )
		local f10_local10 = f10_local3( f10_arg1 )
		if f10_local0.ui_seen_contracts_menu:get() == 0 then
			f10_local0.ui_seen_contracts_menu:set( 1 )
			f10_local1( "vox_mark_first_time" )
		elseif f10_local10 and f10_local10 ~= f10_local0.ui_last_weapon_drop_vo_timestamp:get() and tonumber( Engine.GetCurrentUTCTimeStr() ) - f10_local10 < Engine.DvarInt( nil, "tu11_contracts_weapon_vo_time_limit" ) then
			f10_local0.ui_last_weapon_drop_vo_timestamp:set( f10_local10 )
			f10_local1( "vox_mark_supply_drop" )
		elseif f10_local0.ui_seen_side_bet_congrats:get() == 0 and f10_local9 then
			f10_local0.ui_seen_side_bet_congrats:set( 1 )
			f10_local1( "vox_mark_calling_card" )
		elseif f10_local0.ui_seen_weekly_congrats:get() == 0 and f10_local8 then
			f10_local0.ui_seen_weekly_congrats:set( 1 )
			f10_local1( "vox_mark_weekly_reward" )
		elseif f10_local0.ui_seen_daily_congrats:get() == 0 and f10_local7 then
			f10_local0.ui_seen_daily_congrats:set( 1 )
			f10_local1( "vox_mark_daily_reward" )
		elseif f10_local7 and f10_local8 then
			f10_local1( "vox_mark_no_contracts" )
		elseif f10_local7 and not f10_local8 then
			f10_local1( "vox_mark_weekly_available" )
		elseif f10_local8 and not f10_local7 then
			f10_local1( "vox_mark_daily_available" )
		else
			f10_local1( "vox_mark_weekly_daily_available" )
		end
	end
end

LUI.createMenu.BM_Contracts = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "BM_Contracts" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "Blackmarket_extra"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "BM_Contracts.buttonPrompts" )
	local f16_local1 = self
	self.anyChildUsesUpdateState = true
	
	local Screen = LUI.UIImage.new()
	Screen:setLeftRight( true, true, 0, 0 )
	Screen:setTopBottom( true, true, 0, 0 )
	Screen:setImage( RegisterImage( "uie_t7_blackmarket_contracts_bg_1080" ) )
	self:addElement( Screen )
	self.Screen = Screen
	
	local SelfIdentityBadge = CoD.SelfIdentityBadge.new( f16_local1, controller )
	SelfIdentityBadge:setLeftRight( false, true, -453, -110 )
	SelfIdentityBadge:setTopBottom( true, false, 15, 75 )
	SelfIdentityBadge:subscribeToGlobalModel( controller, "PerController", "identityBadge", function ( model )
		SelfIdentityBadge:setModel( model, controller )
	end )
	SelfIdentityBadge:subscribeToGlobalModel( controller, "PerController", nil, function ( model )
		SelfIdentityBadge.CallingCard.CallingCardsFrameWidget:setModel( model, controller )
	end )
	self:addElement( SelfIdentityBadge )
	self.SelfIdentityBadge = SelfIdentityBadge
	
	local feFooterContainerNOTLobby = CoD.fe_FooterContainer_NOTLobby.new( f16_local1, controller )
	feFooterContainerNOTLobby:setLeftRight( true, true, 1, -1 )
	feFooterContainerNOTLobby:setTopBottom( false, true, -67, 0 )
	feFooterContainerNOTLobby:registerEventHandler( "menu_opened", function ( element, event )
		local f19_local0 = nil
		SizeToSafeArea( element, controller )
		if not f19_local0 then
			f19_local0 = element:dispatchEventToChildren( event )
		end
		return f19_local0
	end )
	self:addElement( feFooterContainerNOTLobby )
	self.feFooterContainerNOTLobby = feFooterContainerNOTLobby
	
	local WeeklyContractsWidget = CoD.BM_Contracts_WeeklyContractsWidget.new( f16_local1, controller )
	WeeklyContractsWidget:setLeftRight( true, false, 310, 794 )
	WeeklyContractsWidget:setTopBottom( true, false, 320.74, 613.74 )
	self:addElement( WeeklyContractsWidget )
	self.WeeklyContractsWidget = WeeklyContractsWidget
	
	local BlackjackInfo = CoD.BM_Contracts_BlackjackInfoWidget.new( f16_local1, controller )
	BlackjackInfo:setLeftRight( true, false, 796, 1213 )
	BlackjackInfo:setTopBottom( true, false, 100.74, 616.74 )
	BlackjackInfo.Title:setText( Engine.Localize( "MPUI_BM_CONTRACT_BLACKJACK" ) )
	BlackjackInfo:registerEventHandler( "gain_focus", function ( element, event )
		local f20_local0 = nil
		if element.gainFocus then
			f20_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f20_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f16_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f20_local0
	end )
	BlackjackInfo:registerEventHandler( "lose_focus", function ( element, event )
		local f21_local0 = nil
		if element.loseFocus then
			f21_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f21_local0 = element.super:loseFocus( event )
		end
		return f21_local0
	end )
	f16_local1:AddButtonCallbackFunction( BlackjackInfo, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f22_arg0, f22_arg1, f22_arg2, f22_arg3 )
		if not IsStorageValueEqualTo( f22_arg2, "stats_mp", "blackjack_contract_count", 0 ) and not IsBlackjackContractActive( f22_arg2 ) then
			OpenSystemOverlay( self, f22_arg1, f22_arg2, "BlackjackActivationConfirmation", {
				self = self,
				element = f22_arg0
			} )
			return true
		else
			
		end
	end, function ( f23_arg0, f23_arg1, f23_arg2 )
		CoD.Menu.SetButtonLabel( f23_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_ACTIVATE" )
		if not IsStorageValueEqualTo( f23_arg2, "stats_mp", "blackjack_contract_count", 0 ) and not IsBlackjackContractActive( f23_arg2 ) then
			return true
		else
			return false
		end
	end, true )
	self:addElement( BlackjackInfo )
	self.BlackjackInfo = BlackjackInfo
	
	local DailyContractWidget = CoD.BM_Contracts_DailyContractWidget.new( f16_local1, controller )
	DailyContractWidget:setLeftRight( true, false, 75, 309 )
	DailyContractWidget:setTopBottom( true, false, 320.74, 613.74 )
	self:addElement( DailyContractWidget )
	self.DailyContractWidget = DailyContractWidget
	
	local SpecialContractWidget = CoD.BM_Contracts_SpecialContractWidget.new( f16_local1, controller )
	SpecialContractWidget:setLeftRight( true, false, 72, 791 )
	SpecialContractWidget:setTopBottom( true, false, 101.74, 319.74 )
	SpecialContractWidget.Title:setText( Engine.Localize( "MPUI_BM_CONTRACT_SPECIAL" ) )
	SpecialContractWidget:subscribeToGlobalModel( controller, "CurrentSpecialContract", "percentComplete", function ( model )
		local percentComplete = Engine.GetModelValue( model )
		if percentComplete then
			SpecialContractWidget.SpecialContractPercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( percentComplete, 1 ), CoD.GetVectorComponentFromString( percentComplete, 2 ), CoD.GetVectorComponentFromString( percentComplete, 3 ), CoD.GetVectorComponentFromString( percentComplete, 4 ) )
		end
	end )
	SpecialContractWidget:subscribeToGlobalModel( controller, "CurrentSpecialContract", "fractionText", function ( model )
		local fractionText = Engine.GetModelValue( model )
		if fractionText then
			SpecialContractWidget.SpecialContractPercentCompleteWidget.percentText:setText( Engine.Localize( fractionText ) )
		end
	end )
	SpecialContractWidget:subscribeToGlobalModel( controller, "CurrentSpecialContract", "name", function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			SpecialContractWidget.SpecialContractName:setText( LocalizeToUpperString( name ) )
		end
	end )
	SpecialContractWidget:subscribeToGlobalModel( controller, "CurrentSpecialContract", "description", function ( model )
		local description = Engine.GetModelValue( model )
		if description then
			SpecialContractWidget.SpecialContractDesc:setText( Engine.Localize( description ) )
		end
	end )
	SpecialContractWidget:registerEventHandler( "gain_focus", function ( element, event )
		local f28_local0 = nil
		if element.gainFocus then
			f28_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f28_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f16_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f28_local0
	end )
	SpecialContractWidget:registerEventHandler( "lose_focus", function ( element, event )
		local f29_local0 = nil
		if element.loseFocus then
			f29_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f29_local0 = element.super:loseFocus( event )
		end
		return f29_local0
	end )
	f16_local1:AddButtonCallbackFunction( SpecialContractWidget, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f30_arg0, f30_arg1, f30_arg2, f30_arg3 )
		OpenPopup( self, "BM_SpecialContracts", f30_arg2, "", "" )
		return true
	end, function ( f31_arg0, f31_arg1, f31_arg2 )
		CoD.Menu.SetButtonLabel( f31_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	SpecialContractWidget:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return IsDvarValueEqualTo( "enable_weapon_contract", false )
			end
		},
		{
			stateName = "Short",
			condition = function ( menu, element, event )
				return IsDvarValueEqualTo( "ui_enablePromoMenu", true ) and not IsModelValueTrue( controller, "CurrentSpecialContract.isComplete" )
			end
		},
		{
			stateName = "Completed",
			condition = function ( menu, element, event )
				return IsDvarValueEqualTo( "ui_enablePromoMenu", false ) and IsModelValueTrue( controller, "CurrentSpecialContract.isComplete" )
			end
		},
		{
			stateName = "CompletedShort",
			condition = function ( menu, element, event )
				return IsDvarValueEqualTo( "ui_enablePromoMenu", true ) and IsModelValueTrue( controller, "CurrentSpecialContract.isComplete" )
			end
		}
	} )
	SpecialContractWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CurrentSpecialContract.isComplete" ), function ( model )
		f16_local1:updateElementState( SpecialContractWidget, {
			name = "model_validation",
			menu = f16_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CurrentSpecialContract.isComplete"
		} )
	end )
	self:addElement( SpecialContractWidget )
	self.SpecialContractWidget = SpecialContractWidget
	
	local CommunityButton = CoD.BM_Contracts_CommunityButton.new( f16_local1, controller )
	CommunityButton:setLeftRight( true, false, 73, 431 )
	CommunityButton:setTopBottom( true, false, 101.74, 319.74 )
	CommunityButton:setAlpha( 0 )
	CommunityButton.TitleAndDesc.SpecialContractName:setText( LocalizeToUpperString( "CONTRACT_BGB_CC_TITLE" ) )
	CommunityButton.TitleAndDesc.SpecialContractDesc:setText( Engine.Localize( "MPUI_CONTRACTS_RTC_DESC" ) )
	CommunityButton:registerEventHandler( "gain_focus", function ( element, event )
		local f37_local0 = nil
		if element.gainFocus then
			f37_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f37_local0 = element.super:gainFocus( event )
		end
		if IsDvarValueEqualTo( "ui_enablePromoMenu", false ) then
			SetFocusToElement( self, "SpecialContractWidget", controller )
			MakeNotFocusable( element )
		else
			CoD.Menu.UpdateButtonShownState( element, f16_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		end
		return f37_local0
	end )
	CommunityButton:registerEventHandler( "lose_focus", function ( element, event )
		local f38_local0 = nil
		if element.loseFocus then
			f38_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f38_local0 = element.super:loseFocus( event )
		end
		return f38_local0
	end )
	f16_local1:AddButtonCallbackFunction( CommunityButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f39_arg0, f39_arg1, f39_arg2, f39_arg3 )
		if IsDvarValueEqualTo( "ui_enablePromoMenu", true ) then
			OpenOverlay( self, "ZMHD_Community_Theme", f39_arg2, "", "" )
			return true
		else
			
		end
	end, function ( f40_arg0, f40_arg1, f40_arg2 )
		if IsDvarValueEqualTo( "ui_enablePromoMenu", true ) then
			CoD.Menu.SetButtonLabel( f40_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	self:addElement( CommunityButton )
	self.CommunityButton = CommunityButton
	
	local BMLogoContracts = CoD.BM_LogoContracts.new( f16_local1, controller )
	BMLogoContracts:setLeftRight( true, false, 32.04, 423.04 )
	BMLogoContracts:setTopBottom( true, false, 5, 126 )
	BMLogoContracts:setScale( 0.95 )
	BMLogoContracts.RecentItems:setText( Engine.Localize( "MPUI_BM_CONTRACTS" ) )
	self:addElement( BMLogoContracts )
	self.BMLogoContracts = BMLogoContracts
	
	WeeklyContractsWidget.navigation = {
		left = DailyContractWidget,
		up = {
			SpecialContractWidget,
			CommunityButton
		},
		right = BlackjackInfo
	}
	BlackjackInfo.navigation = {
		left = WeeklyContractsWidget
	}
	DailyContractWidget.navigation = {
		up = {
			SpecialContractWidget,
			CommunityButton
		},
		right = WeeklyContractsWidget
	}
	SpecialContractWidget.navigation = {
		left = CommunityButton,
		right = BlackjackInfo,
		down = {
			DailyContractWidget,
			WeeklyContractsWidget
		}
	}
	CommunityButton.navigation = {
		right = SpecialContractWidget,
		down = {
			DailyContractWidget,
			WeeklyContractsWidget
		}
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				Screen:completeAnimation()
				self.Screen:setAlpha( 1 )
				self.clipFinished( Screen, {} )
				feFooterContainerNOTLobby:completeAnimation()
				self.feFooterContainerNOTLobby:setAlpha( 1 )
				self.clipFinished( feFooterContainerNOTLobby, {} )
				WeeklyContractsWidget:completeAnimation()
				self.WeeklyContractsWidget:setLeftRight( true, false, 310, 794 )
				self.WeeklyContractsWidget:setTopBottom( true, false, 284.74, 613.74 )
				self.clipFinished( WeeklyContractsWidget, {} )
				DailyContractWidget:completeAnimation()
				self.DailyContractWidget:setLeftRight( true, false, 75, 309 )
				self.DailyContractWidget:setTopBottom( true, false, 284.74, 613.74 )
				self.clipFinished( DailyContractWidget, {} )
				SpecialContractWidget:completeAnimation()
				self.SpecialContractWidget:setLeftRight( true, false, 72, 791 )
				self.SpecialContractWidget:setTopBottom( true, false, 102.74, 281.74 )
				self.clipFinished( SpecialContractWidget, {} )
				CommunityButton:completeAnimation()
				self.CommunityButton:setAlpha( 0 )
				self.clipFinished( CommunityButton, {} )
			end
		},
		CommunityVisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				Screen:completeAnimation()
				self.Screen:setAlpha( 1 )
				self.clipFinished( Screen, {} )
				feFooterContainerNOTLobby:completeAnimation()
				self.feFooterContainerNOTLobby:setAlpha( 1 )
				self.clipFinished( feFooterContainerNOTLobby, {} )
				WeeklyContractsWidget:completeAnimation()
				self.WeeklyContractsWidget:setLeftRight( true, false, 310, 794 )
				self.WeeklyContractsWidget:setTopBottom( true, false, 320.74, 613.74 )
				self.clipFinished( WeeklyContractsWidget, {} )
				DailyContractWidget:completeAnimation()
				self.DailyContractWidget:setLeftRight( true, false, 75, 309 )
				self.DailyContractWidget:setTopBottom( true, false, 320.74, 613.74 )
				self.clipFinished( DailyContractWidget, {} )
				SpecialContractWidget:completeAnimation()
				self.SpecialContractWidget:setLeftRight( true, false, 431, 1150 )
				self.SpecialContractWidget:setTopBottom( true, false, 102.74, 319.74 )
				self.clipFinished( SpecialContractWidget, {} )
				CommunityButton:completeAnimation()
				self.CommunityButton:setAlpha( 1 )
				self.clipFinished( CommunityButton, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "CommunityVisible",
			condition = function ( menu, element, event )
				return IsDvarValueEqualTo( "ui_enablePromoMenu", true )
			end
		}
	} )
	CoD.Menu.AddNavigationHandler( f16_local1, self, controller )
	self:registerEventHandler( "menu_opened", function ( element, event )
		local f44_local0 = nil
		PlayClipOnElement( self, {
			elementName = "SelfIdentityBadge",
			clipName = "Hide"
		}, controller )
		ValidateBlackjackPurchase( controller )
		if not f44_local0 then
			f44_local0 = element:dispatchEventToChildren( event )
		end
		return f44_local0
	end )
	f16_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f45_arg0, f45_arg1, f45_arg2, f45_arg3 )
		GoBack( self, f45_arg2 )
		ClearMenuSavedState( f45_arg1 )
		HandleGoBackFromContracts( self, f45_arg0, f45_arg2, "", f45_arg1 )
		StopMenuTrackedSound( f45_arg1 )
		return true
	end, function ( f46_arg0, f46_arg1, f46_arg2 )
		CoD.Menu.SetButtonLabel( f46_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	feFooterContainerNOTLobby:setModel( self.buttonModel, controller )
	WeeklyContractsWidget.id = "WeeklyContractsWidget"
	BlackjackInfo.id = "BlackjackInfo"
	DailyContractWidget.id = "DailyContractWidget"
	SpecialContractWidget.id = "SpecialContractWidget"
	CommunityButton.id = "CommunityButton"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f16_local1
	} )
	if not self:restoreState() then
		self.CommunityButton:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.SelfIdentityBadge:close()
		element.feFooterContainerNOTLobby:close()
		element.WeeklyContractsWidget:close()
		element.BlackjackInfo:close()
		element.DailyContractWidget:close()
		element.SpecialContractWidget:close()
		element.CommunityButton:close()
		element.BMLogoContracts:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "BM_Contracts.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

