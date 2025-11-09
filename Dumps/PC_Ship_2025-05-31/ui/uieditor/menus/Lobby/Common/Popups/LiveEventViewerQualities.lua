require( "ui.uieditor.widgets.CharacterCustomization.list1ButtonNewStyle" )
require( "ui.uieditor.widgets.Footer.fe_FooterContainer_NOTLobby" )

LUI.createMenu.LiveEventViewerQualities = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "LiveEventViewerQualities" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "Special_widgets"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "LiveEventViewerQualities.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local backing = LUI.UIImage.new()
	backing:setLeftRight( true, true, 0, 0 )
	backing:setTopBottom( true, true, 0, 0 )
	backing:setRGB( 0, 0, 0 )
	backing:setAlpha( 0.5 )
	self:addElement( backing )
	self.backing = backing
	
	local qualityList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	qualityList:makeFocusable()
	qualityList:setLeftRight( true, false, 64, 296 )
	qualityList:setTopBottom( true, false, 36, 374 )
	qualityList:setWidgetType( CoD.list1ButtonNewStyle )
	qualityList:setVerticalCount( 10 )
	qualityList:setDataSource( "LiveEventViewerQualities" )
	qualityList:registerEventHandler( "gain_focus", function ( element, event )
		local f2_local0 = nil
		if element.gainFocus then
			f2_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f2_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
		return f2_local0
	end )
	qualityList:registerEventHandler( "lose_focus", function ( element, event )
		local f3_local0 = nil
		if element.loseFocus then
			f3_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f3_local0 = element.super:loseFocus( event )
		end
		return f3_local0
	end )
	self:AddButtonCallbackFunction( qualityList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		SelectLiveEventQuality( element )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:AddButtonCallbackFunction( qualityList, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_CANCEL" )
		return true
	end, false )
	self:addElement( qualityList )
	self.qualityList = qualityList
	
	local footer = CoD.fe_FooterContainer_NOTLobby.new( self, controller )
	footer:setLeftRight( true, true, 1, -1 )
	footer:setTopBottom( false, true, -67, 0 )
	footer:registerEventHandler( "menu_loaded", function ( element, event )
		local f8_local0 = nil
		SizeToSafeArea( element, controller )
		if not f8_local0 then
			f8_local0 = element:dispatchEventToChildren( event )
		end
		return f8_local0
	end )
	self:addElement( footer )
	self.footer = footer
	
	qualityList.id = "qualityList"
	footer:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.qualityList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.qualityList:close()
		element.footer:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "LiveEventViewerQualities.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

