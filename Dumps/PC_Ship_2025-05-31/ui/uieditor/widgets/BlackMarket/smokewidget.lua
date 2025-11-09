CoD.smokewidget = InheritFrom( LUI.UIElement )
CoD.smokewidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.smokewidget )
	self.id = "smokewidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 182 )
	self:setTopBottom( true, false, 0, 238 )
	
	local smoke1 = LUI.UIImage.new()
	smoke1:setLeftRight( true, false, -5, 187 )
	smoke1:setTopBottom( true, false, 0, 178 )
	smoke1:setImage( RegisterImage( "uie_t7_blackmarket_crate_smoke2" ) )
	smoke1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_normal" ) )
	smoke1:setShaderVector( 0, 1, 0.66, 0, 0 )
	smoke1:setShaderVector( 1, 0, 0.08, 0, 0 )
	self:addElement( smoke1 )
	self.smoke1 = smoke1
	
	local mask = LUI.UIImage.new()
	mask:setLeftRight( true, false, 0, 182 )
	mask:setTopBottom( true, false, -38, 238 )
	mask:setImage( RegisterImage( "uie_t7_blackmarket_crate_smokemask" ) )
	self:addElement( mask )
	self.mask = mask
	
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

