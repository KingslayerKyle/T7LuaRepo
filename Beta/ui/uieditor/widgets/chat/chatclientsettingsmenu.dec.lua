require( "ui.uieditor.widgets.Chat.CheckboxWithLabel" )
require( "ui.uieditor.widgets.ChannelFilterOptionsContainer" )

local PostLoadFunc = function ( self, controller, menu )
	self.ShowTimestamps.id = "ShowTimestamps"
	self.ShowChannels.id = "ShowChannels"
	self.ChannelFilterOptionsContainerParty.id = "ChannelFilterOptionsContainerParty"
	self.ChannelFilterOptionsContainerTeam.id = "ChannelFilterOptionsContainerTeam"
	self.ChannelFilterOptionsContainerAll.id = "ChannelFilterOptionsContainerAll"
end

CoD.ChatClientSettingsMenu = InheritFrom( LUI.UIElement )
CoD.ChatClientSettingsMenu.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ChatClientSettingsMenu )
	self.id = "ChatClientSettingsMenu"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 110 )
	self:setTopBottom( true, false, 0, 110 )
	self.anyChildUsesUpdateState = true
	
	local BackGroundImage = LUI.UIImage.new()
	BackGroundImage:setLeftRight( true, false, 0, 110 )
	BackGroundImage:setTopBottom( true, false, 0, 110 )
	BackGroundImage:setRGB( 0, 0, 0 )
	BackGroundImage:setAlpha( 0.7 )
	self:addElement( BackGroundImage )
	self.BackGroundImage = BackGroundImage
	
	local ShowChannels = CoD.CheckboxWithLabel.new( menu, controller )
	ShowChannels:setLeftRight( true, false, 3, 107 )
	ShowChannels:setTopBottom( true, false, 92, 106 )
	ShowChannels.label:setText( Engine.Localize( "PLATFORM_CHAT_SHOW_CHANNEL" ) )
	ShowChannels:subscribeToGlobalModel( controller, "ChatClientGlobal", "showChannel", function ( model )
		ShowChannels:setModel( model, controller )
	end )
	ShowChannels:subscribeToGlobalModel( controller, "ChatClientGlobal", "showChannel.checked", function ( model )
		local element = ShowChannels
		ChatClientShowChannelSet( self, element, controller, model )
	end )
	self:addElement( ShowChannels )
	self.ShowChannels = ShowChannels
	
	local ShowTimestamps = CoD.CheckboxWithLabel.new( menu, controller )
	ShowTimestamps:setLeftRight( true, false, 3, 107 )
	ShowTimestamps:setTopBottom( true, false, 76, 90 )
	ShowTimestamps.label:setText( Engine.Localize( "PLATFORM_CHAT_SHOW_TIMESTAMP" ) )
	ShowTimestamps:subscribeToGlobalModel( controller, "ChatClientGlobal", "showTimestamps", function ( model )
		ShowTimestamps:setModel( model, controller )
	end )
	ShowTimestamps:subscribeToGlobalModel( controller, "ChatClientGlobal", "showTimestamps.checked", function ( model )
		local element = ShowTimestamps
		ChatClientShowTimestampsSet( self, element, controller, model )
	end )
	self:addElement( ShowTimestamps )
	self.ShowTimestamps = ShowTimestamps
	
	local SwitchesLabel = LUI.UIText.new()
	SwitchesLabel:setLeftRight( true, false, 0, 57 )
	SwitchesLabel:setTopBottom( true, false, 62, 76 )
	SwitchesLabel:setText( Engine.Localize( "PLATFORM_CHAT_PREFIX_CAPS" ) )
	SwitchesLabel:setTTF( "fonts/default.ttf" )
	SwitchesLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	SwitchesLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( SwitchesLabel )
	self.SwitchesLabel = SwitchesLabel
	
	local ChannelFilterOptionsContainerParty = CoD.ChannelFilterOptionsContainer.new( menu, controller )
	ChannelFilterOptionsContainerParty:setLeftRight( true, false, 3, 107 )
	ChannelFilterOptionsContainerParty:setTopBottom( true, false, 46, 60 )
	ChannelFilterOptionsContainerParty.label:setText( Engine.Localize( "PLATFORM_CHAT_PARTY" ) )
	ChannelFilterOptionsContainerParty:subscribeToGlobalModel( controller, "ChatClientGlobal", "partyChannel", function ( model )
		ChannelFilterOptionsContainerParty:setModel( model, controller )
	end )
	ChannelFilterOptionsContainerParty:subscribeToGlobalModel( controller, "ChatClientGlobal", "partyChannel.checked", function ( model )
		local element = ChannelFilterOptionsContainerParty
		ChatClientFilterChannelSet( self, element, controller, "Party", model )
	end )
	self:addElement( ChannelFilterOptionsContainerParty )
	self.ChannelFilterOptionsContainerParty = ChannelFilterOptionsContainerParty
	
	local ChannelFilterOptionsContainerTeam = CoD.ChannelFilterOptionsContainer.new( menu, controller )
	ChannelFilterOptionsContainerTeam:setLeftRight( true, false, 3, 107 )
	ChannelFilterOptionsContainerTeam:setTopBottom( true, false, 30, 44 )
	ChannelFilterOptionsContainerTeam.label:setText( Engine.Localize( "PLATFORM_CHAT_TEAM" ) )
	ChannelFilterOptionsContainerTeam:subscribeToGlobalModel( controller, "ChatClientGlobal", "teamChannel", function ( model )
		ChannelFilterOptionsContainerTeam:setModel( model, controller )
	end )
	ChannelFilterOptionsContainerTeam:subscribeToGlobalModel( controller, "ChatClientGlobal", "teamChannel.checked", function ( model )
		local element = ChannelFilterOptionsContainerTeam
		ChatClientFilterChannelSet( self, element, controller, "Team", model )
	end )
	self:addElement( ChannelFilterOptionsContainerTeam )
	self.ChannelFilterOptionsContainerTeam = ChannelFilterOptionsContainerTeam
	
	local ChannelFilterOptionsContainerAll = CoD.ChannelFilterOptionsContainer.new( menu, controller )
	ChannelFilterOptionsContainerAll:setLeftRight( true, false, 3, 107 )
	ChannelFilterOptionsContainerAll:setTopBottom( true, false, 14, 28 )
	ChannelFilterOptionsContainerAll.label:setText( Engine.Localize( "PLATFORM_CHAT_ALL" ) )
	ChannelFilterOptionsContainerAll:subscribeToGlobalModel( controller, "ChatClientGlobal", "allChannel", function ( model )
		ChannelFilterOptionsContainerAll:setModel( model, controller )
	end )
	ChannelFilterOptionsContainerAll:subscribeToGlobalModel( controller, "ChatClientGlobal", "allChannel.checked", function ( model )
		local element = ChannelFilterOptionsContainerAll
		ChatClientFilterChannelSet( self, element, controller, "All", model )
	end )
	self:addElement( ChannelFilterOptionsContainerAll )
	self.ChannelFilterOptionsContainerAll = ChannelFilterOptionsContainerAll
	
	local ColorsLabel = LUI.UIText.new()
	ColorsLabel:setLeftRight( true, false, 55, 110 )
	ColorsLabel:setTopBottom( true, false, 0, 14 )
	ColorsLabel:setText( Engine.Localize( "PLATFORM_CHAT_COLOR_CAPS" ) )
	ColorsLabel:setTTF( "fonts/default.ttf" )
	ColorsLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	ColorsLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ColorsLabel )
	self.ColorsLabel = ColorsLabel
	
	local ChannelsLabel = LUI.UIText.new()
	ChannelsLabel:setLeftRight( true, false, 0, 56 )
	ChannelsLabel:setTopBottom( true, false, 0, 14 )
	ChannelsLabel:setText( Engine.Localize( "PLATFORM_CHAT_CHANNEL_CAPS" ) )
	ChannelsLabel:setTTF( "fonts/default.ttf" )
	ChannelsLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ChannelsLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ChannelsLabel )
	self.ChannelsLabel = ChannelsLabel
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				BackGroundImage:completeAnimation()
				self.BackGroundImage:setAlpha( 0.7 )
				self.clipFinished( BackGroundImage, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.ShowChannels:close()
		self.ShowTimestamps:close()
		self.ChannelFilterOptionsContainerParty:close()
		self.ChannelFilterOptionsContainerTeam:close()
		self.ChannelFilterOptionsContainerAll:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

