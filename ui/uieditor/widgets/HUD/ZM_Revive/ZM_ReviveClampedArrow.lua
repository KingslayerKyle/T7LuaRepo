-- bb53798571e5e860ca731549387aafef
-- This hash is used for caching, delete to decompile the file again

CoD.ZM_ReviveClampedArrow = InheritFrom( LUI.UIElement )
CoD.ZM_ReviveClampedArrow.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ZM_ReviveClampedArrow )
	self.id = "ZM_ReviveClampedArrow"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 260 )
	self:setTopBottom( true, false, 0, 64 )
	
	local arrow = LUI.UIImage.new()
	arrow:setLeftRight( false, true, -64, 0 )
	arrow:setTopBottom( true, true, 0, 0 )
	arrow:setZRot( 90 )
	arrow:setImage( RegisterImage( "uie_t7_zm_hud_revive_arrow" ) )
	self:addElement( arrow )
	self.arrow = arrow
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

