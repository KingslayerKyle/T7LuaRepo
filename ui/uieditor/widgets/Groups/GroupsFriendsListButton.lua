-- 7045450ec959a8e4b0e483baf914c9ed
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveDiags" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgIdle" )
require( "ui.uieditor.widgets.Social.Social_background" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.Social.Social_PlayersListButton_Presence" )
require( "ui.uieditor.widgets.Social.Social_PlayersListButton_Joinable" )
require( "ui.uieditor.widgets.Social.Social_PartyLeaderIconLarge" )
require( "ui.uieditor.widgets.Social.Social_PartyMemberIconLarge" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )
require( "ui.uieditor.widgets.Groups.GroupsCheckbox" )

CoD.GroupsFriendsListButton = InheritFrom( LUI.UIElement )
CoD.GroupsFriendsListButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.GroupsFriendsListButton )
	self.id = "GroupsFriendsListButton"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 374 )
	self:setTopBottom( true, false, 0, 60 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local BoxButtonLrgInactiveDiag = CoD.cac_ButtonBoxLrgInactiveDiags.new( menu, controller )
	BoxButtonLrgInactiveDiag:setLeftRight( true, true, -2, 2 )
	BoxButtonLrgInactiveDiag:setTopBottom( true, true, -2, 2 )
	BoxButtonLrgInactiveDiag:setAlpha( 0 )
	self:addElement( BoxButtonLrgInactiveDiag )
	self.BoxButtonLrgInactiveDiag = BoxButtonLrgInactiveDiag
	
	local BoxButtonLrgInactive = CoD.cac_ButtonBoxLrgInactive.new( menu, controller )
	BoxButtonLrgInactive:setLeftRight( true, true, -2, 2 )
	BoxButtonLrgInactive:setTopBottom( true, true, -2, 2 )
	self:addElement( BoxButtonLrgInactive )
	self.BoxButtonLrgInactive = BoxButtonLrgInactive
	
	local BoxButtonLrgIdle = CoD.cac_ButtonBoxLrgIdle.new( menu, controller )
	BoxButtonLrgIdle:setLeftRight( true, true, -2, 2 )
	BoxButtonLrgIdle:setTopBottom( true, true, -2, 2 )
	self:addElement( BoxButtonLrgIdle )
	self.BoxButtonLrgIdle = BoxButtonLrgIdle
	
	local BlackTint = LUI.UIImage.new()
	BlackTint:setLeftRight( true, false, 0, 374 )
	BlackTint:setTopBottom( true, false, 0.25, 60 )
	BlackTint:setRGB( 0, 0, 0 )
	BlackTint:setAlpha( 0.2 )
	self:addElement( BlackTint )
	self.BlackTint = BlackTint
	
	local BlackTint0 = LUI.UIImage.new()
	BlackTint0:setLeftRight( true, false, 0, 374 )
	BlackTint0:setTopBottom( true, false, 0.25, 60 )
	BlackTint0:setRGB( 0, 0, 0 )
	BlackTint0:setAlpha( 0 )
	self:addElement( BlackTint0 )
	self.BlackTint0 = BlackTint0
	
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
	emblem:linkToElementModel( self, "identityBadge.xuid", true, function ( model )
		local identityBadgeXuid = Engine.GetModelValue( model )
		if identityBadgeXuid then
			emblem:setupPlayerEmblemByXUID( identityBadgeXuid )
		end
	end )
	self:addElement( emblem )
	self.emblem = emblem
	
	local gamertag = LUI.UIText.new()
	gamertag:setLeftRight( true, false, 103, 346 )
	gamertag:setTopBottom( false, false, -20, 0 )
	gamertag:setTTF( "fonts/escom.ttf" )
	gamertag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	gamertag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	gamertag:linkToElementModel( self, "fullname", true, function ( model )
		local fullname = Engine.GetModelValue( model )
		if fullname then
			gamertag:setText( fullname )
		end
	end )
	self:addElement( gamertag )
	self.gamertag = gamertag
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( true, true, -4.25, 2 )
	FocusBarT:setTopBottom( true, false, -4, 0 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( true, true, -4.25, 2 )
	FocusBarB:setTopBottom( false, true, 0, 4 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local glitch = LUI.UIImage.new()
	glitch:setLeftRight( true, true, -12, 7 )
	glitch:setTopBottom( true, false, -8.75, 4.75 )
	glitch:setRGB( 1, 0.09, 0 )
	glitch:setAlpha( 0 )
	glitch:setImage( RegisterImage( "uie_t7_effect_glitches_menu10" ) )
	glitch:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( glitch )
	self.glitch = glitch
	
	local glitch2 = LUI.UIImage.new()
	glitch2:setLeftRight( true, true, -8.5, 8.5 )
	glitch2:setTopBottom( false, true, -6, 9 )
	glitch2:setRGB( 1, 0.15, 0 )
	glitch2:setAlpha( 0 )
	glitch2:setImage( RegisterImage( "uie_t7_effect_glitches_menu10" ) )
	glitch2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( glitch2 )
	self.glitch2 = glitch2
	
	local presence = CoD.Social_PlayersListButton_Presence.new( menu, controller )
	presence:setLeftRight( true, false, 106, 366 )
	presence:setTopBottom( true, false, 32, 57 )
	presence:linkToElementModel( self, nil, false, function ( model )
		presence:setModel( model, controller )
	end )
	presence:linkToElementModel( self, "platformPresence", true, function ( model )
		local platformPresence = Engine.GetModelValue( model )
		if platformPresence then
			presence.platformPresenceScroller.textBox:setText( PlatformPresenceToLocalizedString( platformPresence ) )
		end
	end )
	presence:linkToElementModel( self, "activity", true, function ( model )
		local activity = Engine.GetModelValue( model )
		if activity then
			presence.titlePresenceScroller.textBox:setText( Engine.Localize( PresenceActivityToModeString( activity ) ) )
		end
	end )
	presence:linkToElementModel( self, "activity", true, function ( model )
		local activity = Engine.GetModelValue( model )
		if activity then
			presence.titlePresenceIcon:setImage( RegisterImage( PresenceActivityToIcon( activity ) ) )
		end
	end )
	presence:linkToElementModel( self, "titlePresence", true, function ( model )
		local titlePresence = Engine.GetModelValue( model )
		if titlePresence then
			presence.lastMet:setText( Engine.Localize( titlePresence ) )
		end
	end )
	presence:registerEventHandler( "menu_loaded", function ( element, event )
		local f9_local0 = nil
		SetupAutoHorizontalAlignArabicText( element )
		if not f9_local0 then
			f9_local0 = element:dispatchEventToChildren( event )
		end
		return f9_local0
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
			stateName = "PartyMemberTopOrMiddle",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "isPartyMemberTopOrMiddle" )
			end
		},
		{
			stateName = "PartyMember",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "OtherPartyMemberTopOrMiddle",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "isOtherMemberTopOrMiddle" )
			end
		},
		{
			stateName = "OtherPartyMember",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "isOtherMember" )
			end
		}
	} )
	SocialPartyMemberIconLarge0:linkToElementModel( SocialPartyMemberIconLarge0, "isPartyMemberTopOrMiddle", true, function ( model )
		menu:updateElementState( SocialPartyMemberIconLarge0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isPartyMemberTopOrMiddle"
		} )
	end )
	SocialPartyMemberIconLarge0:linkToElementModel( SocialPartyMemberIconLarge0, "isOtherMemberTopOrMiddle", true, function ( model )
		menu:updateElementState( SocialPartyMemberIconLarge0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isOtherMemberTopOrMiddle"
		} )
	end )
	SocialPartyMemberIconLarge0:linkToElementModel( SocialPartyMemberIconLarge0, "isOtherMember", true, function ( model )
		menu:updateElementState( SocialPartyMemberIconLarge0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isOtherMember"
		} )
	end )
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
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( false, false, -188.25, 189 )
	StartMenuframenoBG0:setTopBottom( true, true, -1, 2 )
	StartMenuframenoBG0:setAlpha( 0.6 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	local GroupsCheckbox = CoD.GroupsCheckbox.new( menu, controller )
	GroupsCheckbox:setLeftRight( true, false, 382, 396 )
	GroupsCheckbox:setTopBottom( true, false, 21.5, 35.5 )
	GroupsCheckbox:setScale( 1.2 )
	GroupsCheckbox:linkToElementModel( self, nil, false, function ( model )
		GroupsCheckbox:setModel( model, controller )
	end )
	self:addElement( GroupsCheckbox )
	self.GroupsCheckbox = GroupsCheckbox
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )

				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )

				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactive, {} )

				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgIdle, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )

				glitch:completeAnimation()
				self.glitch:setAlpha( 0 )
				self.clipFinished( glitch, {} )

				glitch2:completeAnimation()
				self.glitch2:setAlpha( 0 )
				self.clipFinished( glitch2, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 5 )

				local BoxButtonLrgInactiveFrame2 = function ( BoxButtonLrgInactive, event )
					if not event.interrupted then
						BoxButtonLrgInactive:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
					end
					BoxButtonLrgInactive:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( BoxButtonLrgInactive, event )
					else
						BoxButtonLrgInactive:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0 )
				BoxButtonLrgInactiveFrame2( BoxButtonLrgInactive, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					local FocusBarTFrame3 = function ( FocusBarT, event )
						local FocusBarTFrame4 = function ( FocusBarT, event )
							local FocusBarTFrame5 = function ( FocusBarT, event )
								local FocusBarTFrame6 = function ( FocusBarT, event )
									if not event.interrupted then
										FocusBarT:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
									end
									FocusBarT:setAlpha( 1 )
									if event.interrupted then
										self.clipFinished( FocusBarT, event )
									else
										FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									FocusBarTFrame6( FocusBarT, event )
									return 
								else
									FocusBarT:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
									FocusBarT:setAlpha( 0.5 )
									FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBarTFrame5( FocusBarT, event )
								return 
							else
								FocusBarT:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
								FocusBarT:setAlpha( 0.48 )
								FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBarTFrame4( FocusBarT, event )
							return 
						else
							FocusBarT:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							FocusBarT:setAlpha( 0 )
							FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBarTFrame3( FocusBarT, event )
						return 
					else
						FocusBarT:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						FocusBarT:setAlpha( 0.37 )
						FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame3 )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				FocusBarTFrame2( FocusBarT, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					local FocusBarBFrame3 = function ( FocusBarB, event )
						local FocusBarBFrame4 = function ( FocusBarB, event )
							local FocusBarBFrame5 = function ( FocusBarB, event )
								local FocusBarBFrame6 = function ( FocusBarB, event )
									if not event.interrupted then
										FocusBarB:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
									end
									FocusBarB:setAlpha( 1 )
									if event.interrupted then
										self.clipFinished( FocusBarB, event )
									else
										FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									FocusBarBFrame6( FocusBarB, event )
									return 
								else
									FocusBarB:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
									FocusBarB:setAlpha( 0.5 )
									FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBarBFrame5( FocusBarB, event )
								return 
							else
								FocusBarB:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
								FocusBarB:setAlpha( 0.48 )
								FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBarBFrame4( FocusBarB, event )
							return 
						else
							FocusBarB:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							FocusBarB:setAlpha( 0 )
							FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBarBFrame3( FocusBarB, event )
						return 
					else
						FocusBarB:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						FocusBarB:setAlpha( 0.37 )
						FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame3 )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				FocusBarBFrame2( FocusBarB, {} )
				local glitchFrame2 = function ( glitch, event )
					local glitchFrame3 = function ( glitch, event )
						if not event.interrupted then
							glitch:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						end
						glitch:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( glitch, event )
						else
							glitch:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						glitchFrame3( glitch, event )
						return 
					else
						glitch:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						glitch:setAlpha( 0.43 )
						glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame3 )
					end
				end
				
				glitch:completeAnimation()
				self.glitch:setAlpha( 0 )
				glitchFrame2( glitch, {} )
				local glitch2Frame2 = function ( glitch2, event )
					local glitch2Frame3 = function ( glitch2, event )
						if not event.interrupted then
							glitch2:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						end
						glitch2:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( glitch2, event )
						else
							glitch2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						glitch2Frame3( glitch2, event )
						return 
					else
						glitch2:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						glitch2:setAlpha( 0.43 )
						glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame3 )
					end
				end
				
				glitch2:completeAnimation()
				self.glitch2:setAlpha( 0 )
				glitch2Frame2( glitch2, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 3 )

				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgInactive, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 5 )

				local BoxButtonLrgInactiveFrame2 = function ( BoxButtonLrgInactive, event )
					if not event.interrupted then
						BoxButtonLrgInactive:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
					end
					BoxButtonLrgInactive:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( BoxButtonLrgInactive, event )
					else
						BoxButtonLrgInactive:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 1 )
				BoxButtonLrgInactiveFrame2( BoxButtonLrgInactive, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					local FocusBarTFrame3 = function ( FocusBarT, event )
						local FocusBarTFrame4 = function ( FocusBarT, event )
							local FocusBarTFrame5 = function ( FocusBarT, event )
								local FocusBarTFrame6 = function ( FocusBarT, event )
									if not event.interrupted then
										FocusBarT:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									end
									FocusBarT:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( FocusBarT, event )
									else
										FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									FocusBarTFrame6( FocusBarT, event )
									return 
								else
									FocusBarT:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
									FocusBarT:setAlpha( 0.37 )
									FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBarTFrame5( FocusBarT, event )
								return 
							else
								FocusBarT:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
								FocusBarT:setAlpha( 0 )
								FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBarTFrame4( FocusBarT, event )
							return 
						else
							FocusBarT:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							FocusBarT:setAlpha( 0.48 )
							FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBarTFrame3( FocusBarT, event )
						return 
					else
						FocusBarT:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						FocusBarT:setAlpha( 0.5 )
						FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame3 )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				FocusBarTFrame2( FocusBarT, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					local FocusBarBFrame3 = function ( FocusBarB, event )
						local FocusBarBFrame4 = function ( FocusBarB, event )
							local FocusBarBFrame5 = function ( FocusBarB, event )
								local FocusBarBFrame6 = function ( FocusBarB, event )
									if not event.interrupted then
										FocusBarB:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									end
									FocusBarB:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( FocusBarB, event )
									else
										FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									FocusBarBFrame6( FocusBarB, event )
									return 
								else
									FocusBarB:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
									FocusBarB:setAlpha( 0.37 )
									FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBarBFrame5( FocusBarB, event )
								return 
							else
								FocusBarB:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
								FocusBarB:setAlpha( 0 )
								FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBarBFrame4( FocusBarB, event )
							return 
						else
							FocusBarB:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							FocusBarB:setAlpha( 0.48 )
							FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBarBFrame3( FocusBarB, event )
						return 
					else
						FocusBarB:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						FocusBarB:setAlpha( 0.5 )
						FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame3 )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				FocusBarBFrame2( FocusBarB, {} )
				local glitchFrame2 = function ( glitch, event )
					local glitchFrame3 = function ( glitch, event )
						if not event.interrupted then
							glitch:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						end
						glitch:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( glitch, event )
						else
							glitch:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						glitchFrame3( glitch, event )
						return 
					else
						glitch:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						glitch:setAlpha( 0.43 )
						glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame3 )
					end
				end
				
				glitch:completeAnimation()
				self.glitch:setAlpha( 0 )
				glitchFrame2( glitch, {} )
				local glitch2Frame2 = function ( glitch2, event )
					local glitch2Frame3 = function ( glitch2, event )
						if not event.interrupted then
							glitch2:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						end
						glitch2:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( glitch2, event )
						else
							glitch2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						glitch2Frame3( glitch2, event )
						return 
					else
						glitch2:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						glitch2:setAlpha( 0.43 )
						glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame3 )
					end
				end
				
				glitch2:completeAnimation()
				self.glitch2:setAlpha( 0 )
				glitch2Frame2( glitch2, {} )
			end
		}
	}
	GroupsCheckbox.id = "GroupsCheckbox"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.GroupsCheckbox:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BoxButtonLrgInactiveDiag:close()
		element.BoxButtonLrgInactive:close()
		element.BoxButtonLrgIdle:close()
		element.Socialbackground00:close()
		element.Socialbackground000:close()
		element.FocusBarT:close()
		element.FocusBarB:close()
		element.presence:close()
		element.joinable:close()
		element.SocialPartyLeaderIconLarge0:close()
		element.SocialPartyMemberIconLarge0:close()
		element.StartMenuframenoBG0:close()
		element.GroupsCheckbox:close()
		element.emblem:close()
		element.gamertag:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

