CoD.GroupsFrameNoBG = InheritFrom( LUI.UIElement )
CoD.GroupsFrameNoBG.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GroupsFrameNoBG )
	self.id = "GroupsFrameNoBG"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( 0, 0, 0, 450 )
	self:setTopBottom( 0, 0, 0, 210 )
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( 0, 1, 0, 0 )
	Image:setTopBottom( 0, 1, 0, 0 )
	Image:setImage( RegisterImage( "uie_t7_menu_cac_buttonboxlrgstrokefull" ) )
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

