-- aa6ef0bee94fa95e026ecfd832c1813c
-- This hash is used for caching, delete to decompile the file again

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
		local primaryButtonImage = Engine.GetModelValue( model )
		if primaryButtonImage then
			buttonImage:setImage( RegisterImage( primaryButtonImage ) )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.buttonImage:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

