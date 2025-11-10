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
	self:setLeftRight( true, false, 0, 20 )
	self:setTopBottom( true, false, 0, 20 )
	
	local newImage = LUI.UIImage.new()
	newImage:setLeftRight( true, true, 0, 0 )
	newImage:setTopBottom( true, true, 0, 0 )
	newImage:setImage( RegisterImage( "uie_t7_menu_frontend_helptag" ) )
	self:addElement( newImage )
	self.newImage = newImage
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				newImage:completeAnimation()
				self.newImage:setAlpha( 0 )
				self.clipFinished( newImage, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				newImage:completeAnimation()
				self.newImage:setAlpha( 1 )
				self.clipFinished( newImage, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 0 )
			end,
			Focus = function ()
				self:setupElementClipCounter( 0 )
			end,
			LoseFocus = function ()
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

