-- a9cb6b8feefb235f7228e33d876768e2
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 400 )
	self:setTopBottom( true, false, 0, 200 )
	
	local CACHeroPreviewPanelImage0 = CoD.CACHeroPreviewPanelImage.new( menu, controller )
	CACHeroPreviewPanelImage0:setLeftRight( true, false, 0, 400 )
	CACHeroPreviewPanelImage0:setTopBottom( true, false, 0, 200 )
	CACHeroPreviewPanelImage0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2" ) )
	CACHeroPreviewPanelImage0:setShaderVector( 0, 0, 0, 0, 0 )
	self:addElement( CACHeroPreviewPanelImage0 )
	self.CACHeroPreviewPanelImage0 = CACHeroPreviewPanelImage0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CACHeroPreviewPanelImage0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

