-- ec01421221508bead0ebe07e6b93da76
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Terminal.OmnipediaWidget" )
require( "ui.uieditor.widgets.Terminal.OmnipediaWidgetButtons" )

local PreLoadFunc = function ( self, controller )
	local f1_local0 = self
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Weapons.buttonPrompts" )
	f1_local0:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f2_arg0, f2_arg1, f2_arg2, f2_arg3 )
		self:playSound( "item_read" )
		if self.OmnipediaWidget.BinaryHTML0:isInFocus() then
			self.OmnipediaWidget.BinaryHTML0:followActiveLink()
		else
			local f2_local0 = self.OmnipediaWidget.BinaryHTML0
			local f2_local1 = self.OmnipediaWidget.BookmarksList
			f2_local0:gotoUrl( Engine.GetModelValue( Engine.GetModel( f2_arg0:getModel(), "bookmarkURL" ) ) )
			f2_local1:processEvent( {
				name = "lose_focus",
				controller = f2_arg2
			} )
			f2_local0:processEvent( {
				name = "gain_focus",
				controller = f2_arg2
			} )
			self.OmnipediaWidget:playClip( "BookMark_Close" )
			self.OmnipediaWidget.BookMarkClose()
		end
		return true
	end, function ( f3_arg0, f3_arg1, f3_arg2 )
		if self.OmnipediaWidget ~= nil and self.OmnipediaWidget.BinaryHTML0:isInFocus() then
			CoD.Menu.SetButtonLabel( f3_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_BROWSER_FOLLOWLINK" )
		else
			CoD.Menu.SetButtonLabel( f3_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_BROWSER_GOTOBOOKMARK" )
		end
		return true
	end, false )
	f1_local0:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3 )
		self:playSound( "menu_go_back" )
		if self.OmnipediaWidget.BinaryHTML0:isInFocus() then
			self.OmnipediaWidget.BinaryHTML0:previousLink()
		else
			local f4_local0 = self.OmnipediaWidget.BinaryHTML0
			self.OmnipediaWidget.BookmarksList:processEvent( {
				name = "lose_focus",
				controller = f4_arg2
			} )
			f4_local0:processEvent( {
				name = "gain_focus",
				controller = f4_arg2
			} )
			self.OmnipediaWidget:playClip( "BookMark_Close" )
			self.OmnipediaWidget.BookMarkClose()
		end
		return true
	end, function ( f5_arg0, f5_arg1, f5_arg2 )
		if self.OmnipediaWidget ~= nil and self.OmnipediaWidget.BinaryHTML0:isInFocus() then
			CoD.Menu.SetButtonLabel( f5_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BROWSER_BACK" )
		else
			CoD.Menu.SetButtonLabel( f5_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BROWSER_CLOSEBOOKMARKS" )
		end
		return true
	end, false )
	f1_local0:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "X", function ( f6_arg0, f6_arg1, f6_arg2, f6_arg3 )
		if self.OmnipediaWidget ~= nil and self.OmnipediaWidget.BinaryHTML0:isInFocus() then
			GoBack( self, f6_arg2 )
		end
		return true
	end, function ( f7_arg0, f7_arg1, f7_arg2 )
		CoD.Menu.SetButtonLabel( f7_arg1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_BROWSER_CLOSE" )
		local f7_local0
		if self.OmnipediaWidget ~= nil then
			f7_local0 = self.OmnipediaWidget.BinaryHTML0:isInFocus()
		else
			f7_local0 = false
		end
		return f7_local0
	end, false )
	f1_local0:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "H", function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3 )
		if self.OmnipediaWidget.BinaryHTML0:isInFocus() then
			self.OmnipediaWidget.BinaryHTML0:homeLink()
		end
		return true
	end, function ( f9_arg0, f9_arg1, f9_arg2 )
		CoD.Menu.SetButtonLabel( f9_arg1, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "MENU_BROWSER_HOME" )
		local f9_local0
		if self.OmnipediaWidget ~= nil then
			f9_local0 = self.OmnipediaWidget.BinaryHTML0:isInFocus()
		else
			f9_local0 = false
		end
		return f9_local0
	end, false )
	f1_local0:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RB, "B", function ( f10_arg0, f10_arg1, f10_arg2, f10_arg3 )
		if self.OmnipediaWidget ~= nil and self.OmnipediaWidget.BinaryHTML0:isInFocus() then
			local f10_local0 = self.OmnipediaWidget.BinaryHTML0
			local f10_local1 = self.OmnipediaWidget.BookmarksList
			f10_local0:processEvent( {
				name = "lose_focus",
				controller = f10_arg2
			} )
			f10_local1:processEvent( {
				name = "gain_focus",
				controller = f10_arg2
			} )
			self.OmnipediaWidget:playClip( "BookMark_Nav" )
			self.OmnipediaWidget.BookMarkOpen()
		end
		return true
	end, function ( f11_arg0, f11_arg1, f11_arg2 )
		CoD.Menu.SetButtonLabel( f11_arg1, Enum.LUIButton.LUI_KEY_RB, "MENU_BROWSER_BOOKMARKS" )
		local f11_local0
		if self.OmnipediaWidget ~= nil then
			f11_local0 = self.OmnipediaWidget.BinaryHTML0:isInFocus()
		else
			f11_local0 = false
		end
		return f11_local0
	end, false )
	f1_local0:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, nil, function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3 )
		return true
	end, function ( f13_arg0, f13_arg1, f13_arg2 )
		if Engine.LastInput_Gamepad() then
			CoD.Menu.SetButtonLabel( f13_arg1, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "MENU_BROWSER_CURSOR" )
			local f13_local0
			if self.OmnipediaWidget ~= nil then
				f13_local0 = self.OmnipediaWidget.BinaryHTML0:isInFocus()
			else
				f13_local0 = false
			end
			return f13_local0
		else
			
		end
	end, false )
