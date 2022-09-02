-- eb080b8a3d52d3790fbbe2a4be89589b
-- This hash is used for caching, delete to decompile the file again

CoD.MissionRecordVault_Objectives_inGame = InheritFrom( LUI.UIElement )
CoD.MissionRecordVault_Objectives_inGame.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.MissionRecordVault_Objectives_inGame )
	self.id = "MissionRecordVault_Objectives_inGame"
	self.soundSet = "CAC_PrimaryWeapon"
	self:setLeftRight( true, false, 0, 520 )
	self:setTopBottom( true, false, 0, 360 )
	
	local Description = LUI.UIText.new()
	Description:setLeftRight( true, false, 39, 493.7 )
	Description:setTopBottom( true, false, 238, 268 )
	Description:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Description:linkToElementModel( self, "mapDescriptionShort", true, function ( model )
		local mapDescriptionShort = Engine.GetModelValue( model )
		if mapDescriptionShort then
			Description:setText( Engine.Localize( mapDescriptionShort ) )
		end
	end )
	self:addElement( Description )
	self.Description = Description
	
	local Objective = LUI.UIText.new()
	Objective:setLeftRight( true, false, 39, 493 )
	Objective:setTopBottom( true, false, 161, 195 )
	Objective:setRGB( 1, 0.42, 0.07 )
	Objective:setTTF( "fonts/escom.ttf" )
	Objective:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	Objective:setShaderVector( 0, 0.06, 0, 0, 0 )
	Objective:setShaderVector( 1, 0.6, 0, 0, 0 )
	Objective:setShaderVector( 2, 1, 0, 0, 0 )
	Objective:setLetterSpacing( 1 )
	Objective:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Objective:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Objective:subscribeToGlobalModel( controller, "MissionRecordVaultMapInfo", "mapObjective", function ( model )
		local mapObjective = Engine.GetModelValue( model )
		if mapObjective then
			Objective:setText( Engine.Localize( LocalizeToUpperString( mapObjective ) ) )
		end
	end )
	self:addElement( Objective )
	self.Objective = Objective
	
	local Subtitle = LUI.UITightText.new()
	Subtitle:setLeftRight( true, false, 39, 493.7 )
	Subtitle:setTopBottom( true, false, 83, 105 )
	Subtitle:setAlpha( 0.88 )
	Subtitle:setText( Engine.Localize( "MENU_MISSION_OVERVIEW_CAP" ) )
	Subtitle:setTTF( "fonts/escom.ttf" )
	Subtitle:setLetterSpacing( 2 )
	self:addElement( Subtitle )
	self.Subtitle = Subtitle
	
	local Title = LUI.UITightText.new()
	Title:setLeftRight( true, false, 34, 493.7 )
	Title:setTopBottom( true, false, 101, 156 )
	Title:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	Title:subscribeToGlobalModel( controller, "MissionRecordVaultMapInfo", "mapName", function ( model )
		local mapName = Engine.GetModelValue( model )
		if mapName then
			Title:setText( Engine.Localize( LocalizeToUpperString( mapName ) ) )
		end
	end )
	self:addElement( Title )
	self.Title = Title
	
	local OSname = LUI.UIImage.new()
	OSname:setLeftRight( true, false, 76.38, 220.88 )
	OSname:setTopBottom( true, false, 21.56, 34.7 )
	OSname:setImage( RegisterImage( "uie_t7_menu_cp_vault_screen_coalescense" ) )
	self:addElement( OSname )
	self.OSname = OSname
	
	local Logobar = LUI.UIImage.new()
	Logobar:setLeftRight( true, false, 79.38, 101.5 )
	Logobar:setTopBottom( true, false, 36.34, 45.87 )
	Logobar:setImage( RegisterImage( "uie_t7_menu_cp_vault_screen_logo_bar" ) )
	self:addElement( Logobar )
	self.Logobar = Logobar
	
	local Logobar0 = LUI.UIImage.new()
	Logobar0:setLeftRight( true, false, 98.38, 107.5 )
	Logobar0:setTopBottom( true, false, 36.34, 45.47 )
	Logobar0:setImage( RegisterImage( "uie_t7_menu_cp_vault_screen_logo_bars" ) )
	self:addElement( Logobar0 )
	self.Logobar0 = Logobar0
	
	local toprightnumbers = LUI.UIImage.new()
	toprightnumbers:setLeftRight( true, false, 479, 508.4 )
	toprightnumbers:setTopBottom( true, false, 37.49, 46.31 )
	toprightnumbers:setImage( RegisterImage( "uie_t7_menu_cp_vault_screen_top_rightbar_numbers" ) )
	self:addElement( toprightnumbers )
	self.toprightnumbers = toprightnumbers
	
	local topRightBar = LUI.UIImage.new()
	topRightBar:setLeftRight( true, false, 317.65, 513.05 )
	topRightBar:setTopBottom( true, false, 18.85, 38.39 )
	topRightBar:setImage( RegisterImage( "uie_t7_menu_cp_vault_screen_top_rightbar" ) )
	self:addElement( topRightBar )
	self.topRightBar = topRightBar
	
	local Line000 = LUI.UIImage.new()
	Line000:setLeftRight( true, false, 22, 517.66 )
	Line000:setTopBottom( true, false, 53.52, 58.02 )
	Line000:setImage( RegisterImage( "uie_t7_menu_cp_vault_screen_longbar" ) )
	self:addElement( Line000 )
	self.Line000 = Line000
	
	local buttons0 = LUI.UIImage.new()
	buttons0:setLeftRight( true, false, 288, 512 )
	buttons0:setTopBottom( true, false, 334.4, 343.36 )
	buttons0:setImage( RegisterImage( "uie_t7_menu_cp_vault_screen_bottombtn" ) )
	self:addElement( buttons0 )
	self.buttons0 = buttons0
	
	local Line0000 = LUI.UIImage.new()
	Line0000:setLeftRight( true, false, 22, 517.66 )
	Line0000:setTopBottom( true, false, 326.52, 331.02 )
	Line0000:setImage( RegisterImage( "uie_t7_menu_cp_vault_screen_longbar" ) )
	self:addElement( Line0000 )
	self.Line0000 = Line0000
	
	local Logobar00 = LUI.UIImage.new()
	Logobar00:setLeftRight( true, false, 114.63, 123.76 )
	Logobar00:setTopBottom( true, false, 36.34, 45.47 )
	Logobar00:setImage( RegisterImage( "uie_t7_menu_cp_vault_screen_logo_bars" ) )
	self:addElement( Logobar00 )
	self.Logobar00 = Logobar00
	
	local Logobar000 = LUI.UIImage.new()
	Logobar000:setLeftRight( true, false, 106.5, 115.63 )
	Logobar000:setTopBottom( true, false, 36.34, 45.47 )
	Logobar000:setImage( RegisterImage( "uie_t7_menu_cp_vault_screen_logo_bars" ) )
	self:addElement( Logobar000 )
	self.Logobar000 = Logobar000
	
	local Logobar001 = LUI.UIImage.new()
	Logobar001:setLeftRight( true, false, 122.76, 131.88 )
	Logobar001:setTopBottom( true, false, 36.34, 45.47 )
	Logobar001:setImage( RegisterImage( "uie_t7_menu_cp_vault_screen_logo_bars" ) )
	self:addElement( Logobar001 )
	self.Logobar001 = Logobar001
	
	local logo = LUI.UIImage.new()
	logo:setLeftRight( true, false, 38.38, 73.34 )
	logo:setTopBottom( true, false, 13.56, 48.52 )
	logo:setImage( RegisterImage( "uie_t7_menu_cp_datavault_logo" ) )
	self:addElement( logo )
	self.logo = logo
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Description:close()
		element.Objective:close()
		element.Title:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

