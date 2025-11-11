require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )
require( "ui.uieditor.widgets.Social.Social_background" )
require( "ui.uieditor.widgets.Social.Social_PartyLeaderIconLarge" )
require( "ui.uieditor.widgets.Social.Social_PartyMemberIconLarge" )
require( "ui.uieditor.widgets.Social.Social_PlayersListButton_Joinable" )
require( "ui.uieditor.widgets.Social.Social_PlayersListButton_Presence" )

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
	self:setLeftRight( 0, 0, 0, 561 )
	self:setTopBottom( 0, 0, 0, 90 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local Socialbackground00 = CoD.Social_background.new( menu, controller )
	Socialbackground00:setLeftRight( 0, 0, 146, 561 )
	Socialbackground00:setTopBottom( 0, 0, 0, 90 )
	self:addElement( Socialbackground00 )
	self.Socialbackground00 = Socialbackground00
	
	local Socialbackground000 = CoD.Social_background.new( menu, controller )
	Socialbackground000:setLeftRight( 0, 0, 0, 144 )
	Socialbackground000:setTopBottom( 0, 0, 0, 90 )
	self:addElement( Socialbackground000 )
	self.Socialbackground000 = Socialbackground000
	
	local emblem = LUI.UIImage.new()
	emblem:setLeftRight( 0, 0, 0, 144 )
	emblem:setTopBottom( 0, 1, 0, 0 )
	self:addElement( emblem )
	self.emblem = emblem
	
	local gamertag = LUI.UIText.new()
	gamertag:setLeftRight( 0, 0, 163, 501 )
	gamertag:setTopBottom( 0.5, 0.5, -30, 0 )
	gamertag:setText( Engine.Localize( "WWWWWWWWWWWWWW" ) )
	gamertag:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	gamertag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	gamertag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( gamertag )
	self.gamertag = gamertag
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( 0, 1, -3, 3 )
	FocusBarT:setTopBottom( 0, 0, -6, 0 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( 0, 1, -3, 3 )
	FocusBarB:setTopBottom( 1, 1, 0, 6 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local FocusBorder = CoD.FE_TitleNumBrdr.new( menu, controller )
	FocusBorder:setLeftRight( 0, 1, 0, 0 )
	FocusBorder:setTopBottom( 0, 1, 0, 0 )
	FocusBorder:setRGB( 1, 0.3, 0 )
	FocusBorder:setAlpha( 0 )
	self:addElement( FocusBorder )
	self.FocusBorder = FocusBorder
	
	local glitch = LUI.UIImage.new()
	glitch:setLeftRight( 0, 1, -18, 10 )
	glitch:setTopBottom( 0, 0, -13, 7 )
	glitch:setRGB( 1, 0.09, 0 )
	glitch:setImage( RegisterImage( "uie_t7_effect_glitches_menu10" ) )
	glitch:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( glitch )
	self.glitch = glitch
	
	local glitch2 = LUI.UIImage.new()
	glitch2:setLeftRight( 0, 1, -13, 13 )
	glitch2:setTopBottom( 1, 1, -9, 13 )
	glitch2:setRGB( 1, 0.15, 0 )
	glitch2:setImage( RegisterImage( "uie_t7_effect_glitches_menu10" ) )
	glitch2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( glitch2 )
	self.glitch2 = glitch2
	
	local presence = CoD.Social_PlayersListButton_Presence.new( menu, controller )
	presence:setLeftRight( 0, 0, 160, 556 )
	presence:setTopBottom( 0, 0, 48, 86 )
	presence.lastMet:setText( Engine.Localize( "" ) )
	presence:linkToElementModel( self, nil, false, function ( model )
		presence:setModel( model, controller )
	end )
	presence:linkToElementModel( self, "presence", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			presence.platformPresenceScroller.textBox:setText( PlatformPresenceToLocalizedString( modelValue ) )
		end
	end )
	presence:linkToElementModel( self, "presence", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			presence.titlePresenceScroller.textBox:setText( Engine.Localize( PresenceActivityToModeString( modelValue ) ) )
		end
	end )
	self:addElement( presence )
	self.presence = presence
	
	local joinable = CoD.Social_PlayersListButton_Joinable.new( menu, controller )
	joinable:setLeftRight( 0.5, 0.5, 244, 268 )
	joinable:setTopBottom( 0, 0, 7, 43 )
	joinable:linkToElementModel( self, nil, false, function ( model )
		joinable:setModel( model, controller )
	end )
	self:addElement( joinable )
	self.joinable = joinable
	
	local SocialPartyLeaderIconLarge0 = CoD.Social_PartyLeaderIconLarge.new( menu, controller )
	SocialPartyLeaderIconLarge0:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	SocialPartyLeaderIconLarge0:setLeftRight( 0, 0, 564, 600 )
	SocialPartyLeaderIconLarge0:setTopBottom( 0, 0, 1, 90 )
	self:addElement( SocialPartyLeaderIconLarge0 )
	self.SocialPartyLeaderIconLarge0 = SocialPartyLeaderIconLarge0
	
	local SocialPartyMemberIconLarge0 = CoD.Social_PartyMemberIconLarge.new( menu, controller )
	SocialPartyMemberIconLarge0:mergeStateConditions( {
		{
			stateName = "PartyMember",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	SocialPartyMemberIconLarge0:setLeftRight( 1, 1, 4.5, 13.5 )
	SocialPartyMemberIconLarge0:setTopBottom( 0, 1, 2, -2 )
	self:addElement( SocialPartyMemberIconLarge0 )
	self.SocialPartyMemberIconLarge0 = SocialPartyMemberIconLarge0
	
	local pixel = LUI.UIImage.new()
	pixel:setLeftRight( 1, 1, -8, 5 )
	pixel:setTopBottom( 0, 0, -5, 8 )
	pixel:setAlpha( 0.15 )
	pixel:setImage( RegisterImage( "uie_t7_menu_social_pixel" ) )
	self:addElement( pixel )
	self.pixel = pixel
	
	local pixel0 = LUI.UIImage.new()
	pixel0:setLeftRight( 1, 1, -8, 5 )
	pixel0:setTopBottom( 1, 1, -8, 5 )
	pixel0:setAlpha( 0.15 )
	pixel0:setImage( RegisterImage( "uie_t7_menu_social_pixel" ) )
	self:addElement( pixel0 )
	self.pixel0 = pixel0
	
	local pixel1 = LUI.UIImage.new()
	pixel1:setLeftRight( 1, 1, -567, -554 )
	pixel1:setTopBottom( 0, 0, -6, 7 )
	pixel1:setAlpha( 0.15 )
	pixel1:setImage( RegisterImage( "uie_t7_menu_social_pixel" ) )
	self:addElement( pixel1 )
	self.pixel1 = pixel1
	
	local pixel00 = LUI.UIImage.new()
	pixel00:setLeftRight( 1, 1, -567, -554 )
	pixel00:setTopBottom( 1, 1, -7, 6 )
	pixel00:setAlpha( 0.15 )
	pixel00:setImage( RegisterImage( "uie_t7_menu_social_pixel" ) )
	self:addElement( pixel00 )
	self.pixel00 = pixel00
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Socialbackground00:close()
		self.Socialbackground000:close()
		self.FocusBarT:close()
		self.FocusBarB:close()
		self.FocusBorder:close()
		self.presence:close()
		self.joinable:close()
		self.SocialPartyLeaderIconLarge0:close()
		self.SocialPartyMemberIconLarge0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

