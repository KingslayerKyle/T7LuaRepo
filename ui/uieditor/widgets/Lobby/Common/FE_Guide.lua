-- 4a502ff73264445f5393509eb94c01ae
-- This hash is used for caching, delete to decompile the file again

CoD.FE_Guide = InheritFrom( LUI.UIElement )
CoD.FE_Guide.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_Guide )
	self.id = "FE_Guide"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1096 )
	self:setTopBottom( true, false, 0, 479 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 0, 66 )
	Image0:setTopBottom( true, false, 0, 479 )
	Image0:setAlpha( 0.22 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image00 = LUI.UIImage.new()
	Image00:setLeftRight( true, false, 67, 377 )
	Image00:setTopBottom( true, false, 20, 239.5 )
	Image00:setAlpha( 0.43 )
	self:addElement( Image00 )
	self.Image00 = Image00
	
	local Image000 = LUI.UIImage.new()
	Image000:setLeftRight( true, false, 395.5, 736.5 )
	Image000:setTopBottom( true, false, 111, 324 )
	Image000:setAlpha( 0.5 )
	self:addElement( Image000 )
	self.Image000 = Image000
	
	local Image0000 = LUI.UIImage.new()
	Image0000:setLeftRight( true, false, 755, 1096 )
	Image0000:setTopBottom( true, false, 148, 398.07 )
	Image0000:setAlpha( 0.48 )
	self:addElement( Image0000 )
	self.Image0000 = Image0000
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		SelectingPlaylist = {
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

