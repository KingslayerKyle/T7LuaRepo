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
	self:setLeftRight( 0, 0, 0, 96 )
	self:setTopBottom( 0, 0, 0, 96 )
	
	local rankIcon = LUI.UIImage.new()
	rankIcon:setLeftRight( 0, 1, 0, 0 )
	rankIcon:setTopBottom( 0, 1, 0, 0 )
	rankIcon:setImage( RegisterImage( "t7_hud_arena_rank_10" ) )
	self:addElement( rankIcon )
	self.rankIcon = rankIcon
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

