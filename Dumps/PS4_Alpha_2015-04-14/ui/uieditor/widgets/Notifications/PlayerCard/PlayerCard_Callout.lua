require( "ui.uieditor.widgets.Notifications.PlayerCard.PlayerCard" )

local ProcessPlayerCallout = function ( self, event )
	Engine.UpdateCalloutPlayerData( event.controller, event.data[1], event.data[2] )
	self:playClip( "Side" )
end

local PreLoadFunc = function ( self, controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local namePlateModel = Engine.CreateModel( perControllerModel, "namePlate" )
	local heroModel = Engine.CreateModel( namePlateModel, "playerXuid" )
end

local PostLoadFunc = function ( self, controller )
	self:registerEventHandler( "player_callout", function ( element, event )
		ProcessPlayerCallout( self, event )
	end )
end

CoD.PlayerCard_Callout = InheritFrom( LUI.UIElement )
CoD.PlayerCard_Callout.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PlayerCard_Callout )
	self.id = "PlayerCard_Callout"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 276 )
	self:setTopBottom( true, false, 0, 59 )
	self.anyChildUsesUpdateState = true
	
	local PlayerCard = CoD.PlayerCard.new( menu, controller )
	PlayerCard:setLeftRight( true, false, 0, 276 )
	PlayerCard:setTopBottom( true, false, 0, 59 )
	PlayerCard:setRGB( 1, 1, 1 )
	PlayerCard.TeamColor:setRGB( ColorSet.FriendlyBlue.r, ColorSet.FriendlyBlue.g, ColorSet.FriendlyBlue.b )
	PlayerCard:subscribeToGlobalModel( controller, "PlayerNamePlate", "playerCalloutPlayerName", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PlayerCard.CardImage:setImage( RegisterImage( GetRandomPlayercardForPlayer( modelValue ) ) )
		end
	end )
	PlayerCard:subscribeToGlobalModel( controller, "PlayerNamePlate", "playerCalloutPlayerName", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PlayerCard.GamerTag:setAlpha( HideIfEmptyString( modelValue ) )
		end
	end )
	PlayerCard:subscribeToGlobalModel( controller, "PlayerNamePlate", "playerCalloutPlayerName", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PlayerCard.GamerTag.itemName:setText( Engine.Localize( modelValue ) )
		end
	end )
	PlayerCard:subscribeToGlobalModel( controller, "PlayerNamePlate", "playerCalloutClanTag", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PlayerCard.ClanTag:setAlpha( HideIfEmptyString( modelValue ) )
		end
	end )
	PlayerCard:subscribeToGlobalModel( controller, "PlayerNamePlate", "playerCalloutClanTag", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PlayerCard.ClanTag.itemName:setText( Engine.Localize( modelValue ) )
		end
	end )
	PlayerCard:subscribeToGlobalModel( controller, "PlayerNamePlate", "playerXuid", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PlayerCard.HeroLobbyClientExtraCamRender:setupCharacterExtraCamRenderForLobbyClient( modelValue )
		end
	end )
	PlayerCard:subscribeToGlobalModel( controller, "PlayerNamePlate", "playerCalloutRankIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PlayerCard.RankIcon:setImage( RegisterImage( modelValue ) )
		end
	end )
	PlayerCard:subscribeToGlobalModel( controller, "PlayerNamePlate", "playerCalloutRank", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PlayerCard.Rank:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( PlayerCard )
	self.PlayerCard = PlayerCard
	
	local CalloutHeading = LUI.UIText.new()
	CalloutHeading:setLeftRight( true, false, 63.41, 335 )
	CalloutHeading:setTopBottom( true, false, -19, 1 )
	CalloutHeading:setRGB( 1, 1, 1 )
	CalloutHeading:setTTF( "fonts/Entovo.ttf" )
	CalloutHeading:setLetterSpacing( 0.5 )
	CalloutHeading:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	CalloutHeading:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	CalloutHeading:subscribeToGlobalModel( controller, "PlayerNamePlate", "playerCalloutHeading", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CalloutHeading:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( CalloutHeading )
	self.CalloutHeading = CalloutHeading
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				PlayerCard:completeAnimation()
				self.PlayerCard:setAlpha( 0 )
				self.clipFinished( PlayerCard, {} )
				CalloutHeading:completeAnimation()
				self.CalloutHeading:setAlpha( 0 )
				self.clipFinished( CalloutHeading, {} )
			end,
			Side = function ()
				self:setupElementClipCounter( 2 )
				local PlayerCardFrame2 = function ( PlayerCard, event )
					local PlayerCardFrame3 = function ( PlayerCard, event )
						local PlayerCardFrame4 = function ( PlayerCard, event )
							if not event.interrupted then
								PlayerCard:beginAnimation( "keyframe", 350, false, false, CoD.TweenType.Bounce )
							end
							PlayerCard:setLeftRight( true, false, 0, 276 )
							PlayerCard:setTopBottom( true, false, 0, 59 )
							PlayerCard:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( PlayerCard, event )
							else
								PlayerCard:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							PlayerCardFrame4( PlayerCard, event )
							return 
						else
							PlayerCard:beginAnimation( "keyframe", 2089, false, false, CoD.TweenType.Linear )
							PlayerCard:registerEventHandler( "transition_complete_keyframe", PlayerCardFrame4 )
						end
					end
					
					if event.interrupted then
						PlayerCardFrame3( PlayerCard, event )
						return 
					else
						PlayerCard:beginAnimation( "keyframe", 270, false, true, CoD.TweenType.Linear )
						PlayerCard:setLeftRight( true, false, 0, 276 )
						PlayerCard:setAlpha( 1 )
						PlayerCard:registerEventHandler( "transition_complete_keyframe", PlayerCardFrame3 )
					end
				end
				
				PlayerCard:completeAnimation()
				self.PlayerCard:setLeftRight( true, false, -232, 44 )
				self.PlayerCard:setTopBottom( true, false, 0, 59 )
				self.PlayerCard:setAlpha( 0 )
				PlayerCardFrame2( PlayerCard, {} )
				local CalloutHeadingFrame2 = function ( CalloutHeading, event )
					local CalloutHeadingFrame3 = function ( CalloutHeading, event )
						local CalloutHeadingFrame4 = function ( CalloutHeading, event )
							if not event.interrupted then
								CalloutHeading:beginAnimation( "keyframe", 420, false, false, CoD.TweenType.Bounce )
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
							CalloutHeading:beginAnimation( "keyframe", 1990, false, false, CoD.TweenType.Linear )
							CalloutHeading:registerEventHandler( "transition_complete_keyframe", CalloutHeadingFrame4 )
						end
					end
					
					if event.interrupted then
						CalloutHeadingFrame3( CalloutHeading, event )
						return 
					else
						CalloutHeading:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
						CalloutHeading:setAlpha( 1 )
						CalloutHeading:registerEventHandler( "transition_complete_keyframe", CalloutHeadingFrame3 )
					end
				end
				
				CalloutHeading:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
				CalloutHeading:setAlpha( 0 )
				CalloutHeading:registerEventHandler( "transition_complete_keyframe", CalloutHeadingFrame2 )
			end
		}
	}
	self.close = function ( self )
		self.PlayerCard:close()
		self.CalloutHeading:close()
		CoD.PlayerCard_Callout.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

