require( "ui.uieditor.widgets.playercard.SelfIdentityBadge" )
require( "ui.uieditor.widgets.Footer.fe_FooterContainer_NOTLobby" )
require( "ui.uieditor.widgets.BlackMarket.BM_LogoContracts" )
require( "ui.uieditor.widgets.SpecialContracts.SpecialContracts_SelectionButton" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.SpecialContracts.SpecialContracts_Infopane" )

local PreLoadFunc = function ( self, controller )
	self.disablePopupOpenCloseAnim = true
	Engine.CreateModel( Engine.GetModelForController( controller ), "updateContractsList" )
end

local PostLoadFunc = function ( f2_arg0, f2_arg1 )
	f2_arg0.originalOcclusionChange = f2_arg0.m_eventHandlers.occlusion_change
	f2_arg0:registerEventHandler( "occlusion_change", function ( element, event )
		if not event.occluded and event.occludedBy and event.occludedBy.id == "Menu.BM_SpecialContracts_CallingCardContracts" then
			CoD.perController[f2_arg1].callingCardContractGroup = nil
			ForceNotifyControllerModel( f2_arg1, "updateContractsList" )
		end
		element:originalOcclusionChange( event )
	end )
	f2_arg0:registerEventHandler( "bm_autoevents_tick", function ( element, event )
		Engine.SetDvar( "live_autoEventPumpTime", 0 )
	end )
	f2_arg0:addElement( LUI.UITimer.new( 100, "bm_autoevents_tick", false, f2_arg0 ) )
end

LUI.createMenu.BM_SpecialContracts = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "BM_SpecialContracts" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "Blackmarket_extra"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "BM_SpecialContracts.buttonPrompts" )
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
		local f8_local0 = nil
		SizeToSafeArea( element, controller )
		if not f8_local0 then
			f8_local0 = element:dispatchEventToChildren( event )
		end
		return f8_local0
	end )
	self:addElement( feFooterContainerNOTLobby )
	self.feFooterContainerNOTLobby = feFooterContainerNOTLobby
	
	local BMLogoContracts = CoD.BM_LogoContracts.new( self, controller )
	BMLogoContracts:setLeftRight( true, false, 33.04, 424.04 )
	BMLogoContracts:setTopBottom( true, false, 5, 126 )
	BMLogoContracts:setScale( 0.95 )
	BMLogoContracts.RecentItems:setText( Engine.Localize( "CONTRACT_SPECIAL_MENU_TITLE" ) )
	self:addElement( BMLogoContracts )
	self.BMLogoContracts = BMLogoContracts
	
	local SpecialContracts = LUI.UIList.new( self, controller, 3, 0, nil, false, false, 0, 0, false, false )
	SpecialContracts:makeFocusable()
	SpecialContracts:setLeftRight( true, false, 76.97, 832.97 )
	SpecialContracts:setTopBottom( true, false, 105, 597 )
	SpecialContracts:setWidgetType( CoD.SpecialContracts_SelectionButton )
	SpecialContracts:setHorizontalCount( 3 )
	SpecialContracts:setVerticalCount( 3 )
	SpecialContracts:setSpacing( 3 )
	SpecialContracts:setVerticalCounter( CoD.verticalCounter )
	SpecialContracts:setDataSource( "SpecialContractsList" )
	SpecialContracts:registerEventHandler( "gain_focus", function ( element, event )
		local f9_local0 = nil
		if element.gainFocus then
			f9_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f9_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f9_local0
	end )
	SpecialContracts:registerEventHandler( "lose_focus", function ( element, event )
		local f10_local0 = nil
		if element.loseFocus then
			f10_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f10_local0 = element.super:loseFocus( event )
		end
		return f10_local0
	end )
	self:AddButtonCallbackFunction( SpecialContracts, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		if IsSpecialContractAvailable( self, element, controller ) then
			ProcessListAction( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if IsSpecialContractAvailable( self, element, controller ) then
			return true
		else
			return false
		end
	end, true )
	SpecialContracts:subscribeToGlobalModel( controller, "PerController", "updateContractsList", function ( model )
		UpdateDataSource( self, SpecialContracts, controller )
	end )
	SpecialContracts:subscribeToGlobalModel( controller, "AutoeventsCycled", "cycled", function ( model )
		UpdateDataSource( self, SpecialContracts, controller )
	end )
	self:addElement( SpecialContracts )
	self.SpecialContracts = SpecialContracts
	
	local Infopane = CoD.SpecialContracts_Infopane.new( self, controller )
	Infopane:setLeftRight( false, true, -418, -67.91 )
	Infopane:setTopBottom( true, false, 101, 601 )
	self:addElement( Infopane )
	self.Infopane = Infopane
	
	Infopane:linkToElementModel( SpecialContracts, nil, false, function ( model )
		Infopane:setModel( model, controller )
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	feFooterContainerNOTLobby:setModel( self.buttonModel, controller )
	SpecialContracts.id = "SpecialContracts"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.SpecialContracts:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.SelfIdentityBadge:close()
		element.feFooterContainerNOTLobby:close()
		element.BMLogoContracts:close()
		element.SpecialContracts:close()
		element.Infopane:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "BM_SpecialContracts.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

