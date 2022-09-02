-- 4e8e79abc0aa66fbf0a8c3b04d98863c
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 260 )
	self:setTopBottom( true, false, 0, 112 )
	
	local bo3logo = LUI.UIImage.new()
	bo3logo:setLeftRight( false, true, -244, -16 )
	bo3logo:setTopBottom( true, false, 6, 106 )
	bo3logo:setImage( RegisterImage( "uie_t7_menu_welcome_bo3logo" ) )
	self:addElement( bo3logo )
	self.bo3logo = bo3logo
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				bo3logo:completeAnimation()
				self.bo3logo:setAlpha( 1 )
				self.clipFinished( bo3logo, {} )
			end
		},
		Hide = {
			DefaultClip = function ()
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