end

local f0_local1 = function ( f14_arg0, f14_arg1 )
	f14_arg0:registerEventHandler( "input_source_changed", function ( element, event )
		UpdateButtonPromptState( f14_arg0, f14_arg0, f14_arg1, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED )
		f14_arg0.OmnipediaWidgetButtons:processEvent( event )
	end )
end

local PostLoadFunc = function ( f16_arg0, f16_arg1 )
	local f16_local0 = f16_arg0
	f16_arg0.OmnipediaWidget.BinaryHTML0:makeFocusable()
	f16_arg0.OmnipediaWidget.BinaryHTML0.id = "BinaryHTML0"
	SetFocusToElement( f16_arg0.OmnipediaWidget, "BinaryHTML0", f16_arg1 )
	if CoD.isPC then
		f0_local1( f16_arg0, f16_arg1 )
	end
end

LUI.createMenu.Weapons = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Weapons" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Weapons.buttonPrompts" )
	local f17_local1 = self
	self.anyChildUsesUpdateState = true
	
	local OmnipediaWidget = CoD.OmnipediaWidget.new( f17_local1, controller )
	OmnipediaWidget:setLeftRight( false, false, -380, 520 )
	OmnipediaWidget:setTopBottom( true, false, 85, 685 )
	Engine.SetupUI3DWindow( controller, 5, 900, 600 )
	OmnipediaWidget:setUI3DWindow( 5 )
	OmnipediaWidget.BinaryHTML0:setupBinaryHTML( "WinslowAccord-WeaponsAndVehicles.htm" )
	self:addElement( OmnipediaWidget )
	self.OmnipediaWidget = OmnipediaWidget
	
	local OmnipediaWidgetButtons = CoD.OmnipediaWidgetButtons.new( f17_local1, controller )
	OmnipediaWidgetButtons:setLeftRight( true, true, 0, 380 )
	OmnipediaWidgetButtons:setTopBottom( false, true, -65, 0 )
	OmnipediaWidgetButtons:registerEventHandler( "menu_loaded", function ( element, event )
		local f18_local0 = nil
		SizeToSafeArea( element, controller )
		if not f18_local0 then
			f18_local0 = element:dispatchEventToChildren( event )
		end
		return f18_local0
	end )
	self:addElement( OmnipediaWidgetButtons )
	self.OmnipediaWidgetButtons = OmnipediaWidgetButtons
	
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f17_local1
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.OmnipediaWidget:close()
		element.OmnipediaWidgetButtons:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Weapons.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

