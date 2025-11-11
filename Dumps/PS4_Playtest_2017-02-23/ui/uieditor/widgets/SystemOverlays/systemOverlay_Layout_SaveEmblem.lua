require( "ui.uieditor.widgets.CAC.Customization.CACGenericButton" )
require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithInputButton" )
require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_Layout_ForegroundMultilineText" )

CoD.systemOverlay_Layout_SaveEmblem = InheritFrom( LUI.UIElement )
CoD.systemOverlay_Layout_SaveEmblem.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.systemOverlay_Layout_SaveEmblem )
	self.id = "systemOverlay_Layout_SaveEmblem"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1920 )
	self:setTopBottom( 0, 0, 0, 480 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local categoryTypeImage = LUI.UIImage.new()
	categoryTypeImage:setLeftRight( 0, 0, 576, 621 )
	categoryTypeImage:setTopBottom( 0, 0, 17, 62 )
	categoryTypeImage:linkToElementModel( self, "categoryType", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			categoryTypeImage:setImage( RegisterImage( GetCategoryIconForOverlayType( modelValue ) ) )
		end
	end )
	self:addElement( categoryTypeImage )
	self.categoryTypeImage = categoryTypeImage
	
	local title = LUI.UITightText.new()
	title:setLeftRight( 0, 0, 632, 932 )
	title:setTopBottom( 0, 0, 15, 60 )
	title:setTTF( "fonts/escom.ttf" )
	title:linkToElementModel( self, "title", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			title:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( title )
	self.title = title
	
	local text = CoD.systemOverlay_Layout_ForegroundMultilineText.new( menu, controller )
	text:setLeftRight( 0, 0, 635, 1827 )
	text:setTopBottom( 0, 0, 60, 90 )
	text:linkToElementModel( self, "description", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			text.text:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( text )
	self.text = text
	
	local options = LUI.UIList.new( menu, controller, 4, 0, nil, false, false, 0, 0, false, false )
	options:makeFocusable()
	options:setLeftRight( 0, 0, 318, 1440 )
	options:setTopBottom( 0, 0, 278, 378 )
	options:setWidgetType( CoD.CACGenericButton )
	options:setVerticalCount( 2 )
	options:setSpacing( 4 )
	options:linkToElementModel( self, "listDatasource", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			options:setDataSource( modelValue )
		end
	end )
	options:linkToElementModel( options, "disabled", true, function ( model )
		local element = options
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	options:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	options:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( options, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		if not IsDisabled( element, controller ) then
			ProcessListAction( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsDisabled( element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( options )
	self.options = options
	
	local input = CoD.GunsmithInputButton.new( menu, controller )
	input:setLeftRight( 0, 0, 634, 1212 )
	input:setTopBottom( 0, 0, 170, 240 )
	input.Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	input:linkToElementModel( self, nil, false, function ( model )
		input:setModel( model, controller )
	end )
	input:linkToElementModel( self, "inputText", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			input.Text:setText( modelValue )
		end
	end )
	input:registerEventHandler( "ui_keyboard_input", function ( element, event )
		local retVal = nil
		EmblemEditor_HandleKeyboardComplete( self, element, controller, event )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	input:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	input:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( input, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ProcessKeyboardCompleteAction( self, element, controller, menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( input )
	self.input = input
	
	local titleText = LUI.UIText.new()
	titleText:setLeftRight( 0, 0, 637, 1207 )
	titleText:setTopBottom( 0, 0, 126, 164 )
	titleText:setText( Engine.Localize( "MPUI_TITLE" ) )
	titleText:setTTF( "fonts/default.ttf" )
	titleText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	titleText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( titleText )
	self.titleText = titleText
	
	options.navigation = {
		up = input
	}
	input.navigation = {
		down = options
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	options.id = "options"
	input.id = "input"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.options:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.text:close()
		self.options:close()
		self.input:close()
		self.categoryTypeImage:close()
		self.title:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

