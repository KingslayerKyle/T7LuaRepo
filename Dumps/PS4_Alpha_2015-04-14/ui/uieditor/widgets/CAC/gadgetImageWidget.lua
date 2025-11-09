CoD.gadgetImageWidget = InheritFrom( LUI.UIElement )
CoD.gadgetImageWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.gadgetImageWidget )
	self.id = "gadgetImageWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 130 )
	self:setTopBottom( true, false, 0, 62 )
	
	local grenadeImage = LUI.UIImage.new()
	grenadeImage:setLeftRight( false, false, -31, 31 )
	grenadeImage:setTopBottom( true, false, 0, 62 )
	grenadeImage:setRGB( 1, 1, 1 )
	grenadeImage:setImage( RegisterImage( "uie_grenadeicon" ) )
	grenadeImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( grenadeImage )
	self.grenadeImage = grenadeImage
	
	local takeTwoImage = LUI.UIImage.new()
	takeTwoImage:setLeftRight( false, true, -62, 0 )
	takeTwoImage:setTopBottom( true, false, 0, 62 )
	takeTwoImage:setRGB( 1, 1, 1 )
	takeTwoImage:setAlpha( 0 )
	takeTwoImage:setImage( RegisterImage( "uie_grenadeicon" ) )
	takeTwoImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( takeTwoImage )
	self.takeTwoImage = takeTwoImage
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				grenadeImage:completeAnimation()
				self.grenadeImage:setLeftRight( false, false, -31, 31 )
				self.grenadeImage:setTopBottom( true, false, 0, 62 )
				self.clipFinished( grenadeImage, {} )
				takeTwoImage:completeAnimation()
				self.takeTwoImage:setAlpha( 0 )
				self.clipFinished( takeTwoImage, {} )
			end
		},
		TakeTwo = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

