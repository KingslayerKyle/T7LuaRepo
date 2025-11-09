require( "ui.uieditor.widgets.Notifications.PlayerCard.PlayerCard" )

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
	self:setLeftRight( true, false, 0, 305 )
	self:setTopBottom( true, false, 0, 59 )
	self.anyChildUsesUpdateState = true
	
	local PlayerCard0 = CoD.PlayerCard.new( menu, controller )
	PlayerCard0:setLeftRight( true, false, 0, 305 )
	PlayerCard0:setTopBottom( true, false, 0, 59 )
	PlayerCard0.CalloutHeading:setText( Engine.Localize( "CGAME_KILLED" ) )
	PlayerCard0:mergeStateConditions( {
		{
			stateName = "Calingcard",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	self:addElement( PlayerCard0 )
	self.PlayerCard0 = PlayerCard0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				PlayerCard0:completeAnimation()
				self.PlayerCard0:setAlpha( 0 )
				self.clipFinished( PlayerCard0, {} )
			end,
			Bottom = function ()
				self:setupElementClipCounter( 1 )
				local PlayerCard0Frame2 = function ( PlayerCard0, event )
					local PlayerCard0Frame3 = function ( PlayerCard0, event )
						local PlayerCard0Frame4 = function ( PlayerCard0, event )
							local PlayerCard0Frame5 = function ( PlayerCard0, event )
								local PlayerCard0Frame6 = function ( PlayerCard0, event )
									if not event.interrupted then
										PlayerCard0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
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
									PlayerCard0Frame6( PlayerCard0, event )
									return 
								else
									PlayerCard0:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
									PlayerCard0:setAlpha( 1 )
									PlayerCard0:registerEventHandler( "transition_complete_keyframe", PlayerCard0Frame6 )
								end
							end
							
							if event.interrupted then
								PlayerCard0Frame5( PlayerCard0, event )
								return 
							else
								PlayerCard0:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
								PlayerCard0:setAlpha( 0 )
								PlayerCard0:registerEventHandler( "transition_complete_keyframe", PlayerCard0Frame5 )
							end
						end
						
						if event.interrupted then
							PlayerCard0Frame4( PlayerCard0, event )
							return 
						else
							PlayerCard0:beginAnimation( "keyframe", 2080, false, false, CoD.TweenType.Linear )
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
			end
		},
		HideForCodCaster = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				PlayerCard0:completeAnimation()
				self.PlayerCard0:setAlpha( 0 )
				self.clipFinished( PlayerCard0, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				PlayerCard0:completeAnimation()
				self.PlayerCard0:setAlpha( 0 )
				self.clipFinished( PlayerCard0, {} )
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
				local f13_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN )
				if not f13_local0 then
					f13_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM )
					if not f13_local0 then
						f13_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_FINAL_KILLCAM )
						if not f13_local0 then
							f13_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED )
							if not f13_local0 then
								f13_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM )
								if not f13_local0 then
									f13_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM )
								end
							end
						end
					end
				end
				return f13_local0
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
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_FINAL_KILLCAM ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_FINAL_KILLCAM
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.PlayerCard0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

