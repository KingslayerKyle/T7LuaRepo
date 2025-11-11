require( "ui.uieditor.widgets.GameSettings.GameSettings_OptionsButton" )
require( "ui.uieditor.widgets.PC.Utility.VerticalListSpacer" )

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
	self:setLeftRight( 0, 0, 0, 480 )
	self:setTopBottom( 0, 0, 0, 1080 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local VerticalListSpacer0 = CoD.VerticalListSpacer.new( menu, controller )
	VerticalListSpacer0:setLeftRight( 0, 0, 0, 480 )
	VerticalListSpacer0:setTopBottom( 0, 0, 0, 247 )
	self:addElement( VerticalListSpacer0 )
	self.VerticalListSpacer0 = VerticalListSpacer0
	
	local TextBox0 = LUI.UIText.new()
	TextBox0:setLeftRight( 0, 0, 28, 468 )
	TextBox0:setTopBottom( 0, 0, 247, 298 )
	TextBox0:setRGB( 1, 0.47, 0 )
	TextBox0:setText( Engine.Localize( "MENU_OPTIONS" ) )
	TextBox0:setTTF( "fonts/default.ttf" )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	local spacer = LUI.UIImage.new()
	spacer:setLeftRight( 0, 0, 68, 260 )
	spacer:setTopBottom( 0, 0, 298, 313 )
	spacer:setAlpha( 0 )
	self:addElement( spacer )
	self.spacer = spacer
	
	local List0 = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, false )
	List0:makeFocusable()
	List0:setLeftRight( 0, 0, 19, 401 )
	List0:setTopBottom( 0, 0, 314, 480 )
	List0:setWidgetType( CoD.GameSettings_OptionsButton )
	List0:setVerticalCount( 3 )
	List0:setDataSource( "GameSettingsOptions" )
	List0:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	List0:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( List0, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ProcessListAction( self, element, controller )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( List0 )
	self.List0 = List0
	
	local VerticalListSpacer1 = CoD.VerticalListSpacer.new( menu, controller )
	VerticalListSpacer1:setLeftRight( 0, 0, 0, 604 )
	VerticalListSpacer1:setTopBottom( 0, 0, 481, 497 )
	self:addElement( VerticalListSpacer1 )
	self.VerticalListSpacer1 = VerticalListSpacer1
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( 0, 0, 28, 441 )
	Title:setTopBottom( 0, 0, 497, 527 )
	Title:setTTF( "fonts/default.ttf" )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Title )
	self.Title = Title
	
	Title:linkToElementModel( List0, "description", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Title:setText( Engine.Localize( modelValue ) )
		end
	end )
	List0.id = "List0"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.List0:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.VerticalListSpacer0:close()
		self.List0:close()
		self.VerticalListSpacer1:close()
		self.Title:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

