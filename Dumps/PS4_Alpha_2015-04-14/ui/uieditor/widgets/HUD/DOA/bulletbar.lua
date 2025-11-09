CoD.bulletbar = InheritFrom( LUI.UIElement )
CoD.bulletbar.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.bulletbar )
	self.id = "bulletbar"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 261 )
	self:setTopBottom( true, false, 0, 49 )
	
	local barfill = LUI.UIImage.new()
	barfill:setLeftRight( true, true, 0, 0 )
	barfill:setTopBottom( true, true, 0, 0 )
	barfill:setRGB( 1, 1, 1 )
	barfill:setImage( RegisterImage( "uie_emblem_bg_bullets02" ) )
	barfill:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	barfill:setShaderVector( 0, 1, 0, 0, 0 )
	barfill:setShaderVector( 1, 0, 0, 0, 0 )
	barfill:setShaderVector( 2, 1, 0, 0, 0 )
	barfill:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( barfill )
	self.barfill = barfill
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

