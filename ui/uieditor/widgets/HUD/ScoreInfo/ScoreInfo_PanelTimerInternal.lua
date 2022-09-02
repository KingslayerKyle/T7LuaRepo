-- bdbdf077cfe3d5fae75671dca27fe955
-- This hash is used for caching, delete to decompile the file again

CoD.ScoreInfo_PanelTimerInternal = InheritFrom( LUI.UIElement )
CoD.ScoreInfo_PanelTimerInternal.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ScoreInfo_PanelTimerInternal )
	self.id = "ScoreInfo_PanelTimerInternal"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 64 )
	self:setTopBottom( true, false, 0, 40 )
	
	local PanelTimer = LUI.UIImage.new()
	PanelTimer:setLeftRight( false, false, -32, 32 )
	PanelTimer:setTopBottom( false, false, -20, 20 )
	PanelTimer:setImage( RegisterImage( "uie_t7_core_hud_scorewidget_paneltimer" ) )
	PanelTimer:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_1" ) )
	PanelTimer:setShaderVector( 0, 10, 10, 0, 0 )
	self:addElement( PanelTimer )
	self.PanelTimer = PanelTimer
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

