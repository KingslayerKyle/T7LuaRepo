CoD.FE_HelpItemsLabel = InheritFrom( LUI.UIElement )
CoD.FE_HelpItemsLabel.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_HelpItemsLabel )
	self.id = "FE_HelpItemsLabel"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 30 )
	self:setTopBottom( 0, 0, 0, 30 )
	
	local newImage = LUI.UIImage.new()
	newImage:setLeftRight( 0, 1, 0, 0 )
	newImage:setTopBottom( 0, 1, 0, 0 )
	newImage:setImage( RegisterImage( "uie_t7_menu_frontend_helptag" ) )
	self:addElement( newImage )
	self.newImage = newImage
	
	self.resetProperties = function ()
		newImage:completeAnimation()
		newImage:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				newImage:completeAnimation()
				self.newImage:setAlpha( 0 )
				self.clipFinished( newImage, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsDisabled( element, controller )
			end
		}
	} )
	self:linkToElementModel( self, "disabled", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		} )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

