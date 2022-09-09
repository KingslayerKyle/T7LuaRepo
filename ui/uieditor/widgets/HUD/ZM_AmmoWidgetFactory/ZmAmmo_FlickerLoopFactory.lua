-- 8092203c9dfe1739b4f296a4f930baef
-- This hash is used for caching, delete to decompile the file again

CoD.ZmAmmo_FlickerLoopFactory = InheritFrom( LUI.UIElement )
CoD.ZmAmmo_FlickerLoopFactory.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ZmAmmo_FlickerLoopFactory )
	self.id = "ZmAmmo_FlickerLoopFactory"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 127 )
	self:setTopBottom( true, false, 0, 127 )
	
	local ReflectAnim = LUI.UIImage.new()
	ReflectAnim:setLeftRight( true, false, 0, 126.85 )
	ReflectAnim:setTopBottom( true, false, 0, 126.85 )
	ReflectAnim:setImage( RegisterImage( "uie_t7_zm_derriese_hud_ammo_dpadbasereflect" ) )
	self:addElement( ReflectAnim )
	self.ReflectAnim = ReflectAnim
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				local ReflectAnimFrame2 = function ( ReflectAnim, event )
					if not event.interrupted then
						ReflectAnim:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					ReflectAnim:setAlpha( 0.2 )
					if event.interrupted then
						self.clipFinished( ReflectAnim, event )
					else
						ReflectAnim:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ReflectAnim:completeAnimation()
				self.ReflectAnim:setAlpha( 0.6 )
				ReflectAnimFrame2( ReflectAnim, {} )

				self.nextClip = "DefaultClip"
			end
		},
		WeaponDual = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				local ReflectAnimFrame2 = function ( ReflectAnim, event )
					if not event.interrupted then
						ReflectAnim:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					ReflectAnim:setAlpha( 0.2 )
					if event.interrupted then
						self.clipFinished( ReflectAnim, event )
					else
						ReflectAnim:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ReflectAnim:completeAnimation()
				self.ReflectAnim:setAlpha( 1 )
				ReflectAnimFrame2( ReflectAnim, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "WeaponDual",
			condition = function ( menu, element, event )
				return IsModelValueGreaterThanOrEqualTo( controller, "currentWeapon.ammoInDWClip", 0 )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.ammoInDWClip" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.ammoInDWClip"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
