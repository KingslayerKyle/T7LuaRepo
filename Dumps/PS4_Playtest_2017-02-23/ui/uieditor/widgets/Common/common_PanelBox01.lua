CoD.common_PanelBox01 = InheritFrom( LUI.UIElement )
CoD.common_PanelBox01.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.common_PanelBox01 )
	self.id = "common_PanelBox01"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 168 )
	self:setTopBottom( 0, 0, 0, 168 )
	
	local Backing = LUI.UIImage.new()
	Backing:setLeftRight( 0, 1, 3, -3 )
	Backing:setTopBottom( 0, 1, 3, -3 )
	Backing:setRGB( 0, 0, 0 )
	Backing:setAlpha( 0.5 )
	self:addElement( Backing )
	self.Backing = Backing
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( 0, 1, 0, 0 )
	Image:setTopBottom( 0, 1, 0, 0 )
	Image:setImage( RegisterImage( "uie_t7_menu_cac_buttonboxlrginactivefull" ) )
	Image:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	Image:setShaderVector( 0, 0, 0, 0.36, 0.36 )
	Image:setupNineSliceShader( 24, 24 )
	self:addElement( Image )
	self.Image = Image
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

