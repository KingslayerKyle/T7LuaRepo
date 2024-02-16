require( "ui.uieditor.widgets.Chat.ChannelSelectorButton" )

local PostLoadFunc = function ( self, controller, menu )
	self.ChannelSelectorButtonParty.id = "ChannelSelectorButtonParty"
	self.ChannelSelectorButtonTeam.id = "ChannelSelectorButtonTeam"
	self.ChannelSelectorButtonAll.id = "ChannelSelectorButtonAll"
end

CoD.ChatClientChannelSelectorMenu = InheritFrom( LUI.UIElement )
CoD.ChatClientChannelSelectorMenu.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ChatClientChannelSelectorMenu )
	self.id = "ChatClientChannelSelectorMenu"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 110 )
	self:setTopBottom( true, false, 0, 64 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local BackGroundImage = LUI.UIImage.new()
	BackGroundImage:setLeftRight( true, true, 0, 0 )
	BackGroundImage:setTopBottom( true, true, 0, 0 )
	BackGroundImage:setRGB( 0, 0, 0 )
	self:addElement( BackGroundImage )
	self.BackGroundImage = BackGroundImage
	
	local ChannelsLabel = LUI.UIText.new()
	ChannelsLabel:setLeftRight( true, false, 0, 56 )
	ChannelsLabel:setTopBottom( true, false, 0, 14 )
	ChannelsLabel:setText( Engine.Localize( "PLATFORM_CHAT_CHANNELS_CAP" ) )
	ChannelsLabel:setTTF( "fonts/default.ttf" )
	ChannelsLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ChannelsLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ChannelsLabel )
	self.ChannelsLabel = ChannelsLabel
	
	local ChannelSelectorButtonParty = CoD.ChannelSelectorButton.new( menu, controller )
	ChannelSelectorButtonParty:setLeftRight( true, false, 3, 106 )
	ChannelSelectorButtonParty:setTopBottom( true, false, 46, 60 )
	ChannelSelectorButtonParty.ChannelLabel:setText( Engine.Localize( "PLATFORM_CHAT_CHANNEL_SELECT_PARTY" ) )
	ChannelSelectorButtonParty:linkToElementModel( self, "partyChannel.color", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ChannelSelectorButtonParty.ChannelLabel:setRGB( modelValue )
		end
	end )
	ChannelSelectorButtonParty:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	ChannelSelectorButtonParty:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( ChannelSelectorButtonParty, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ChatClientInputChannelSelectorHide( self, element, controller )
		ChatClientInputStart( self, element, controller, "Party" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "" )
		return false
	end, false )
	self:addElement( ChannelSelectorButtonParty )
	self.ChannelSelectorButtonParty = ChannelSelectorButtonParty
	
	local ChannelSelectorButtonTeam = CoD.ChannelSelectorButton.new( menu, controller )
	ChannelSelectorButtonTeam:setLeftRight( true, false, 3, 106 )
	ChannelSelectorButtonTeam:setTopBottom( true, false, 30, 44 )
	ChannelSelectorButtonTeam.ChannelLabel:setText( Engine.Localize( "PLATFORM_CHAT_CHANNEL_SELECT_TEAM" ) )
	ChannelSelectorButtonTeam:linkToElementModel( self, "teamChannel.color", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ChannelSelectorButtonTeam.ChannelLabel:setRGB( modelValue )
		end
	end )
	ChannelSelectorButtonTeam:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	ChannelSelectorButtonTeam:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( ChannelSelectorButtonTeam, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ChatClientInputChannelSelectorHide( self, element, controller )
		ChatClientInputStart( self, element, controller, "Team" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "" )
		return false
	end, false )
	self:addElement( ChannelSelectorButtonTeam )
	self.ChannelSelectorButtonTeam = ChannelSelectorButtonTeam
	
	local ChannelSelectorButtonAll = CoD.ChannelSelectorButton.new( menu, controller )
	ChannelSelectorButtonAll:setLeftRight( true, false, 3, 106 )
	ChannelSelectorButtonAll:setTopBottom( true, false, 14, 28 )
	ChannelSelectorButtonAll.ChannelLabel:setText( Engine.Localize( "PLATFORM_CHAT_CHANNEL_SELECT_ALL" ) )
	ChannelSelectorButtonAll:linkToElementModel( self, "allChannel.color", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ChannelSelectorButtonAll.ChannelLabel:setRGB( modelValue )
		end
	end )
	ChannelSelectorButtonAll:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	ChannelSelectorButtonAll:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( ChannelSelectorButtonAll, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ChatClientInputChannelSelectorHide( self, element, controller )
		ChatClientInputStart( self, element, controller, "All" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "" )
		return false
	end, false )
	self:addElement( ChannelSelectorButtonAll )
	self.ChannelSelectorButtonAll = ChannelSelectorButtonAll
	
	ChannelSelectorButtonParty.navigation = {
		up = ChannelSelectorButtonTeam
	}
	ChannelSelectorButtonTeam.navigation = {
		up = ChannelSelectorButtonAll,
		down = ChannelSelectorButtonParty
	}
	ChannelSelectorButtonAll.navigation = {
		down = ChannelSelectorButtonTeam
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	ChannelSelectorButtonParty.id = "ChannelSelectorButtonParty"
	ChannelSelectorButtonTeam.id = "ChannelSelectorButtonTeam"
	ChannelSelectorButtonAll.id = "ChannelSelectorButtonAll"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.ChannelSelectorButtonTeam:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.ChannelSelectorButtonParty:close()
		self.ChannelSelectorButtonTeam:close()
		self.ChannelSelectorButtonAll:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

