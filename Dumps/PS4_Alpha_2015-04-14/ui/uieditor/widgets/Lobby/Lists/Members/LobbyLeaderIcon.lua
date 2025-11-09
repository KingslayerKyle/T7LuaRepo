CoD.LobbyLeaderIcon = InheritFrom( LUI.UIElement )
CoD.LobbyLeaderIcon.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LobbyLeaderIcon )
	self.id = "LobbyLeaderIcon"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 24 )
	self:setTopBottom( true, false, 0, 24 )
	
	local Leader = LUI.UIImage.new()
	Leader:setLeftRight( true, false, -1, 23 )
	Leader:setTopBottom( true, false, -4, 28 )
	Leader:setRGB( 0.29, 0.38, 0.68 )
	Leader:setImage( RegisterImage( "uie_t7_menu_frontend_iconpartyleader" ) )
	Leader:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Leader )
	self.Leader = Leader
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

