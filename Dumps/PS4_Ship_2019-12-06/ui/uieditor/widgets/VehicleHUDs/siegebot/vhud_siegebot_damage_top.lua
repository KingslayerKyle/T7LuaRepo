CoD.vhud_siegebot_damage_top = InheritFrom( LUI.UIElement )
CoD.vhud_siegebot_damage_top.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.vhud_siegebot_damage_top )
	self.id = "vhud_siegebot_damage_top"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 106 )
	self:setTopBottom( true, false, 0, 106 )
	
	local circle = LUI.UIImage.new()
	circle:setLeftRight( true, false, 0, 106 )
	circle:setTopBottom( true, false, 0, 106 )
	circle:setImage( RegisterImage( "uie_t7_mp_hud_vehicle_siegebot_circleinner" ) )
	circle:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( circle )
	self.circle = circle
	
	local none = LUI.UIImage.new()
	none:setLeftRight( true, false, 0, 106 )
	none:setTopBottom( true, false, 0, 106 )
	none:setImage( RegisterImage( "uie_t7_mp_hud_vehicle_siegebot_icontop" ) )
	none:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( none )
	self.none = none
	
	local low = LUI.UIImage.new()
	low:setLeftRight( true, false, 0, 106 )
	low:setTopBottom( true, false, 0, 106 )
	low:setRGB( 0.97, 0.85, 0 )
	low:setAlpha( 0 )
	low:setImage( RegisterImage( "uie_t7_mp_hud_vehicle_siegebot_damageiconyellow" ) )
	low:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( low )
	self.low = low
	
	local medium = LUI.UIImage.new()
	medium:setLeftRight( true, false, 0, 106 )
	medium:setTopBottom( true, false, 0, 106 )
	medium:setRGB( 1, 0.4, 0 )
	medium:setAlpha( 0 )
	medium:setImage( RegisterImage( "uie_t7_mp_hud_vehicle_siegebot_damageiconorange" ) )
	medium:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( medium )
	self.medium = medium
	
	local high = LUI.UIImage.new()
	high:setLeftRight( true, false, 0, 106 )
	high:setTopBottom( true, false, 0, 106 )
	high:setRGB( 0.67, 0.14, 0.13 )
	high:setAlpha( 0 )
	high:setImage( RegisterImage( "uie_t7_mp_hud_vehicle_siegebot_damageiconred" ) )
	high:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( high )
	self.high = high
	
	local dot = LUI.UIImage.new()
	dot:setLeftRight( true, false, 81.68, 84.68 )
	dot:setTopBottom( true, false, 32.92, 35.92 )
	dot:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_centerinnerringelementpix" ) )
	dot:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( dot )
	self.dot = dot
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 19.68, 22.68 )
	Image0:setTopBottom( true, false, 32.92, 35.92 )
	Image0:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_centerinnerringelementpix" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, 81.68, 84.68 )
	Image1:setTopBottom( true, false, 68.92, 71.92 )
	Image1:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_centerinnerringelementpix" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( true, false, 19.68, 22.68 )
	Image2:setTopBottom( true, false, 68.92, 71.92 )
	Image2:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_centerinnerringelementpix" ) )
	Image2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				none:completeAnimation()
				self.none:setAlpha( 1 )
				self.clipFinished( none, {} )
				low:completeAnimation()
				self.low:setAlpha( 0 )
				self.clipFinished( low, {} )
				medium:completeAnimation()
				self.medium:setAlpha( 0 )
				self.clipFinished( medium, {} )
				high:completeAnimation()
				self.high:setAlpha( 0 )
				self.clipFinished( high, {} )
			end,
			StartUp = function ()
				self:setupElementClipCounter( 0 )
			end,
			Zoom = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		damage_high = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				none:completeAnimation()
				self.none:setAlpha( 1 )
				self.clipFinished( none, {} )
				low:completeAnimation()
				self.low:setAlpha( 0 )
				self.clipFinished( low, {} )
				medium:completeAnimation()
				self.medium:setAlpha( 0 )
				self.clipFinished( medium, {} )
				local highFrame2 = function ( high, event )
					local highFrame3 = function ( high, event )
						local highFrame4 = function ( high, event )
							local highFrame5 = function ( high, event )
								local highFrame6 = function ( high, event )
									if not event.interrupted then
										high:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
									end
									high:setAlpha( 0 )
									high:setScale( 1.3 )
									if event.interrupted then
										self.clipFinished( high, event )
									else
										high:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									highFrame6( high, event )
									return 
								else
									high:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
									high:setAlpha( 0.4 )
									high:setScale( 1.18 )
									high:registerEventHandler( "transition_complete_keyframe", highFrame6 )
								end
							end
							
							if event.interrupted then
								highFrame5( high, event )
								return 
							else
								high:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
								high:setAlpha( 1 )
								high:registerEventHandler( "transition_complete_keyframe", highFrame5 )
							end
						end
						
						if event.interrupted then
							highFrame4( high, event )
							return 
						else
							high:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
							high:setAlpha( 0.32 )
							high:registerEventHandler( "transition_complete_keyframe", highFrame4 )
						end
					end
					
					if event.interrupted then
						highFrame3( high, event )
						return 
					else
						high:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						high:setAlpha( 1 )
						high:registerEventHandler( "transition_complete_keyframe", highFrame3 )
					end
				end
				
				high:completeAnimation()
				self.high:setAlpha( 0 )
				self.high:setScale( 1 )
				highFrame2( high, {} )
				self.nextClip = "DefaultClip"
			end
		},
		damage_medium = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				none:completeAnimation()
				self.none:setAlpha( 1 )
				self.clipFinished( none, {} )
				low:completeAnimation()
				self.low:setAlpha( 0 )
				self.clipFinished( low, {} )
				medium:completeAnimation()
				self.medium:setAlpha( 0.8 )
				self.clipFinished( medium, {} )
				high:completeAnimation()
				self.high:setAlpha( 0 )
				self.clipFinished( high, {} )
			end
		},
		damage_low = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				none:completeAnimation()
				self.none:setAlpha( 1 )
				self.clipFinished( none, {} )
				low:completeAnimation()
				self.low:setAlpha( 0.5 )
				self.clipFinished( low, {} )
				medium:completeAnimation()
				self.medium:setAlpha( 0 )
				self.clipFinished( medium, {} )
				high:completeAnimation()
				self.high:setAlpha( 0 )
				self.clipFinished( high, {} )
			end
		},
		EMP = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "damage_high",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThanOrEqualTo( element, controller, "damage", 0.75 )
			end
		},
		{
			stateName = "damage_medium",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThanOrEqualTo( element, controller, "damage", 0.5 )
			end
		},
		{
			stateName = "damage_low",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThanOrEqualTo( element, controller, "damage", 0.25 )
			end
		},
		{
			stateName = "EMP",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_EMP_ACTIVE )
			end
		}
	} )
	self:linkToElementModel( self, "damage", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "damage"
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
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

