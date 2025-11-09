require( "ui.uieditor.widgets.MPHudWidgets.ThrustMeter.ThrustMeterDots" )
require( "ui.uieditor.widgets.MPHudWidgets.ThrustMeter.ThrustMeterArrows" )

local ThrustMeter_Colors = {
	{
		r = 1,
		g = 1,
		b = 1
	}
}
local ThrustMeter_Cutoffs = {
	0
}
local ThrustMeter_Color_Lerp = function ( elem, rgbFrom, rgbTo, frac )
	frac = math.min( math.max( 0, frac ), 1 )
	local red = rgbFrom.r * (1 - frac) + rgbTo.r * frac
	local green = rgbFrom.g * (1 - frac) + rgbTo.g * frac
	local blue = rgbFrom.b * (1 - frac) + rgbTo.b * frac
	elem:setRGB( red, green, blue )
end

local ThrustMeter_ApplyColor = function ( elem, scalableWidth )
	for i = 1, #ThrustMeter_Cutoffs - 1, 1 do
		if ThrustMeter_Cutoffs[i] <= scalableWidth and scalableWidth <= ThrustMeter_Cutoffs[i + 1] then
			local fraction = (scalableWidth - ThrustMeter_Cutoffs[i]) / (ThrustMeter_Cutoffs[i + 1] - ThrustMeter_Cutoffs[i])
			ThrustMeter_Color_Lerp( elem, ThrustMeter_Colors[i], ThrustMeter_Colors[i + 1], fraction )
			return 
		end
	end
	elem:setRGB( ThrustMeter_Colors[#ThrustMeter_Colors].r, ThrustMeter_Colors[#ThrustMeter_Colors].g, ThrustMeter_Colors[#ThrustMeter_Colors].b )
end

local ThrustMeter_Update = function ( self, energyRatioModel )
	local scalableWidth = Engine.GetModelValue( energyRatioModel )
	if not scalableWidth then
		return 
	elseif self.lastScalableWidth == -1 then
		self:playClip( "IntroAnimation" )
		self.lastScalableWidth = 1
	end
	if self.lastScalableWidth == scalableWidth then
		return 
	end
	local f3_local0 = self.lastScalableWidth < scalableWidth
	if scalableWidth == 1 then
		self:setState( "FullEnergy" )
	else
		self:setState( "DefaultState" )
		self:playClip( "DecreaseFromFull" )
	end
	self.lastScalableWidth = scalableWidth
	local targetFill = 0.48 + 0.04 * scalableWidth
	local targetRightRotation = -25.3 + 52.3 * scalableWidth
	local targetRight2Rotation = targetRightRotation + 2
	self.thrustMeter.fill:beginAnimation( "update_fill", 50, false, false )
	ThrustMeter_ApplyColor( self.thrustMeter.fill, scalableWidth )
	self.thrustMeter.fill:setShaderVector( 0, targetFill, 0, 0, 0 )
	self.thrustMeter.dots:beginAnimation( "update_fill", 50, false, false )
	self.thrustMeter.dots:setShaderVector( 0, 1 - targetFill, 0, 0, 0 )
	local arrowAnimLength = 50
	if f3_local0 then
		arrowAnimLength = 50
		self.thrustArrows.right1:playClip( "Fill" )
	else
		self.thrustArrows.right1:playClip( "Drain" )
	end
	self.thrustArrows.right1:beginAnimation( "right_chevron_thick", arrowAnimLength, false, false )
	self.thrustArrows.right1:setZRot( targetRightRotation )
	self.thrustArrows.right2:beginAnimation( "right_chevron_thin", arrowAnimLength, false, false )
	self.thrustArrows.right2:setZRot( targetRight2Rotation )
end

local PostLoadFunc = function ( self, controller )
	self.lastScalableWidth = -1
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.playerEnergyRatio" ), function ( model )
		ThrustMeter_Update( self, model )
	end )
end

CoD.ThrustMeter = InheritFrom( LUI.UIElement )
CoD.ThrustMeter.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ThrustMeter )
	self.id = "ThrustMeter"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 170 )
	self:setTopBottom( true, false, 0, 40 )
	
	local thrustMeter = CoD.ThrustMeterDots.new( menu, controller )
	thrustMeter:setLeftRight( false, false, -70, 68 )
	thrustMeter:setTopBottom( false, true, -36, 0 )
	thrustMeter:setRGB( 1, 1, 1 )
	thrustMeter.fill:setShaderVector( 0, 0.52, 0, 0, 0 )
	thrustMeter.fill:setShaderVector( 1, 0.5, 0, 0, 0 )
	thrustMeter.fill:setShaderVector( 2, -2.84, 0, 0, 0 )
	self:addElement( thrustMeter )
	self.thrustMeter = thrustMeter
	
	local thrustArrows = CoD.ThrustMeterArrows.new( menu, controller )
	thrustArrows:setLeftRight( false, false, -7.5, 7.5 )
	thrustArrows:setTopBottom( false, true, -300, 0 )
	thrustArrows:setRGB( 1, 1, 1 )
	thrustArrows.right1:setZRot( 27 )
	self:addElement( thrustArrows )
	self.thrustArrows = thrustArrows
	
	local pixel1 = LUI.UIImage.new()
	pixel1:setLeftRight( false, false, -80, -72 )
	pixel1:setTopBottom( false, true, -36, -28 )
	pixel1:setRGB( 1, 1, 1 )
	pixel1:setAlpha( 0.4 )
	pixel1:setImage( RegisterImage( "uie_t7_cp_hud_abilitywheel_pixel" ) )
	pixel1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixel1 )
	self.pixel1 = pixel1
	
	local pixel2 = LUI.UIImage.new()
	pixel2:setLeftRight( false, false, 72, 80 )
	pixel2:setTopBottom( false, true, -36, -28 )
	pixel2:setRGB( 1, 1, 1 )
	pixel2:setAlpha( 0.4 )
	pixel2:setImage( RegisterImage( "uie_t7_cp_hud_abilitywheel_pixel" ) )
	pixel2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixel2 )
	self.pixel2 = pixel2
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				thrustMeter:completeAnimation()
				self.thrustMeter:setRGB( 1, 1, 1 )
				self.thrustMeter:setAlpha( 1 )
				self.clipFinished( thrustMeter, {} )
				thrustArrows:completeAnimation()
				self.thrustArrows:setRGB( 1, 1, 1 )
				self.thrustArrows:setAlpha( 1 )
				self.clipFinished( thrustArrows, {} )
				pixel1:completeAnimation()
				self.pixel1:setAlpha( 0.4 )
				self.clipFinished( pixel1, {} )
				pixel2:completeAnimation()
				self.pixel2:setAlpha( 0.4 )
				self.clipFinished( pixel2, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				thrustMeter:completeAnimation()
				self.thrustMeter:setAlpha( 0 )
				self.clipFinished( thrustMeter, {} )
				thrustArrows:completeAnimation()
				self.thrustArrows:setAlpha( 0 )
				self.clipFinished( thrustArrows, {} )
				pixel1:completeAnimation()
				self.pixel1:setAlpha( 0 )
				self.clipFinished( pixel1, {} )
				pixel2:completeAnimation()
				self.pixel2:setAlpha( 0 )
				self.clipFinished( pixel2, {} )
			end
		},
		FullEnergy = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				local thrustMeterFrame2 = function ( thrustMeter, event )
					local thrustMeterFrame3 = function ( thrustMeter, event )
						if not event.interrupted then
							thrustMeter:beginAnimation( "keyframe", 290, false, false, CoD.TweenType.Bounce )
						end
						thrustMeter:setRGB( 1, 1, 1 )
						thrustMeter:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( thrustMeter, event )
						else
							thrustMeter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						thrustMeterFrame3( thrustMeter, event )
						return 
					else
						thrustMeter:beginAnimation( "keyframe", 709, false, false, CoD.TweenType.Linear )
						thrustMeter:registerEventHandler( "transition_complete_keyframe", thrustMeterFrame3 )
					end
				end
				
				thrustMeter:completeAnimation()
				self.thrustMeter:setRGB( 1, 1, 1 )
				self.thrustMeter:setAlpha( 1 )
				thrustMeterFrame2( thrustMeter, {} )
				local thrustArrowsFrame2 = function ( thrustArrows, event )
					local thrustArrowsFrame3 = function ( thrustArrows, event )
						if not event.interrupted then
							thrustArrows:beginAnimation( "keyframe", 629, false, false, CoD.TweenType.Bounce )
						end
						thrustArrows:setRGB( 1, 1, 1 )
						thrustArrows:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( thrustArrows, event )
						else
							thrustArrows:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						thrustArrowsFrame3( thrustArrows, event )
						return 
					else
						thrustArrows:beginAnimation( "keyframe", 370, false, false, CoD.TweenType.Linear )
						thrustArrows:registerEventHandler( "transition_complete_keyframe", thrustArrowsFrame3 )
					end
				end
				
				thrustArrows:completeAnimation()
				self.thrustArrows:setRGB( 1, 1, 1 )
				self.thrustArrows:setAlpha( 1 )
				thrustArrowsFrame2( thrustArrows, {} )
				local pixel1Frame2 = function ( pixel1, event )
					if not event.interrupted then
						pixel1:beginAnimation( "keyframe", 839, false, false, CoD.TweenType.Bounce )
					end
					pixel1:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( pixel1, event )
					else
						pixel1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				pixel1:completeAnimation()
				self.pixel1:setAlpha( 0.4 )
				pixel1Frame2( pixel1, {} )
				local pixel2Frame2 = function ( pixel2, event )
					if not event.interrupted then
						pixel2:beginAnimation( "keyframe", 839, false, false, CoD.TweenType.Bounce )
					end
					pixel2:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( pixel2, event )
					else
						pixel2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				pixel2:completeAnimation()
				self.pixel2:setAlpha( 0.4 )
				pixel2Frame2( pixel2, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				local f16_local0
				if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) and Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE ) then
					f16_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_HARDCORE )
					if not f16_local0 then
						f16_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED )
						if not f16_local0 then
							f16_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM )
							if not f16_local0 then
								f16_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN )
								if not f16_local0 then
									f16_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM )
									if not f16_local0 then
										f16_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED )
										if not f16_local0 then
											f16_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE )
											if not f16_local0 then
												f16_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_VEHICLE )
												if not f16_local0 then
													f16_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE )
													if not f16_local0 then
														f16_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN )
														if not f16_local0 then
															f16_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC )
															if not f16_local0 then
																f16_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_EMP_ACTIVE )
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
					f16_local0 = true
				end
				return f16_local0
			end
		},
		{
			stateName = "FullEnergy",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "playerAbilities.playerEnergyRatio", 1 )
			end
		}
	} )
	if self.m_eventHandlers.hud_update_refresh then
		local currentEv = self.m_eventHandlers.hud_update_refresh
		self:registerEventHandler( "hud_update_refresh", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		self:registerEventHandler( "hud_update_refresh", LUI.UIElement.updateState )
	end
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
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.playerEnergyRatio" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.playerEnergyRatio"
		} )
	end )
	self.close = function ( self )
		self.thrustMeter:close()
		self.thrustArrows:close()
		CoD.ThrustMeter.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

