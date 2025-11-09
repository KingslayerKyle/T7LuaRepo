CoD.cac_2lines = InheritFrom( LUI.UIElement )
CoD.cac_2lines.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.cac_2lines )
	self.id = "cac_2lines"
	self.soundSet = "CAC_Overcapacity"
	self:setLeftRight( true, false, 0, 36 )
	self:setTopBottom( true, false, 0, 37 )
	
	local Image40 = LUI.UIImage.new()
	Image40:setLeftRight( true, false, 0, 36 )
	Image40:setTopBottom( false, false, -18.38, -14.88 )
	Image40:setRGB( 1, 1, 1 )
	Image40:setZRot( 180 )
	Image40:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image40:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image40 )
	self.Image40 = Image40
	
	local Image400 = LUI.UIImage.new()
	Image400:setLeftRight( true, false, 0, 36 )
	Image400:setTopBottom( false, false, 14.88, 18.38 )
	Image400:setRGB( 1, 1, 1 )
	Image400:setZRot( 180 )
	Image400:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image400:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image400 )
	self.Image400 = Image400
	
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.itemList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

