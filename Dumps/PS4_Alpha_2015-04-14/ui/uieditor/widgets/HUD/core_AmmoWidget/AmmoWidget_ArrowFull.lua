CoD.AmmoWidget_ArrowFull = InheritFrom( LUI.UIElement )
CoD.AmmoWidget_ArrowFull.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidget_ArrowFull )
	self.id = "AmmoWidget_ArrowFull"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 10 )
	self:setTopBottom( true, false, 0, 10 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, true, 0, 0 )
	Image0:setTopBottom( true, true, 0, 0 )
	Image0:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_arrowfull" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

