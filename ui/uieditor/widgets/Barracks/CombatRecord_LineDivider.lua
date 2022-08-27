-- eb6aa5d1ed0a20cdb851d33a43fa957e
-- This hash is used for caching, delete to decompile the file again

CoD.CombatRecord_LineDivider = InheritFrom( LUI.UIElement )
CoD.CombatRecord_LineDivider.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CombatRecord_LineDivider )
	self.id = "CombatRecord_LineDivider"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 25 )
	self:setTopBottom( true, false, 0, 13 )
	
	local Image6 = LUI.UIImage.new()
	Image6:setLeftRight( true, true, 0, 0 )
	Image6:setTopBottom( true, false, 0, 8 )
	Image6:setAlpha( 0.66 )
	Image6:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Image6:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image6 )
	self.Image6 = Image6
	
	local Image60 = LUI.UIImage.new()
	Image60:setLeftRight( true, true, 6.5, -7 )
	Image60:setTopBottom( true, false, 5, 13 )
	Image60:setAlpha( 0.66 )
	Image60:setZRot( 90 )
	Image60:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Image60:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image60 )
	self.Image60 = Image60
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

