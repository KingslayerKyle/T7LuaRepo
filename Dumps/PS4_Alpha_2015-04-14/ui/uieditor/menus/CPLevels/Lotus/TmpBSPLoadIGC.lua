LUI.createMenu.TmpBSPLoadIGC = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "TmpBSPLoadIGC" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	local menu = self
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 64, 1216 )
	Image0:setTopBottom( true, false, 36, 684 )
	Image0:setRGB( 1, 1, 1 )
	Image0:setImage( RegisterImage( "uie_cp_lt_2_bsp_load" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = menu
	} )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

