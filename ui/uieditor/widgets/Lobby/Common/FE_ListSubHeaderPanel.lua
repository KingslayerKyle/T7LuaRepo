-- b69cdaf6417a35aa731885302bc5cb50
-- This hash is used for caching, delete to decompile the file again

CoD.FE_ListSubHeaderPanel = InheritFrom( LUI.UIElement )
CoD.FE_ListSubHeaderPanel.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.FE_ListSubHeaderPanel )
	self.id = "FE_ListSubHeaderPanel"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 32 )
	self:setTopBottom( true, false, 0, 30 )
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( true, true, -7, 9 )
	Image:setTopBottom( true, true, -1, 1 )
	Image:setImage( RegisterImage( "uie_t7_menu_frontend_listsubheadpanelfull" ) )
	Image:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	Image:setShaderVector( 0, 0.33, 0.12, 0, 0 )
	Image:setupNineSliceShader( 16, 4 )
	self:addElement( Image )
	self.Image = Image
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
