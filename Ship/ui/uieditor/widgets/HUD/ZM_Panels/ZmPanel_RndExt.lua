-- c73f2953239dbc6c27b8ce53f91730f6
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.ZM_Panels.ZmPanel_RndInt" )

CoD.ZmPanel_RndExt = InheritFrom( LUI.UIElement )
CoD.ZmPanel_RndExt.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ZmPanel_RndExt )
	self.id = "ZmPanel_RndExt"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 224 )
	self:setTopBottom( true, false, 0, 200 )
	
	local ZmPanelRndInt0 = CoD.ZmPanel_RndInt.new( menu, controller )
	ZmPanelRndInt0:setLeftRight( true, false, 0, 224 )
	ZmPanelRndInt0:setTopBottom( true, false, 0, 200 )
	ZmPanelRndInt0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2" ) )
	ZmPanelRndInt0:setShaderVector( 0, 30, 0, 0, 0 )
	self:addElement( ZmPanelRndInt0 )
	self.ZmPanelRndInt0 = ZmPanelRndInt0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ZmPanelRndInt0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
