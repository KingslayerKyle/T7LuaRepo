-- 921d6539e95ed867e64694a18ebe5e1e
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Theater.Theater_TopFramePanelCont" )

CoD.Theater_TopFramePanel = InheritFrom( LUI.UIElement )
CoD.Theater_TopFramePanel.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.Theater_TopFramePanel )
	self.id = "Theater_TopFramePanel"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 536 )
	self:setTopBottom( true, false, 0, 62 )
	
	local TheaterTopFramePanelCont0 = CoD.Theater_TopFramePanelCont.new( menu, controller )
	TheaterTopFramePanelCont0:setLeftRight( true, false, 0, 575 )
	TheaterTopFramePanelCont0:setTopBottom( true, false, 0, 61.75 )
	TheaterTopFramePanelCont0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2_highquality" ) )
	TheaterTopFramePanelCont0:setShaderVector( 0, 0, 3, 0, 0 )
	self:addElement( TheaterTopFramePanelCont0 )
	self.TheaterTopFramePanelCont0 = TheaterTopFramePanelCont0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.TheaterTopFramePanelCont0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

