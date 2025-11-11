CoD.GunsmithBO3Logo = InheritFrom( LUI.UIElement )
CoD.GunsmithBO3Logo.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GunsmithBO3Logo )
	self.id = "GunsmithBO3Logo"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 390 )
	self:setTopBottom( 0, 0, 0, 168 )
	
	local bo3logo = LUI.UIImage.new()
	bo3logo:setLeftRight( 1, 1, -366, -24 )
	bo3logo:setTopBottom( 0, 0, 9, 159 )
	bo3logo:setImage( RegisterImage( "uie_t7_menu_welcome_bo3logo" ) )
	self:addElement( bo3logo )
	self.bo3logo = bo3logo
	
	self.resetProperties = function ()
		bo3logo:completeAnimation()
		bo3logo:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Hide = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				bo3logo:completeAnimation()
				self.bo3logo:setAlpha( 0 )
				self.clipFinished( bo3logo, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

