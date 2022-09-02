-- cf5b2a4cdb0cbdfeffd095137738ffab
-- This hash is used for caching, delete to decompile the file again

CoD.vhud_siegebot_EMPwidget = InheritFrom( LUI.UIElement )
CoD.vhud_siegebot_EMPwidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.vhud_siegebot_EMPwidget )
	self.id = "vhud_siegebot_EMPwidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 144 )
	self:setTopBottom( true, false, 0, 280 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 0, 144 )
	Image0:setTopBottom( true, false, 0, 280 )
	Image0:setImage( RegisterImage( "uie_hud_t7_emp_siegebotdirectional" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_emp" ) )
	Image0:setShaderVector( 0, 26, 0, 0, 0 )
	Image0:setShaderVector( 1, 1, 0, 0, 0 )
	Image0:setShaderVector( 2, 1, 0, 0, 0 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				Image0:completeAnimation()
				self.Image0:setAlpha( 0 )
				self.clipFinished( Image0, {} )
			end
		},
		EMP = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				Image0:completeAnimation()
				self.Image0:setAlpha( 1 )
				self.clipFinished( Image0, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "EMP",
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
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

