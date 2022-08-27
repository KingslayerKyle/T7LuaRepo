-- 9a19cc71edd21b88e802e1659efd47cb
-- This hash is used for caching, delete to decompile the file again

CoD.AmmoWidget_Ball = InheritFrom( LUI.UIElement )
CoD.AmmoWidget_Ball.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidget_Ball )
	self.id = "AmmoWidget_Ball"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 70 )
	self:setTopBottom( true, false, 0, 70 )
	
	local PanelGlow = LUI.UIImage.new()
	PanelGlow:setLeftRight( true, false, -21.23, 86.37 )
	PanelGlow:setTopBottom( true, false, -19.5, 89.5 )
	PanelGlow:setRGB( 0.3, 0.65, 0.82 )
	PanelGlow:setAlpha( 0.41 )
	PanelGlow:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	PanelGlow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( PanelGlow )
	self.PanelGlow = PanelGlow
	
	local Ball = LUI.UIImage.new()
	Ball:setLeftRight( true, false, 0, 70 )
	Ball:setTopBottom( true, false, 0, 70 )
	Ball:setScale( 0.9 )
	Ball:setImage( RegisterImage( "uie_t7_hud_widget_uplink_ball" ) )
	self:addElement( Ball )
	self.Ball = Ball
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				PanelGlow:completeAnimation()
				self.PanelGlow:setAlpha( 0 )
				self.clipFinished( PanelGlow, {} )
				Ball:completeAnimation()
				self.Ball:setAlpha( 0 )
				self.clipFinished( Ball, {} )
			end
		},
		Hide = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				PanelGlow:completeAnimation()
				self.PanelGlow:setAlpha( 0 )
				self.clipFinished( PanelGlow, {} )
				Ball:completeAnimation()
				self.Ball:setAlpha( 0 )
				self.clipFinished( Ball, {} )
			end
		},
		Show = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				local PanelGlowFrame2 = function ( PanelGlow, event )
					local PanelGlowFrame3 = function ( PanelGlow, event )
						local PanelGlowFrame4 = function ( PanelGlow, event )
							local PanelGlowFrame5 = function ( PanelGlow, event )
								local PanelGlowFrame6 = function ( PanelGlow, event )
									local PanelGlowFrame7 = function ( PanelGlow, event )
										if not event.interrupted then
											PanelGlow:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Linear )
										end
										PanelGlow:setLeftRight( true, false, -21.23, 86.37 )
										PanelGlow:setTopBottom( true, false, -19.5, 89.5 )
										PanelGlow:setRGB( 0.3, 0.65, 0.82 )
										PanelGlow:setAlpha( 0.4 )
										PanelGlow:setScale( 1 )
										if event.interrupted then
											self.clipFinished( PanelGlow, event )
										else
											PanelGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										PanelGlowFrame7( PanelGlow, event )
										return 
									else
										PanelGlow:beginAnimation( "keyframe", 350, false, false, CoD.TweenType.Linear )
										PanelGlow:setAlpha( 0.75 )
										PanelGlow:registerEventHandler( "transition_complete_keyframe", PanelGlowFrame7 )
									end
								end
								
								if event.interrupted then
									PanelGlowFrame6( PanelGlow, event )
									return 
								else
									PanelGlow:beginAnimation( "keyframe", 399, false, false, CoD.TweenType.Linear )
									PanelGlow:setAlpha( 0.4 )
									PanelGlow:registerEventHandler( "transition_complete_keyframe", PanelGlowFrame6 )
								end
							end
							
							if event.interrupted then
								PanelGlowFrame5( PanelGlow, event )
								return 
							else
								PanelGlow:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
								PanelGlow:setAlpha( 0.75 )
								PanelGlow:registerEventHandler( "transition_complete_keyframe", PanelGlowFrame5 )
							end
						end
						
						if event.interrupted then
							PanelGlowFrame4( PanelGlow, event )
							return 
						else
							PanelGlow:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
							PanelGlow:setAlpha( 0.41 )
							PanelGlow:registerEventHandler( "transition_complete_keyframe", PanelGlowFrame4 )
						end
					end
					
					if event.interrupted then
						PanelGlowFrame3( PanelGlow, event )
						return 
					else
						PanelGlow:beginAnimation( "keyframe", 389, false, false, CoD.TweenType.Linear )
						PanelGlow:setAlpha( 0.75 )
						PanelGlow:registerEventHandler( "transition_complete_keyframe", PanelGlowFrame3 )
					end
				end
				
				PanelGlow:completeAnimation()
				self.PanelGlow:setLeftRight( true, false, -21.23, 86.37 )
				self.PanelGlow:setTopBottom( true, false, -19.5, 89.5 )
				self.PanelGlow:setRGB( 0.3, 0.65, 0.82 )
				self.PanelGlow:setAlpha( 0.41 )
				self.PanelGlow:setScale( 1 )
				PanelGlowFrame2( PanelGlow, {} )
				local BallFrame2 = function ( Ball, event )
					local BallFrame3 = function ( Ball, event )
						local BallFrame4 = function ( Ball, event )
							local BallFrame5 = function ( Ball, event )
								local BallFrame6 = function ( Ball, event )
									local BallFrame7 = function ( Ball, event )
										if not event.interrupted then
											Ball:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Linear )
										end
										Ball:setAlpha( 1 )
										Ball:setScale( 0.9 )
										if event.interrupted then
											self.clipFinished( Ball, event )
										else
											Ball:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										BallFrame7( Ball, event )
										return 
									else
										Ball:beginAnimation( "keyframe", 350, false, false, CoD.TweenType.Linear )
										Ball:setScale( 0.8 )
										Ball:registerEventHandler( "transition_complete_keyframe", BallFrame7 )
									end
								end
								
								if event.interrupted then
									BallFrame6( Ball, event )
									return 
								else
									Ball:beginAnimation( "keyframe", 399, false, false, CoD.TweenType.Linear )
									Ball:setScale( 0.9 )
									Ball:registerEventHandler( "transition_complete_keyframe", BallFrame6 )
								end
							end
							
							if event.interrupted then
								BallFrame5( Ball, event )
								return 
							else
								Ball:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
								Ball:setScale( 0.8 )
								Ball:registerEventHandler( "transition_complete_keyframe", BallFrame5 )
							end
						end
						
						if event.interrupted then
							BallFrame4( Ball, event )
							return 
						else
							Ball:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
							Ball:setScale( 0.9 )
							Ball:registerEventHandler( "transition_complete_keyframe", BallFrame4 )
						end
					end
					
					if event.interrupted then
						BallFrame3( Ball, event )
						return 
					else
						Ball:beginAnimation( "keyframe", 389, false, false, CoD.TweenType.Linear )
						Ball:setScale( 0.8 )
						Ball:registerEventHandler( "transition_complete_keyframe", BallFrame3 )
					end
				end
				
				Ball:completeAnimation()
				self.Ball:setAlpha( 1 )
				self.Ball:setScale( 0.9 )
				BallFrame2( Ball, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Hide",
			condition = function ( menu, element, event )
				local f17_local0
				if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) and Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE ) then
					f17_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_HARDCORE )
					if not f17_local0 then
						f17_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED )
						if not f17_local0 then
							f17_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM )
							if not f17_local0 then
								f17_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN )
								if not f17_local0 then
									f17_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM )
									if not f17_local0 then
										f17_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED )
										if not f17_local0 then
											f17_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE )
											if not f17_local0 then
												f17_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_SCOPED )
												if not f17_local0 then
													f17_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_VEHICLE )
													if not f17_local0 then
														f17_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE )
														if not f17_local0 then
															f17_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN )
															if not f17_local0 then
																f17_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC )
																if not f17_local0 then
																	f17_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_EMP_ACTIVE )
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
					f17_local0 = true
				end
				return f17_local0
			end
		},
		{
			stateName = "Show",
			condition = function ( menu, element, event )
				return IsCurrentViewmodelWeaponName( controller, "ball" )
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
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.viewmodelWeaponName" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.viewmodelWeaponName"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

