-- 36f6c9eb5626c4b8ca533f146802c0dd
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 78 )
	self:setTopBottom( true, false, 0, 78 )
	
	local rewardTileImage = LUI.UIImage.new()
	rewardTileImage:setLeftRight( true, true, 0, 0 )
	rewardTileImage:setTopBottom( true, true, 0, 0 )
	self:addElement( rewardTileImage )
	self.rewardTileImage = rewardTileImage
	
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

