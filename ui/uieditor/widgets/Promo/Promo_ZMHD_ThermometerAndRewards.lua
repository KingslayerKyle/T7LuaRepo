-- 54652dff51e049ee55a2a2a07f84384c
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Promo.Promo_ThermometerAndRewards_Idol" )
require( "ui.uieditor.widgets.Promo.Promo_UnlockableReward" )
require( "ui.uieditor.widgets.Promo.Promo_UnlockableRewardLargeLock" )
require( "ui.uieditor.widgets.Promo.Promo_ThermometerAndRewards_EdgeMarker" )
require( "ui.uieditor.widgets.Promo.Promo_PlusOneText" )
require( "ui.uieditor.widgets.Promo.Promo_ThermometerAndRewards_Complete" )
require( "ui.uieditor.widgets.BlackMarket.BM_TopNavBtn" )
require( "ui.uieditor.widgets.CAC.cac_PurchasingExtraSlots" )

local PostLoadFunc = function ( self, controller, menu )
	self:setForceMouseEventDispatch( true )
	local f1_local0 = {}
	local f1_local1 = {
		self.RewardWidget0,
		self.RewardWidget1,
		self.RewardWidget2,
		self.RewardWidget3
	}
	local f1_local2 = {
		self.RedeemBtn0,
		self.RedeemBtn1,
		self.RedeemBtn2,
		self.RedeemBtn3
	}
	local f1_local3 = {
		CoD.BlackMarketUtility.mar2018_challenge_sentinel_tier1,
		CoD.BlackMarketUtility.mar2018_challenge_sentinel_tier2,
		CoD.BlackMarketUtility.mar2018_challenge_sentinel_tier3,
		CoD.BlackMarketUtility.mar2018_challenge_sentinel_tier4
	}
	MakeNotFocusable( self.RedeemBtn0 )
	MakeNotFocusable( self.RedeemBtn1 )
	MakeNotFocusable( self.RedeemBtn2 )
	MakeNotFocusable( self.RedeemBtn3 )
	local f1_local4 = false
	for f1_local9, f1_local10 in ipairs( f1_local1 ) do
		if f1_local10 then
			f1_local10:registerEventHandler( "clip_over", function ( element, event )
				if element.currentState == "Complete" and f1_local4 then
					f1_local4 = false
					Engine.PlaySound( "uin_thm_fill" )
				end
				LUI.UIElement.clipOver( element, event )
			end )
			if f1_local9 <= #CoD.BlackMarketUtility.PromoRewardCompletionValues then
				local f1_local8 = CoD.BlackMarketUtility.PromoRewardCompletionValues[f1_local9]
				table.insert( f1_local0, {
					rewardWidget = f1_local10,
					nearCompleteValue = f1_local8.nearCompleteValue,
					completeValue = f1_local8.completeValue,
					rewardWidgetIndex = f1_local9
				} )
			end
		end
	end
	CoD.RewardRedeemBtnInfoList = {}
	for f1_local9, f1_local10 in ipairs( f1_local2 ) do
		table.insert( CoD.RewardRedeemBtnInfoList, {
			redeemBtn = f1_local10,
			isFocus = false
		} )
	end
	f1_local5 = function ( f3_arg0 )
		for f3_local4, f3_local5 in pairs( f1_local0 ) do
			local f3_local6 = f3_local5.rewardWidget
			if f3_local6 then
				local f3_local3 = CoD.RewardRedeemBtnInfoList[f3_local5.rewardWidgetIndex]
				if f3_local5.completeValue <= f3_arg0 then
					if f3_local6.currentState ~= "Complete" then
						f1_local4 = true
						Engine.PlaySound( "uin_thm_goal_reached" )
						if Engine.GetInventoryItemQuantity( controller, f1_local3[f3_local5.rewardWidgetIndex] ) == 0 and f3_local5.rewardWidgetIndex ~= 1 and f3_local3 then
							f3_local3.redeemBtn:makeFocusableWithoutResettingNavigation()
							f3_local3.redeemBtn:setAlpha( 1 )
						end
					end
					f3_local6:setState( "Complete" )
				end
				if f3_local5.nearCompleteValue <= f3_arg0 then
					f3_local6:setState( "NearComplete" )
				else
					f3_local6:setState( "Locked" )
				end
			end
		end
	end
	
	f1_local6 = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	f1_local7 = 0
	if f1_local6 and f1_local6.lastSeenThermometerValue then
		f1_local7 = math.max( math.min( f1_local6.lastSeenThermometerValue:get(), 1 ), 0 )
		f1_local6.lastSeenThermometerValue:set( CoD.GetThermometerProgress() )
	end
	f1_local7 = 0
	local f1_local9, f1_local10, f1_local8, f1_local11 = self.ThermometerAnimation:getLocalTopBottom()
	local f1_local12 = f1_local11 - f1_local8
	local f1_local13, f1_local14, f1_local15, f1_local16 = self.PromoThermometerAndRewardsEdgeMarker:getLocalTopBottom()
	local f1_local17, f1_local18, f1_local19, f1_local20 = self.PromoPlusOneText:getLocalTopBottom()
	local f1_local21, f1_local22, f1_local23, f1_local24 = self.PromoThermometerAndRewardsIdol:getLocalTopBottom()
	local f1_local25 = f1_local16 - f1_local15
	local f1_local26 = f1_local20 - f1_local19
	local f1_local27 = function ( f4_arg0 )
		if f1_local4 then
			return 
		end
		f1_local7 = math.min( CoD.GetThermometerProgress() or 0, f1_local7 + f4_arg0 )
		self.ThermometerAnimation:setShaderVector( 2, 1 - f1_local7, 1, 0, 0 )
		local f4_local0 = f1_local11 - f1_local12 * f1_local7
		self.PromoThermometerAndRewardsEdgeMarker:setTopBottom( f1_local9, f1_local10, f4_local0, f4_local0 + f1_local25 )
		self.PromoThermometerAndRewardsIdol:setTopBottom( f1_local9, f1_local10, f4_local0, f1_local24 )
		f1_local5( f1_local7 )
		if f1_local7 >= CoD.BlackMarketUtility.PromoRewardCompletionValues[#CoD.BlackMarketUtility.PromoRewardCompletionValues].completeValue then
			self.ThermometerComplete:setState( "Completed" )
			self.PromoThermometerAndRewardsIdol:setState( "StopAnimations" )
		end
	end
	
	f1_local27( 0 )
	Engine.PlaySound( "uin_thm_fill" )
	local f1_local28 = menu and menu.id == "Menu.MPAAR"
	self.thermometerAnimTimer = LUI.UITimer.newElementTimer( 16, false, function ( f5_arg0 )
		self:setState( "Animating" )
		if f1_local7 >= (CoD.GetThermometerProgress() or 0) then
			if self.thermometerAnimTimer then
				self.thermometerAnimTimer:close()
				self.thermometerAnimTimer = nil
				self:setState( "DefaultState" )
				CoD.TurnOnRedeemBtnFocus()
			end
			self.PromoThermometerAndRewardsEdgeMarker:playClip( "LoopAfterIntro" )
			local f5_local0 = f1_local11 - f1_local12 * f1_local7
			self.PromoPlusOneText:setTopBottom( f1_local9, f1_local10, f5_local0, f5_local0 + f1_local26 )
			Engine.StopSound( "uin_thm_fill" )
			if CoD.GetThermometerProgress() >= 1 then
				Engine.PlaySound( "uin_thm_meter_full" )
			else
				if f1_local28 then
					self.PromoPlusOneText:playClip( "PlayAfterIntro" )
				end
				Engine.PlaySound( "uin_thm_pulse" )
			end
			return 
		else
			f1_local27( 0.4 / 60 )
		end
	end )
	self:addElement( self.thermometerAnimTimer )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		if element.thermometerAnimTimer then
			element.thermometerAnimTimer:close()
			element.thermometerAnimTimer = nil
		end
	end )
