-- 6953e85517874982c164926c5ca2bb96
-- This hash is used for caching, delete to decompile the file again

CoD.FE_ButtonWarning = InheritFrom( LUI.UIElement )
CoD.FE_ButtonWarning.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.FE_ButtonWarning )
	self.id = "FE_ButtonWarning"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 30 )
	self:setTopBottom( true, false, 0, 32 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, true, 0, 0 )
	Image0:setTopBottom( true, true, 4, -4 )
	Image0:setRGB( 1, 0.45, 0 )
	Image0:setImage( RegisterImage( "uie_t7_icon_pregame_warning" ) )
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
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				Image0:completeAnimation()
				self.Image0:setAlpha( 1 )
				self.Image0:setYRot( 0 )
				self.clipFinished( Image0, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "warning" )
			end
		}
	} )
	self:linkToElementModel( self, "warning", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "warning"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
