CoD.listCounterButton = InheritFrom( LUI.UIElement )
CoD.listCounterButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.listCounterButton )
	self.id = "listCounterButton"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 72 )
	self:setTopBottom( 0, 0, 0, 36 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local image = LUI.UIImage.new()
	image:setLeftRight( 0, 1, 0, 0 )
	image:setTopBottom( 0, 1, 0, 0 )
	image:setImage( RegisterImage( "uie_img_t7_menu_arrow" ) )
	self:addElement( image )
	self.image = image
	
	self.resetProperties = function ()
		image:completeAnimation()
		image:setRGB( 1, 1, 1 )
		image:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				image:completeAnimation()
				self.image:setRGB( 1, 0.41, 0 )
				self.clipFinished( image, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				image:completeAnimation()
				self.image:setAlpha( 0 )
				self.clipFinished( image, {} )
			end
		},
		Disabled = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				image:completeAnimation()
				self.image:setRGB( 0.2, 0.29, 0.33 )
				self.clipFinished( image, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

