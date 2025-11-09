require( "ui.uieditor.widgets.Terminal.OmnipediaWidget" )
require( "ui.uieditor.widgets.Terminal.OmnipediaWidgetButtons" )

local PreLoadFunc = function ( self, controller )
	local f1_local0 = self
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Omnipedia.buttonPrompts" )
	f1_local0:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		self:playSound( "item_read" )
		if self.OmnipediaWidget.BinaryHTML0:isInFocus() then
			self.OmnipediaWidget.BinaryHTML0:followActiveLink()
		else
			local f2_local0 = self.OmnipediaWidget.BinaryHTML0
			local f2_local1 = self.OmnipediaWidget.BookmarksList
			f2_local0:gotoUrl( Engine.GetModelValue( Engine.GetModel( element:getModel(), "bookmarkURL" ) ) )
			f2_local1:processEvent( {
				name = "lose_focus",
				controller = controller
			} )
			f2_local0:processEvent( {
				name = "gain_focus",
				controller = controller
			} )
			self.OmnipediaWidget:playClip( "BookMark_Close" )
		end
		return true
	end, function ( element, menu, controller )
		if self.OmnipediaWidget ~= nil and self.OmnipediaWidget.BinaryHTML0:isInFocus() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_BROWSER_FOLLOWLINK" )
		else
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_BROWSER_GOTOBOOKMARK" )
		end
		return true
	end, false )
	f1_local0:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		self:playSound( "menu_go_back" )
		if self.OmnipediaWidget.BinaryHTML0:isInFocus() then
			self.OmnipediaWidget.BinaryHTML0:previousLink()
		else
			local f4_local0 = self.OmnipediaWidget.BinaryHTML0
			self.OmnipediaWidget.BookmarksList:processEvent( {
				name = "lose_focus",
				controller = controller
			} )
			f4_local0:processEvent( {
				name = "gain_focus",
				controller = controller
			} )
			self.OmnipediaWidget:playClip( "BookMark_Close" )
		end
		return true
	end, function ( element, menu, controller )
		if self.OmnipediaWidget ~= nil and self.OmnipediaWidget.BinaryHTML0:isInFocus() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BROWSER_BACK" )
		else
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BROWSER_CLOSEBOOKMARKS" )
		end
		return true
	end, false )
	f1_local0:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, nil, function ( element, menu, controller, model )
		if self.OmnipediaWidget ~= nil and self.OmnipediaWidget.BinaryHTML0:isInFocus() then
			GoBack( self, controller )
		end
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_BROWSER_CLOSE" )
		local f7_local0
		if self.OmnipediaWidget ~= nil then
			f7_local0 = self.OmnipediaWidget.BinaryHTML0:isInFocus()
		else
			f7_local0 = false
		end
		return f7_local0
	end, false )
	f1_local0:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, nil, function ( element, menu, controller, model )
		if self.OmnipediaWidget.BinaryHTML0:isInFocus() then
			self.OmnipediaWidget.BinaryHTML0:homeLink()
		end
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "MENU_BROWSER_HOME" )
		local f9_local0
		if self.OmnipediaWidget ~= nil then
			f9_local0 = self.OmnipediaWidget.BinaryHTML0:isInFocus()
		else
			f9_local0 = false
		end
		return f9_local0
	end, false )
	f1_local0:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RB, nil, function ( element, menu, controller, model )
		if self.OmnipediaWidget ~= nil and self.OmnipediaWidget.BinaryHTML0:isInFocus() then
			local f10_local0 = self.OmnipediaWidget.BinaryHTML0
			local f10_local1 = self.OmnipediaWidget.BookmarksList
			f10_local0:processEvent( {
				name = "lose_focus",
				controller = controller
			} )
			f10_local1:processEvent( {
				name = "gain_focus",
				controller = controller
			} )
			self.OmnipediaWidget:playClip( "BookMark_Nav" )
		end
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RB, "MENU_BROWSER_BOOKMARKS" )
		local f11_local0
		if self.OmnipediaWidget ~= nil then
			f11_local0 = self.OmnipediaWidget.BinaryHTML0:isInFocus()
		else
			f11_local0 = false
		end
		return f11_local0
	end, false )
	f1_local0:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, nil, function ( element, menu, controller, model )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "MENU_BROWSER_CURSOR" )
		local f13_local0
		if self.OmnipediaWidget ~= nil then
			f13_local0 = self.OmnipediaWidget.BinaryHTML0:isInFocus()
		else
			f13_local0 = false
		end
		return f13_local0
	end, false )
end

local PostLoadFunc = function ( f14_arg0, f14_arg1 )
	local f14_local0 = f14_arg0
	f14_arg0.OmnipediaWidget.BinaryHTML0:makeFocusable()
	f14_arg0.OmnipediaWidget.BinaryHTML0.id = "BinaryHTML0"
	SetFocusToElement( f14_arg0.OmnipediaWidget, "BinaryHTML0", f14_arg1 )
end

LUI.createMenu.Omnipedia = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Omnipedia" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Omnipedia.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local OmnipediaWidget = CoD.OmnipediaWidget.new( self, controller )
	OmnipediaWidget:setLeftRight( true, false, 0, 900 )
	OmnipediaWidget:setTopBottom( true, false, 0, 600 )
	Engine.SetupUI3DWindow( controller, 5, 900, 600 )
	OmnipediaWidget:setUI3DWindow( 5 )
	OmnipediaWidget.BinaryHTML0:setupBinaryHTML( "home.htm" )
	self:addElement( OmnipediaWidget )
	self.OmnipediaWidget = OmnipediaWidget
	
	local OmnipediaWidgetButtons = CoD.OmnipediaWidgetButtons.new( self, controller )
	OmnipediaWidgetButtons:setLeftRight( true, true, 0, 380 )
	OmnipediaWidgetButtons:setTopBottom( false, true, -65, 0 )
	OmnipediaWidgetButtons:registerEventHandler( "menu_loaded", function ( element, event )
		local f16_local0 = nil
		SizeToSafeArea( element, controller )
		if not f16_local0 then
			f16_local0 = element:dispatchEventToChildren( event )
		end
		return f16_local0
	end )
	self:addElement( OmnipediaWidgetButtons )
	self.OmnipediaWidgetButtons = OmnipediaWidgetButtons
	
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.OmnipediaWidget:close()
		element.OmnipediaWidgetButtons:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Omnipedia.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

