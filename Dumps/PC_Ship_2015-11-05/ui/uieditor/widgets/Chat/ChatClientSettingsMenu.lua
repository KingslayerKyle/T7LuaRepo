require( "ui.uieditor.widgets.Chat.CheckboxWithLabel" )
require( "ui.uieditor.widgets.ChannelFilterOptionsContainer" )

local PostLoadFunc = function ( self, controller, menu )
	self.ShowTimestamps.id = "ShowTimestamps"
	self.ShowChannels.id = "ShowChannels"
	self.ChannelFilterOptionsContainerParty.id = "ChannelFilterOptionsContainerParty"
	self.ChannelFilterOptionsContainerTeam.id = "ChannelFilterOptionsContainerTeam"
	self.ChannelFilterOptionsContainerAll.id = "ChannelFilterOptionsContainerAll"
	local f1_local0 = function ( f2_arg0, f2_arg1 )
		ToggleSelfModelBoolean( f2_arg0, f2_arg0, f2_arg1.controller, "checked" )
	end
	
	self.ShowTimestamps:registerEventHandler( "leftmouseup", f1_local0 )
	self.ShowChannels:registerEventHandler( "leftmouseup", f1_local0 )
	self.ChannelFilterOptionsContainerParty:registerEventHandler( "leftmouseup", f1_local0 )
	self.ChannelFilterOptionsContainerTeam:registerEventHandler( "leftmouseup", f1_local0 )
	self.ChannelFilterOptionsContainerAll:registerEventHandler( "leftmouseup", f1_local0 )
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
	self:setTopBottom( true, false, 0, 123 )
	self.anyChildUsesUpdateState = true
	
	local greyBG = LUI.UIImage.new()
	greyBG:setLeftRight( true, false, 4, 106.5 )
	greyBG:setTopBottom( true, false, 1, 120.5 )
	greyBG:setRGB( 0, 0, 0 )
	self:addElement( greyBG )
	self.greyBG = greyBG
	
	local BackGroundImageTop = LUI.UIImage.new()
	BackGroundImageTop:setLeftRight( true, false, 3, 107 )
	BackGroundImageTop:setTopBottom( true, false, 1, 18 )
	BackGroundImageTop:setRGB( 0, 0, 0 )
	BackGroundImageTop:setAlpha( 0.9 )
	self:addElement( BackGroundImageTop )
	self.BackGroundImageTop = BackGroundImageTop
	
	local ShowChannels = CoD.CheckboxWithLabel.new( menu, controller )
	ShowChannels:setLeftRight( true, false, 3, 107 )
	ShowChannels:setTopBottom( true, false, 106, 120 )
	ShowChannels.label:setText( Engine.Localize( "PLATFORM_CHAT_SHOW_CHANNEL" ) )
	ShowChannels:subscribeToGlobalModel( controller, "ChatClientGlobal", "showChannel", function ( model )
		ShowChannels:setModel( model, controller )
	end )
	ShowChannels:subscribeToGlobalModel( controller, "ChatClientGlobal", "showChannel.checked", function ( model )
		ChatClientShowChannelSet( self, ShowChannels, controller, model )
	end )
	self:addElement( ShowChannels )
	self.ShowChannels = ShowChannels
	
	local ShowTimestamps = CoD.CheckboxWithLabel.new( menu, controller )
	ShowTimestamps:setLeftRight( true, false, 3, 107 )
	ShowTimestamps:setTopBottom( true, false, 89, 103 )
	ShowTimestamps.label:setText( Engine.Localize( "PLATFORM_CHAT_SHOW_TIMESTAMP" ) )
	ShowTimestamps:subscribeToGlobalModel( controller, "ChatClientGlobal", "showTimestamps", function ( model )
		ShowTimestamps:setModel( model, controller )
	end )
	ShowTimestamps:subscribeToGlobalModel( controller, "ChatClientGlobal", "showTimestamps.checked", function ( model )
		ChatClientShowTimestampsSet( self, ShowTimestamps, controller, model )
	end )
	self:addElement( ShowTimestamps )
	self.ShowTimestamps = ShowTimestamps
	
	local ChannelFilterOptionsContainerParty = CoD.ChannelFilterOptionsContainer.new( menu, controller )
	ChannelFilterOptionsContainerParty:setLeftRight( true, false, 3, 107 )
	ChannelFilterOptionsContainerParty:setTopBottom( true, false, 54, 68 )
	ChannelFilterOptionsContainerParty.label:setText( Engine.Localize( "PLATFORM_CHAT_PARTY" ) )
	ChannelFilterOptionsContainerParty:subscribeToGlobalModel( controller, "ChatClientGlobal", "partyChannel", function ( model )
		ChannelFilterOptionsContainerParty:setModel( model, controller )
	end )
	ChannelFilterOptionsContainerParty:subscribeToGlobalModel( controller, "ChatClientGlobal", "partyChannel.checked", function ( model )
		ChatClientFilterChannelSet( self, ChannelFilterOptionsContainerParty, controller, "Party", model )
	end )
	self:addElement( ChannelFilterOptionsContainerParty )
	self.ChannelFilterOptionsContainerParty = ChannelFilterOptionsContainerParty
	
	local ChannelFilterOptionsContainerTeam = CoD.ChannelFilterOptionsContainer.new( menu, controller )
	ChannelFilterOptionsContainerTeam:setLeftRight( true, false, 3, 107 )
	ChannelFilterOptionsContainerTeam:setTopBottom( true, false, 37, 51 )
	ChannelFilterOptionsContainerTeam.label:setText( Engine.Localize( "PLATFORM_CHAT_TEAM" ) )
	ChannelFilterOptionsContainerTeam:subscribeToGlobalModel( controller, "ChatClientGlobal", "teamChannel", function ( model )
		ChannelFilterOptionsContainerTeam:setModel( model, controller )
	end )
	ChannelFilterOptionsContainerTeam:subscribeToGlobalModel( controller, "ChatClientGlobal", "teamChannel.checked", function ( model )
		ChatClientFilterChannelSet( self, ChannelFilterOptionsContainerTeam, controller, "Team", model )
	end )
	self:addElement( ChannelFilterOptionsContainerTeam )
	self.ChannelFilterOptionsContainerTeam = ChannelFilterOptionsContainerTeam
	
	local ChannelFilterOptionsContainerAll = CoD.ChannelFilterOptionsContainer.new( menu, controller )
	ChannelFilterOptionsContainerAll:setLeftRight( true, false, 3, 107 )
	ChannelFilterOptionsContainerAll:setTopBottom( true, false, 20, 34 )
	ChannelFilterOptionsContainerAll.label:setText( Engine.Localize( "PLATFORM_CHAT_ALL" ) )
	ChannelFilterOptionsContainerAll:subscribeToGlobalModel( controller, "ChatClientGlobal", "allChannel", function ( model )
		ChannelFilterOptionsContainerAll:setModel( model, controller )
	end )
	ChannelFilterOptionsContainerAll:subscribeToGlobalModel( controller, "ChatClientGlobal", "allChannel.checked", function ( model )
		ChatClientFilterChannelSet( self, ChannelFilterOptionsContainerAll, controller, "All", model )
	end )
	self:addElement( ChannelFilterOptionsContainerAll )
	self.ChannelFilterOptionsContainerAll = ChannelFilterOptionsContainerAll
	
	local ColorsLabel = LUI.UIText.new()
	ColorsLabel:setLeftRight( true, false, 51, 106 )
	ColorsLabel:setTopBottom( true, false, 2, 16 )
	ColorsLabel:setAlpha( 0 )
	ColorsLabel:setText( Engine.Localize( "PLATFORM_CHAT_COLOR_CAPS" ) )
	ColorsLabel:setTTF( "fonts/default.ttf" )
	ColorsLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	ColorsLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ColorsLabel )
	self.ColorsLabel = ColorsLabel
	
	local ChannelsLabel = LUI.UIText.new()
	ChannelsLabel:setLeftRight( true, false, 4, 60 )
	ChannelsLabel:setTopBottom( true, false, 2, 16 )
	ChannelsLabel:setText( Engine.Localize( "PLATFORM_CHAT_CHANNEL_CAPS" ) )
	ChannelsLabel:setTTF( "fonts/default.ttf" )
	ChannelsLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ChannelsLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ChannelsLabel )
	self.ChannelsLabel = ChannelsLabel
	
	local BlackBGBottom = LUI.UIImage.new()
	BlackBGBottom:setLeftRight( true, false, 3, 107 )
	BlackBGBottom:setTopBottom( true, false, 72, 87 )
	BlackBGBottom:setRGB( 0, 0, 0 )
	BlackBGBottom:setAlpha( 0.9 )
	self:addElement( BlackBGBottom )
	self.BlackBGBottom = BlackBGBottom
	
	local SwitchesLabel = LUI.UIText.new()
	SwitchesLabel:setLeftRight( true, false, 4, 61 )
	SwitchesLabel:setTopBottom( true, false, 72, 86 )
	SwitchesLabel:setText( Engine.Localize( "PLATFORM_CHAT_PREFIX_CAPS" ) )
	SwitchesLabel:setTTF( "fonts/default.ttf" )
	SwitchesLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	SwitchesLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( SwitchesLabel )
	self.SwitchesLabel = SwitchesLabel
	
	local whiteLineTop = LUI.UIImage.new()
	whiteLineTop:setLeftRight( true, true, 4, -3 )
	whiteLineTop:setTopBottom( false, true, -123, -119 )
	whiteLineTop:setAlpha( 0.55 )
	whiteLineTop:setImage( RegisterImage( "uie_t7_menu_frontend_featuredframeum" ) )
	whiteLineTop:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( whiteLineTop )
	self.whiteLineTop = whiteLineTop
	
	local whitelineMid = LUI.UIImage.new()
	whitelineMid:setLeftRight( true, true, 4, -3 )
	whitelineMid:setTopBottom( false, true, -53, -49 )
	whitelineMid:setAlpha( 0.55 )
	whitelineMid:setImage( RegisterImage( "uie_t7_menu_frontend_featuredframeum" ) )
	whitelineMid:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( whitelineMid )
	self.whitelineMid = whitelineMid
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				BackGroundImageTop:completeAnimation()
				self.BackGroundImageTop:setAlpha( 0.7 )
				self.clipFinished( BackGroundImageTop, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ShowChannels:close()
		element.ShowTimestamps:close()
		element.ChannelFilterOptionsContainerParty:close()
		element.ChannelFilterOptionsContainerTeam:close()
		element.ChannelFilterOptionsContainerAll:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

