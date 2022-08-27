-- f145bdae36177c176036210c79b1a6dd
-- This hash is used for caching, delete to decompile the file again

CoD.FE_ButtonPanel = InheritFrom( LUI.UIElement )
CoD.FE_ButtonPanel.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_ButtonPanel )
	self.id = "FE_ButtonPanel"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 82 )
	self:setTopBottom( true, false, 0, 20 )
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( true, true, -1, 1 )
	Image:setTopBottom( true, true, -2, 2 )
	Image:setImage( RegisterImage( "uie_t7_menu_frontend_buttonpanelfull" ) )
	Image:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	Image:setShaderVector( 0, 0.09, 0.27, 0, 0 )
	Image:setupNineSliceShader( 8, 8 )
	self:addElement( Image )
	self.Image = Image
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

