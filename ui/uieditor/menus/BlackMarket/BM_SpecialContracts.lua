-- 1a1c6038bda1ed3cda0e4578e4f7c295
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.playercard.SelfIdentityBadge" )
require( "ui.uieditor.widgets.Footer.fe_FooterContainer_NOTLobby" )
require( "ui.uieditor.widgets.BlackMarket.BM_LogoContracts" )
require( "ui.uieditor.widgets.SpecialContracts.SpecialContracts_SelectionButton" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.SpecialContracts.SpecialContracts_Infopane" )

local f0_local0 = function ( f1_arg0, f1_arg1 )
	local f1_local0 = function ( f2_arg0, f2_arg1 )
		if f2_arg0.m_inputDisabled then
			local f2_local0 = f2_arg0:getFirstChild()
			while f2_local0 do
				if f2_local0.menuName then
					f2_local0:processEvent( f2_arg1 )
				end
				f2_local0 = f2_local0:getNextSibling()
			end
		elseif f2_arg1.name == "mousemove" then
			LUI.UIElement.MouseMoveEvent( f1_arg0, f2_arg1 )
		else
			LUI.UIElement.MouseButtonEvent( f1_arg0, f2_arg1 )
		end
	end
	
	f1_arg0:registerEventHandler( "mousemove", f1_local0 )
	f1_arg0:registerEventHandler( "mouseup", f1_local0 )
	f1_arg0:registerEventHandler( "mousedown", f1_local0 )
end

local PreLoadFunc = function ( self, controller )
	self.disablePopupOpenCloseAnim = true
	Engine.CreateModel( Engine.GetModelForController( controller ), "updateContractsList" )
end

local PostLoadFunc = function ( f4_arg0, f4_arg1 )
	f4_arg0.originalOcclusionChange = f4_arg0.m_eventHandlers.occlusion_change
	f4_arg0:registerEventHandler( "occlusion_change", function ( element, event )
		if not event.occluded and event.occludedBy and event.occludedBy.id == "Menu.BM_SpecialContracts_CallingCardContracts" then
			CoD.perController[f4_arg1].callingCardContractGroup = nil
			ForceNotifyControllerModel( f4_arg1, "updateContractsList" )
		end
		element:originalOcclusionChange( event )
	end )
	f4_arg0:registerEventHandler( "bm_autoevents_tick", function ( element, event )
		Engine.SetDvar( "live_autoEventPumpTime", 0 )
	end )
	f4_arg0:addElement( LUI.UITimer.new( 100, "bm_autoevents_tick", false, f4_arg0 ) )
	if CoD.isPC then
		f0_local0( f4_arg0, f4_arg1 )
	end
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
	local f7_local1 = self
	self.anyChildUsesUpdateState = true
	
	local Screen = LUI.UIImage.new()
	Screen:setLeftRight( true, true, 0, 0 )
	Screen:setTopBottom( true, true, 0, 0 )
	Screen:setImage( RegisterImage( "uie_t7_blackmarket_contracts_bg_1080" ) )
	self:addElement( Screen )
	self.Screen = Screen
	
	local SelfIdentityBadge = CoD.SelfIdentityBadge.new( f7_local1, controller )
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
	
	local feFooterContainerNOTLobby = CoD.fe_FooterContainer_NOTLobby.new( f7_local1, controller )
	feFooterContainerNOTLobby:setLeftRight( true, true, 1, -1 )
	feFooterContainerNOTLobby:setTopBottom( false, true, -67, 0 )
	feFooterContainerNOTLobby:registerEventHandler( "menu_opened", function ( element, event )
		local f10_local0 = nil
		SizeToSafeArea( element, controller )
		if not f10_local0 then
			f10_local0 = element:dispatchEventToChildren( event )
		end
		return f10_local0
	end )
	self:addElement( feFooterContainerNOTLobby )
	self.feFooterContainerNOTLobby = feFooterContainerNOTLobby
	
	local BMLogoContracts = CoD.BM_LogoContracts.new( f7_local1, controller )
	BMLogoContracts:setLeftRight( true, false, 33.04, 424.04 )
	BMLogoContracts:setTopBottom( true, false, 5, 126 )
	BMLogoContracts:setScale( 0.95 )
	BMLogoContracts.RecentItems:setText( Engine.Localize( "CONTRACT_SPECIAL_MENU_TITLE" ) )
	self:addElement( BMLogoContracts )
	self.BMLogoContracts = BMLogoContracts
	
	local SpecialContracts = LUI.UIList.new( f7_local1, controller, 3, 0, nil, false, false, 0, 0, false, false )
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
		local f11_local0 = nil
		if element.gainFocus then
			f11_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f11_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f7_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f11_local0
	end )
	SpecialContracts:registerEventHandler( "lose_focus", function ( element, event )
		local f12_local0 = nil
		if element.loseFocus then
			f12_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f12_local0 = element.super:loseFocus( event )
		end
		return f12_local0
	end )
	f7_local1:AddButtonCallbackFunction( SpecialContracts, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f13_arg0, f13_arg1, f13_arg2, f13_arg3 )
		if IsSpecialContractAvailable( self, f13_arg0, f13_arg2 ) then
			ProcessListAction( self, f13_arg0, f13_arg2 )
			return true
		else
			
		end
	end, function ( f14_arg0, f14_arg1, f14_arg2 )
		CoD.Menu.SetButtonLabel( f14_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if IsSpecialContractAvailable( self, f14_arg0, f14_arg2 ) then
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
	
	local Infopane = CoD.SpecialContracts_Infopane.new( f7_local1, controller )
	Infopane:setLeftRight( false, true, -418, -67.91 )
	Infopane:setTopBottom( true, false, 101, 601 )
	self:addElement( Infopane )
	self.Infopane = Infopane
	
	Infopane:linkToElementModel( SpecialContracts, nil, false, function ( model )
		Infopane:setModel( model, controller )
	end )
	f7_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f18_arg0, f18_arg1, f18_arg2, f18_arg3 )
		GoBack( self, f18_arg2 )
		return true
	end, function ( f19_arg0, f19_arg1, f19_arg2 )
		CoD.Menu.SetButtonLabel( f19_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
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
		menu = f7_local1
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

