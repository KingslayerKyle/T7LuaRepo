-- 1b0e940dc20656f8ac1432ec069f4429
-- This hash is used for caching, delete to decompile the file again

CoD.firstplace = InheritFrom( LUI.UIElement )
CoD.firstplace.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.firstplace )
	self.id = "firstplace"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 72 )
	self:setTopBottom( true, false, 0, 72 )
	
	local firstplace = LUI.UIImage.new()
	firstplace:setLeftRight( true, true, 0, 0 )
	firstplace:setTopBottom( true, true, 0, 0 )
	firstplace:setAlpha( 0 )
	firstplace:setImage( RegisterImage( "uie_firstplace" ) )
	self:addElement( firstplace )
	self.firstplace = firstplace
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				firstplace:completeAnimation()
				self.firstplace:setAlpha( 0 )
				self.clipFinished( firstplace, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				firstplace:completeAnimation()
				self.firstplace:setAlpha( 1 )
				self.clipFinished( firstplace, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "ribbon", 1 )
			end
		}
	} )
	self:linkToElementModel( self, "ribbon", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "ribbon"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

