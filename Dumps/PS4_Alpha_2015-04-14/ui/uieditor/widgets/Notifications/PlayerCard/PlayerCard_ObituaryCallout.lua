require( "ui.uieditor.widgets.Notifications.PlayerCard.PlayerCard" )

local SetupKillcam = function ( self, event )
	if not Engine.IsVisibilityBitSet( event.controller, Enum.UIVisibilityBit.BIT_FINAL_KILLCAM ) and not Engine.IsVisibilityBitSet( event.controller, Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM ) and not Engine.IsVisibilityBitSet( event.controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM ) then
		self:setState( "DefaultState" )
		self:setAlpha( 0 )
		return 
	else
		local calloutData = Engine.GetCalloutPlayerData( event.controller, Engine.GetPredictedClientNum( event.controller ) )
		self.CalloutHeading:setText( "" )
		self.ObituaryCalloutContainer.Name:setText( calloutData.playerName )
		self.ObituaryCalloutContainer.RankImage:setImage( RegisterMaterial( calloutData.rankIcon ) )
		self.ObituaryCalloutContainer.RankText:setText( calloutData.rank )
		self.ObituaryCalloutContainer.ClanTag:setText( calloutData.clanTag )
		self:setAlpha( 1 )
		self:setState( "KillCam" )
	end
end

local SetupPlayerObituary = function ( self, event )
	if Engine.IsVisibilityBitSet( event.controller, Enum.UIVisibilityBit.BIT_FINAL_KILLCAM ) or Engine.IsVisibilityBitSet( event.controller, Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM ) or Engine.IsVisibilityBitSet( event.controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM ) then
		self:setState( "DefaultState" )
		self:setAlpha( 0 )
		return 
	else
		self.CalloutHeading:setText( event.killString )
		self.ObituaryCalloutContainer.Name:setText( event.playerName )
		self.ObituaryCalloutContainer.RankImage:setImage( RegisterMaterial( event.rankIcon ) )
		self.ObituaryCalloutContainer.RankText:setText( event.rank )
		self.ObituaryCalloutContainer.ClanTag:setText( event.clanTag )
		self.TempIcon:setupPlayerEmblemServer( event.playerClientNum )
		self:setAlpha( 1 )
		self:playClip( "Bottom" )
	end
end

local PostLoadFunc = function ( self, controller )
	self.SetupKillcam = SetupKillcam
end

