require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )

CoD.cac_ElemsSideList = InheritFrom( LUI.UIElement )
CoD.cac_ElemsSideList.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.cac_ElemsSideList )
	self.id = "cac_ElemsSideList"
	self.soundSet = "CAC_PrimaryWeapon"
	self:setLeftRight( 0, 0, 0, 102 )
	self:setTopBottom( 0, 0, 0, 1005 )
	self.anyChildUsesUpdateState = true
	
	local LineSide = LUI.UIImage.new()
	LineSide:setLeftRight( 0, 0, 45, 57 )
	LineSide:setTopBottom( 0, 0, 0, 1005 )
	LineSide:setAlpha( 0 )
	LineSide:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide )
	self.LineSide = LineSide
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( menu, controller )
	FEMenuLeftGraphics:setLeftRight( 0, 0, 29, 107 )
	FEMenuLeftGraphics:setTopBottom( 0, 0, 129, 1055 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FEMenuLeftGraphics:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

