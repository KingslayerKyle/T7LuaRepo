CoD.StartMenu_LeftGraphics = InheritFrom( LUI.UIElement )
CoD.StartMenu_LeftGraphics.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_LeftGraphics )
	self.id = "StartMenu_LeftGraphics"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( 0, 0, 0, 93 )
	self:setTopBottom( 0, 0, 0, 898 )
	
	local LineSide = LUI.UIImage.new()
	LineSide:setLeftRight( 0, 0, 50, 53 )
	LineSide:setTopBottom( 0, 0, -125, 853 )
	LineSide:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide )
	self.LineSide = LineSide
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

