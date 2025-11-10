require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_Layout_ForegroundMultilineText" )
require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithInputButton" )
require( "ui.uieditor.widgets.Lobby.Common.List1ButtonLarge_Left_ND" )

CoD.systemOverlay_Layout_CreateVariantName = InheritFrom( LUI.UIElement )
CoD.systemOverlay_Layout_CreateVariantName.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.systemOverlay_Layout_CreateVariantName )
	self.id = "systemOverlay_Layout_CreateVariantName"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 320 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local title = LUI.UITightText.new()
	title:setLeftRight( true, false, 421, 621 )
	title:setTopBottom( true, false, 10, 40 )
	title:setTTF( "fonts/escom.ttf" )
	title:linkToElementModel( self, "title", true, function ( model )
		local _title = Engine.GetModelValue( model )
		if _title then
			title:setText( Engine.Localize( _title ) )
		end
	end )
	self:addElement( title )
	self.title = title
	
	local text = CoD.systemOverlay_Layout_ForegroundMultilineText.new( menu, controller )
	text:setLeftRight( true, false, 423, 1218 )
	text:setTopBottom( true, false, 40, 60 )
	text:linkToElementModel( self, "description", true, function ( model )
		local description = Engine.GetModelValue( model )
		if description then
			text.text:setText( Engine.Localize( description ) )
		end
	end )
	self:addElement( text )
	self.text = text
	
	local input = CoD.GunsmithInputButton.new( menu, controller )
	input:setLeftRight( true, false, 423, 808 )
	input:setTopBottom( true, false, 97, 144 )
	input:linkToElementModel( self, nil, false, function ( model )
		input:setModel( model, controller )
	end )
	input:linkToElementModel( self, "inputText", true, function ( model )
		local inputText = Engine.GetModelValue( model )
		if inputText then
			input.Text:setText( inputText )
		end
	end )
	input:registerEventHandler( "ui_keyboard_input", function ( element, event )
		local f6_local0 = nil
		Gunsmith_HandleKeyboardComplete( self, element, controller, event )
		if not f6_local0 then
			f6_local0 = element:dispatchEventToChildren( event )
		end
		return f6_local0
	end )
	input:registerEventHandler( "gain_focus", function ( element, event )
		local f7_local0 = nil
		if element.gainFocus then
			f7_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f7_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f7_local0
	end )
	input:registerEventHandler( "lose_focus", function ( element, event )
		local f8_local0 = nil
		if element.loseFocus then
			f8_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f8_local0 = element.super:loseFocus( event )
		end
		return f8_local0
	end )
	menu:AddButtonCallbackFunction( input, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ProcessKeyboardCompleteAction( self, element, controller, menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( input )
	self.input = input
	
	local image = LUI.UIImage.new()
	image:setLeftRight( true, false, 66, 392 )
	image:setTopBottom( true, false, 6.5, 219.5 )
	image:setImage( RegisterImage( "uie_t7_menu_gunsmith_nameyourvariant" ) )
	self:addElement( image )
	self.image = image
	
	local welcomeTitle = LUI.UIText.new()
	welcomeTitle:setLeftRight( true, false, 66, 392 )
	welcomeTitle:setTopBottom( true, false, 231.86, 256.86 )
	welcomeTitle:setText( Engine.Localize( "MENU_GUNSMITH_WELCOME_TITLE" ) )
	welcomeTitle:setTTF( "fonts/escom.ttf" )
	welcomeTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	welcomeTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( welcomeTitle )
	self.welcomeTitle = welcomeTitle
	
	local welcomeSubtitle = LUI.UIText.new()
	welcomeSubtitle:setLeftRight( true, false, 66, 392 )
	welcomeSubtitle:setTopBottom( true, false, 256.86, 281.86 )
	welcomeSubtitle:setText( Engine.Localize( "MENU_GUNSMITH_WELCOME_SUBTITLE" ) )
	welcomeSubtitle:setTTF( "fonts/default.ttf" )
	welcomeSubtitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	welcomeSubtitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( welcomeSubtitle )
	self.welcomeSubtitle = welcomeSubtitle
	
	local confirmButton = CoD.List1ButtonLarge_Left_ND.new( menu, controller )
	confirmButton:setLeftRight( true, false, 423, 703 )
	confirmButton:setTopBottom( true, false, 160, 192 )
	confirmButton.btnDisplayText:setText( Engine.Localize( "MENU_CONFIRM_CAPS" ) )
	confirmButton.btnDisplayTextStroke:setText( Engine.Localize( "MENU_CONFIRM_CAPS" ) )
	confirmButton:registerEventHandler( "gain_focus", function ( element, event )
		local f11_local0 = nil
		if element.gainFocus then
			f11_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f11_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f11_local0
	end )
	confirmButton:registerEventHandler( "lose_focus", function ( element, event )
		local f12_local0 = nil
		if element.loseFocus then
			f12_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f12_local0 = element.super:loseFocus( event )
		end
		return f12_local0
	end )
	menu:AddButtonCallbackFunction( confirmButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ProcessConfirmVariantNameAction( self, element, controller, menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	confirmButton:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return not Gunsmith_ValidVariantNameEntered( element, controller )
			end
		}
	} )
	confirmButton:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Gunsmith.validVariantNameEntered" ), function ( model )
		menu:updateElementState( confirmButton, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "Gunsmith.validVariantNameEntered"
		} )
	end )
	self:addElement( confirmButton )
	self.confirmButton = confirmButton
	
	input.navigation = {
		down = confirmButton
	}
	confirmButton.navigation = {
		up = input
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	input.id = "input"
	confirmButton.id = "confirmButton"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.input:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.text:close()
		element.input:close()
		element.confirmButton:close()
		element.title:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

