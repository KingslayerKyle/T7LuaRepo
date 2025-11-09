LUI.createMenu.TmpMobileShopRideIGC = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "TmpMobileShopRideIGC" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local Frame0 = LUI.UIFrame.new( self, controller, 0, 0 )
	Frame0:setLeftRight( true, false, 344, 472 )
	Frame0:setTopBottom( true, false, 235.5, 363.5 )
	Frame0:setRGB( 1, 1, 1 )
	self:addElement( Frame0 )
	self.Frame0 = Frame0
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 64, 1216 )
	Image0:setTopBottom( true, false, 36, 684 )
	Image0:setRGB( 1, 1, 1 )
	Image0:setImage( RegisterImage( "uie_cp_lt_tower_2_mobile_shop_ride" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	Frame0.id = "Frame0"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.Frame0:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

