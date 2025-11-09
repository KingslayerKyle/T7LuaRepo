CoD.LobbySlideTitleBox = InheritFrom( LUI.UIElement )
CoD.LobbySlideTitleBox.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LobbySlideTitleBox )
	self.id = "LobbySlideTitleBox"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 103 )
	self:setTopBottom( true, false, 0, 34 )
	
	local maskshape = LUI.UIImage.new()
	maskshape:setLeftRight( true, true, 0.73, -4 )
	maskshape:setTopBottom( true, true, 0, -2 )
	maskshape:setRGB( 0, 0, 0 )
	maskshape:setAlpha( 0.4 )
	maskshape:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( maskshape )
	self.maskshape = maskshape
	
	local left = LUI.UIImage.new()
	left:setLeftRight( true, false, 0, 8 )
	left:setTopBottom( true, true, 0, 0 )
	left:setRGB( 1, 1, 1 )
	left:setImage( RegisterImage( "uie_img_t7_menu_cacselection_infoboxatitlel" ) )
	left:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( left )
	self.left = left
	
	local right = LUI.UIImage.new()
	right:setLeftRight( false, true, -8, 0 )
	right:setTopBottom( true, true, 0, 0 )
	right:setRGB( 1, 1, 1 )
	right:setImage( RegisterImage( "uie_img_t7_menu_cacselection_infoboxatitler" ) )
	right:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( right )
	self.right = right
	
	local middle = LUI.UIImage.new()
	middle:setLeftRight( true, true, 8, -8 )
	middle:setTopBottom( true, true, 0, 0 )
	middle:setRGB( 1, 1, 1 )
	middle:setImage( RegisterImage( "uie_img_t7_menu_cacselection_infoboxatitlem" ) )
	middle:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( middle )
	self.middle = middle
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

