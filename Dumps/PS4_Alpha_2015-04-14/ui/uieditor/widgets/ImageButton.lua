CoD.ImageButton = InheritFrom( LUI.UIElement )
CoD.ImageButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ImageButton )
	self.id = "ImageButton"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 128 )
	self:setTopBottom( true, false, 0, 128 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local focus = LUI.UIImage.new()
	focus:setLeftRight( true, true, 0, 0 )
	focus:setTopBottom( true, true, 0, 0 )
	focus:setRGB( 1, 1, 1 )
	focus:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( focus )
	self.focus = focus
	
	local unfocused = LUI.UIImage.new()
	unfocused:setLeftRight( true, true, 0, 0 )
	unfocused:setTopBottom( true, true, 0, 0 )
	unfocused:setRGB( 1, 1, 1 )
	unfocused:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( unfocused )
	self.unfocused = unfocused
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				focus:completeAnimation()
				self.focus:setAlpha( 0 )
				self.clipFinished( focus, {} )
				unfocused:completeAnimation()
				self.unfocused:setAlpha( 1 )
				self.clipFinished( unfocused, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 2 )
				focus:completeAnimation()
				self.focus:setAlpha( 1 )
				self.clipFinished( focus, {} )
				unfocused:completeAnimation()
				self.unfocused:setAlpha( 0 )
				self.clipFinished( unfocused, {} )
			end
		},
		Disabled = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			Focus = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