CoD.PlayerCard_ObituaryCallout = InheritFrom( LUI.UIElement )
CoD.PlayerCard_ObituaryCallout.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PlayerCard_ObituaryCallout )
	self.id = "PlayerCard_ObituaryCallout"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 276 )
	self:setTopBottom( true, false, 0, 59 )
	self.anyChildUsesUpdateState = true
	
	local PlayerCard0 = CoD.PlayerCard.new( menu, controller )
	PlayerCard0:setLeftRight( true, false, 0, 276 )
	PlayerCard0:setTopBottom( true, false, 0, 59 )
	PlayerCard0:setRGB( 1, 1, 1 )
	PlayerCard0.TeamColor:setRGB( ColorSet.EnemyOrange.r, ColorSet.EnemyOrange.g, ColorSet.EnemyOrange.b )
	PlayerCard0:subscribeToGlobalModel( controller, "PlayerNamePlate", "playerObitCalloutPlayerName", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PlayerCard0.CardImage:setImage( RegisterImage( GetRandomPlayercardForPlayer( modelValue ) ) )
		end
	end )
	PlayerCard0:subscribeToGlobalModel( controller, "PlayerNamePlate", "playerObitCalloutPlayerName", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PlayerCard0.GamerTag:setAlpha( HideIfEmptyString( modelValue ) )
		end
	end )
	PlayerCard0:subscribeToGlobalModel( controller, "PlayerNamePlate", "playerObitCalloutPlayerName", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PlayerCard0.GamerTag.itemName:setText( Engine.Localize( modelValue ) )
		end
	end )
	PlayerCard0:subscribeToGlobalModel( controller, "PlayerNamePlate", "playerObitCalloutClanTag", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PlayerCard0.ClanTag:setAlpha( HideIfEmptyString( modelValue ) )
		end
	end )
	PlayerCard0:subscribeToGlobalModel( controller, "KillcamInfo", "victimClanTag", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PlayerCard0.ClanTag.itemName:setText( Engine.Localize( modelValue ) )
		end
	end )
	PlayerCard0:subscribeToGlobalModel( controller, "PlayerNamePlate", "playerObitCalloutXuid", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PlayerCard0.HeroLobbyClientExtraCamRender:setupCharacterExtraCamRenderForLobbyClient( modelValue )
		end
	end )
	PlayerCard0:subscribeToGlobalModel( controller, "PlayerNamePlate", "playerObitCalloutRankIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PlayerCard0.RankIcon:setImage( RegisterImage( modelValue ) )
		end
	end )
	PlayerCard0:subscribeToGlobalModel( controller, "PlayerNamePlate", "playerObitCalloutRank", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PlayerCard0.Rank:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( PlayerCard0 )
	self.PlayerCard0 = PlayerCard0
	
	local CalloutHeading = LUI.UIText.new()
	CalloutHeading:setLeftRight( true, false, 63.41, 335 )
	CalloutHeading:setTopBottom( true, false, -19, 1 )
	CalloutHeading:setRGB( 1, 1, 1 )
	CalloutHeading:setText( Engine.Localize( "MENU_KILLED" ) )
	CalloutHeading:setTTF( "fonts/Entovo.ttf" )
	CalloutHeading:setLetterSpacing( 0.5 )
	CalloutHeading:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	CalloutHeading:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( CalloutHeading )
	self.CalloutHeading = CalloutHeading
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				PlayerCard0:completeAnimation()
				self.PlayerCard0:setAlpha( 0 )
				self.clipFinished( PlayerCard0, {} )
				CalloutHeading:completeAnimation()
				self.CalloutHeading:setAlpha( 0 )
				self.clipFinished( CalloutHeading, {} )
			end,
			Bottom = function ()
				self:setupElementClipCounter( 2 )
				local PlayerCard0Frame2 = function ( PlayerCard0, event )
					local PlayerCard0Frame3 = function ( PlayerCard0, event )
						local PlayerCard0Frame4 = function ( PlayerCard0, event )
							if not event.interrupted then
								PlayerCard0:beginAnimation( "keyframe", 430, false, false, CoD.TweenType.Bounce )
							end
							PlayerCard0:setLeftRight( true, false, 0, 276 )
							PlayerCard0:setTopBottom( true, false, 0, 59 )
							PlayerCard0:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( PlayerCard0, event )
							else
								PlayerCard0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							PlayerCard0Frame4( PlayerCard0, event )
							return 
						else
							PlayerCard0:beginAnimation( "keyframe", 1980, false, false, CoD.TweenType.Linear )
							PlayerCard0:registerEventHandler( "transition_complete_keyframe", PlayerCard0Frame4 )
						end
					end
					
					if event.interrupted then
						PlayerCard0Frame3( PlayerCard0, event )
						return 
					else
						PlayerCard0:beginAnimation( "keyframe", 300, false, true, CoD.TweenType.Linear )
						PlayerCard0:setTopBottom( true, false, 0, 59 )
						PlayerCard0:setAlpha( 1 )
						PlayerCard0:registerEventHandler( "transition_complete_keyframe", PlayerCard0Frame3 )
					end
				end
				
				PlayerCard0:completeAnimation()
				self.PlayerCard0:setLeftRight( true, false, 0, 276 )
				self.PlayerCard0:setTopBottom( true, false, 56, 115 )
				self.PlayerCard0:setAlpha( 0 )
				PlayerCard0Frame2( PlayerCard0, {} )
				local CalloutHeadingFrame2 = function ( CalloutHeading, event )
					local CalloutHeadingFrame3 = function ( CalloutHeading, event )
						local CalloutHeadingFrame4 = function ( CalloutHeading, event )
							if not event.interrupted then
								CalloutHeading:beginAnimation( "keyframe", 480, false, false, CoD.TweenType.Bounce )
							end
							CalloutHeading:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( CalloutHeading, event )
							else
								CalloutHeading:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							CalloutHeadingFrame4( CalloutHeading, event )
							return 
						else
							CalloutHeading:beginAnimation( "keyframe", 1930, false, false, CoD.TweenType.Linear )
							CalloutHeading:registerEventHandler( "transition_complete_keyframe", CalloutHeadingFrame4 )
						end
					end
					
					if event.interrupted then
						CalloutHeadingFrame3( CalloutHeading, event )
						return 
					else
						CalloutHeading:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
						CalloutHeading:setAlpha( 1 )
						CalloutHeading:registerEventHandler( "transition_complete_keyframe", CalloutHeadingFrame3 )
					end
				end
				
				CalloutHeading:completeAnimation()
				self.CalloutHeading:setAlpha( 0 )
				CalloutHeadingFrame2( CalloutHeading, {} )
			end
		},
		KillCam = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				local PlayerCard0Frame2 = function ( PlayerCard0, event )
					local PlayerCard0Frame3 = function ( PlayerCard0, event )
						local PlayerCard0Frame4 = function ( PlayerCard0, event )
							if not event.interrupted then
								PlayerCard0:beginAnimation( "keyframe", 460, false, false, CoD.TweenType.Bounce )
							end
							PlayerCard0:setLeftRight( true, false, 0, 276 )
							PlayerCard0:setTopBottom( true, false, 0, 59 )
							PlayerCard0:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( PlayerCard0, event )
							else
								PlayerCard0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							PlayerCard0Frame4( PlayerCard0, event )
							return 
						else
							PlayerCard0:beginAnimation( "keyframe", 1899, false, false, CoD.TweenType.Linear )
							PlayerCard0:registerEventHandler( "transition_complete_keyframe", PlayerCard0Frame4 )
						end
					end
					
					if event.interrupted then
						PlayerCard0Frame3( PlayerCard0, event )
						return 
					else
						PlayerCard0:beginAnimation( "keyframe", 400, false, true, CoD.TweenType.Linear )
						PlayerCard0:setTopBottom( true, false, 0, 59 )
						PlayerCard0:setAlpha( 1 )
						PlayerCard0:registerEventHandler( "transition_complete_keyframe", PlayerCard0Frame3 )
					end
				end
				
				PlayerCard0:completeAnimation()
				self.PlayerCard0:setLeftRight( true, false, 0, 276 )
				self.PlayerCard0:setTopBottom( true, false, 59, 118 )
				self.PlayerCard0:setAlpha( 0 )
				PlayerCard0Frame2( PlayerCard0, {} )
				local CalloutHeadingFrame2 = function ( CalloutHeading, event )
					local CalloutHeadingFrame3 = function ( CalloutHeading, event )
						local CalloutHeadingFrame4 = function ( CalloutHeading, event )
							if not event.interrupted then
								CalloutHeading:beginAnimation( "keyframe", 539, false, false, CoD.TweenType.Bounce )
							end
							CalloutHeading:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( CalloutHeading, event )
							else
								CalloutHeading:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							CalloutHeadingFrame4( CalloutHeading, event )
							return 
						else
							CalloutHeading:beginAnimation( "keyframe", 1820, false, false, CoD.TweenType.Linear )
							CalloutHeading:registerEventHandler( "transition_complete_keyframe", CalloutHeadingFrame4 )
						end
					end
					
					if event.interrupted then
						CalloutHeadingFrame3( CalloutHeading, event )
						return 
					else
						CalloutHeading:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
						CalloutHeading:setAlpha( 1 )
						CalloutHeading:registerEventHandler( "transition_complete_keyframe", CalloutHeadingFrame3 )
					end
				end
				
				CalloutHeading:completeAnimation()
				self.CalloutHeading:setAlpha( 0 )
				CalloutHeadingFrame2( CalloutHeading, {} )
			end
		}
	}
	self.close = function ( self )
		self.PlayerCard0:close()
		CoD.PlayerCard_ObituaryCallout.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

