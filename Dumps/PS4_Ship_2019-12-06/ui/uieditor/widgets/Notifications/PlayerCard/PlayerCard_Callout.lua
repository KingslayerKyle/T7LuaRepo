require( "ui.uieditor.widgets.Notifications.PlayerCard.PlayerCard" )

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
	PlayerCard:subscribeToGlobalModel( controller, "PlayerCallout", nil, function ( model )
		PlayerCard:setModel( model, controller )
	end )
	PlayerCard:linkToElementModel( self, "heading", true, function ( model )
		local heading = Engine.GetModelValue( model )
		if heading then
			PlayerCard.CalloutHeading:setText( Engine.Localize( heading ) )
		end
	end )
	PlayerCard:mergeStateConditions( {
		{
			stateName = "Emblem",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "Calingcard",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( PlayerCard )
	self.PlayerCard = PlayerCard
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				PlayerCard:completeAnimation()
				self.PlayerCard:setAlpha( 0 )
				self.clipFinished( PlayerCard, {} )
			end,
			Side = function ()
				self:setupElementClipCounter( 1 )
				local PlayerCardFrame2 = function ( PlayerCard, event )
					local PlayerCardFrame3 = function ( PlayerCard, event )
						local PlayerCardFrame4 = function ( PlayerCard, event )
							local PlayerCardFrame5 = function ( PlayerCard, event )
								local PlayerCardFrame6 = function ( PlayerCard, event )
									if not event.interrupted then
										PlayerCard:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
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
									PlayerCardFrame6( PlayerCard, event )
									return 
								else
									PlayerCard:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
									PlayerCard:setAlpha( 1 )
									PlayerCard:registerEventHandler( "transition_complete_keyframe", PlayerCardFrame6 )
								end
							end
							
							if event.interrupted then
								PlayerCardFrame5( PlayerCard, event )
								return 
							else
								PlayerCard:beginAnimation( "keyframe", 49, true, true, CoD.TweenType.Linear )
								PlayerCard:setAlpha( 0 )
								PlayerCard:registerEventHandler( "transition_complete_keyframe", PlayerCardFrame5 )
							end
						end
						
						if event.interrupted then
							PlayerCardFrame4( PlayerCard, event )
							return 
						else
							PlayerCard:beginAnimation( "keyframe", 2279, false, false, CoD.TweenType.Linear )
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
			end
		},
		HideForCodCaster = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				PlayerCard:completeAnimation()
				self.PlayerCard:setAlpha( 0 )
				self.clipFinished( PlayerCard, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				PlayerCard:completeAnimation()
				self.PlayerCard:setAlpha( 0 )
				self.clipFinished( PlayerCard, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "HideForCodCaster",
			condition = function ( menu, element, event )
				return IsCodCaster( controller ) and not IsCodCasterProfileValueEqualTo( controller, "shoutcaster_calloutcards", 1 )
			end
		},
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				local f16_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN )
				if not f16_local0 then
					f16_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM )
				end
				return f16_local0
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "factions.isCoDCaster" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "factions.isCoDCaster"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CodCaster.profileSettingsUpdated" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CodCaster.profileSettingsUpdated"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM
		} )
	end )
	self:subscribeToGlobalModel( controller, "PerController", "scriptNotify", function ( model )
		local f21_local0 = self
		if IsParamModelEqualToString( model, "player_callout" ) then
			ProcessPlayerCallout( f21_local0, controller, model )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.PlayerCard:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

