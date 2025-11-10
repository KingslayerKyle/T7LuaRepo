require( "ui.uieditor.widgets.GameSettings.GameSettings_OptionsButton" )

CoD.FileshareSidePopupLayout = InheritFrom( LUI.UIElement )
CoD.FileshareSidePopupLayout.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FileshareSidePopupLayout )
	self.id = "FileshareSidePopupLayout"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 278 )
	self:setTopBottom( true, false, 0, 270 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local List0 = LUI.UIList.new( menu, controller, 1, 0, nil, false, false, 0, 0, false, false )
	List0:makeFocusable()
	List0:setLeftRight( true, false, 1, 256 )
	List0:setTopBottom( true, false, 0, 184 )
	List0:setWidgetType( CoD.GameSettings_OptionsButton )
	List0:setVerticalCount( 5 )
	List0:setSpacing( 1 )
	List0:registerEventHandler( "gain_focus", function ( element, event )
		local f2_local0 = nil
		if element.gainFocus then
			f2_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f2_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f2_local0
	end )
	List0:registerEventHandler( "lose_focus", function ( element, event )
		local f3_local0 = nil
		if element.loseFocus then
			f3_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f3_local0 = element.super:loseFocus( event )
		end
		return f3_local0
	end )
	menu:AddButtonCallbackFunction( List0, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ProcessListAction( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( List0 )
	self.List0 = List0
	
	local description = LUI.UIText.new()
	description:setLeftRight( true, false, 16.25, 244 )
	description:setTopBottom( true, false, 198.5, 218.5 )
	description:setAlpha( 0.9 )
	description:setText( Engine.Localize( "MENU_DESCRIPTION" ) )
	description:setTTF( "fonts/default.ttf" )
	description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( description )
	self.description = description
	
	local Arrow = LUI.UIImage.new()
	Arrow:setLeftRight( true, false, 3, 12 )
	Arrow:setTopBottom( true, false, 204, 213 )
	Arrow:setAlpha( 0.6 )
	Arrow:setImage( RegisterImage( "uie_t7_menu_gunsmith_arrow_white" ) )
	self:addElement( Arrow )
	self.Arrow = Arrow
	
	List0.id = "List0"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.List0:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.List0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

