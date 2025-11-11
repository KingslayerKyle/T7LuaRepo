CoD.PreviewImageWidget = InheritFrom( LUI.UIElement )
CoD.PreviewImageWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PreviewImageWidget )
	self.id = "PreviewImageWidget"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1518 )
	self:setTopBottom( 0, 0, 0, 759 )
	
	local image = LUI.UIImage.new()
	image:setLeftRight( 0.5, 0.5, -562.5, 562.5 )
	image:setTopBottom( 0.5, 0.5, 380, 920 )
	image:setMaterial( LUI.UIImage.GetCachedMaterial( "extracam_4" ) )
	image:setShaderVector( 0, 0, 0.09, 1, 0.91 )
	image:setShaderVector( 1, 0.1, 0.15, 0, 0 )
	self:addElement( image )
	self.image = image
	
	self.resetProperties = function ()
		image:completeAnimation()
		image:setLeftRight( 0.5, 0.5, -562.5, 562.5 )
		image:setTopBottom( 0.5, 0.5, 380, 920 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Square = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				image:completeAnimation()
				self.image:setLeftRight( 0.5, 0.5, -218, 217 )
				self.image:setTopBottom( 0.5, 0.5, -217.5, 217.5 )
				self.clipFinished( image, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

