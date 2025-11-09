require( "ui.uieditor.widgets.Promo.Promo_ThermometerAndRewards_Idol" )
require( "ui.uieditor.widgets.Promo.Promo_UnlockableReward" )
require( "ui.uieditor.widgets.Promo.Promo_ThermometerAndRewards_EdgeMarker" )
require( "ui.uieditor.widgets.Promo.Promo_PlusOneText" )
require( "ui.uieditor.widgets.Promo.Promo_ThermometerAndRewards_Complete" )

DataSources.ZMHDPromoRewardList = {
	getModel = function ( f1_arg0 )
		local f1_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "ZMHDPromoRewardList" )
		local f1_local1 = 0
		if IsLive() then
			for f1_local5, f1_local6 in ipairs( Engine.GetBackgroundsForCategoryName( f1_arg0, "default" ) ) do
				if f1_local6.isContractBg and f1_local6.entitlement == "zmhd_tier3" then
					ListHelper_CreateModelsFromTable( Engine.CreateModel( f1_local0, "tier3" ), {
						title = Engine.Localize( f1_local6.description .. "_TITLE" ),
						description = "",
						iconId = f1_local6.id,
						isLocked = f1_local6.isBGLocked,
						isContractBg = f1_local6.isContractBg,
						isPackage = false
					} )
					break
				end
			end
		end
		return f1_local0
	end
}
local PostLoadFunc = function ( self, controller, menu )
	local f2_local0 = {}
	local f2_local1 = {
		self.RewardWidget3
	}
	local f2_local2 = false
	for f2_local7, f2_local8 in ipairs( f2_local1 ) do
		if f2_local8 then
			f2_local8:registerEventHandler( "clip_over", function ( element, event )
				if element.currentState == "Complete" and f2_local2 then
					f2_local2 = false
					Engine.PlaySound( "uin_thm_fill" )
				end
				LUI.UIElement.clipOver( element, event )
			end )
			if f2_local7 <= #CoD.BlackMarketUtility.PromoRewardCompletionValues then
				local f2_local6 = CoD.BlackMarketUtility.PromoRewardCompletionValues[f2_local7]
				table.insert( f2_local0, {
					rewardWidget = f2_local8,
					nearCompleteValue = f2_local6.nearCompleteValue,
					completeValue = f2_local6.completeValue
				} )
			end
		end
	end
	f2_local3 = function ( f4_arg0 )
		for f4_local3, f4_local4 in pairs( f2_local0 ) do
			local f4_local5 = f4_local4.rewardWidget
			if f4_local5 then
				if f4_local4.completeValue <= f4_arg0 then
					if f4_local5.currentState ~= "Complete" then
						f2_local2 = true
						Engine.PlaySound( "uin_thm_goal_reached" )
					end
					f4_local5:setState( "Complete" )
				end
				if f4_local4.nearCompleteValue <= f4_arg0 then
					f4_local5:setState( "NearComplete" )
				else
					f4_local5:setState( "Locked" )
				end
			end
		end
	end
	
	f2_local4 = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	f2_local5 = 0
	if f2_local4 and f2_local4.lastSeenThermometerValue then
		f2_local5 = math.max( math.min( f2_local4.lastSeenThermometerValue:get(), 1 ), 0 )
		f2_local4.lastSeenThermometerValue:set( CoD.GetThermometerProgress() )
	end
	f2_local5 = 0
	local f2_local7, f2_local8, f2_local6, f2_local9 = self.ThermometerAnimation:getLocalTopBottom()
	local f2_local10 = f2_local9 - f2_local6
	local f2_local11, f2_local12, f2_local13, f2_local14 = self.PromoThermometerAndRewardsEdgeMarker:getLocalTopBottom()
	local f2_local15, f2_local16, f2_local17, f2_local18 = self.PromoPlusOneText:getLocalTopBottom()
	local f2_local19, f2_local20, f2_local21, f2_local22 = self.PromoThermometerAndRewardsIdol:getLocalTopBottom()
	local f2_local23 = f2_local14 - f2_local13
	local f2_local24 = f2_local18 - f2_local17
	local f2_local25 = function ( f5_arg0 )
		if f2_local2 then
			return 
		end
		f2_local5 = math.min( CoD.GetThermometerProgress() or 0, f2_local5 + f5_arg0 )
		self.ThermometerAnimation:setShaderVector( 2, 1 - f2_local5, 1, 0, 0 )
		local f5_local0 = f2_local9 - f2_local10 * f2_local5
		self.PromoThermometerAndRewardsEdgeMarker:setTopBottom( f2_local7, f2_local8, f5_local0, f5_local0 + f2_local23 )
		self.PromoThermometerAndRewardsIdol:setTopBottom( f2_local7, f2_local8, f5_local0, f2_local22 )
		f2_local3( f2_local5 )
		if f2_local5 >= CoD.BlackMarketUtility.PromoRewardCompletionValues[#CoD.BlackMarketUtility.PromoRewardCompletionValues].completeValue then
			self.ThermometerComplete:setState( "Completed" )
			self.PromoThermometerAndRewardsIdol:setState( "StopAnimations" )
		end
	end
	
	f2_local25( 0 )
	Engine.PlaySound( "uin_thm_fill" )
	local f2_local26 = menu and menu.id == "Menu.MPAAR"
	self.thermometerAnimTimer = LUI.UITimer.newElementTimer( 16, false, function ( f6_arg0 )
		if (CoD.GetThermometerProgress() or 0) <= f2_local5 then
			if self.thermometerAnimTimer then
				self.thermometerAnimTimer:close()
				self.thermometerAnimTimer = nil
			end
			self.PromoThermometerAndRewardsEdgeMarker:playClip( "LoopAfterIntro" )
			local f6_local0 = f2_local9 - f2_local10 * f2_local5
			self.PromoPlusOneText:setTopBottom( f2_local7, f2_local8, f6_local0, f6_local0 + f2_local24 )
			Engine.StopSound( "uin_thm_fill" )
			if CoD.GetThermometerProgress() >= 1 then
				Engine.PlaySound( "uin_thm_meter_full" )
			else
				if f2_local26 then
					self.PromoPlusOneText:playClip( "PlayAfterIntro" )
				end
				Engine.PlaySound( "uin_thm_pulse" )
			end
			return 
		else
			f2_local25( 0.4 / 60 )
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
	Chip:setLeftRight( true, false, -94.37, 72.38 )
	Chip:setTopBottom( true, false, 362.1, 495.5 )
	Chip:setImage( RegisterImage( "uie_t7_zmhd_community_chip_thermometer" ) )
	self:addElement( Chip )
	self.Chip = Chip
	
	local RewardWidget0 = CoD.Promo_UnlockableReward.new( menu, controller )
	RewardWidget0:setLeftRight( true, false, 106.13, 406.13 )
	RewardWidget0:setTopBottom( true, false, 301, 376 )
	RewardWidget0:setAlpha( 0 )
	RewardWidget0:setScale( 1.45 )
	RewardWidget0.PromoRewardImage.Image:setImage( RegisterImage( "uie_t7_zmhd_community_tier1" ) )
	RewardWidget0.TextBox0:setText( Engine.Localize( "MENU_TIER1_CC" ) )
	self:addElement( RewardWidget0 )
	self.RewardWidget0 = RewardWidget0
	
	local RewardWidget2 = CoD.Promo_UnlockableReward.new( menu, controller )
	RewardWidget2:setLeftRight( true, false, 106.13, 406.13 )
	RewardWidget2:setTopBottom( true, false, 104.69, 179.69 )
	RewardWidget2:setAlpha( 0 )
	RewardWidget2:setScale( 1.45 )
	RewardWidget2.TextBox0:setText( Engine.Localize( "MENU_TIER3_CC" ) )
	RewardWidget2:linkToElementModel( self, "tier3", false, function ( model )
		RewardWidget2:setModel( model, controller )
	end )
	RewardWidget2:linkToElementModel( self, "tier3", false, function ( model )
		RewardWidget2.PromoRewardImage.CallingCardsFrameWidget:setModel( model, controller )
	end )
	self:addElement( RewardWidget2 )
	self.RewardWidget2 = RewardWidget2
	
	local RewardWidget3 = CoD.Promo_UnlockableReward.new( menu, controller )
	RewardWidget3:setLeftRight( true, false, 106.13, 406.13 )
	RewardWidget3:setTopBottom( true, false, 6.69, 81.69 )
	RewardWidget3:setScale( 1.45 )
	RewardWidget3.PromoRewardImage.Image:setImage( RegisterImage( "uie_t7_zmhd_community_cosmic_camo_tier4" ) )
	RewardWidget3.TextBox0:setText( Engine.Localize( "MENU_TIER4_PAP_CAMO" ) )
	self:addElement( RewardWidget3 )
	self.RewardWidget3 = RewardWidget3
	
	local RewardWidget1 = CoD.Promo_UnlockableReward.new( menu, controller )
	RewardWidget1:setLeftRight( true, false, 106.13, 406.13 )
	RewardWidget1:setTopBottom( true, false, 202.69, 277.69 )
	RewardWidget1:setAlpha( 0 )
	RewardWidget1:setScale( 1.45 )
	RewardWidget1.PromoRewardImage.Image:setImage( RegisterImage( "uie_t7_zmhd_community_tier2" ) )
	RewardWidget1.TextBox0:setText( Engine.Localize( "MENU_TIER2_CC" ) )
	self:addElement( RewardWidget1 )
	self.RewardWidget1 = RewardWidget1
	
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
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				PromoThermometerAndRewardsIdol:completeAnimation()
				self.PromoThermometerAndRewardsIdol:setAlpha( 1 )
				self.clipFinished( PromoThermometerAndRewardsIdol, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.PromoThermometerAndRewardsIdol:close()
		element.RewardWidget0:close()
		element.RewardWidget2:close()
		element.RewardWidget3:close()
		element.RewardWidget1:close()
		element.PromoThermometerAndRewardsEdgeMarker:close()
		element.PromoPlusOneText:close()
		element.ThermometerComplete:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

