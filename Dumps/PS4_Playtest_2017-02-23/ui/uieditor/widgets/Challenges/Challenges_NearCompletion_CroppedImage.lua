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
	self:setLeftRight( 0, 0, 0, 192 )
	self:setTopBottom( 0, 0, 0, 96 )
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( 0, 1, -144, 48 )
	Image:setTopBottom( 0, 1, 0, 0 )
	self:addElement( Image )
	self.Image = Image
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

