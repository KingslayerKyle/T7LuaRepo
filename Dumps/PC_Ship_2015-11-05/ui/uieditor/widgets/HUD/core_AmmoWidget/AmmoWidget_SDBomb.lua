local PreLoadFunc = function ( self, controller )
	local f1_local0 = Engine.GetModelForController( controller )
	Engine.SetModelValue( Engine.CreateModel( f1_local0, "hudItems.SDBombClient" ), -1 )
	Engine.CreateModel( f1_local0, "deadSpectator.playerIndex" )
	Engine.CreateModel( f1_local0, "Demolition.defending" )
end

CoD.AmmoWidget_SDBomb = InheritFrom( LUI.UIElement )
CoD.AmmoWidget_SDBomb.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidget_SDBomb )
	self.id = "AmmoWidget_SDBomb"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 70 )
	self:setTopBottom( true, false, 0, 70 )
	
	local PanelGlow = LUI.UIImage.new()
	PanelGlow:setLeftRight( true, false, -8.37, 83.24 )
	PanelGlow:setTopBottom( true, false, -8.5, 84.3 )
	PanelGlow:setRGB( 0.3, 0.65, 0.82 )
	PanelGlow:setAlpha( 0.41 )
	PanelGlow:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	PanelGlow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( PanelGlow )
	self.PanelGlow = PanelGlow
	
	local SDBomb = LUI.UIImage.new()
	SDBomb:setLeftRight( true, false, 0, 70 )
	SDBomb:setTopBottom( true, false, 0, 70 )
	SDBomb:setScale( 0.8 )
	SDBomb:setImage( RegisterImage( "uie_t7_hud_widget_sd_bomb" ) )
	self:addElement( SDBomb )
	self.SDBomb = SDBomb
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				PanelGlow:completeAnimation()
				self.PanelGlow:setAlpha( 0 )
				self.clipFinished( PanelGlow, {} )
				SDBomb:completeAnimation()
				self.SDBomb:setAlpha( 0 )
				self.clipFinished( SDBomb, {} )
			end
		},
		Hide = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				PanelGlow:completeAnimation()
				self.PanelGlow:setAlpha( 0 )
				self.clipFinished( PanelGlow, {} )
				SDBomb:completeAnimation()
				self.SDBomb:setAlpha( 0 )
				self.clipFinished( SDBomb, {} )
			end
		},
		Show = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				PanelGlow:completeAnimation()
				self.PanelGlow:setAlpha( 0.41 )
				self.clipFinished( PanelGlow, {} )
				local SDBombFrame2 = function ( SDBomb, event )
					local SDBombFrame3 = function ( SDBomb, event )
						local SDBombFrame4 = function ( SDBomb, event )
							local SDBombFrame5 = function ( SDBomb, event )
								if not event.interrupted then
									SDBomb:beginAnimation( "keyframe", 339, false, false, CoD.TweenType.Linear )
								end
								SDBomb:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( SDBomb, event )
								else
									SDBomb:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								SDBombFrame5( SDBomb, event )
								return 
							else
								SDBomb:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
								SDBomb:setAlpha( 0.65 )
								SDBomb:registerEventHandler( "transition_complete_keyframe", SDBombFrame5 )
							end
						end
						
						if event.interrupted then
							SDBombFrame4( SDBomb, event )
							return 
						else
							SDBomb:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
							SDBomb:setAlpha( 1 )
							SDBomb:registerEventHandler( "transition_complete_keyframe", SDBombFrame4 )
						end
					end
					
					if event.interrupted then
						SDBombFrame3( SDBomb, event )
						return 
					else
						SDBomb:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
						SDBomb:setAlpha( 0.65 )
						SDBomb:registerEventHandler( "transition_complete_keyframe", SDBombFrame3 )
					end
				end
				
				SDBomb:completeAnimation()
				self.SDBomb:setAlpha( 1 )
				SDBombFrame2( SDBomb, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Hide",
			condition = function ( menu, element, event )
				local f10_local0
				if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) and Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE ) then
					f10_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_HARDCORE )
					if not f10_local0 then
						f10_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED )
						if not f10_local0 then
							f10_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM )
							if not f10_local0 then
								f10_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN )
								if not f10_local0 then
									f10_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM )
									if not f10_local0 then
										f10_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED )
										if not f10_local0 then
											f10_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE )
											if not f10_local0 then
												f10_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_SCOPED )
												if not f10_local0 then
													f10_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_VEHICLE )
													if not f10_local0 then
														f10_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE )
														if not f10_local0 then
															f10_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN )
															if not f10_local0 then
																f10_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC )
																if not f10_local0 then
																	f10_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_EMP_ACTIVE )
																end
															end
														end
													end
												end
											end
										end
									end
								end
							end
						end
					end
				else
					f10_local0 = true
				end
				return f10_local0
			end
		},
		{
			stateName = "Show",
			condition = function ( menu, element, event )
				return AmICarryingBomb( controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE
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
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM
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
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_SCOPED ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_SCOPED
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.SDBombClient" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.SDBombClient"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "deadSpectator.playerIndex" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "deadSpectator.playerIndex"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Demolition.defending" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "Demolition.defending"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

