require( "ui.uieditor.widgets.playercard.SelfIdentityBadge" )
require( "ui.uieditor.widgets.Footer.fe_FooterContainer_NOTLobby" )
require( "ui.uieditor.widgets.BlackMarket.BM_LogoContracts" )
require( "ui.uieditor.widgets.Promo.Promo_ThermometerTabWidget" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0.disablePopupOpenCloseAnim = true
end

LUI.createMenu.RoadToCWL = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "RoadToCWL" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "Blackmarket_extra"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "RoadToCWL.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local Screen = LUI.UIImage.new()
	Screen:setLeftRight( true, true, 0, 0 )
	Screen:setTopBottom( true, true, 0, 0 )
	Screen:setImage( RegisterImage( "uie_t7_blackmarket_contracts_bg_1080" ) )
	self:addElement( Screen )
	self.Screen = Screen
	
	local SelfIdentityBadge = CoD.SelfIdentityBadge.new( self, controller )
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
	
	local feFooterContainerNOTLobby = CoD.fe_FooterContainer_NOTLobby.new( self, controller )
	feFooterContainerNOTLobby:setLeftRight( true, true, 1, -1 )
	feFooterContainerNOTLobby:setTopBottom( false, true, -67, 0 )
	feFooterContainerNOTLobby:registerEventHandler( "menu_opened", function ( element, event )
		local f5_local0 = nil
		SizeToSafeArea( element, controller )
		if not f5_local0 then
			f5_local0 = element:dispatchEventToChildren( event )
		end
		return f5_local0
	end )
	self:addElement( feFooterContainerNOTLobby )
	self.feFooterContainerNOTLobby = feFooterContainerNOTLobby
	
	local BMLogoContracts = CoD.BM_LogoContracts.new( self, controller )
	BMLogoContracts:setLeftRight( true, false, 33.04, 424.04 )
	BMLogoContracts:setTopBottom( true, false, 5, 126 )
	BMLogoContracts:setScale( 0.95 )
	BMLogoContracts.RecentItems:setText( Engine.Localize( "CONTRACT_COMMUNITY_MENU_TITLE" ) )
	self:addElement( BMLogoContracts )
	self.BMLogoContracts = BMLogoContracts
	
	local GlowMeter = LUI.UIImage.new()
	GlowMeter:setLeftRight( true, false, 538.06, 1060.68 )
	GlowMeter:setTopBottom( true, false, 430, 876 )
	GlowMeter:setAlpha( 0.5 )
	GlowMeter:setImage( RegisterImage( "uie_t7_blackmarket_promo_meter_glowmeter" ) )
	self:addElement( GlowMeter )
	self.GlowMeter = GlowMeter
	
	local PromoThermometerTabWidget = CoD.Promo_ThermometerTabWidget.new( self, controller )
	PromoThermometerTabWidget:setLeftRight( true, false, -6, 1274 )
	PromoThermometerTabWidget:setTopBottom( true, false, 89, 651 )
	PromoThermometerTabWidget.txtDescription:setText( Engine.Localize( "CONTRACT_COMMUNITY_CONTRACT_DESC" ) )
	PromoThermometerTabWidget.title:setRGB( 0.82, 0.83, 0.6 )
	self:addElement( PromoThermometerTabWidget )
	self.PromoThermometerTabWidget = PromoThermometerTabWidget
	
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		HandleGoBackFromPromo( self, element, controller, "", menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	feFooterContainerNOTLobby:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.SelfIdentityBadge:close()
		element.feFooterContainerNOTLobby:close()
		element.BMLogoContracts:close()
		element.PromoThermometerTabWidget:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "RoadToCWL.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

