-- 840b27037dbd780db5e017ecec81c19f
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Theater.Theater_BottomFramePanelCont" )

CoD.Theater_BottomFramePanel = InheritFrom( LUI.UIElement )
CoD.Theater_BottomFramePanel.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.Theater_BottomFramePanel )
	self.id = "Theater_BottomFramePanel"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 494 )
	self:setTopBottom( true, false, 0, 62 )
	
	local TheaterBottomFramePanelCont0 = CoD.Theater_BottomFramePanelCont.new( menu, controller )
	TheaterBottomFramePanelCont0:setLeftRight( true, false, -21, 493 )
	TheaterBottomFramePanelCont0:setTopBottom( true, false, 0, 61.75 )
	TheaterBottomFramePanelCont0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2_highquality" ) )
	TheaterBottomFramePanelCont0:setShaderVector( 0, 0, 3, 0, 0 )
	self:addElement( TheaterBottomFramePanelCont0 )
	self.TheaterBottomFramePanelCont0 = TheaterBottomFramePanelCont0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.TheaterBottomFramePanelCont0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
