require( "ui.uieditor.widgets.BorderBakedBlur" )
require( "ui.uieditor.widgets.BorderBakedStroke" )

CoD.GridItemButtonBackdrop = InheritFrom( LUI.UIElement )
CoD.GridItemButtonBackdrop.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GridItemButtonBackdrop )
	self.id = "GridItemButtonBackdrop"
	self.soundSet = "CAC_PrimaryWeapon"
	self:setLeftRight( 0, 0, 0, 180 )
	self:setTopBottom( 0, 0, 0, 180 )
	
	local BorderBakedStroke0 = CoD.BorderBakedStroke.new( menu, controller )
	BorderBakedStroke0:setLeftRight( 0.5, 0.5, -81, 81 )
	BorderBakedStroke0:setTopBottom( 0.5, 0.5, -81, 81 )
	BorderBakedStroke0:setAlpha( 0 )
	BorderBakedStroke0:setZoom( -200 )
	self:addElement( BorderBakedStroke0 )
	self.BorderBakedStroke0 = BorderBakedStroke0
	
	local BorderBakedBlur0 = CoD.BorderBakedBlur.new( menu, controller )
	BorderBakedBlur0:setLeftRight( 0.5, 0.5, -81, 81 )
	BorderBakedBlur0:setTopBottom( 0.5, 0.5, -81, 81 )
	BorderBakedBlur0:setAlpha( 0.4 )
	BorderBakedBlur0:setZoom( -100 )
	self:addElement( BorderBakedBlur0 )
	self.BorderBakedBlur0 = BorderBakedBlur0
	
	local ListBoxAStroke = LUI.UIImage.new()
	ListBoxAStroke:setLeftRight( 0, 0, 0, 180 )
	ListBoxAStroke:setTopBottom( 0, 0, 0, 180 )
	ListBoxAStroke:setAlpha( 0 )
	ListBoxAStroke:setZoom( -200 )
	ListBoxAStroke:setImage( RegisterImage( "uie_img_t7_menu_cacselection_listboxastroke" ) )
	ListBoxAStroke:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ListBoxAStroke )
	self.ListBoxAStroke = ListBoxAStroke
	
	local ListBoxABlur = LUI.UIImage.new()
	ListBoxABlur:setLeftRight( 0, 0, 0, 180 )
	ListBoxABlur:setTopBottom( 0, 0, 0, 180 )
	ListBoxABlur:setAlpha( 0 )
	ListBoxABlur:setZoom( -100 )
	ListBoxABlur:setImage( RegisterImage( "uie_img_t7_menu_cacselection_listboxablur" ) )
	ListBoxABlur:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ListBoxABlur )
	self.ListBoxABlur = ListBoxABlur
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BorderBakedStroke0:close()
		self.BorderBakedBlur0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

