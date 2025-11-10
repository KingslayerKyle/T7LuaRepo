CoD.ArenaRankSmall = InheritFrom( LUI.UIElement )
CoD.ArenaRankSmall.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ArenaRankSmall )
	self.id = "ArenaRankSmall"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 64 )
	self:setTopBottom( true, false, 0, 64 )
	
	local rankIcon = LUI.UIImage.new()
	rankIcon:setLeftRight( true, true, 0, 0 )
	rankIcon:setTopBottom( true, true, 0, 0 )
	rankIcon:setImage( RegisterImage( "uie_t7_hud_arena_rank_10" ) )
	self:addElement( rankIcon )
	self.rankIcon = rankIcon
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

