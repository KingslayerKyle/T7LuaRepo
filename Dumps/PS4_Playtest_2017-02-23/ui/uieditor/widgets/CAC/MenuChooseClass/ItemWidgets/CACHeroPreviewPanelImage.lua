CoD.CACHeroPreviewPanelImage = InheritFrom( LUI.UIElement )
CoD.CACHeroPreviewPanelImage.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CACHeroPreviewPanelImage )
	self.id = "CACHeroPreviewPanelImage"
	self.soundSet = "CAC_EditLoadout"
	self:setLeftRight( 0, 0, 0, 600 )
	self:setTopBottom( 0, 0, 0, 300 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( 0, 0, 0, 600 )
	Image0:setTopBottom( 0, 0, 0, 300 )
	Image0:setImage( RegisterImage( "uie_t7_menu_cac_characterpanel" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_1" ) )
	Image0:setShaderVector( 0, 30, 20, 0, 0 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

