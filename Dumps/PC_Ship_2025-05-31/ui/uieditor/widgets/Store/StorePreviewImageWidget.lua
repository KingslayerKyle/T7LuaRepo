CoD.StorePreviewImageWidget = InheritFrom( LUI.UIElement )
CoD.StorePreviewImageWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StorePreviewImageWidget )
	self.id = "StorePreviewImageWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 386 )
	self:setTopBottom( true, false, 0, 254 )
	
	local previewImage = LUI.UIImage.new()
	previewImage:setLeftRight( true, true, 1, 1 )
	previewImage:setTopBottom( true, true, 1, 1 )
	previewImage:linkToElementModel( self, "productImage", true, function ( model )
		local productImage = Engine.GetModelValue( model )
		if productImage then
			previewImage:setImage( RegisterImage( productImage ) )
		end
	end )
	self:addElement( previewImage )
	self.previewImage = previewImage
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Hide = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				previewImage:completeAnimation()
				self.previewImage:setAlpha( 0 )
				self.clipFinished( previewImage, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Hide",
			condition = function ( menu, element, event )
				return HideProductNameAndDesc()
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.previewImage:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

