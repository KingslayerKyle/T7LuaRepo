-- 84c9d32d8b2a9d1ea83f1f7bd9b7e698
-- This hash is used for caching, delete to decompile the file again

CoD.ScoreInfo_PanelCircleInternal = InheritFrom( LUI.UIElement )
CoD.ScoreInfo_PanelCircleInternal.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ScoreInfo_PanelCircleInternal )
	self.id = "ScoreInfo_PanelCircleInternal"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 88 )
	self:setTopBottom( true, false, 0, 88 )
	
	local PanelCircle = LUI.UIImage.new()
	PanelCircle:setLeftRight( false, false, -44, 44 )
	PanelCircle:setTopBottom( false, false, -44, 44 )
	PanelCircle:setImage( RegisterImage( "uie_t7_core_hud_scorewidget_panelcircle" ) )
	PanelCircle:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_1" ) )
	PanelCircle:setShaderVector( 0, 10, 10, 0, 0 )
	self:addElement( PanelCircle )
	self.PanelCircle = PanelCircle
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
