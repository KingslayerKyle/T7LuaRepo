-- 81f4b5d4574f14044bab1f4524fe4840
-- This hash is used for caching, delete to decompile the file again

CoD.Challenges_NearCompletion_CroppedImage = InheritFrom( LUI.UIElement )
CoD.Challenges_NearCompletion_CroppedImage.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.Challenges_NearCompletion_CroppedImage )
	self.id = "Challenges_NearCompletion_CroppedImage"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 128 )
	self:setTopBottom( true, false, 0, 64 )
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( true, true, -96, 32 )
	Image:setTopBottom( true, true, 0, 0 )
	Image:setImage( RegisterImage( "uie_emblem_bg_att_dual_wield" ) )
	self:addElement( Image )
	self.Image = Image
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

