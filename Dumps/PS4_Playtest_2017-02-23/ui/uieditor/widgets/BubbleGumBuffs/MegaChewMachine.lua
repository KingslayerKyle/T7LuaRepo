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
	self:setLeftRight( 0, 0, 0, 192 )
	self:setTopBottom( 0, 0, 0, 192 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( 0, 0, 0, 192 )
	Image0:setTopBottom( 0, 0, 174, 192 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	self.resetProperties = function ()
		Image0:completeAnimation()
		Image0:setRGB( 1, 1, 1 )
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

