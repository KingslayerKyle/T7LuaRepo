-- 3c667e9d7a69ac1311a902928662172d
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.ScoreInfo.ScoreInfo_PanelCircleInternal" )
require( "ui.uieditor.widgets.HUD.ScoreInfo.ScoreInfo_PanelTimerInternal" )

CoD.TrainingSim_PanelCircle = InheritFrom( LUI.UIElement )
CoD.TrainingSim_PanelCircle.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.TrainingSim_PanelCircle )
	self.id = "TrainingSim_PanelCircle"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 88 )
	self:setTopBottom( true, false, 0, 88 )
	
	local ScoreInfoPanelCircleInternal0 = CoD.ScoreInfo_PanelCircleInternal.new( menu, controller )
	ScoreInfoPanelCircleInternal0:setLeftRight( true, false, 0, 88 )
	ScoreInfoPanelCircleInternal0:setTopBottom( true, false, 0, 88 )
	ScoreInfoPanelCircleInternal0:setRGB( 0.79, 0.82, 0.85 )
	ScoreInfoPanelCircleInternal0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2" ) )
	ScoreInfoPanelCircleInternal0:setShaderVector( 0, 30, 10, 0, 0 )
	self:addElement( ScoreInfoPanelCircleInternal0 )
	self.ScoreInfoPanelCircleInternal0 = ScoreInfoPanelCircleInternal0
	
	local ScoreInfoPanelTimerInternal0 = CoD.ScoreInfo_PanelTimerInternal.new( menu, controller )
	ScoreInfoPanelTimerInternal0:setLeftRight( true, false, 12, 76 )
	ScoreInfoPanelTimerInternal0:setTopBottom( true, false, -27, 13 )
	ScoreInfoPanelTimerInternal0:setRGB( 0.79, 0.82, 0.85 )
	ScoreInfoPanelTimerInternal0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2" ) )
	ScoreInfoPanelTimerInternal0:setShaderVector( 0, 30, 10, 0, 0 )
	self:addElement( ScoreInfoPanelTimerInternal0 )
	self.ScoreInfoPanelTimerInternal0 = ScoreInfoPanelTimerInternal0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ScoreInfoPanelCircleInternal0:close()
		element.ScoreInfoPanelTimerInternal0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

