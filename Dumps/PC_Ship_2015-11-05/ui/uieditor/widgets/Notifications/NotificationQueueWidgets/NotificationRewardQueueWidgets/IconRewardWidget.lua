CoD.IconRewardWidget = InheritFrom( LUI.UIElement )
CoD.IconRewardWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.IconRewardWidget )
	self.id = "IconRewardWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 48 )
	self:setTopBottom( true, false, 0, 48 )
	
	local ImageScanline = LUI.UIImage.new()
	ImageScanline:setLeftRight( false, true, -48, 0 )
	ImageScanline:setTopBottom( false, false, -24, 24 )
	ImageScanline:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scanlines" ) )
	ImageScanline:setShaderVector( 0, 2, 0, 0, 0 )
	ImageScanline:setShaderVector( 1, 1, 0, 0, 0 )
	ImageScanline:setShaderVector( 2, 0.03, 0, 0, 0 )
	self:addElement( ImageScanline )
	self.ImageScanline = ImageScanline
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				ImageScanline:completeAnimation()
				self.ImageScanline:setLeftRight( false, true, -48, 0 )
				self.ImageScanline:setTopBottom( false, false, -24, 24 )
				self.clipFinished( ImageScanline, {} )
			end
		},
		CallingCard = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				ImageScanline:completeAnimation()
				self.ImageScanline:setLeftRight( false, true, -111, 19 )
				self.ImageScanline:setTopBottom( false, false, -16, 16 )
				self.clipFinished( ImageScanline, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

