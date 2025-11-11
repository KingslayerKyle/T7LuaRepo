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
	self:setLeftRight( 0, 0, 0, 37 )
	self:setTopBottom( 0, 0, 0, 19 )
	
	local Image6 = LUI.UIImage.new()
	Image6:setLeftRight( 0, 1, 0, 0 )
	Image6:setTopBottom( 0, 0, 0, 12 )
	Image6:setAlpha( 0.66 )
	Image6:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Image6:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image6 )
	self.Image6 = Image6
	
	local Image60 = LUI.UIImage.new()
	Image60:setLeftRight( 0, 1, 10, -10 )
	Image60:setTopBottom( 0, 0, 8, 20 )
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

