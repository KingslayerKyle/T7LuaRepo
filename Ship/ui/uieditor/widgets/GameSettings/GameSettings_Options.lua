-- 6b2c34006b9bb426df9266bf25578885
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.PC.Utility.VerticalListSpacer" )
require( "ui.uieditor.widgets.GameSettings.GameSettings_OptionsButton" )

CoD.GameSettings_Options = InheritFrom( LUI.UIElement )
CoD.GameSettings_Options.new = function ( menu, controller )
	local self = LUI.UIVerticalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 0
	} )
	self:setAlignment( LUI.Alignment.Top )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.GameSettings_Options )
	self.id = "GameSettings_Options"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 320 )
	self:setTopBottom( true, false, 0, 720 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local VerticalListSpacer0 = CoD.VerticalListSpacer.new( menu, controller )
	VerticalListSpacer0:setLeftRight( true, false, 0, 320 )
	VerticalListSpacer0:setTopBottom( true, false, 0, 164.5 )
	self:addElement( VerticalListSpacer0 )
	self.VerticalListSpacer0 = VerticalListSpacer0
	
	local TextBox0 = LUI.UIText.new()
	TextBox0:setLeftRight( true, false, 18.4, 312 )
	TextBox0:setTopBottom( true, false, 164.5, 198.5 )
	TextBox0:setRGB( 1, 0.47, 0 )
	TextBox0:setText( Engine.Localize( "MENU_OPTIONS" ) )
	TextBox0:setTTF( "fonts/default.ttf" )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	local spacer = LUI.UIImage.new()
	spacer:setLeftRight( true, false, 45.2, 173.2 )
	spacer:setTopBottom( true, false, 198.5, 208.5 )
	spacer:setAlpha( 0 )
	self:addElement( spacer )
	self.spacer = spacer
	
	local List0 = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, false )
	List0:makeFocusable()
	List0:setLeftRight( true, false, 12.4, 267.4 )
	List0:setTopBottom( true, false, 208.5, 320.5 )
	List0:setDataSource( "GameSettingsOptions" )
	List0:setWidgetType( CoD.GameSettings_OptionsButton )
	List0:setVerticalCount( 3 )
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
	menu:AddButtonCallbackFunction( List0, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3 )
		ProcessListAction( self, f4_arg0, f4_arg2 )
		GoBack( self, f4_arg2 )
		return true
	end, function ( f5_arg0, f5_arg1, f5_arg2 )
		CoD.Menu.SetButtonLabel( f5_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( List0 )
	self.List0 = List0
	
	local VerticalListSpacer1 = CoD.VerticalListSpacer.new( menu, controller )
	VerticalListSpacer1:setLeftRight( true, false, 0, 403 )
	VerticalListSpacer1:setTopBottom( true, false, 320.5, 331.5 )
	self:addElement( VerticalListSpacer1 )
	self.VerticalListSpacer1 = VerticalListSpacer1
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( true, false, 18.4, 294 )
	Title:setTopBottom( true, false, 331.5, 351.5 )
	Title:setTTF( "fonts/default.ttf" )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Title )
	self.Title = Title
	
	Title:linkToElementModel( List0, "description", true, function ( model )
		local description = Engine.GetModelValue( model )
		if description then
			Title:setText( Engine.Localize( description ) )
		end
	end )
	List0.id = "List0"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.List0:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.VerticalListSpacer0:close()
		element.List0:close()
		element.VerticalListSpacer1:close()
		element.Title:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
