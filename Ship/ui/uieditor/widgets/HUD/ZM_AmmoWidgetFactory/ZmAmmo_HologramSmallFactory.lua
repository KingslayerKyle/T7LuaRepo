-- 6bcc41988ed0455c987283460944ce25
-- This hash is used for caching, delete to decompile the file again

CoD.ZmAmmo_HologramSmallFactory = InheritFrom( LUI.UIElement )
CoD.ZmAmmo_HologramSmallFactory.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ZmAmmo_HologramSmallFactory )
	self.id = "ZmAmmo_HologramSmallFactory"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 269 )
	self:setTopBottom( true, false, 0, 209 )
	
	local BulbSmFill = LUI.UIImage.new()
	BulbSmFill:setLeftRight( true, false, 0, 269.32 )
	BulbSmFill:setTopBottom( true, false, 0, 209.18 )
	BulbSmFill:setImage( RegisterImage( "uie_t7_zm_derriese_hud_ammo_projection_small" ) )
	self:addElement( BulbSmFill )
	self.BulbSmFill = BulbSmFill
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				local BulbSmFillFrame2 = function ( BulbSmFill, event )
					if not event.interrupted then
						BulbSmFill:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					BulbSmFill:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( BulbSmFill, event )
					else
						BulbSmFill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BulbSmFill:completeAnimation()
				self.BulbSmFill:setAlpha( 0.8 )
				BulbSmFillFrame2( BulbSmFill, {} )

				self.nextClip = "DefaultClip"
			end
		},
		WeaponDual = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				BulbSmFill:completeAnimation()
				self.BulbSmFill:setAlpha( 0 )
				self.clipFinished( BulbSmFill, {} )
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
