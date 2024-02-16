-- 5b6fd8f0489a447ae4281494d1fbbcf7
-- This hash is used for caching, delete to decompile the file again

CoD.ArenaStarAnimation3 = InheritFrom( LUI.UIElement )
CoD.ArenaStarAnimation3.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ArenaStarAnimation3 )
	self.id = "ArenaStarAnimation3"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 190 )
	self:setTopBottom( true, false, 0, 190 )
	
	local YellowStar = LUI.UIImage.new()
	YellowStar:setLeftRight( true, true, 0, 0 )
	YellowStar:setTopBottom( true, true, 0, 0 )
	YellowStar:setScale( 0.8 )
	YellowStar:setImage( RegisterImage( "uie_t7_arena_star_large_yellow" ) )
	YellowStar:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	YellowStar:setShaderVector( 0, 0.29, 0.27, 0.29, 0.29 )
	self:addElement( YellowStar )
	self.YellowStar = YellowStar
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
