CoD.ButtonIcon = InheritFrom( LUI.UIElement )
CoD.ButtonIcon.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ButtonIcon )
	self.id = "ButtonIcon"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 32 )
	self:setTopBottom( true, false, 0, 32 )
	
	local buttonImage = LUI.UIImage.new()
	buttonImage:setLeftRight( true, true, 0, 0 )
	buttonImage:setTopBottom( true, true, 0, 0 )
	buttonImage:subscribeToGlobalModel( controller, "Controller", "primary_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			buttonImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( buttonImage )
	self.buttonImage = buttonImage
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				buttonImage:completeAnimation()
				self.buttonImage:setAlpha( 0 )
				self.clipFinished( buttonImage, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				buttonImage:completeAnimation()
				self.buttonImage:setAlpha( 1 )
				self.clipFinished( buttonImage, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.buttonImage:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

