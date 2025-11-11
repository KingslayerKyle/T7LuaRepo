require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.CACHeroPreviewPanelImage" )

CoD.CACHeroPreviewPanelShader = InheritFrom( LUI.UIElement )
CoD.CACHeroPreviewPanelShader.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CACHeroPreviewPanelShader )
	self.id = "CACHeroPreviewPanelShader"
	self.soundSet = "CAC_EditLoadout"
	self:setLeftRight( 0, 0, 0, 600 )
	self:setTopBottom( 0, 0, 0, 300 )
	
	local CACHeroPreviewPanelImage0 = CoD.CACHeroPreviewPanelImage.new( menu, controller )
	CACHeroPreviewPanelImage0:setLeftRight( 0, 0, 0, 600 )
	CACHeroPreviewPanelImage0:setTopBottom( 0, 0, 0, 300 )
	CACHeroPreviewPanelImage0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2_highquality" ) )
	CACHeroPreviewPanelImage0:setShaderVector( 0, 0, 0, 0, 0 )
	self:addElement( CACHeroPreviewPanelImage0 )
	self.CACHeroPreviewPanelImage0 = CACHeroPreviewPanelImage0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.CACHeroPreviewPanelImage0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

