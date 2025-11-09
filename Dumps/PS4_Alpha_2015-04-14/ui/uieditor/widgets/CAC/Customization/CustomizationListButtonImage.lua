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
	image:setRGB( 1, 1, 1 )
	image:setAlpha( 0 )
	image:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	image:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			image:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( image )
	self.image = image
	
	local paintjob = LUI.UIElement.new()
	paintjob:setLeftRight( true, true, 0, 0 )
	paintjob:setTopBottom( true, true, 0, 0 )
	paintjob:setRGB( 1, 1, 1 )
	paintjob:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	paintjob:subscribeToGlobalModel( controller, "Customization", "type", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			paintjob:setupPaintjobCustomizationType( modelValue )
		end
	end )
	paintjob:linkToElementModel( self, "paintjobSlot", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			paintjob:setupPaintjobSlot( modelValue )
		end
	end )
	paintjob:linkToElementModel( self, "paintjobIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			paintjob:setupPaintjobIndex( modelValue )
		end
	end )
	self:addElement( paintjob )
	self.paintjob = paintjob
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				image:completeAnimation()
				self.image:setAlpha( 1 )
				self.clipFinished( image, {} )
				paintjob:completeAnimation()
				self.paintjob:setAlpha( 0 )
				self.clipFinished( paintjob, {} )
			end
		},
		PaintJob = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				image:completeAnimation()
				self.image:setAlpha( 0 )
				self.clipFinished( image, {} )
				paintjob:completeAnimation()
				self.paintjob:setAlpha( 1 )
				self.clipFinished( paintjob, {} )
			end
		}
	}
	self.close = function ( self )
		self.image:close()
		self.paintjob:close()
		CoD.CustomizationListButtonImage.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

