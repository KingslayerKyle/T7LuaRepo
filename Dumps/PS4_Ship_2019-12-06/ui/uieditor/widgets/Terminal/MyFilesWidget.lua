require( "ui.uieditor.widgets.Terminal.MyFilesContainer" )
require( "ui.uieditor.widgets.Terminal.DOA2Widget" )
require( "ui.uieditor.menus.InGame.PersonalDataVault.Doa2" )

CoD.MyFilesWidget = InheritFrom( LUI.UIElement )
CoD.MyFilesWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MyFilesWidget )
	self.id = "MyFilesWidget"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 900 )
	self:setTopBottom( true, false, 0, 600 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local blackleftBG = LUI.UIImage.new()
	blackleftBG:setLeftRight( true, true, 0, 0 )
	blackleftBG:setTopBottom( false, true, -600, 0 )
	blackleftBG:setRGB( 0, 0, 0 )
	self:addElement( blackleftBG )
	self.blackleftBG = blackleftBG
	
	local MyFilesContainer = CoD.MyFilesContainer.new( menu, controller )
	MyFilesContainer:setLeftRight( true, false, 179, 721 )
	MyFilesContainer:setTopBottom( true, false, 136.5, 411.5 )
	self:addElement( MyFilesContainer )
	self.MyFilesContainer = MyFilesContainer
	
	local white = LUI.UIImage.new()
	white:setLeftRight( true, false, 179, 715 )
	white:setTopBottom( true, false, 136.5, 401.5 )
	white:setAlpha( 0.1 )
	self:addElement( white )
	self.white = white
	
	local DOA2Applet = CoD.DOA2Widget.new( menu, controller )
	DOA2Applet:setLeftRight( true, false, 339.5, 554.5 )
	DOA2Applet:setTopBottom( true, false, 192, 320 )
	DOA2Applet:registerEventHandler( "gain_focus", function ( element, event )
		local f2_local0 = nil
		if element.gainFocus then
			f2_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f2_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f2_local0
	end )
	DOA2Applet:registerEventHandler( "lose_focus", function ( element, event )
		local f3_local0 = nil
		if element.loseFocus then
			f3_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f3_local0 = element.super:loseFocus( event )
		end
		return f3_local0
	end )
	menu:AddButtonCallbackFunction( DOA2Applet, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		NavigateToMenu( self, "Doa2", false, controller )
		SetDOAGameMode( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( DOA2Applet )
	self.DOA2Applet = DOA2Applet
	
	local windowRight = LUI.UIImage.new()
	windowRight:setLeftRight( true, false, 181, 277 )
	windowRight:setTopBottom( true, false, 136.5, 160.5 )
	windowRight:setImage( RegisterImage( "uie_t7_menu_cp_datavault_windowassets2" ) )
	self:addElement( windowRight )
	self.windowRight = windowRight
	
	local windowLeft = LUI.UIImage.new()
	windowLeft:setLeftRight( true, false, 688, 710 )
	windowLeft:setTopBottom( true, false, 139.5, 150.5 )
	windowLeft:setImage( RegisterImage( "uie_t7_menu_cp_datavault_windowassets" ) )
	self:addElement( windowLeft )
	self.windowLeft = windowLeft
	
	local windowRight0 = LUI.UIImage.new()
	windowRight0:setLeftRight( true, false, 181, 277 )
	windowRight0:setTopBottom( true, false, 136.5, 160.5 )
	windowRight0:setImage( RegisterImage( "uie_t7_menu_cp_datavault_windowassets2" ) )
	self:addElement( windowRight0 )
	self.windowRight0 = windowRight0
	
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	DOA2Applet.id = "DOA2Applet"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.DOA2Applet:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.MyFilesContainer:close()
		element.DOA2Applet:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

