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
	self:setLeftRight( true, false, 0, 1012 )
	self:setTopBottom( true, false, 0, 506 )
	
	local image = LUI.UIImage.new()
	image:setLeftRight( false, false, -375, 375 )
	image:setTopBottom( false, false, 253, 613 )
	image:setMaterial( LUI.UIImage.GetCachedMaterial( "extracam_3" ) )
	image:setShaderVector( 0, 0, 0.09, 1, 0.91 )
	image:setShaderVector( 1, 0.1, 0.15, 0, 0 )
	self:addElement( image )
	self.image = image
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				image:completeAnimation()
				self.image:setAlpha( 1 )
				self.clipFinished( image, {} )
			end
		},
		Square = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				image:completeAnimation()
				self.image:setLeftRight( false, false, -145, 145 )
				self.image:setTopBottom( false, false, -145, 145 )
				self.clipFinished( image, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

