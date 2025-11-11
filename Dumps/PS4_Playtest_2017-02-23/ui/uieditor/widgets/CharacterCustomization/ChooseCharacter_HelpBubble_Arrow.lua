CoD.ChooseCharacter_HelpBubble_Arrow = InheritFrom( LUI.UIElement )
CoD.ChooseCharacter_HelpBubble_Arrow.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.ChooseCharacter_HelpBubble_Arrow )
	self.id = "ChooseCharacter_HelpBubble_Arrow"
	self.soundSet = "CAC_EditLoadout"
	self:setLeftRight( 0, 0, 0, 196 )
	self:setTopBottom( 0, 0, 0, 91 )
	
	local TriangleBack = LUI.UIImage.new()
	TriangleBack:setLeftRight( 0, 0, 16, 108 )
	TriangleBack:setTopBottom( 0, 0, 0, 92 )
	TriangleBack:setRGB( 0, 0, 0 )
	TriangleBack:setAlpha( 0 )
	TriangleBack:setZRot( 45 )
	TriangleBack:setScale( 0.7 )
	self:addElement( TriangleBack )
	self.TriangleBack = TriangleBack
	
	local arrowUp = LUI.UIImage.new()
	arrowUp:setLeftRight( 0.5, 0.5, -16.5, 16.5 )
	arrowUp:setTopBottom( 0.5, 0.5, -11, 11 )
	arrowUp:setZRot( 90 )
	arrowUp:setScale( 1.2 )
	arrowUp:setImage( RegisterImage( "uie_img_t7_menu_startmenu_option_arrow" ) )
	arrowUp:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( arrowUp )
	self.arrowUp = arrowUp
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

