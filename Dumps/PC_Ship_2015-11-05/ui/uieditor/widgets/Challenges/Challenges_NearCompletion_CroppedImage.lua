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
	self:setLeftRight( true, false, 0, 96 )
	self:setTopBottom( true, false, 0, 64 )
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( true, false, -160, 96 )
	Image:setTopBottom( true, false, 0, 64 )
	Image:setImage( RegisterImage( "uie_emblem_bg_att_dual_wield" ) )
	self:addElement( Image )
	self.Image = Image
	
	local CoverLeft = LUI.UIImage.new()
	CoverLeft:setLeftRight( true, false, -160, 0 )
	CoverLeft:setTopBottom( true, true, 0, 0 )
	CoverLeft:setRGB( 0, 0, 0 )
	self:addElement( CoverLeft )
	self.CoverLeft = CoverLeft
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