end

CoD.Promo_ZMHD_ThermometerAndRewards = InheritFrom( LUI.UIElement )
CoD.Promo_ZMHD_ThermometerAndRewards.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Promo_ZMHD_ThermometerAndRewards )
	self.id = "Promo_ZMHD_ThermometerAndRewards"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 348 )
	self:setTopBottom( true, false, 0, 438 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local PromoThermometerAndRewardsIdol = CoD.Promo_ThermometerAndRewards_Idol.new( menu, controller )
	PromoThermometerAndRewardsIdol:setLeftRight( true, false, -130.75, 111.76 )
	PromoThermometerAndRewardsIdol:setTopBottom( true, false, -60.67, 533.6 )
	self:addElement( PromoThermometerAndRewardsIdol )
	self.PromoThermometerAndRewardsIdol = PromoThermometerAndRewardsIdol
	
	local LargeGlow = LUI.UIImage.new()
	LargeGlow:setLeftRight( true, false, -11.99, 553.67 )
	LargeGlow:setTopBottom( true, false, -60.67, 142.19 )
	LargeGlow:setImage( RegisterImage( "uie_t7_blackmarket_promo_meter_glowlarge" ) )
	self:addElement( LargeGlow )
	self.LargeGlow = LargeGlow
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( true, false, -31.47, 6.48 )
	Glow:setTopBottom( true, false, 357, 422.94 )
	Glow:setImage( RegisterImage( "uie_t7_blackmarket_promo_meter_lineglow" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local ThermometerBacking = LUI.UIImage.new()
	ThermometerBacking:setLeftRight( true, false, -115.37, 96.38 )
	ThermometerBacking:setTopBottom( true, false, -60.67, 504 )
	ThermometerBacking:setImage( RegisterImage( "uie_t7_blackmarket_promo_meter_mainbar" ) )
	self:addElement( ThermometerBacking )
	self.ThermometerBacking = ThermometerBacking
	
	local ThermometerAnimation = LUI.UIImage.new()
	ThermometerAnimation:setLeftRight( true, false, -39.43, 14.45 )
	ThermometerAnimation:setTopBottom( true, false, -2, 384.64 )
	ThermometerAnimation:setImage( RegisterImage( "uie_t7_blackmarket_promo_meter_fillbar" ) )
	ThermometerAnimation:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta" ) )
	ThermometerAnimation:setShaderVector( 0, 0, 1, 0, 0 )
	ThermometerAnimation:setShaderVector( 1, 0, 0, 0, 0 )
	ThermometerAnimation:setShaderVector( 2, 0, 1, 0, 0 )
	ThermometerAnimation:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( ThermometerAnimation )
	self.ThermometerAnimation = ThermometerAnimation
	
	local Chip = LUI.UIImage.new()
	Chip:setLeftRight( true, false, -95.37, 71.38 )
	Chip:setTopBottom( true, false, 373.1, 506.5 )
	Chip:setImage( RegisterImage( "uie_t7_menu_community_bgb_chip" ) )
	self:addElement( Chip )
	self.Chip = Chip
	
	local RewardWidget0Off = CoD.Promo_UnlockableReward.new( menu, controller )
	RewardWidget0Off:setLeftRight( true, false, 106.13, 406.13 )
	RewardWidget0Off:setTopBottom( true, false, 301, 376 )
	RewardWidget0Off:setAlpha( 0 )
	RewardWidget0Off:setScale( 1.45 )
	RewardWidget0Off.PromoRewardImage.Image:setImage( RegisterImage( "uie_t7_menu_community_bgb_tier01" ) )
	RewardWidget0Off.Lock:setImage( RegisterImage( "uie_t7_menu_community_bgb_locked" ) )
	RewardWidget0Off.TextBox0:setText( Engine.Localize( "MPUI_RARE_SUPPLY_DROP_BUNDLE" ) )
	self:addElement( RewardWidget0Off )
	self.RewardWidget0Off = RewardWidget0Off
	
	local RewardWidget0 = CoD.Promo_UnlockableRewardLargeLock.new( menu, controller )
	RewardWidget0:setLeftRight( true, false, 106.13, 406.13 )
	RewardWidget0:setTopBottom( true, false, 301, 376 )
	RewardWidget0:setScale( 1.45 )
	RewardWidget0.PromoRewardImage.Image:setImage( RegisterImage( "uie_t7_menu_community_bgb_tier01" ) )
	RewardWidget0.TextBox0:setText( Engine.Localize( "CONTRACT_BGB_CC_TIER1" ) )
	self:addElement( RewardWidget0 )
	self.RewardWidget0 = RewardWidget0
	
	local RewardWidget1Off = CoD.Promo_UnlockableReward.new( menu, controller )
	RewardWidget1Off:setLeftRight( true, false, 106.13, 406.13 )
	RewardWidget1Off:setTopBottom( true, false, 202.69, 277.69 )
	RewardWidget1Off:setAlpha( 0 )
	RewardWidget1Off:setScale( 1.45 )
	RewardWidget1Off.PromoRewardImage.Image:setImage( RegisterImage( "uie_t7_menu_community_bgb_tier02" ) )
	RewardWidget1Off.Lock:setImage( RegisterImage( "uie_t7_menu_community_bgb_locked" ) )
	RewardWidget1Off.TextBox0:setText( Engine.Localize( "MPUI_RARE_SUPPLY_DROP_BUNDLE" ) )
	self:addElement( RewardWidget1Off )
	self.RewardWidget1Off = RewardWidget1Off
	
	local RewardWidget1 = CoD.Promo_UnlockableRewardLargeLock.new( menu, controller )
	RewardWidget1:setLeftRight( true, false, 106.13, 406.13 )
	RewardWidget1:setTopBottom( true, false, 202.69, 277.69 )
	RewardWidget1:setScale( 1.45 )
	RewardWidget1.PromoRewardImage.Image:setImage( RegisterImage( "uie_t7_menu_community_bgb_tier02" ) )
	RewardWidget1.TextBox0:setText( Engine.Localize( "CONTRACT_BGB_CC_TIER2" ) )
	self:addElement( RewardWidget1 )
	self.RewardWidget1 = RewardWidget1
	
	local RewardWidget2Off = CoD.Promo_UnlockableReward.new( menu, controller )
	RewardWidget2Off:setLeftRight( true, false, 106.13, 406.13 )
	RewardWidget2Off:setTopBottom( true, false, 104.69, 179.69 )
	RewardWidget2Off:setAlpha( 0 )
	RewardWidget2Off:setScale( 1.45 )
	RewardWidget2Off.PromoRewardImage.Image:setImage( RegisterImage( "uie_t7_menu_community_bgb_tier03" ) )
	RewardWidget2Off.TextBox0:setText( Engine.Localize( "MPUI_BM_BRIBE_MELEE_WEAPON" ) )
	self:addElement( RewardWidget2Off )
	self.RewardWidget2Off = RewardWidget2Off
	
	local RewardWidget2 = CoD.Promo_UnlockableRewardLargeLock.new( menu, controller )
	RewardWidget2:setLeftRight( true, false, 106.13, 406.13 )
	RewardWidget2:setTopBottom( true, false, 104.69, 179.69 )
	RewardWidget2:setScale( 1.45 )
	RewardWidget2.PromoRewardImage.Image:setImage( RegisterImage( "uie_t7_menu_community_bgb_tier03" ) )
	RewardWidget2.TextBox0:setText( Engine.Localize( "CONTRACT_BGB_CC_TIER3" ) )
	self:addElement( RewardWidget2 )
	self.RewardWidget2 = RewardWidget2
	
	local RewardWidget3 = CoD.Promo_UnlockableReward.new( menu, controller )
	RewardWidget3:setLeftRight( true, false, 106.13, 406.13 )
	RewardWidget3:setTopBottom( true, false, 6.69, 81.69 )
	RewardWidget3:setScale( 1.45 )
	RewardWidget3.PromoRewardImage.Image:setImage( RegisterImage( "uie_t7_menu_community_bgb_tier04" ) )
	RewardWidget3.TextBox0:setText( Engine.Localize( "CONTRACT_BGB_CC_TIER4" ) )
	self:addElement( RewardWidget3 )
	self.RewardWidget3 = RewardWidget3
	
	local RewardWidget3Off = CoD.Promo_UnlockableRewardLargeLock.new( menu, controller )
	RewardWidget3Off:setLeftRight( true, false, 106.13, 406.13 )
	RewardWidget3Off:setTopBottom( true, false, 6.69, 81.69 )
	RewardWidget3Off:setAlpha( 0 )
	RewardWidget3Off:setScale( 1.45 )
	RewardWidget3Off.PromoRewardImage.Image:setImage( RegisterImage( "uie_t7_menu_community_bgb_tier04" ) )
	RewardWidget3Off.TextBox0:setText( Engine.Localize( "CONTRACT_BGB_CC_TIER4" ) )
	self:addElement( RewardWidget3Off )
	self.RewardWidget3Off = RewardWidget3Off
	
	local PromoThermometerAndRewardsEdgeMarker = CoD.Promo_ThermometerAndRewards_EdgeMarker.new( menu, controller )
	PromoThermometerAndRewardsEdgeMarker:setLeftRight( true, false, -61.81, 39.82 )
	PromoThermometerAndRewardsEdgeMarker:setTopBottom( true, false, -15.75, 34.25 )
	self:addElement( PromoThermometerAndRewardsEdgeMarker )
	self.PromoThermometerAndRewardsEdgeMarker = PromoThermometerAndRewardsEdgeMarker
	
	local PromoPlusOneText = CoD.Promo_PlusOneText.new( menu, controller )
	PromoPlusOneText:setLeftRight( true, false, -21.49, -3.49 )
	PromoPlusOneText:setTopBottom( true, false, -40.75, -15.75 )
	self:addElement( PromoPlusOneText )
	self.PromoPlusOneText = PromoPlusOneText
	
	local GlowDots = LUI.UIImage.new()
	GlowDots:setLeftRight( true, false, -55.49, 29.6 )
	GlowDots:setTopBottom( true, false, 360.64, 391.36 )
	GlowDots:setAlpha( 0.35 )
	GlowDots:setImage( RegisterImage( "uie_t7_blackmarket_promo_meter_glowpulse4" ) )
	GlowDots:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowDots )
	self.GlowDots = GlowDots
	
	local GlowDots2 = LUI.UIImage.new()
	GlowDots2:setLeftRight( true, false, -55.49, 32.51 )
	GlowDots2:setTopBottom( true, false, 283.32, 299.32 )
	GlowDots2:setAlpha( 0.35 )
	GlowDots2:setImage( RegisterImage( "uie_t7_blackmarket_promo_meter_glowpulse5" ) )
	GlowDots2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowDots2 )
	self.GlowDots2 = GlowDots2
	
	local GlowDots3 = LUI.UIImage.new()
	GlowDots3:setLeftRight( true, false, -55.49, 32.51 )
	GlowDots3:setTopBottom( true, false, 186.32, 202.32 )
	GlowDots3:setAlpha( 0.35 )
	GlowDots3:setImage( RegisterImage( "uie_t7_blackmarket_promo_meter_glowpulse5" ) )
	GlowDots3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowDots3 )
	self.GlowDots3 = GlowDots3
	
	local GlowDots4 = LUI.UIImage.new()
	GlowDots4:setLeftRight( true, false, -55.49, 32.51 )
	GlowDots4:setTopBottom( true, false, 88.32, 104.32 )
	GlowDots4:setAlpha( 0.35 )
	GlowDots4:setImage( RegisterImage( "uie_t7_blackmarket_promo_meter_glowpulse5" ) )
	GlowDots4:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowDots4 )
	self.GlowDots4 = GlowDots4
	
	local GlowDots5 = LUI.UIImage.new()
	GlowDots5:setLeftRight( true, false, -55.49, 32.51 )
	GlowDots5:setTopBottom( true, false, -8.68, 6.69 )
	GlowDots5:setAlpha( 0.35 )
	GlowDots5:setImage( RegisterImage( "uie_t7_blackmarket_promo_meter_glowpulse5" ) )
	GlowDots5:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowDots5 )
	self.GlowDots5 = GlowDots5
	
	local ThermometerComplete = CoD.Promo_ThermometerAndRewards_Complete.new( menu, controller )
	ThermometerComplete:setLeftRight( true, false, -130.99, 112.01 )
	ThermometerComplete:setTopBottom( true, false, -60.67, 533.33 )
	self:addElement( ThermometerComplete )
	self.ThermometerComplete = ThermometerComplete
	
	local RedeemBtn0 = CoD.BM_TopNavBtn.new( menu, controller )
	RedeemBtn0:setLeftRight( true, false, -146.47, -31.47 )
	RedeemBtn0:setTopBottom( true, false, 318, 359 )
	RedeemBtn0:setAlpha( 0 )
	RedeemBtn0.btnDisplayTextStroke0:setText( Engine.Localize( "CONTRACT_COMMUNITY_CONTRACT_CLAIM_REWARD" ) )
	RedeemBtn0.btnDisplayTextStroke:setText( Engine.Localize( "CONTRACT_COMMUNITY_CONTRACT_CLAIM_REWARD" ) )
	RedeemBtn0:registerEventHandler( "gain_focus", function ( element, event )
		local f8_local0 = nil
		if element.gainFocus then
			f8_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f8_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f8_local0
	end )
	RedeemBtn0:registerEventHandler( "lose_focus", function ( element, event )
		local f9_local0 = nil
		if element.loseFocus then
			f9_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f9_local0 = element.super:loseFocus( event )
		end
		return f9_local0
	end )
	menu:AddButtonCallbackFunction( RedeemBtn0, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f10_arg0, f10_arg1, f10_arg2, f10_arg3 )
		if IsSelfInState( self, "DefaultState" ) then
			RedeemRewardAction( self, f10_arg2, f10_arg1, "1" )
			return true
		else
			
		end
	end, function ( f11_arg0, f11_arg1, f11_arg2 )
		if IsSelfInState( self, "DefaultState" ) then
			CoD.Menu.SetButtonLabel( f11_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	self:addElement( RedeemBtn0 )
	self.RedeemBtn0 = RedeemBtn0
	
	local RedeemBtn1 = CoD.BM_TopNavBtn.new( menu, controller )
	RedeemBtn1:setLeftRight( true, false, -146.47, -31.47 )
	RedeemBtn1:setTopBottom( true, false, 219.69, 260.69 )
	RedeemBtn1:setAlpha( 0 )
	RedeemBtn1.btnDisplayTextStroke0:setText( Engine.Localize( "CONTRACT_COMMUNITY_CONTRACT_CLAIM_REWARD" ) )
	RedeemBtn1.btnDisplayTextStroke:setText( Engine.Localize( "CONTRACT_COMMUNITY_CONTRACT_CLAIM_REWARD" ) )
	RedeemBtn1:registerEventHandler( "gain_focus", function ( element, event )
		local f12_local0 = nil
		if element.gainFocus then
			f12_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f12_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f12_local0
	end )
	RedeemBtn1:registerEventHandler( "lose_focus", function ( element, event )
		local f13_local0 = nil
		if element.loseFocus then
			f13_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f13_local0 = element.super:loseFocus( event )
		end
		return f13_local0
	end )
	menu:AddButtonCallbackFunction( RedeemBtn1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f14_arg0, f14_arg1, f14_arg2, f14_arg3 )
		if IsSelfInState( self, "DefaultState" ) then
			RedeemRewardAction( self, f14_arg2, f14_arg1, "2" )
			return true
		else
			
		end
	end, function ( f15_arg0, f15_arg1, f15_arg2 )
		if IsSelfInState( self, "DefaultState" ) then
			CoD.Menu.SetButtonLabel( f15_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	self:addElement( RedeemBtn1 )
	self.RedeemBtn1 = RedeemBtn1
	
	local RedeemBtn2 = CoD.BM_TopNavBtn.new( menu, controller )
	RedeemBtn2:setLeftRight( true, false, -146.47, -31.47 )
	RedeemBtn2:setTopBottom( true, false, 121.69, 162.69 )
	RedeemBtn2:setAlpha( 0 )
	RedeemBtn2.btnDisplayTextStroke0:setText( Engine.Localize( "CONTRACT_COMMUNITY_CONTRACT_CLAIM_REWARD" ) )
	RedeemBtn2.btnDisplayTextStroke:setText( Engine.Localize( "CONTRACT_COMMUNITY_CONTRACT_CLAIM_REWARD" ) )
	RedeemBtn2:registerEventHandler( "gain_focus", function ( element, event )
		local f16_local0 = nil
		if element.gainFocus then
			f16_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f16_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f16_local0
	end )
	RedeemBtn2:registerEventHandler( "lose_focus", function ( element, event )
		local f17_local0 = nil
		if element.loseFocus then
			f17_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f17_local0 = element.super:loseFocus( event )
		end
		return f17_local0
	end )
	menu:AddButtonCallbackFunction( RedeemBtn2, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f18_arg0, f18_arg1, f18_arg2, f18_arg3 )
		if IsSelfInState( self, "DefaultState" ) then
			RedeemRewardAction( self, f18_arg2, f18_arg1, "3" )
			return true
		else
			
		end
	end, function ( f19_arg0, f19_arg1, f19_arg2 )
		if IsSelfInState( self, "DefaultState" ) then
			CoD.Menu.SetButtonLabel( f19_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	self:addElement( RedeemBtn2 )
	self.RedeemBtn2 = RedeemBtn2
	
	local RedeemBtn3 = CoD.BM_TopNavBtn.new( menu, controller )
	RedeemBtn3:setLeftRight( true, false, -146.47, -31.47 )
	RedeemBtn3:setTopBottom( true, false, 23.69, 64.69 )
	RedeemBtn3:setAlpha( 0 )
	RedeemBtn3.btnDisplayTextStroke0:setText( Engine.Localize( "CONTRACT_COMMUNITY_CONTRACT_CLAIM_REWARD" ) )
	RedeemBtn3.btnDisplayTextStroke:setText( Engine.Localize( "CONTRACT_COMMUNITY_CONTRACT_CLAIM_REWARD" ) )
	RedeemBtn3:registerEventHandler( "gain_focus", function ( element, event )
		local f20_local0 = nil
		if element.gainFocus then
			f20_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f20_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f20_local0
	end )
	RedeemBtn3:registerEventHandler( "lose_focus", function ( element, event )
		local f21_local0 = nil
		if element.loseFocus then
			f21_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f21_local0 = element.super:loseFocus( event )
		end
		return f21_local0
	end )
	menu:AddButtonCallbackFunction( RedeemBtn3, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f22_arg0, f22_arg1, f22_arg2, f22_arg3 )
		if IsSelfInState( self, "DefaultState" ) then
			RedeemRewardAction( self, f22_arg2, f22_arg1, "4" )
			return true
		else
			
		end
	end, function ( f23_arg0, f23_arg1, f23_arg2 )
		if IsSelfInState( self, "DefaultState" ) then
			CoD.Menu.SetButtonLabel( f23_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	self:addElement( RedeemBtn3 )
	self.RedeemBtn3 = RedeemBtn3
	
	local ProcessingWidget = CoD.cac_PurchasingExtraSlots.new( menu, controller )
	ProcessingWidget:setLeftRight( true, false, -345.43, -39.43 )
	ProcessingWidget:setTopBottom( true, false, 146.32, 242.32 )
	ProcessingWidget.PurchasingText:setText( Engine.Localize( "MENU_PROCESSING_PURCHASE" ) )
	self:addElement( ProcessingWidget )
	self.ProcessingWidget = ProcessingWidget
	
	RedeemBtn0.navigation = {
		up = RedeemBtn1
	}
	RedeemBtn1.navigation = {
		up = RedeemBtn2,
		down = RedeemBtn0
	}
	RedeemBtn2.navigation = {
		up = RedeemBtn3,
		down = RedeemBtn1
	}
	RedeemBtn3.navigation = {
		down = RedeemBtn2
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				PromoThermometerAndRewardsIdol:completeAnimation()
				self.PromoThermometerAndRewardsIdol:setAlpha( 1 )
				self.clipFinished( PromoThermometerAndRewardsIdol, {} )
				ProcessingWidget:completeAnimation()
				self.ProcessingWidget:setAlpha( 0 )
				self.clipFinished( ProcessingWidget, {} )
			end
		},
		Purchasing = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				ProcessingWidget:completeAnimation()
				self.ProcessingWidget:setAlpha( 1 )
				self.clipFinished( ProcessingWidget, {} )
			end
		},
		Animating = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				ProcessingWidget:completeAnimation()
				self.ProcessingWidget:setAlpha( 0 )
				self.clipFinished( ProcessingWidget, {} )
			end
		}
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	RedeemBtn0.id = "RedeemBtn0"
	RedeemBtn1.id = "RedeemBtn1"
	RedeemBtn2.id = "RedeemBtn2"
	RedeemBtn3.id = "RedeemBtn3"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.RedeemBtn0:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.PromoThermometerAndRewardsIdol:close()
		element.RewardWidget0Off:close()
		element.RewardWidget0:close()
		element.RewardWidget1Off:close()
		element.RewardWidget1:close()
		element.RewardWidget2Off:close()
		element.RewardWidget2:close()
		element.RewardWidget3:close()
		element.RewardWidget3Off:close()
		element.PromoThermometerAndRewardsEdgeMarker:close()
		element.PromoPlusOneText:close()
		element.ThermometerComplete:close()
		element.RedeemBtn0:close()
		element.RedeemBtn1:close()
		element.RedeemBtn2:close()
		element.RedeemBtn3:close()
		element.ProcessingWidget:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

