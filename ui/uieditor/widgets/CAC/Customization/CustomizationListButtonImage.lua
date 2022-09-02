-- 20e4828a5b613e16144afa20f588efa6
-- This hash is used for caching, delete to decompile the file again

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
		local _image = Engine.GetModelValue( model )
		if _image then
			image:setImage( RegisterImage( _image ) )
		end
	end )
	self:addElement( image )
	self.image = image
	
	local paintjobExtraCamRender = LUI.UIImage.new()
	paintjobExtraCamRender:setLeftRight( true, true, 0, 0 )
	paintjobExtraCamRender:setTopBottom( true, true, 0, 0 )
	paintjobExtraCamRender:linkToElementModel( self, "paintjobSlotAndIndex", true, function ( model )
		local paintjobSlotAndIndex = Engine.GetModelValue( model )
		if paintjobSlotAndIndex then
			paintjobExtraCamRender:setupWCPaintjobIconExtraCamRender( GetPaintshopExtraCamParameters( controller, paintjobSlotAndIndex ) )
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

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.image:close()
		element.paintjobExtraCamRender:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

