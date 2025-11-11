CoD.FE_ListSubHeaderPanelShader = InheritFrom( LUI.UIElement )
CoD.FE_ListSubHeaderPanelShader.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_ListSubHeaderPanelShader )
	self.id = "FE_ListSubHeaderPanelShader"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 48 )
	self:setTopBottom( 0, 0, 0, 45 )
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( 0, 1, -10, 14 )
	Image:setTopBottom( 0, 1, -2, 2 )
	Image:setImage( RegisterImage( "uie_t7_menu_frontend_listsubheadpanelfull" ) )
	Image:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_1_nineslice" ) )
	Image:setShaderVector( 0, 0, 0, 0, 0 )
	Image:setShaderVector( 1, 30, 20, 0, 0 )
	Image:setupNineSliceShader( 24, 6 )
	self:addElement( Image )
	self.Image = Image
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

