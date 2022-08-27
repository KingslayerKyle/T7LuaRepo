-- 12bdc6ff318363071cfea3f83600e172
-- This hash is used for caching, delete to decompile the file again

CoD.Theater_TopFramePanelCont = InheritFrom( LUI.UIElement )
CoD.Theater_TopFramePanelCont.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Theater_TopFramePanelCont )
	self.id = "Theater_TopFramePanelCont"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 536 )
	self:setTopBottom( true, false, 0, 62 )
	
	local topframe = LUI.UIImage.new()
	topframe:setLeftRight( true, false, 0, 536 )
	topframe:setTopBottom( true, false, 0, 61.75 )
	topframe:setImage( RegisterImage( "uie_t7_hud_theater_topframe" ) )
	topframe:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_1" ) )
	topframe:setShaderVector( 0, 10, 10, 0, 0 )
	self:addElement( topframe )
	self.topframe = topframe
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

