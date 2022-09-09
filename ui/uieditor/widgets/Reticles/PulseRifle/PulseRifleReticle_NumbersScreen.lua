-- 0fe54f53e0805c52b9ff9fe579fd65ad
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Reticles.PulseRifle.PulseRifleReticle_Numbers" )

CoD.PulseRifleReticle_NumbersScreen = InheritFrom( LUI.UIElement )
CoD.PulseRifleReticle_NumbersScreen.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.PulseRifleReticle_NumbersScreen )
	self.id = "PulseRifleReticle_NumbersScreen"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 204 )
	self:setTopBottom( true, false, 0, 96 )
	self.anyChildUsesUpdateState = true
	
	local PulseRifleReticleNumbers = CoD.PulseRifleReticle_Numbers.new( menu, controller )
	PulseRifleReticleNumbers:setLeftRight( true, false, 0, 204 )
	PulseRifleReticleNumbers:setTopBottom( true, false, 0, 96 )
	Engine.SetupUI3DWindow( controller, 0, 204, 96 )
	PulseRifleReticleNumbers:setUI3DWindow( 0 )
	PulseRifleReticleNumbers:subscribeToGlobalModel( controller, "CurrentWeapon", nil, function ( model )
		PulseRifleReticleNumbers:setModel( model, controller )
	end )
	self:addElement( PulseRifleReticleNumbers )
	self.PulseRifleReticleNumbers = PulseRifleReticleNumbers
	
	local PulseRifleReticleNumbers0 = CoD.PulseRifleReticle_Numbers.new( menu, controller )
	PulseRifleReticleNumbers0:setLeftRight( true, false, 0, 204 )
	PulseRifleReticleNumbers0:setTopBottom( true, false, 0, 96 )
	Engine.SetupUI3DWindow( controller, 0, 204, 96 )
	PulseRifleReticleNumbers0:setUI3DWindow( 0 )
	PulseRifleReticleNumbers0:setAlpha( 0.15 )
	PulseRifleReticleNumbers0:setZoom( 10 )
	PulseRifleReticleNumbers0:subscribeToGlobalModel( controller, "CurrentWeapon", nil, function ( model )
		PulseRifleReticleNumbers0:setModel( model, controller )
	end )
	self:addElement( PulseRifleReticleNumbers0 )
	self.PulseRifleReticleNumbers0 = PulseRifleReticleNumbers0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				PulseRifleReticleNumbers:completeAnimation()
				self.PulseRifleReticleNumbers:setAlpha( 1 )
				self.clipFinished( PulseRifleReticleNumbers, {} )

				PulseRifleReticleNumbers0:completeAnimation()
				self.PulseRifleReticleNumbers0:setAlpha( 0.15 )
				self.clipFinished( PulseRifleReticleNumbers0, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				PulseRifleReticleNumbers:completeAnimation()
				self.PulseRifleReticleNumbers:setAlpha( 0 )
				self.clipFinished( PulseRifleReticleNumbers, {} )

				PulseRifleReticleNumbers0:completeAnimation()
				self.PulseRifleReticleNumbers0:setAlpha( 0 )
				self.clipFinished( PulseRifleReticleNumbers0, {} )
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
		element.PulseRifleReticleNumbers:close()
		element.PulseRifleReticleNumbers0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
