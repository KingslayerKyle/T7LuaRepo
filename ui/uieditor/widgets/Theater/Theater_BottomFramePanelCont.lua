-- c2f8e84645756ee0a7fde856281f7cea
-- This hash is used for caching, delete to decompile the file again

CoD.Theater_BottomFramePanelCont = InheritFrom( LUI.UIElement )
CoD.Theater_BottomFramePanelCont.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Theater_BottomFramePanelCont )
	self.id = "Theater_BottomFramePanelCont"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 536 )
	self:setTopBottom( true, false, 0, 62 )
	
	local bottomframe = LUI.UIImage.new()
	bottomframe:setLeftRight( true, false, 0, 536 )
	bottomframe:setTopBottom( true, false, 0, 61.75 )
	bottomframe:setImage( RegisterImage( "uie_t7_hud_theater_bottomframe" ) )
	bottomframe:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_1" ) )
	bottomframe:setShaderVector( 0, 10, 10, 0, 0 )
	self:addElement( bottomframe )
	self.bottomframe = bottomframe
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

