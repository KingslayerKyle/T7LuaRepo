-- 03d0a8fa1e93647efde34007104eafbc
-- This hash is used for caching, delete to decompile the file again

CoD.CP_Prologue_AmmoWidget_PanelClip = InheritFrom( LUI.UIElement )
CoD.CP_Prologue_AmmoWidget_PanelClip.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CP_Prologue_AmmoWidget_PanelClip )
	self.id = "CP_Prologue_AmmoWidget_PanelClip"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 67 )
	self:setTopBottom( true, false, 0, 45 )
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( true, true, 8, -14 )
	Image2:setTopBottom( false, false, -22.5, 22.83 )
	Image2:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_panelammom" ) )
	Image2:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_1" ) )
	Image2:setShaderVector( 0, 30, 20, 0, 0 )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( false, true, -14, 0 )
	Image3:setTopBottom( false, false, -22.5, 22.83 )
	Image3:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_panelammor" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_1" ) )
	Image3:setShaderVector( 0, 30, 20, 0, 0 )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

