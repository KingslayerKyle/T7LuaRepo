-- af4e4be8a184ca217d395d4373c1b665
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Social.Social_background" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )
require( "ui.uieditor.widgets.Social.Social_PlayersListButton_Presence" )
require( "ui.uieditor.widgets.Social.Social_PlayersListButton_Joinable" )
require( "ui.uieditor.widgets.Social.Social_PartyLeaderIconLarge" )
require( "ui.uieditor.widgets.Social.Social_PartyMemberIconLarge" )

CoD.GroupsRosterRowInternal = InheritFrom( LUI.UIElement )
CoD.GroupsRosterRowInternal.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GroupsRosterRowInternal )
	self.id = "GroupsRosterRowInternal"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 374 )
	self:setTopBottom( true, false, 0, 60 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local Socialbackground00 = CoD.Social_background.new( menu, controller )
	Socialbackground00:setLeftRight( true, false, 97.47, 374 )
	Socialbackground00:setTopBottom( true, false, 0, 60 )
	self:addElement( Socialbackground00 )
	self.Socialbackground00 = Socialbackground00
	
	local Socialbackground000 = CoD.Social_background.new( menu, controller )
	Socialbackground000:setLeftRight( true, false, 0, 96 )
	Socialbackground000:setTopBottom( true, false, 0, 59.75 )
	self:addElement( Socialbackground000 )
	self.Socialbackground000 = Socialbackground000
	
	local emblem = LUI.UIImage.new()
	emblem:setLeftRight( true, false, 0, 96 )
	emblem:setTopBottom( true, true, 0, 0 )
	emblem:linkToElementModel( self, "xuid", true, function ( model )
		local xuid = Engine.GetModelValue( model )
		if xuid then
			emblem:setupPlayerEmblemByXUID( xuid )
		end
	end )
	self:addElement( emblem )
	self.emblem = emblem
	
	local gamertag = LUI.UIText.new()
	gamertag:setLeftRight( true, false, 109, 334 )
	gamertag:setTopBottom( false, false, -20, 0 )
	gamertag:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	gamertag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	gamertag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	gamertag:linkToElementModel( self, "gamertag", true, function ( model )
		local _gamertag = Engine.GetModelValue( model )
		if _gamertag then
			gamertag:setText( _gamertag )
		end
	end )
	self:addElement( gamertag )
	self.gamertag = gamertag
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( true, true, -2, 2 )
	FocusBarT:setTopBottom( true, false, -4, 0 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( true, true, -2, 2 )
	FocusBarB:setTopBottom( false, true, 0, 4 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local FocusBorder = CoD.FE_TitleNumBrdr.new( menu, controller )
	FocusBorder:setLeftRight( true, true, 0, 0 )
	FocusBorder:setTopBottom( true, true, -0.5, 0 )
	FocusBorder:setRGB( 1, 0.3, 0 )
	FocusBorder:setAlpha( 0 )
	self:addElement( FocusBorder )
	self.FocusBorder = FocusBorder
	
	local glitch = LUI.UIImage.new()
	glitch:setLeftRight( true, true, -12, 7 )
	glitch:setTopBottom( true, false, -8.75, 4.75 )
	glitch:setRGB( 1, 0.09, 0 )
	glitch:setImage( RegisterImage( "uie_t7_effect_glitches_menu10" ) )
	glitch:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( glitch )
	self.glitch = glitch
	
	local glitch2 = LUI.UIImage.new()
	glitch2:setLeftRight( true, true, -8.5, 8.5 )
	glitch2:setTopBottom( false, true, -6, 9 )
	glitch2:setRGB( 1, 0.15, 0 )
	glitch2:setImage( RegisterImage( "uie_t7_effect_glitches_menu10" ) )
	glitch2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( glitch2 )
	self.glitch2 = glitch2
	
	local presence = CoD.Social_PlayersListButton_Presence.new( menu, controller )
	presence:setLeftRight( true, false, 107, 371 )
	presence:setTopBottom( true, false, 32, 57 )
	presence.lastMet:setText( Engine.Localize( "" ) )
	presence:linkToElementModel( self, nil, false, function ( model )
		presence:setModel( model, controller )
	end )
	presence:linkToElementModel( self, "presence", true, function ( model )
		local _presence = Engine.GetModelValue( model )
		if _presence then
			presence.platformPresenceScroller.textBox:setText( Engine.Localize( PlatformPresenceToLocalizedString( _presence ) ) )
		end
	end )
	presence:linkToElementModel( self, "presence", true, function ( model )
		local _presence = Engine.GetModelValue( model )
		if _presence then
			presence.titlePresenceScroller.textBox:setText( Engine.Localize( PresenceActivityToModeString( _presence ) ) )
		end
	end )
	self:addElement( presence )
	self.presence = presence
	
	local joinable = CoD.Social_PlayersListButton_Joinable.new( menu, controller )
	joinable:setLeftRight( false, false, 163, 179 )
	joinable:setTopBottom( true, false, 4.5, 28.5 )
	joinable:linkToElementModel( self, nil, false, function ( model )
		joinable:setModel( model, controller )
	end )
	self:addElement( joinable )
	self.joinable = joinable
	
	local SocialPartyLeaderIconLarge0 = CoD.Social_PartyLeaderIconLarge.new( menu, controller )
	SocialPartyLeaderIconLarge0:setLeftRight( true, false, 376, 400 )
	SocialPartyLeaderIconLarge0:setTopBottom( true, false, 0.25, 59.75 )
	SocialPartyLeaderIconLarge0:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	self:addElement( SocialPartyLeaderIconLarge0 )
	self.SocialPartyLeaderIconLarge0 = SocialPartyLeaderIconLarge0
	
	local SocialPartyMemberIconLarge0 = CoD.Social_PartyMemberIconLarge.new( menu, controller )
	SocialPartyMemberIconLarge0:setLeftRight( false, true, 3, 9 )
	SocialPartyMemberIconLarge0:setTopBottom( true, true, 1, -1.25 )
	SocialPartyMemberIconLarge0:mergeStateConditions( {
		{
			stateName = "PartyMember",
			condition = function ( menu, element, event )
				return ParentPropertyIsTrue( self, "isPartyMember" ) and AlwaysFalse()
			end
		}
	} )
	self:addElement( SocialPartyMemberIconLarge0 )
	self.SocialPartyMemberIconLarge0 = SocialPartyMemberIconLarge0
	
	local pixel = LUI.UIImage.new()
	pixel:setLeftRight( false, true, -5, 3.5 )
	pixel:setTopBottom( true, false, -3, 5.5 )
	pixel:setAlpha( 0.15 )
	pixel:setImage( RegisterImage( "uie_t7_menu_social_pixel" ) )
	self:addElement( pixel )
	self.pixel = pixel
	
	local pixel0 = LUI.UIImage.new()
	pixel0:setLeftRight( false, true, -5, 3.5 )
	pixel0:setTopBottom( false, true, -5.5, 3 )
	pixel0:setAlpha( 0.15 )
	pixel0:setImage( RegisterImage( "uie_t7_menu_social_pixel" ) )
	self:addElement( pixel0 )
	self.pixel0 = pixel0
	
	local pixel1 = LUI.UIImage.new()
	pixel1:setLeftRight( false, true, -378.25, -369.75 )
	pixel1:setTopBottom( true, false, -4, 4.5 )
	pixel1:setAlpha( 0.15 )
	pixel1:setImage( RegisterImage( "uie_t7_menu_social_pixel" ) )
	self:addElement( pixel1 )
	self.pixel1 = pixel1
	
	local pixel00 = LUI.UIImage.new()
	pixel00:setLeftRight( false, true, -378.25, -369.75 )
	pixel00:setTopBottom( false, true, -4.5, 4 )
	pixel00:setAlpha( 0.15 )
	pixel00:setImage( RegisterImage( "uie_t7_menu_social_pixel" ) )
	self:addElement( pixel00 )
	self.pixel00 = pixel00
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Socialbackground00:close()
		element.Socialbackground000:close()
		element.FocusBarT:close()
		element.FocusBarB:close()
		element.FocusBorder:close()
		element.presence:close()
		element.joinable:close()
		element.SocialPartyLeaderIconLarge0:close()
		element.SocialPartyMemberIconLarge0:close()
		element.emblem:close()
		element.gamertag:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

