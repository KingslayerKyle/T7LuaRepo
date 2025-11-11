require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgIdle" )
require( "ui.uieditor.widgets.CAC.cac_ListButtonLabel" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.Social.Social_background" )
require( "ui.uieditor.widgets.Social.Social_PartyLeaderIconLarge" )
require( "ui.uieditor.widgets.Social.Social_PartyMemberIconLarge" )
require( "ui.uieditor.widgets.Social.Social_PlayersListButton_Joinable" )
require( "ui.uieditor.widgets.Social.Social_PlayersListButton_Presence" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )

CoD.Social_PlayersListButton = InheritFrom( LUI.UIElement )
CoD.Social_PlayersListButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Social_PlayersListButton )
	self.id = "Social_PlayersListButton"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 561 )
	self:setTopBottom( 0, 0, 0, 90 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local BlackTint0 = LUI.UIImage.new()
	BlackTint0:setLeftRight( 0, 0, 0, 561 )
	BlackTint0:setTopBottom( 0, 0, 0, 90 )
	BlackTint0:setRGB( 0, 0, 0 )
	BlackTint0:setAlpha( 0 )
	self:addElement( BlackTint0 )
	self.BlackTint0 = BlackTint0
	
	local BoxButtonLrgIdle = CoD.cac_ButtonBoxLrgIdle.new( menu, controller )
	BoxButtonLrgIdle:setLeftRight( 0, 1, 0, 4 )
	BoxButtonLrgIdle:setTopBottom( 0, 1, -3, 1 )
	BoxButtonLrgIdle:setAlpha( 0.5 )
	self:addElement( BoxButtonLrgIdle )
	self.BoxButtonLrgIdle = BoxButtonLrgIdle
	
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
	emblem:setLeftRight( 0, 0, 3, 144 )
	emblem:setTopBottom( 0, 1, 2, -2 )
	emblem:linkToElementModel( self, "identityBadge.xuid", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			emblem:setupPlayerEmblemByXUID( modelValue )
		end
	end )
	self:addElement( emblem )
	self.emblem = emblem
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( 0, 1, -7, 3 )
	FocusBarT:setTopBottom( 0, 0, -6, 0 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( 0, 1, -7, 3 )
	FocusBarB:setTopBottom( 1, 1, 0, 6 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local glitch = LUI.UIImage.new()
	glitch:setLeftRight( 0, 1, -18, 10 )
	glitch:setTopBottom( 0, 0, -13, 7 )
	glitch:setRGB( 1, 0.09, 0 )
	glitch:setAlpha( 0 )
	glitch:setImage( RegisterImage( "uie_t7_effect_glitches_menu10" ) )
	glitch:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( glitch )
	self.glitch = glitch
	
	local glitch2 = LUI.UIImage.new()
	glitch2:setLeftRight( 0, 1, -13, 13 )
	glitch2:setTopBottom( 1, 1, -9, 13 )
	glitch2:setRGB( 1, 0.15, 0 )
	glitch2:setAlpha( 0 )
	glitch2:setImage( RegisterImage( "uie_t7_effect_glitches_menu10" ) )
	glitch2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( glitch2 )
	self.glitch2 = glitch2
	
	local presence = CoD.Social_PlayersListButton_Presence.new( menu, controller )
	presence:setLeftRight( 0, 0, 159, 549 )
	presence:setTopBottom( 0, 0, 48, 86 )
	presence:linkToElementModel( self, nil, false, function ( model )
		presence:setModel( model, controller )
	end )
	presence:linkToElementModel( self, "platformPresence", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			presence.platformPresenceScroller.textBox:setText( PlatformPresenceToLocalizedString( modelValue ) )
		end
	end )
	presence:linkToElementModel( self, "activity", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			presence.titlePresenceScroller.textBox:setText( Engine.Localize( PresenceActivityToModeString( modelValue ) ) )
		end
	end )
	presence:linkToElementModel( self, "activity", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			presence.titlePresenceIcon:setImage( RegisterImage( PresenceActivityToIcon( modelValue ) ) )
		end
	end )
	presence:linkToElementModel( self, "titlePresence", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			presence.lastMet:setText( Engine.Localize( modelValue ) )
		end
	end )
	presence:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SetupAutoHorizontalAlignArabicText( element )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
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
	
	local BlackTint = LUI.UIImage.new()
	BlackTint:setLeftRight( 0, 0, 0, 561 )
	BlackTint:setTopBottom( 0, 0, 0, 90 )
	BlackTint:setRGB( 0, 0, 0 )
	BlackTint:setAlpha( 0.2 )
	self:addElement( BlackTint )
	self.BlackTint = BlackTint
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( 0.5, 0.5, -282, 284 )
	StartMenuframenoBG0:setTopBottom( 0, 1, -1, 3 )
	StartMenuframenoBG0:setAlpha( 0.6 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	local LabelButton = CoD.cac_ListButtonLabel.new( menu, controller )
	LabelButton:mergeStateConditions( {
		{
			stateName = "HasNew",
			condition = function ( menu, element, event )
				return IsCACAnyCamoNew( self, controller )
			end
		}
	} )
	LabelButton:setLeftRight( 0, 0, 159, 377 )
	LabelButton:setTopBottom( 0.5, 0.5, -29, 1 )
	LabelButton:linkToElementModel( self, "fullname", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LabelButton.itemName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( LabelButton )
	self.LabelButton = LabelButton
	
	self.resetProperties = function ()
		FocusBarB:completeAnimation()
		FocusBarT:completeAnimation()
		emblem:completeAnimation()
		glitch2:completeAnimation()
		glitch:completeAnimation()
		BlackTint:completeAnimation()
		FocusBarB:setLeftRight( 0, 1, -7, 3 )
		FocusBarB:setTopBottom( 1, 1, 0, 6 )
		FocusBarB:setAlpha( 0 )
		FocusBarT:setLeftRight( 0, 1, -7, 3 )
		FocusBarT:setTopBottom( 0, 0, -6, 0 )
		FocusBarT:setAlpha( 0 )
		emblem:setLeftRight( 0, 0, 3, 144 )
		emblem:setTopBottom( 0, 1, 2, -2 )
		glitch2:setAlpha( 0 )
		glitch:setAlpha( 0 )
		BlackTint:setAlpha( 0.2 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				emblem:completeAnimation()
				self.emblem:setLeftRight( 0, 0, -0.5, 143.5 )
				self.emblem:setTopBottom( 0, 1, 0, 0 )
				self.clipFinished( emblem, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( 0, 1, -3, 3 )
				self.FocusBarT:setTopBottom( 0, 0, -6, 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( 0, 1, -3, 3 )
				self.FocusBarB:setTopBottom( 1, 1, 0, 6 )
				self.clipFinished( FocusBarB, {} )
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					local FocusBarTFrame3 = function ( FocusBarT, event )
						local FocusBarTFrame4 = function ( FocusBarT, event )
							local FocusBarTFrame5 = function ( FocusBarT, event )
								local FocusBarTFrame6 = function ( FocusBarT, event )
									local FocusBarTFrame7 = function ( FocusBarT, event )
										if not event.interrupted then
											FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										end
										FocusBarT:setAlpha( 1 )
										if event.interrupted then
											self.clipFinished( FocusBarT, event )
										else
											FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										FocusBarTFrame7( FocusBarT, event )
										return 
									else
										FocusBarT:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame7 )
									end
								end
								
								if event.interrupted then
									FocusBarTFrame6( FocusBarT, event )
									return 
								else
									FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									FocusBarT:setAlpha( 0.35 )
									FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBarTFrame5( FocusBarT, event )
								return 
							else
								FocusBarT:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBarTFrame4( FocusBarT, event )
							return 
						else
							FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							FocusBarT:setAlpha( 0.57 )
							FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBarTFrame3( FocusBarT, event )
						return 
					else
						FocusBarT:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
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
									local FocusBarBFrame7 = function ( FocusBarB, event )
										if not event.interrupted then
											FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										end
										FocusBarB:setAlpha( 1 )
										if event.interrupted then
											self.clipFinished( FocusBarB, event )
										else
											FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										FocusBarBFrame7( FocusBarB, event )
										return 
									else
										FocusBarB:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame7 )
									end
								end
								
								if event.interrupted then
									FocusBarBFrame6( FocusBarB, event )
									return 
								else
									FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									FocusBarB:setAlpha( 0.21 )
									FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBarBFrame5( FocusBarB, event )
								return 
							else
								FocusBarB:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBarBFrame4( FocusBarB, event )
							return 
						else
							FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							FocusBarB:setAlpha( 0.66 )
							FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBarBFrame3( FocusBarB, event )
						return 
					else
						FocusBarB:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame3 )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				FocusBarBFrame2( FocusBarB, {} )
				local glitchFrame2 = function ( glitch, event )
					local glitchFrame3 = function ( glitch, event )
						local glitchFrame4 = function ( glitch, event )
							local glitchFrame5 = function ( glitch, event )
								local glitchFrame6 = function ( glitch, event )
									local glitchFrame7 = function ( glitch, event )
										if not event.interrupted then
											glitch:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
										end
										glitch:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( glitch, event )
										else
											glitch:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										glitchFrame7( glitch, event )
										return 
									else
										glitch:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame7 )
									end
								end
								
								if event.interrupted then
									glitchFrame6( glitch, event )
									return 
								else
									glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									glitch:setAlpha( 1 )
									glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame6 )
								end
							end
							
							if event.interrupted then
								glitchFrame5( glitch, event )
								return 
							else
								glitch:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame5 )
							end
						end
						
						if event.interrupted then
							glitchFrame4( glitch, event )
							return 
						else
							glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							glitch:setAlpha( 0 )
							glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame4 )
						end
					end
					
					if event.interrupted then
						glitchFrame3( glitch, event )
						return 
					else
						glitch:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame3 )
					end
				end
				
				glitch:completeAnimation()
				self.glitch:setAlpha( 1 )
				glitchFrame2( glitch, {} )
				local glitch2Frame2 = function ( glitch2, event )
					local glitch2Frame3 = function ( glitch2, event )
						local glitch2Frame4 = function ( glitch2, event )
							local glitch2Frame5 = function ( glitch2, event )
								local glitch2Frame6 = function ( glitch2, event )
									local glitch2Frame7 = function ( glitch2, event )
										if not event.interrupted then
											glitch2:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
										end
										glitch2:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( glitch2, event )
										else
											glitch2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										glitch2Frame7( glitch2, event )
										return 
									else
										glitch2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame7 )
									end
								end
								
								if event.interrupted then
									glitch2Frame6( glitch2, event )
									return 
								else
									glitch2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									glitch2:setAlpha( 1 )
									glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame6 )
								end
							end
							
							if event.interrupted then
								glitch2Frame5( glitch2, event )
								return 
							else
								glitch2:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame5 )
							end
						end
						
						if event.interrupted then
							glitch2Frame4( glitch2, event )
							return 
						else
							glitch2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							glitch2:setAlpha( 0 )
							glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame4 )
						end
					end
					
					if event.interrupted then
						glitch2Frame3( glitch2, event )
						return 
					else
						glitch2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame3 )
					end
				end
				
				glitch2:completeAnimation()
				self.glitch2:setAlpha( 1 )
				glitch2Frame2( glitch2, {} )
				local BlackTintFrame2 = function ( BlackTint, event )
					if not event.interrupted then
						BlackTint:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
					end
					BlackTint:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( BlackTint, event )
					else
						BlackTint:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BlackTint:completeAnimation()
				self.BlackTint:setAlpha( 0.2 )
				BlackTintFrame2( BlackTint, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				BlackTint:completeAnimation()
				self.BlackTint:setAlpha( 0 )
				self.clipFinished( BlackTint, {} )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					local FocusBarTFrame3 = function ( FocusBarT, event )
						local FocusBarTFrame4 = function ( FocusBarT, event )
							local FocusBarTFrame5 = function ( FocusBarT, event )
								local FocusBarTFrame6 = function ( FocusBarT, event )
									local FocusBarTFrame7 = function ( FocusBarT, event )
										if not event.interrupted then
											FocusBarT:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
										end
										FocusBarT:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( FocusBarT, event )
										else
											FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										FocusBarTFrame7( FocusBarT, event )
										return 
									else
										FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										FocusBarT:setAlpha( 0.35 )
										FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame7 )
									end
								end
								
								if event.interrupted then
									FocusBarTFrame6( FocusBarT, event )
									return 
								else
									FocusBarT:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBarTFrame5( FocusBarT, event )
								return 
							else
								FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								FocusBarT:setAlpha( 0.57 )
								FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBarTFrame4( FocusBarT, event )
							return 
						else
							FocusBarT:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							FocusBarT:setAlpha( 0 )
							FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBarTFrame3( FocusBarT, event )
						return 
					else
						FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						FocusBarT:setAlpha( 0.35 )
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
									local FocusBarBFrame7 = function ( FocusBarB, event )
										if not event.interrupted then
											FocusBarB:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
										end
										FocusBarB:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( FocusBarB, event )
										else
											FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										FocusBarBFrame7( FocusBarB, event )
										return 
									else
										FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										FocusBarB:setAlpha( 0.21 )
										FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame7 )
									end
								end
								
								if event.interrupted then
									FocusBarBFrame6( FocusBarB, event )
									return 
								else
									FocusBarB:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBarBFrame5( FocusBarB, event )
								return 
							else
								FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								FocusBarB:setAlpha( 0.66 )
								FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBarBFrame4( FocusBarB, event )
							return 
						else
							FocusBarB:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							FocusBarB:setAlpha( 0 )
							FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBarBFrame3( FocusBarB, event )
						return 
					else
						FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						FocusBarB:setAlpha( 0.21 )
						FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame3 )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				FocusBarBFrame2( FocusBarB, {} )
				local glitchFrame2 = function ( glitch, event )
					local glitchFrame3 = function ( glitch, event )
						local glitchFrame4 = function ( glitch, event )
							local glitchFrame5 = function ( glitch, event )
								local glitchFrame6 = function ( glitch, event )
									local glitchFrame7 = function ( glitch, event )
										local glitchFrame8 = function ( glitch, event )
											if not event.interrupted then
												glitch:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
											end
											glitch:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( glitch, event )
											else
												glitch:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											glitchFrame8( glitch, event )
											return 
										else
											glitch:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											glitch:setAlpha( 0.4 )
											glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame8 )
										end
									end
									
									if event.interrupted then
										glitchFrame7( glitch, event )
										return 
									else
										glitch:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame7 )
									end
								end
								
								if event.interrupted then
									glitchFrame6( glitch, event )
									return 
								else
									glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									glitch:setAlpha( 0 )
									glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame6 )
								end
							end
							
							if event.interrupted then
								glitchFrame5( glitch, event )
								return 
							else
								glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame5 )
							end
						end
						
						if event.interrupted then
							glitchFrame4( glitch, event )
							return 
						else
							glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							glitch:setAlpha( 1 )
							glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame4 )
						end
					end
					
					if event.interrupted then
						glitchFrame3( glitch, event )
						return 
					else
						glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame3 )
					end
				end
				
				glitch:completeAnimation()
				self.glitch:setAlpha( 0 )
				glitchFrame2( glitch, {} )
				local glitch2Frame2 = function ( glitch2, event )
					local glitch2Frame3 = function ( glitch2, event )
						local glitch2Frame4 = function ( glitch2, event )
							local glitch2Frame5 = function ( glitch2, event )
								local glitch2Frame6 = function ( glitch2, event )
									local glitch2Frame7 = function ( glitch2, event )
										local glitch2Frame8 = function ( glitch2, event )
											if not event.interrupted then
												glitch2:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
											end
											glitch2:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( glitch2, event )
											else
												glitch2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											glitch2Frame8( glitch2, event )
											return 
										else
											glitch2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											glitch2:setAlpha( 0.57 )
											glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame8 )
										end
									end
									
									if event.interrupted then
										glitch2Frame7( glitch2, event )
										return 
									else
										glitch2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame7 )
									end
								end
								
								if event.interrupted then
									glitch2Frame6( glitch2, event )
									return 
								else
									glitch2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									glitch2:setAlpha( 0 )
									glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame6 )
								end
							end
							
							if event.interrupted then
								glitch2Frame5( glitch2, event )
								return 
							else
								glitch2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame5 )
							end
						end
						
						if event.interrupted then
							glitch2Frame4( glitch2, event )
							return 
						else
							glitch2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							glitch2:setAlpha( 1 )
							glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame4 )
						end
					end
					
					if event.interrupted then
						glitch2Frame3( glitch2, event )
						return 
					else
						glitch2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame3 )
					end
				end
				
				glitch2:completeAnimation()
				self.glitch2:setAlpha( 0 )
				glitch2Frame2( glitch2, {} )
				local BlackTintFrame2 = function ( BlackTint, event )
					if not event.interrupted then
						BlackTint:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
					end
					BlackTint:setAlpha( 0.2 )
					if event.interrupted then
						self.clipFinished( BlackTint, event )
					else
						BlackTint:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BlackTint:completeAnimation()
				self.BlackTint:setAlpha( 0 )
				BlackTintFrame2( BlackTint, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BoxButtonLrgIdle:close()
		self.Socialbackground00:close()
		self.Socialbackground000:close()
		self.FocusBarT:close()
		self.FocusBarB:close()
		self.presence:close()
		self.joinable:close()
		self.SocialPartyLeaderIconLarge0:close()
		self.SocialPartyMemberIconLarge0:close()
		self.StartMenuframenoBG0:close()
		self.LabelButton:close()
		self.emblem:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

