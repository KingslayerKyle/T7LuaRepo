-- 475a9ee3ed0105721c3c3200c75ca64f
-- This hash is used for caching, delete to decompile the file again

CoD.onOffImage = InheritFrom( LUI.UIElement )
CoD.onOffImage.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.onOffImage )
	self.id = "onOffImage"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 64 )
	self:setTopBottom( true, false, 0, 64 )
	
	local image = LUI.UIImage.new()
	image:setLeftRight( true, true, 0, 0 )
	image:setTopBottom( true, true, 0, 0 )
	self:addElement( image )
	self.image = image
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				image:completeAnimation()
				self.image:setAlpha( 0 )
				self.clipFinished( image, {} )
			end
		},
		On = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				image:completeAnimation()
				self.image:setAlpha( 1 )
				self.clipFinished( image, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

