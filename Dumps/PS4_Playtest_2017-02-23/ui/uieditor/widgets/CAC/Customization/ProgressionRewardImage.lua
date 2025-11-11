CoD.ProgressionRewardImage = InheritFrom( LUI.UIElement )
CoD.ProgressionRewardImage.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ProgressionRewardImage )
	self.id = "ProgressionRewardImage"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 117 )
	self:setTopBottom( 0, 0, 0, 117 )
	
	local rewardTileImage = LUI.UIImage.new()
	rewardTileImage:setLeftRight( 0, 1, 0, 0 )
	rewardTileImage:setTopBottom( 0, 1, 0, 0 )
	self:addElement( rewardTileImage )
	self.rewardTileImage = rewardTileImage
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

