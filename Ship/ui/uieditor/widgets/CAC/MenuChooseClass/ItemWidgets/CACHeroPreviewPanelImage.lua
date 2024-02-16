-- b2e697db3ba372f1c5b308a5db1a4354
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 400 )
	self:setTopBottom( true, false, 0, 200 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 0, 400 )
	Image0:setTopBottom( true, false, 0, 200 )
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
