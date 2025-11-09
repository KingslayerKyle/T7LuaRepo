CoD.SelectionPreviewImage = InheritFrom( LUI.UIElement )
CoD.SelectionPreviewImage.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SelectionPreviewImage )
	self.id = "SelectionPreviewImage"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 680 )
	self:setTopBottom( true, false, 0, 340 )
	
	local previewImage = LUI.UIImage.new()
	previewImage:setLeftRight( false, false, -340, 340 )
	previewImage:setTopBottom( false, false, -170, 170 )
	previewImage:setRGB( 1, 1, 1 )
	previewImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( previewImage )
	self.previewImage = previewImage
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				previewImage:completeAnimation()
				self.previewImage:setLeftRight( false, false, -340, 340 )
				self.previewImage:setTopBottom( false, false, -170, 170 )
				self.clipFinished( previewImage, {} )
			end
		},
		Square = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				previewImage:completeAnimation()
				self.previewImage:setLeftRight( false, false, -170, 170 )
				self.previewImage:setTopBottom( false, false, -170, 170 )
				self.clipFinished( previewImage, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

