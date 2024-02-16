-- 9bfc8b673ee79b4cd691f1ebab1fe392
-- This hash is used for caching, delete to decompile the file again

CoD.MissionRecordVault_MapImage_inGame = InheritFrom( LUI.UIElement )
CoD.MissionRecordVault_MapImage_inGame.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.MissionRecordVault_MapImage_inGame )
	self.id = "MissionRecordVault_MapImage_inGame"
	self.soundSet = "CAC_PrimaryWeapon"
	self:setLeftRight( true, false, 0, 640 )
	self:setTopBottom( true, false, 0, 360 )
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( true, true, 24.22, -160.6 )
	Image:setTopBottom( true, true, 72.76, -43.48 )
	Image:subscribeToGlobalModel( controller, "MissionRecordVaultMapInfo", "previewImage", function ( model )
		local previewImage = Engine.GetModelValue( model )
		if previewImage then
			Image:setImage( RegisterImage( previewImage ) )
		end
	end )
	self:addElement( Image )
	self.Image = Image
	
	local OSname = LUI.UIImage.new()
	OSname:setLeftRight( true, false, 64.38, 208.88 )
	OSname:setTopBottom( true, false, 31.56, 44.7 )
	OSname:setImage( RegisterImage( "uie_t7_menu_cp_vault_screen_coalescense" ) )
	self:addElement( OSname )
	self.OSname = OSname
	
	local Logobar = LUI.UIImage.new()
	Logobar:setLeftRight( true, false, 67.38, 89.5 )
	Logobar:setTopBottom( true, false, 46.34, 55.87 )
	Logobar:setImage( RegisterImage( "uie_t7_menu_cp_vault_screen_logo_bar" ) )
	self:addElement( Logobar )
	self.Logobar = Logobar
	
	local Logobar0 = LUI.UIImage.new()
	Logobar0:setLeftRight( true, false, 86.38, 95.5 )
	Logobar0:setTopBottom( true, false, 46.34, 55.47 )
	Logobar0:setImage( RegisterImage( "uie_t7_menu_cp_vault_screen_logo_bars" ) )
	self:addElement( Logobar0 )
	self.Logobar0 = Logobar0
	
	local toprightnumbers = LUI.UIImage.new()
	toprightnumbers:setLeftRight( true, false, 450, 479.4 )
	toprightnumbers:setTopBottom( true, false, 47.49, 56.31 )
	toprightnumbers:setImage( RegisterImage( "uie_t7_menu_cp_vault_screen_top_rightbar_numbers" ) )
	self:addElement( toprightnumbers )
	self.toprightnumbers = toprightnumbers
	
	local topRightBar = LUI.UIImage.new()
	topRightBar:setLeftRight( true, false, 288.65, 484.05 )
	topRightBar:setTopBottom( true, false, 28.85, 48.39 )
	topRightBar:setImage( RegisterImage( "uie_t7_menu_cp_vault_screen_top_rightbar" ) )
	self:addElement( topRightBar )
	self.topRightBar = topRightBar
	
	local Line000 = LUI.UIImage.new()
	Line000:setLeftRight( true, false, 17, 487.66 )
	Line000:setTopBottom( true, false, 64.52, 69.02 )
	Line000:setImage( RegisterImage( "uie_t7_menu_cp_vault_screen_longbar" ) )
	self:addElement( Line000 )
	self.Line000 = Line000
	
	local Logobar00 = LUI.UIImage.new()
	Logobar00:setLeftRight( true, false, 102.63, 111.76 )
	Logobar00:setTopBottom( true, false, 46.34, 55.47 )
	Logobar00:setImage( RegisterImage( "uie_t7_menu_cp_vault_screen_logo_bars" ) )
	self:addElement( Logobar00 )
	self.Logobar00 = Logobar00
	
	local Logobar000 = LUI.UIImage.new()
	Logobar000:setLeftRight( true, false, 94.5, 103.63 )
	Logobar000:setTopBottom( true, false, 46.34, 55.47 )
	Logobar000:setImage( RegisterImage( "uie_t7_menu_cp_vault_screen_logo_bars" ) )
	self:addElement( Logobar000 )
	self.Logobar000 = Logobar000
	
	local Logobar001 = LUI.UIImage.new()
	Logobar001:setLeftRight( true, false, 110.76, 119.88 )
	Logobar001:setTopBottom( true, false, 46.34, 55.47 )
	Logobar001:setImage( RegisterImage( "uie_t7_menu_cp_vault_screen_logo_bars" ) )
	self:addElement( Logobar001 )
	self.Logobar001 = Logobar001
	
	local logo = LUI.UIImage.new()
	logo:setLeftRight( true, false, 26.38, 61.34 )
	logo:setTopBottom( true, false, 23.56, 58.52 )
	logo:setImage( RegisterImage( "uie_t7_menu_cp_datavault_logo" ) )
	self:addElement( logo )
	self.logo = logo
	
	local buttons0 = LUI.UIImage.new()
	buttons0:setLeftRight( true, false, 259, 483 )
	buttons0:setTopBottom( true, false, 331.4, 340.36 )
	buttons0:setImage( RegisterImage( "uie_t7_menu_cp_vault_screen_bottombtn" ) )
	self:addElement( buttons0 )
	self.buttons0 = buttons0
	
	local Line0000 = LUI.UIImage.new()
	Line0000:setLeftRight( true, false, 17, 487.66 )
	Line0000:setTopBottom( true, false, 321.52, 326.02 )
	Line0000:setImage( RegisterImage( "uie_t7_menu_cp_vault_screen_longbar" ) )
	self:addElement( Line0000 )
	self.Line0000 = Line0000
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Image:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
