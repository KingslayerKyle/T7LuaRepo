CoD.MegaChewMachine = InheritFrom( LUI.UIElement )
CoD.MegaChewMachine.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MegaChewMachine )
	self.id = "MegaChewMachine"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 128 )
	self:setTopBottom( true, false, 0, 128 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 0, 128 )
	Image0:setTopBottom( true, false, 116, 128 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Image0:completeAnimation()
				self.Image0:setRGB( 1, 1, 1 )
				self.clipFinished( Image0, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 1 )
				Image0:completeAnimation()
				self.Image0:setRGB( 1, 0, 0 )
				self.clipFinished( Image0, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

