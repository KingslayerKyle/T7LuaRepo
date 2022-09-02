-- 397f73ee8a9afd11d9bbe424c5e95a0d
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Chat.ChannelSelectorButton" )

local PostLoadFunc = function ( self, controller, menu )
	self.ChannelSelectorButtonParty.id = "ChannelSelectorButtonParty"
	self.ChannelSelectorButtonTeam.id = "ChannelSelectorButtonTeam"
	self.ChannelSelectorButtonAll.id = "ChannelSelectorButtonAll"
	local f1_local0 = function ( f2_arg0, f2_arg1 )
		ChatClientInputChannelSelectorHide( self, f2_arg0, controller )
		ChatClientInputStart( self, f2_arg0, controller, f2_arg0.inputChannelToStart )
	end
	
	self.ChannelSelectorButtonParty.inputChannelToStart = "Party"
	self.ChannelSelectorButtonTeam.inputChannelToStart = "Team"
	self.ChannelSelectorButtonAll.inputChannelToStart = "All"
	self.ChannelSelectorButtonParty:registerEventHandler( "leftmouseup", f1_local0 )
	self.ChannelSelectorButtonTeam:registerEventHandler( "leftmouseup", f1_local0 )
	self.ChannelSelectorButtonAll:registerEventHandler( "leftmouseup", f1_local0 )
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
	self:setTopBottom( true, false, 0, 76 )
	self.anyChildUsesUpdateState = true
	
	local greyBG = LUI.UIImage.new()
	greyBG:setLeftRight( true, false, 3, 106 )
	greyBG:setTopBottom( true, false, 1, 71 )
	greyBG:setRGB( 0, 0, 0 )
	self:addElement( greyBG )
	self.greyBG = greyBG
	
	local BackGroundImage = LUI.UIImage.new()
	BackGroundImage:setLeftRight( true, true, 3, -4 )
	BackGroundImage:setTopBottom( true, true, 1, -59 )
	BackGroundImage:setRGB( 0, 0, 0 )
	self:addElement( BackGroundImage )
	self.BackGroundImage = BackGroundImage
	
	local ChannelsLabel = LUI.UIText.new()
	ChannelsLabel:setLeftRight( true, false, 4, 60 )
	ChannelsLabel:setTopBottom( true, false, 1, 15 )
	ChannelsLabel:setText( Engine.Localize( "PLATFORM_CHAT_CHANNELS_CAP" ) )
	ChannelsLabel:setTTF( "fonts/default.ttf" )
	ChannelsLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ChannelsLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ChannelsLabel )
	self.ChannelsLabel = ChannelsLabel
	
	local ChannelSelectorButtonParty = CoD.ChannelSelectorButton.new( menu, controller )
	ChannelSelectorButtonParty:setLeftRight( true, false, 3, 106 )
	ChannelSelectorButtonParty:setTopBottom( true, false, 56.5, 70.5 )
	ChannelSelectorButtonParty.ChannelLabel:setText( Engine.Localize( "PLATFORM_CHAT_CHANNEL_SELECT_PARTY" ) )
	ChannelSelectorButtonParty:linkToElementModel( self, "partyChannel.color", true, function ( model )
		local partyChannelColor = Engine.GetModelValue( model )
		if partyChannelColor then
			ChannelSelectorButtonParty.ChannelLabel:setRGB( partyChannelColor )
		end
	end )
	self:addElement( ChannelSelectorButtonParty )
	self.ChannelSelectorButtonParty = ChannelSelectorButtonParty
	
	local ChannelSelectorButtonTeam = CoD.ChannelSelectorButton.new( menu, controller )
	ChannelSelectorButtonTeam:setLeftRight( true, false, 3, 106 )
	ChannelSelectorButtonTeam:setTopBottom( true, false, 38, 52 )
	ChannelSelectorButtonTeam.ChannelLabel:setText( Engine.Localize( "PLATFORM_CHAT_CHANNEL_SELECT_TEAM" ) )
	ChannelSelectorButtonTeam:linkToElementModel( self, "teamChannel.color", true, function ( model )
		local teamChannelColor = Engine.GetModelValue( model )
		if teamChannelColor then
			ChannelSelectorButtonTeam.ChannelLabel:setRGB( teamChannelColor )
		end
	end )
	self:addElement( ChannelSelectorButtonTeam )
	self.ChannelSelectorButtonTeam = ChannelSelectorButtonTeam
	
	local ChannelSelectorButtonAll = CoD.ChannelSelectorButton.new( menu, controller )
	ChannelSelectorButtonAll:setLeftRight( true, false, 3, 106 )
	ChannelSelectorButtonAll:setTopBottom( true, false, 19.5, 33.5 )
	ChannelSelectorButtonAll.ChannelLabel:setText( Engine.Localize( "PLATFORM_CHAT_CHANNEL_SELECT_ALL" ) )
	ChannelSelectorButtonAll:linkToElementModel( self, "allChannel.color", true, function ( model )
		local allChannelColor = Engine.GetModelValue( model )
		if allChannelColor then
			ChannelSelectorButtonAll.ChannelLabel:setRGB( allChannelColor )
		end
	end )
	self:addElement( ChannelSelectorButtonAll )
	self.ChannelSelectorButtonAll = ChannelSelectorButtonAll
	
	local whiteline = LUI.UIImage.new()
	whiteline:setLeftRight( true, true, 3, -4 )
	whiteline:setTopBottom( false, true, -76, -72 )
	whiteline:setAlpha( 0.55 )
	whiteline:setImage( RegisterImage( "uie_t7_menu_frontend_featuredframeum" ) )
	whiteline:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( whiteline )
	self.whiteline = whiteline
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ChannelSelectorButtonParty:close()
		element.ChannelSelectorButtonTeam:close()
		element.ChannelSelectorButtonAll:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

