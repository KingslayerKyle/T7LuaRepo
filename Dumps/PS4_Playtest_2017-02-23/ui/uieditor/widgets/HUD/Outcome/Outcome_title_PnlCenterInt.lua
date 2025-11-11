CoD.Outcome_title_PnlCenterInt = InheritFrom( LUI.UIElement )
CoD.Outcome_title_PnlCenterInt.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Outcome_title_PnlCenterInt )
	self.id = "Outcome_title_PnlCenterInt"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1051 )
	self:setTopBottom( 0, 0, 0, 82 )
	
	local TopFrameBlur = LUI.UIImage.new()
	TopFrameBlur:setLeftRight( 0, 1, 0, 0 )
	TopFrameBlur:setTopBottom( 0, 0, 0, 82 )
	TopFrameBlur:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_1" ) )
	TopFrameBlur:setShaderVector( 0, 0, 20, 0, 0 )
	self:addElement( TopFrameBlur )
	self.TopFrameBlur = TopFrameBlur
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

