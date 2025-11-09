require( "ui.uieditor.widgets.Reticles.LauncherMulti.LauncherMultiReticle_UI3D_Internal" )

CoD.LauncherMultiReticle_UI3D = InheritFrom( LUI.UIElement )
CoD.LauncherMultiReticle_UI3D.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LauncherMultiReticle_UI3D )
	self.id = "LauncherMultiReticle_UI3D"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 512 )
	self:setTopBottom( true, false, 0, 512 )
	self.anyChildUsesUpdateState = true
	
	local internal = CoD.LauncherMultiReticle_UI3D_Internal.new( menu, controller )
	internal:setLeftRight( true, false, 0, 512 )
	internal:setTopBottom( true, false, 0, 512 )
	Engine.SetupUI3DWindow( controller, 3, 512, 512 )
	internal:setUI3DWindow( 3 )
	internal:mergeStateConditions( {
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return IsModelValueEnumBitSet( controller, "currentWeapon.lockedOnEnemy", Enum.RocketLauncherTargetStatesFlags.ROCKET_LAUNCHER_TARGET_LOCKED )
			end
		}
	} )
	internal:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.lockedOnEnemy" ), function ( model )
		menu:updateElementState( internal, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.lockedOnEnemy"
		} )
	end )
	self:addElement( internal )
	self.internal = internal
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				internal:completeAnimation()
				self.internal:setAlpha( 1 )
				self.clipFinished( internal, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				internal:completeAnimation()
				self.internal:setAlpha( 0 )
				self.clipFinished( internal, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_EMP_ACTIVE )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.internal:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

