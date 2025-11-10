CoD.BM_Logo = InheritFrom( LUI.UIElement )
CoD.BM_Logo.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BM_Logo )
	self.id = "BM_Logo"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 324 )
	self:setTopBottom( true, false, 0, 121 )
	
	local logo = LUI.UIImage.new()
	logo:setLeftRight( true, false, 0, 338.8 )
	logo:setTopBottom( true, false, 0, 121 )
	logo:setImage( RegisterImage( "uie_t7_blackmarket_screen_header" ) )
	self:addElement( logo )
	self.logo = logo
	
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

