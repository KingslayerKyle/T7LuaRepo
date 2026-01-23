CoD.MissionRecordVault_Operations_inGame = InheritFrom( LUI.UIElement )
CoD.MissionRecordVault_Operations_inGame.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MissionRecordVault_Operations_inGame )
	self.id = "MissionRecordVault_Operations_inGame"
	self.soundSet = "CAC_PrimaryWeapon"
	self:setLeftRight( true, false, 0, 640 )
	self:setTopBottom( true, false, 0, 360 )
	
	local frameBG00 = LUI.UIImage.new()
	frameBG00:setLeftRight( true, false, 45, 578 )
	frameBG00:setTopBottom( false, true, -177.65, -124.35 )
	frameBG00:setImage( RegisterImage( "uie_t7_menu_cp_vault_framescreenbg" ) )
	self:addElement( frameBG00 )
	self.frameBG00 = frameBG00
	
	local frameBG0 = LUI.UIImage.new()
	frameBG0:setLeftRight( true, false, 45, 578 )
	frameBG0:setTopBottom( false, true, -234.65, -181.35 )
	frameBG0:setImage( RegisterImage( "uie_t7_menu_cp_vault_framescreenbg" ) )
	self:addElement( frameBG0 )
	self.frameBG0 = frameBG0
	
	local frameBG000 = LUI.UIImage.new()
	frameBG000:setLeftRight( true, false, 45, 578 )
	frameBG000:setTopBottom( false, true, -119.65, -66.35 )
	frameBG000:setImage( RegisterImage( "uie_t7_menu_cp_vault_framescreenbg" ) )
	self:addElement( frameBG000 )
	self.frameBG000 = frameBG000
	
	local frame000000 = LUI.UIImage.new()
	frame000000:setLeftRight( true, false, 45, 578 )
	frame000000:setTopBottom( false, true, -119.65, -66.35 )
	frame000000:setImage( RegisterImage( "uie_t7_menu_cp_vault_framescreen" ) )
	self:addElement( frame000000 )
	self.frame000000 = frame000000
	
	local frame00000 = LUI.UIImage.new()
	frame00000:setLeftRight( true, false, 45, 578 )
	frame00000:setTopBottom( false, true, -177.65, -124.35 )
	frame00000:setImage( RegisterImage( "uie_t7_menu_cp_vault_framescreen" ) )
	self:addElement( frame00000 )
	self.frame00000 = frame00000
	
	local frame0000 = LUI.UIImage.new()
	frame0000:setLeftRight( true, false, 45, 578 )
	frame0000:setTopBottom( false, true, -234.65, -181.35 )
	frame0000:setImage( RegisterImage( "uie_t7_menu_cp_vault_framescreen" ) )
	self:addElement( frame0000 )
	self.frame0000 = frame0000
	
	local EngageDesc = LUI.UIText.new()
	EngageDesc:setLeftRight( true, false, 56.38, 596.05 )
	EngageDesc:setTopBottom( false, true, -267, -241 )
	EngageDesc:setText( Engine.Localize( "CPUI_AREA_OF_OPERATIONS_DESC_CAPS" ) )
	EngageDesc:setTTF( "fonts/escom.ttf" )
	EngageDesc:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	EngageDesc:setShaderVector( 0, 0.06, 0, 0, 0 )
	EngageDesc:setShaderVector( 1, 0.02, 0, 0, 0 )
	EngageDesc:setShaderVector( 2, 2, 0, 0, 0 )
	EngageDesc:setLetterSpacing( 1 )
	EngageDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	EngageDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( EngageDesc )
	self.EngageDesc = EngageDesc
	
	local EngageClose = LUI.UIText.new()
	EngageClose:setLeftRight( true, false, 68.26, 272.26 )
	EngageClose:setTopBottom( false, true, -220, -196 )
	EngageClose:setText( Engine.Localize( "CPUI_ENGAGEMENT_CLOSE_CAPS" ) )
	EngageClose:setTTF( "fonts/escom.ttf" )
	EngageClose:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	EngageClose:setShaderVector( 0, 0.06, 0, 0, 0 )
	EngageClose:setShaderVector( 1, 0.02, 0, 0, 0 )
	EngageClose:setShaderVector( 2, 2, 0, 0, 0 )
	EngageClose:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	EngageClose:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( EngageClose )
	self.EngageClose = EngageClose
	
	local EngageMid = LUI.UIText.new()
	EngageMid:setLeftRight( true, false, 68.26, 275.26 )
	EngageMid:setTopBottom( false, true, -163, -139 )
	EngageMid:setText( Engine.Localize( "CPUI_ENGAGEMENT_MEDIUM_CAPS" ) )
	EngageMid:setTTF( "fonts/escom.ttf" )
	EngageMid:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	EngageMid:setShaderVector( 0, 0.06, 0, 0, 0 )
	EngageMid:setShaderVector( 1, 0.02, 0, 0, 0 )
	EngageMid:setShaderVector( 2, 2, 0, 0, 0 )
	EngageMid:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	EngageMid:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( EngageMid )
	self.EngageMid = EngageMid
	
	local EngageMid0 = LUI.UIText.new()
	EngageMid0:setLeftRight( true, false, 68.26, 272.26 )
	EngageMid0:setTopBottom( false, true, -105, -81 )
	EngageMid0:setText( Engine.Localize( "CPUI_ENGAGEMENT_LONG_CAPS" ) )
	EngageMid0:setTTF( "fonts/escom.ttf" )
	EngageMid0:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	EngageMid0:setShaderVector( 0, 0.06, 0, 0, 0 )
	EngageMid0:setShaderVector( 1, 0.02, 0, 0, 0 )
	EngageMid0:setShaderVector( 2, 2, 0, 0, 0 )
	EngageMid0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	EngageMid0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( EngageMid0 )
	self.EngageMid0 = EngageMid0
	
	local EngageCloseBox = LUI.UIImage.new()
	EngageCloseBox:setLeftRight( true, false, 276, 561 )
	EngageCloseBox:setTopBottom( false, true, -224, -192 )
	EngageCloseBox:setImage( RegisterImage( "uie_t7_menu_cp_vault_frame_fill" ) )
	EngageCloseBox:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	EngageCloseBox:setShaderVector( 1, 0, 0, 0, 0 )
	EngageCloseBox:setShaderVector( 2, 1, 0, 0, 0 )
	EngageCloseBox:setShaderVector( 3, 0, 0, 0, 0 )
	EngageCloseBox:subscribeToGlobalModel( controller, "MissionRecordVaultMapInfo", "engageClose", function ( model )
		local engageClose = Engine.GetModelValue( model )
		if engageClose then
			EngageCloseBox:setShaderVector( 0, CoD.GetVectorComponentFromString( engageClose, 1 ), CoD.GetVectorComponentFromString( engageClose, 2 ), CoD.GetVectorComponentFromString( engageClose, 3 ), CoD.GetVectorComponentFromString( engageClose, 4 ) )
		end
	end )
	EngageCloseBox:linkToElementModel( self, "engageClose", true, function ( model )
		local engageClose = Engine.GetModelValue( model )
		if engageClose then
			EngageCloseBox:setRGB( MissionRecordVault_EngageRangeColor( engageClose ) )
		end
	end )
	self:addElement( EngageCloseBox )
	self.EngageCloseBox = EngageCloseBox
	
	local EngageMidBox = LUI.UIImage.new()
	EngageMidBox:setLeftRight( true, false, 276, 561 )
	EngageMidBox:setTopBottom( false, true, -167, -135 )
	EngageMidBox:setImage( RegisterImage( "uie_t7_menu_cp_vault_frame_fill" ) )
	EngageMidBox:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	EngageMidBox:setShaderVector( 1, 0, 0, 0, 0 )
	EngageMidBox:setShaderVector( 2, 1, 0, 0, 0 )
	EngageMidBox:setShaderVector( 3, 0, 0, 0, 0 )
	EngageMidBox:subscribeToGlobalModel( controller, "MissionRecordVaultMapInfo", "engageMedium", function ( model )
		local engageMedium = Engine.GetModelValue( model )
		if engageMedium then
			EngageMidBox:setShaderVector( 0, CoD.GetVectorComponentFromString( engageMedium, 1 ), CoD.GetVectorComponentFromString( engageMedium, 2 ), CoD.GetVectorComponentFromString( engageMedium, 3 ), CoD.GetVectorComponentFromString( engageMedium, 4 ) )
		end
	end )
	EngageMidBox:linkToElementModel( self, "engageMedium", true, function ( model )
		local engageMedium = Engine.GetModelValue( model )
		if engageMedium then
			EngageMidBox:setRGB( MissionRecordVault_EngageRangeColor( engageMedium ) )
		end
	end )
	self:addElement( EngageMidBox )
	self.EngageMidBox = EngageMidBox
	
	local EngageLongBox = LUI.UIImage.new()
	EngageLongBox:setLeftRight( true, false, 276, 561 )
	EngageLongBox:setTopBottom( false, true, -110, -77 )
	EngageLongBox:setImage( RegisterImage( "uie_t7_menu_cp_vault_frame_fill" ) )
	EngageLongBox:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	EngageLongBox:setShaderVector( 1, 0, 0, 0, 0 )
	EngageLongBox:setShaderVector( 2, 1, 0, 0, 0 )
	EngageLongBox:setShaderVector( 3, 0, 0, 0, 0 )
	EngageLongBox:subscribeToGlobalModel( controller, "MissionRecordVaultMapInfo", "engageLong", function ( model )
		local engageLong = Engine.GetModelValue( model )
		if engageLong then
			EngageLongBox:setShaderVector( 0, CoD.GetVectorComponentFromString( engageLong, 1 ), CoD.GetVectorComponentFromString( engageLong, 2 ), CoD.GetVectorComponentFromString( engageLong, 3 ), CoD.GetVectorComponentFromString( engageLong, 4 ) )
		end
	end )
	EngageLongBox:linkToElementModel( self, "engageLong", true, function ( model )
		local engageLong = Engine.GetModelValue( model )
		if engageLong then
			EngageLongBox:setRGB( MissionRecordVault_EngageRangeColor( engageLong ) )
		end
	end )
	self:addElement( EngageLongBox )
	self.EngageLongBox = EngageLongBox
	
	local OSname = LUI.UIImage.new()
	OSname:setLeftRight( true, false, 91.38, 235.88 )
	OSname:setTopBottom( true, false, 43.56, 56.7 )
	OSname:setImage( RegisterImage( "uie_t7_menu_cp_vault_screen_coalescense" ) )
	self:addElement( OSname )
	self.OSname = OSname
	
	local Logobar = LUI.UIImage.new()
	Logobar:setLeftRight( true, false, 94.38, 116.5 )
	Logobar:setTopBottom( true, false, 58.34, 67.87 )
	Logobar:setImage( RegisterImage( "uie_t7_menu_cp_vault_screen_logo_bar" ) )
	self:addElement( Logobar )
	self.Logobar = Logobar
	
	local Logobar0 = LUI.UIImage.new()
	Logobar0:setLeftRight( true, false, 113.38, 122.5 )
	Logobar0:setTopBottom( true, false, 58.34, 67.47 )
	Logobar0:setImage( RegisterImage( "uie_t7_menu_cp_vault_screen_logo_bars" ) )
	self:addElement( Logobar0 )
	self.Logobar0 = Logobar0
	
	local toprightnumbers = LUI.UIImage.new()
	toprightnumbers:setLeftRight( true, false, 558, 587.4 )
	toprightnumbers:setTopBottom( true, false, 59.49, 68.31 )
	toprightnumbers:setImage( RegisterImage( "uie_t7_menu_cp_vault_screen_top_rightbar_numbers" ) )
	self:addElement( toprightnumbers )
	self.toprightnumbers = toprightnumbers
	
	local topRightBar = LUI.UIImage.new()
	topRightBar:setLeftRight( true, false, 396.65, 592.05 )
	topRightBar:setTopBottom( true, false, 40.85, 60.39 )
	topRightBar:setImage( RegisterImage( "uie_t7_menu_cp_vault_screen_top_rightbar" ) )
	self:addElement( topRightBar )
	self.topRightBar = topRightBar
	
	local Line000 = LUI.UIImage.new()
	Line000:setLeftRight( true, false, 41, 596.05 )
	Line000:setTopBottom( true, false, 76.52, 81.02 )
	Line000:setImage( RegisterImage( "uie_t7_menu_cp_vault_screen_longbar" ) )
	self:addElement( Line000 )
	self.Line000 = Line000
	
	local Logobar00 = LUI.UIImage.new()
	Logobar00:setLeftRight( true, false, 129.63, 138.76 )
	Logobar00:setTopBottom( true, false, 58.34, 67.47 )
	Logobar00:setImage( RegisterImage( "uie_t7_menu_cp_vault_screen_logo_bars" ) )
	self:addElement( Logobar00 )
	self.Logobar00 = Logobar00
	
	local Logobar000 = LUI.UIImage.new()
	Logobar000:setLeftRight( true, false, 121.5, 130.63 )
	Logobar000:setTopBottom( true, false, 58.34, 67.47 )
	Logobar000:setImage( RegisterImage( "uie_t7_menu_cp_vault_screen_logo_bars" ) )
	self:addElement( Logobar000 )
	self.Logobar000 = Logobar000
	
	local Logobar001 = LUI.UIImage.new()
	Logobar001:setLeftRight( true, false, 137.76, 146.88 )
	Logobar001:setTopBottom( true, false, 58.34, 67.47 )
	Logobar001:setImage( RegisterImage( "uie_t7_menu_cp_vault_screen_logo_bars" ) )
	self:addElement( Logobar001 )
	self.Logobar001 = Logobar001
	
	local logo = LUI.UIImage.new()
	logo:setLeftRight( true, false, 53.38, 88.34 )
	logo:setTopBottom( true, false, 35.56, 70.52 )
	logo:setImage( RegisterImage( "uie_t7_menu_cp_datavault_logo" ) )
	self:addElement( logo )
	self.logo = logo
	
	local buttons0 = LUI.UIImage.new()
	buttons0:setLeftRight( true, false, 366, 590 )
	buttons0:setTopBottom( true, false, 312.4, 321.36 )
	buttons0:setImage( RegisterImage( "uie_t7_menu_cp_vault_screen_bottombtn" ) )
	self:addElement( buttons0 )
	self.buttons0 = buttons0
	
	local Line0000 = LUI.UIImage.new()
	Line0000:setLeftRight( true, false, 41, 596.05 )
	Line0000:setTopBottom( true, false, 302.52, 307.02 )
	Line0000:setImage( RegisterImage( "uie_t7_menu_cp_vault_screen_longbar" ) )
	self:addElement( Line0000 )
	self.Line0000 = Line0000
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.EngageCloseBox:close()
		element.EngageMidBox:close()
		element.EngageLongBox:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

