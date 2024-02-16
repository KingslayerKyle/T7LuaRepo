-- 4f5e1c32505f64d5010a4c8a83480f13
-- This hash is used for caching, delete to decompile the file again

CoD.Social_LeaderIcon = InheritFrom( LUI.UIElement )
CoD.Social_LeaderIcon.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.Social_LeaderIcon )
	self.id = "Social_LeaderIcon"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 24 )
	self:setTopBottom( true, false, 0, 24 )
	
	local Leader = LUI.UIImage.new()
	Leader:setLeftRight( true, false, -1, 23 )
	Leader:setTopBottom( true, false, -4, 28 )
	Leader:setRGB( ColorSet.PartyOther.r, ColorSet.PartyOther.g, ColorSet.PartyOther.b )
	Leader:setImage( RegisterImage( "uie_t7_menu_frontend_iconpartyleader" ) )
	Leader:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Leader )
	self.Leader = Leader
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
