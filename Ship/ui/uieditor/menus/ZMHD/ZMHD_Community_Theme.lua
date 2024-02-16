-- 7154d69ff95ef313cf5029b24be6be75
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.playercard.SelfIdentityBadge" )
require( "ui.uieditor.widgets.Footer.fe_FooterContainer_NOTLobby" )
require( "ui.uieditor.widgets.Promo.Promo_ZMHD_CommunityWidget" )
require( "ui.uieditor.widgets.Promo.Promo_ZMDH_HeaderWidget" )

LUI.createMenu.ZMHD_Community_Theme = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "ZMHD_Community_Theme" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "Blackmarket_extra"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "ZMHD_Community_Theme.buttonPrompts" )
	local f1_local1 = self
	self.anyChildUsesUpdateState = true
	
	local Screen = LUI.UIImage.new()
	Screen:setLeftRight( true, true, 0, 0 )
	Screen:setTopBottom( true, true, 0, 0 )
	Screen:setImage( RegisterImage( "uie_t7_blackmarket_contracts_bg_1080" ) )
	self:addElement( Screen )
	self.Screen = Screen
	
	local BG = LUI.UIImage.new()
	BG:setLeftRight( true, true, 0, 0 )
	BG:setTopBottom( true, true, 0, 0 )
	BG:setImage( RegisterImage( "uie_t7_zmhd_community_theme_bg_1080" ) )
	self:addElement( BG )
	self.BG = BG
	
	local SelfIdentityBadge = CoD.SelfIdentityBadge.new( f1_local1, controller )
	SelfIdentityBadge:setLeftRight( false, true, -453, -110 )
	SelfIdentityBadge:setTopBottom( true, false, 15, 75 )
	SelfIdentityBadge:setAlpha( 0 )
	SelfIdentityBadge:subscribeToGlobalModel( controller, "PerController", "identityBadge", function ( model )
		SelfIdentityBadge:setModel( model, controller )
	end )
	SelfIdentityBadge:subscribeToGlobalModel( controller, "PerController", nil, function ( model )
		SelfIdentityBadge.CallingCard.CallingCardsFrameWidget:setModel( model, controller )
	end )
	self:addElement( SelfIdentityBadge )
	self.SelfIdentityBadge = SelfIdentityBadge
	
	local feFooterContainerNOTLobby = CoD.fe_FooterContainer_NOTLobby.new( f1_local1, controller )
	feFooterContainerNOTLobby:setLeftRight( true, true, 1, -1 )
	feFooterContainerNOTLobby:setTopBottom( false, true, -67, 0 )
	feFooterContainerNOTLobby:registerEventHandler( "menu_opened", function ( element, event )
		local f4_local0 = nil
		SizeToSafeArea( element, controller )
		if not f4_local0 then
			f4_local0 = element:dispatchEventToChildren( event )
		end
		return f4_local0
	end )
	self:addElement( feFooterContainerNOTLobby )
	self.feFooterContainerNOTLobby = feFooterContainerNOTLobby
	
	local GlowMeter = LUI.UIImage.new()
	GlowMeter:setLeftRight( true, false, 538.06, 1060.68 )
	GlowMeter:setTopBottom( true, false, 430, 876 )
	GlowMeter:setAlpha( 0.5 )
	GlowMeter:setImage( RegisterImage( "uie_t7_blackmarket_promo_meter_glowmeter" ) )
	self:addElement( GlowMeter )
	self.GlowMeter = GlowMeter
	
	local PromoZMHDCommunityWidget = CoD.Promo_ZMHD_CommunityWidget.new( f1_local1, controller )
	PromoZMHDCommunityWidget:setLeftRight( true, false, -6, 1274 )
	PromoZMHDCommunityWidget:setTopBottom( true, false, 89, 639 )
	PromoZMHDCommunityWidget.TitleAndDesc.title:setRGB( 0.93, 0.93, 0.6 )
	PromoZMHDCommunityWidget.TitleAndDesc.title:setText( LocalizeToUpperString( "CONTRACT_BGB_CC_TITLE" ) )
	PromoZMHDCommunityWidget.TitleAndDesc.txtDescription:setRGB( 0.93, 0.93, 0.6 )
	PromoZMHDCommunityWidget.TitleAndDesc.txtDescription:setText( Engine.Localize( "CONTRACT_BGB_CC_DESC" ) )
	self:addElement( PromoZMHDCommunityWidget )
	self.PromoZMHDCommunityWidget = PromoZMHDCommunityWidget
	
	local PromoZMDHHeaderWidget0 = CoD.Promo_ZMDH_HeaderWidget.new( f1_local1, controller )
	PromoZMDHHeaderWidget0:setLeftRight( true, false, 34.35, 569.35 )
	PromoZMDHHeaderWidget0:setTopBottom( true, false, 6, 127 )
	PromoZMDHHeaderWidget0.RecentItems:setText( Engine.Localize( "CONTRACT_COMMUNITY_MENU_TITLE" ) )
	self:addElement( PromoZMDHHeaderWidget0 )
	self.PromoZMDHHeaderWidget0 = PromoZMDHHeaderWidget0
	
	f1_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f5_arg0, f5_arg1, f5_arg2, f5_arg3 )
		GoBack( self, f5_arg2 )
		HandleGoBackFromPromo( self, f5_arg0, f5_arg2, "", f5_arg1 )
		return true
	end, function ( f6_arg0, f6_arg1, f6_arg2 )
		CoD.Menu.SetButtonLabel( f6_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	feFooterContainerNOTLobby:setModel( self.buttonModel, controller )
	PromoZMHDCommunityWidget.id = "PromoZMHDCommunityWidget"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f1_local1
	} )
	if not self:restoreState() then
		self.PromoZMHDCommunityWidget:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.SelfIdentityBadge:close()
		element.feFooterContainerNOTLobby:close()
		element.PromoZMHDCommunityWidget:close()
		element.PromoZMDHHeaderWidget0:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "ZMHD_Community_Theme.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

