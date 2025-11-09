require( "ui.uieditor.widgets.GameSettings.GameSettings_OptionsButton" )
require( "ui.uieditor.widgets.Theater.Theater_HintText" )

CoD.FileshareSidePopupLayout = InheritFrom( LUI.UIElement )
CoD.FileshareSidePopupLayout.new = function ( menu, controller )
	local self = LUI.UIVerticalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 10
	} )
	self:setAlignment( LUI.Alignment.Top )
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
	List0:setTopBottom( true, false, 0, 258 )
	List0:setWidgetType( CoD.GameSettings_OptionsButton )
	List0:setVerticalCount( 7 )
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
	
	local hintText = CoD.Theater_HintText.new( menu, controller )
	hintText:setLeftRight( true, false, 1, 281 )
	hintText:setTopBottom( true, false, 268, 292 )
	hintText.ItemHintText:setText( Engine.Localize( "MENU_NEW" ) )
	self:addElement( hintText )
	self.hintText = hintText
	
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
		element.hintText:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

