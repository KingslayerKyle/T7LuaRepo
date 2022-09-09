-- bd74640281429daafdde42b8140859e5
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.ScoreInfo.ScoreInfo_PanelCircleInternal" )

CoD.ScoreInfo_PanelCircle = InheritFrom( LUI.UIElement )
CoD.ScoreInfo_PanelCircle.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ScoreInfo_PanelCircle )
	self.id = "ScoreInfo_PanelCircle"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 88 )
	self:setTopBottom( true, false, 0, 88 )
	
	local ScoreInfoPanelCircleInternal0 = CoD.ScoreInfo_PanelCircleInternal.new( menu, controller )
	ScoreInfoPanelCircleInternal0:setLeftRight( true, false, 0, 88 )
	ScoreInfoPanelCircleInternal0:setTopBottom( true, false, 0, 88 )
	ScoreInfoPanelCircleInternal0:setRGB( 0.55, 0.58, 0.6 )
	ScoreInfoPanelCircleInternal0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2_highquality" ) )
	ScoreInfoPanelCircleInternal0:setShaderVector( 0, 30, 10, 0, 0 )
	self:addElement( ScoreInfoPanelCircleInternal0 )
	self.ScoreInfoPanelCircleInternal0 = ScoreInfoPanelCircleInternal0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ScoreInfoPanelCircleInternal0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
