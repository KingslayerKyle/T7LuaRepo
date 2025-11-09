require( "ui.uieditor.widgets.Chat.checkboxNoLabel" )
require( "ui.uieditor.widgets.ChannelFilterColorButton" )

CoD.ChannelFilterOptionsContainer = InheritFrom( LUI.UIElement )
CoD.ChannelFilterOptionsContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ChannelFilterOptionsContainer )
	self.id = "ChannelFilterOptionsContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 104 )
	self:setTopBottom( true, false, 0, 14 )
	self.anyChildUsesUpdateState = true
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, false, 0, 104 )
	background:setTopBottom( true, false, 0, 14 )
	background:setRGB( 0.23, 0.23, 0.23 )
	self:addElement( background )
	self.background = background
	
	local checkboxNoLabel = CoD.checkboxNoLabel.new( menu, controller )
	checkboxNoLabel:setLeftRight( true, false, 0, 14 )
	checkboxNoLabel:setTopBottom( true, false, 0, 14 )
	checkboxNoLabel:linkToElementModel( self, nil, false, function ( model )
		checkboxNoLabel:setModel( model, controller )
	end )
	checkboxNoLabel:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	checkboxNoLabel:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( checkboxNoLabel, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ToggleSelfModelBoolean( self, element, controller, "checked" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "" )
		return false
	end, false )
	self:addElement( checkboxNoLabel )
	self.checkboxNoLabel = checkboxNoLabel
	
	local label = LUI.UIText.new()
	label:setLeftRight( true, false, 16, 88 )
	label:setTopBottom( true, false, 0, 14 )
	label:setText( Engine.Localize( "MENU_NEW" ) )
	label:setTTF( "fonts/default.ttf" )
	label:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	label:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( label )
	self.label = label
	
	local ChannelFilterColorButton = CoD.ChannelFilterColorButton.new( menu, controller )
	ChannelFilterColorButton:setLeftRight( true, false, 90, 104 )
	ChannelFilterColorButton:setTopBottom( true, false, 0, 14 )
	ChannelFilterColorButton:linkToElementModel( self, nil, false, function ( model )
		ChannelFilterColorButton:setModel( model, controller )
	end )
	ChannelFilterColorButton:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	ChannelFilterColorButton:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( ChannelFilterColorButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "" )
		return false
	end, false )
	self:addElement( ChannelFilterColorButton )
	self.ChannelFilterColorButton = ChannelFilterColorButton
	
	checkboxNoLabel.navigation = {
		right = ChannelFilterColorButton
	}
	ChannelFilterColorButton.navigation = {
		left = checkboxNoLabel
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ToggleSelfModelBoolean( self, element, controller, "checked" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "" )
		return false
	end, false )
	checkboxNoLabel.id = "checkboxNoLabel"
	ChannelFilterColorButton.id = "ChannelFilterColorButton"
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.checkboxNoLabel:close()
		self.ChannelFilterColorButton:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

