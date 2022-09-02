-- bb212f169cbd93bc4c4d3d09d586323a
-- This hash is used for caching, delete to decompile the file again

CoD.AbilityWheel_CenterAberation = InheritFrom( LUI.UIElement )
CoD.AbilityWheel_CenterAberation.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.AbilityWheel_CenterAberation )
	self.id = "AbilityWheel_CenterAberation"
	self.soundSet = "AbilityWheel"
	self:setLeftRight( true, false, 0, 309 )
	self:setTopBottom( true, false, 0, 320 )
	
	local CenterSphere0 = LUI.UIImage.new()
	CenterSphere0:setLeftRight( true, false, 0, 308.79 )
	CenterSphere0:setTopBottom( true, false, 0, 320 )
	CenterSphere0:setRGB( 0, 0, 0 )
	CenterSphere0:setAlpha( 0.75 )
	CenterSphere0:setScale( 0.9 )
	CenterSphere0:setImage( RegisterImage( "uie_t7_cp_hud_abilitywheel_sphere" ) )
	CenterSphere0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_multiply" ) )
	self:addElement( CenterSphere0 )
	self.CenterSphere0 = CenterSphere0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end,
			Close = function ()
				self:setupElementClipCounter( 0 )

			end
		},
		ControlCore = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end
		},
		MartialCore = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				CenterSphere0:completeAnimation()
				self.CenterSphere0:setRGB( 0, 0, 0 )
				self.CenterSphere0:setAlpha( 1 )
				self.clipFinished( CenterSphere0, {} )
			end
		},
		ChaosCore = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				CenterSphere0:completeAnimation()
				self.CenterSphere0:setRGB( 0, 0, 0 )
				self.CenterSphere0:setAlpha( 0.75 )
				self.CenterSphere0:setScale( 0.9 )
				self.CenterSphere0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_multiply" ) )
				self.clipFinished( CenterSphere0, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "ControlCore",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "hudItems.cybercomRequestedType", 0 )
			end
		},
		{
			stateName = "MartialCore",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "hudItems.cybercomRequestedType", 1 )
			end
		},
		{
			stateName = "ChaosCore",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "hudItems.cybercomRequestedType", 2 )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.cybercomRequestedType" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.cybercomRequestedType"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

