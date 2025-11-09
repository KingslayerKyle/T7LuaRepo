CoD.CustomizationListButtonImage = InheritFrom( LUI.UIElement )
CoD.CustomizationListButtonImage.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CustomizationListButtonImage )
	self.id = "CustomizationListButtonImage"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 120 )
	self:setTopBottom( true, false, 0, 120 )
	
	local image = LUI.UIImage.new()
	image:setLeftRight( true, true, 0, 0 )
	image:setTopBottom( true, true, 0, 0 )
	image:setAlpha( 0 )
	image:setupUIStreamedImage( 0 )
	image:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			image:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( image )
	self.image = image
	
	local paintjobExtraCamRender = LUI.UIImage.new()
	paintjobExtraCamRender:setLeftRight( true, true, 0, 0 )
	paintjobExtraCamRender:setTopBottom( true, true, 0, 0 )
	paintjobExtraCamRender:linkToElementModel( self, "paintjobSlotAndIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			paintjobExtraCamRender:setupWCPaintjobIconExtraCamRender( GetPaintshopExtraCamParameters( controller, modelValue ) )
		end
	end )
	self:addElement( paintjobExtraCamRender )
	self.paintjobExtraCamRender = paintjobExtraCamRender
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				image:completeAnimation()
				self.image:setAlpha( 1 )
				self.clipFinished( image, {} )
				paintjobExtraCamRender:completeAnimation()
				self.paintjobExtraCamRender:setAlpha( 0 )
				self.clipFinished( paintjobExtraCamRender, {} )
			end
		},
		PaintJob = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				image:completeAnimation()
				self.image:setAlpha( 0 )
				self.clipFinished( image, {} )
				paintjobExtraCamRender:completeAnimation()
				self.paintjobExtraCamRender:setAlpha( 1 )
				self.clipFinished( paintjobExtraCamRender, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.image:close()
		self.paintjobExtraCamRender:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

