-- ef9d951e23616e79f8f8652b5aa68d1f
-- This hash is used for caching, delete to decompile the file again

CoD.MissionRecordVault_Operations = InheritFrom( LUI.UIElement )
CoD.MissionRecordVault_Operations.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.MissionRecordVault_Operations )
	self.id = "MissionRecordVault_Operations"
	self.soundSet = "CAC_PrimaryWeapon"
	self:setLeftRight( true, false, 0, 450 )
	self:setTopBottom( true, false, 0, 248 )
	
	local SecTitleBG = LUI.UIImage.new()
	SecTitleBG:setLeftRight( true, false, -46, 510.63 )
	SecTitleBG:setTopBottom( true, false, 24, 72.22 )
	SecTitleBG:setAlpha( 0.65 )
	SecTitleBG:setImage( RegisterImage( "uie_t7_menu_cp_vault_sec_title_bg" ) )
	self:addElement( SecTitleBG )
	self.SecTitleBG = SecTitleBG
	
	local EngageTitle = LUI.UIText.new()
	EngageTitle:setLeftRight( true, false, 43, 485.5 )
	EngageTitle:setTopBottom( true, false, 39, 59 )
	EngageTitle:setAlpha( 0.9 )
	EngageTitle:setText( Engine.Localize( "CPUI_AREA_OF_OPERATIONS_CAPS" ) )
	EngageTitle:setTTF( "fonts/escom.ttf" )
	EngageTitle:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	EngageTitle:setShaderVector( 0, 0.06, 0, 0, 0 )
	EngageTitle:setShaderVector( 1, 0.02, 0, 0, 0 )
	EngageTitle:setShaderVector( 2, 1, 0, 0, 0 )
	EngageTitle:setLetterSpacing( 1.8 )
	EngageTitle:setLineSpacing( 3.5 )
	EngageTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	EngageTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( EngageTitle )
	self.EngageTitle = EngageTitle
	
	local EngageDesc = LUI.UIText.new()
	EngageDesc:setLeftRight( true, false, 43, 457.5 )
	EngageDesc:setTopBottom( false, true, -154.5, -135.5 )
	EngageDesc:setAlpha( 0.85 )
	EngageDesc:setText( Engine.Localize( "CPUI_AREA_OF_OPERATIONS_DESC_CAPS" ) )
	EngageDesc:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	EngageDesc:setLetterSpacing( 1 )
	EngageDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	EngageDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( EngageDesc )
	self.EngageDesc = EngageDesc
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( true, false, -2, 26 )
	Image3:setTopBottom( true, false, 23, 27.22 )
	Image3:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image30 = LUI.UIImage.new()
	Image30:setLeftRight( true, false, -2, 26 )
	Image30:setTopBottom( true, false, 69, 73.22 )
	Image30:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	Image30:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image30 )
	self.Image30 = Image30
	
	local frame0000 = LUI.UIImage.new()
	frame0000:setLeftRight( true, false, 25.5, 410.5 )
	frame0000:setTopBottom( false, true, -46.15, -7.85 )
	frame0000:setImage( RegisterImage( "uie_t7_menu_cp_vault_framescreen" ) )
	self:addElement( frame0000 )
	self.frame0000 = frame0000
	
	local frameBG0 = LUI.UIImage.new()
	frameBG0:setLeftRight( true, false, 25.5, 410.5 )
	frameBG0:setTopBottom( false, true, -46.6, -8.3 )
	frameBG0:setImage( RegisterImage( "uie_t7_menu_cp_vault_framescreenbg" ) )
	self:addElement( frameBG0 )
	self.frameBG0 = frameBG0
	
	local frame000 = LUI.UIImage.new()
	frame000:setLeftRight( true, false, 25.5, 410.5 )
	frame000:setTopBottom( false, true, -88.45, -50.15 )
	frame000:setImage( RegisterImage( "uie_t7_menu_cp_vault_framescreen" ) )
	self:addElement( frame000 )
	self.frame000 = frame000
	
	local frameBG = LUI.UIImage.new()
	frameBG:setLeftRight( true, false, 25.5, 410.5 )
	frameBG:setTopBottom( false, true, -130.75, -92.45 )
	frameBG:setImage( RegisterImage( "uie_t7_menu_cp_vault_framescreenbg" ) )
	self:addElement( frameBG )
	self.frameBG = frameBG
	
	local frameBG00 = LUI.UIImage.new()
	frameBG00:setLeftRight( true, false, 25.5, 410.5 )
	frameBG00:setTopBottom( false, true, -88.45, -50.15 )
	frameBG00:setImage( RegisterImage( "uie_t7_menu_cp_vault_framescreenbg" ) )
	self:addElement( frameBG00 )
	self.frameBG00 = frameBG00
	
	local frame00 = LUI.UIImage.new()
	frame00:setLeftRight( true, false, 25.5, 410.5 )
	frame00:setTopBottom( false, true, -130.75, -92.45 )
	frame00:setImage( RegisterImage( "uie_t7_menu_cp_vault_framescreen" ) )
	self:addElement( frame00 )
	self.frame00 = frame00
	
	local EngageClose = LUI.UIText.new()
	EngageClose:setLeftRight( true, false, 43, 184 )
	EngageClose:setTopBottom( false, true, -119, -102 )
	EngageClose:setAlpha( 0.7 )
	EngageClose:setText( Engine.Localize( "CPUI_ENGAGEMENT_CLOSE_CAPS" ) )
	EngageClose:setTTF( "fonts/escom.ttf" )
	EngageClose:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	EngageClose:setShaderVector( 0, 0.06, 0, 0, 0 )
	EngageClose:setShaderVector( 1, 0.02, 0, 0, 0 )
	EngageClose:setShaderVector( 2, 1, 0, 0, 0 )
	EngageClose:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	EngageClose:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( EngageClose )
	self.EngageClose = EngageClose
	
	local EngageMid = LUI.UIText.new()
	EngageMid:setLeftRight( true, false, 43, 184 )
	EngageMid:setTopBottom( false, true, -76, -59 )
	EngageMid:setAlpha( 0.7 )
	EngageMid:setText( Engine.Localize( "CPUI_ENGAGEMENT_MEDIUM_CAPS" ) )
	EngageMid:setTTF( "fonts/escom.ttf" )
	EngageMid:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	EngageMid:setShaderVector( 0, 0.06, 0, 0, 0 )
	EngageMid:setShaderVector( 1, 0.02, 0, 0, 0 )
	EngageMid:setShaderVector( 2, 1, 0, 0, 0 )
	EngageMid:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	EngageMid:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( EngageMid )
	self.EngageMid = EngageMid
	
	local EngageMid0 = LUI.UIText.new()
	EngageMid0:setLeftRight( true, false, 43, 184 )
	EngageMid0:setTopBottom( false, true, -34, -17 )
	EngageMid0:setAlpha( 0.7 )
	EngageMid0:setText( Engine.Localize( "CPUI_ENGAGEMENT_LONG_CAPS" ) )
	EngageMid0:setTTF( "fonts/escom.ttf" )
	EngageMid0:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	EngageMid0:setShaderVector( 0, 0.06, 0, 0, 0 )
	EngageMid0:setShaderVector( 1, 0.02, 0, 0, 0 )
	EngageMid0:setShaderVector( 2, 1, 0, 0, 0 )
	EngageMid0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	EngageMid0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( EngageMid0 )
	self.EngageMid0 = EngageMid0
	
	local EngageLongBox = LUI.UIImage.new()
	EngageLongBox:setLeftRight( true, false, 193.63, 396.63 )
	EngageLongBox:setTopBottom( false, true, -39.6, -15.6 )
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
	
	local EngageMidBox = LUI.UIImage.new()
	EngageMidBox:setLeftRight( true, false, 193.63, 396.63 )
	EngageMidBox:setTopBottom( false, true, -80.6, -57.6 )
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
	
	local EngageCloseBox = LUI.UIImage.new()
	EngageCloseBox:setLeftRight( true, false, 193.63, 396.63 )
	EngageCloseBox:setTopBottom( false, true, -123.6, -99.6 )
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
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.EngageLongBox:close()
		element.EngageMidBox:close()
		element.EngageCloseBox:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
