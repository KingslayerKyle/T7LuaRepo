CoD.blackhatEmp = InheritFrom( LUI.UIElement )
CoD.blackhatEmp.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.blackhatEmp )
	self.id = "blackhatEmp"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 202 )
	self:setTopBottom( true, false, 0, 168 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 0, 202.46 )
	Image0:setTopBottom( true, false, 0, 168 )
	Image0:setImage( RegisterImage( "uie_hud_t7_blackhat_emp" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_emp" ) )
	Image0:setShaderVector( 0, 17.69, 0, 0, 0 )
	Image0:setShaderVector( 1, 1.63, 0, 0, 0 )
	Image0:setShaderVector( 2, 2.21, 0, 0, 0 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	self.clipsPerState = {
		DefaultState = {
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

