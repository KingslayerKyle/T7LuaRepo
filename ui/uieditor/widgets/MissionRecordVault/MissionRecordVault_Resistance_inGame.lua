-- 02dadc2d9a7e71440fd54f6becc82de3
-- This hash is used for caching, delete to decompile the file again

CoD.MissionRecordVault_Resistance_inGame = InheritFrom( LUI.UIElement )
CoD.MissionRecordVault_Resistance_inGame.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.MissionRecordVault_Resistance_inGame )
	self.id = "MissionRecordVault_Resistance_inGame"
	self.soundSet = "CAC_PrimaryWeapon"
	self:setLeftRight( true, false, 0, 640 )
	self:setTopBottom( true, false, 0, 360 )
	
	local ResistanceTitle = LUI.UIText.new()
	ResistanceTitle:setLeftRight( true, false, 34, 586.4 )
	ResistanceTitle:setTopBottom( true, false, 92, 118 )
	ResistanceTitle:setText( Engine.Localize( "CPUI_EXPECTED_RESISTANCE_TITLE_CAPS" ) )
	ResistanceTitle:setTTF( "fonts/escom.ttf" )
	ResistanceTitle:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	ResistanceTitle:setShaderVector( 0, 0.06, 0, 0, 0 )
	ResistanceTitle:setShaderVector( 1, 0.02, 0, 0, 0 )
	ResistanceTitle:setShaderVector( 2, 2, 0, 0, 0 )
	ResistanceTitle:setLetterSpacing( 1 )
	ResistanceTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ResistanceTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ResistanceTitle )
	self.ResistanceTitle = ResistanceTitle
	
	local ResistanceText = LUI.UIText.new()
	ResistanceText:setLeftRight( true, false, 35, 586 )
	ResistanceText:setTopBottom( true, false, 130, 154 )
	ResistanceText:setRGB( 0.95, 0.9, 0.03 )
	ResistanceText:setTTF( "fonts/escom.ttf" )
	ResistanceText:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	ResistanceText:setShaderVector( 0, 0.06, 0, 0, 0 )
	ResistanceText:setShaderVector( 1, 0.02, 0, 0, 0 )
	ResistanceText:setShaderVector( 2, 2, 0, 0, 0 )
	ResistanceText:setLetterSpacing( 1 )
	ResistanceText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ResistanceText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	ResistanceText:linkToElementModel( self, "resisttitle1", true, function ( model )
		local resisttitle1 = Engine.GetModelValue( model )
		if resisttitle1 then
			ResistanceText:setText( Engine.Localize( LocalizeToUpperString( resisttitle1 ) ) )
		end
	end )
	self:addElement( ResistanceText )
	self.ResistanceText = ResistanceText
	
	local ResistanceText00 = LUI.UIText.new()
	ResistanceText00:setLeftRight( true, false, 35, 590 )
	ResistanceText00:setTopBottom( true, false, 252, 276 )
	ResistanceText00:setRGB( 0.95, 0.9, 0.03 )
	ResistanceText00:setTTF( "fonts/escom.ttf" )
	ResistanceText00:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	ResistanceText00:setShaderVector( 0, 0.06, 0, 0, 0 )
	ResistanceText00:setShaderVector( 1, 0.02, 0, 0, 0 )
	ResistanceText00:setShaderVector( 2, 2, 0, 0, 0 )
	ResistanceText00:setLetterSpacing( 1 )
	ResistanceText00:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ResistanceText00:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	ResistanceText00:linkToElementModel( self, "resisttitle3", true, function ( model )
		local resisttitle3 = Engine.GetModelValue( model )
		if resisttitle3 then
			ResistanceText00:setText( Engine.Localize( LocalizeToUpperString( resisttitle3 ) ) )
		end
	end )
	self:addElement( ResistanceText00 )
	self.ResistanceText00 = ResistanceText00
	
	local ResistanceText1 = LUI.UIText.new()
	ResistanceText1:setLeftRight( true, false, 35, 586 )
	ResistanceText1:setTopBottom( true, false, 156, 178 )
	ResistanceText1:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ResistanceText1:setLetterSpacing( 1 )
	ResistanceText1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ResistanceText1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	ResistanceText1:linkToElementModel( self, "resist1short", true, function ( model )
		local resist1short = Engine.GetModelValue( model )
		if resist1short then
			ResistanceText1:setText( Engine.Localize( resist1short ) )
		end
	end )
	self:addElement( ResistanceText1 )
	self.ResistanceText1 = ResistanceText1
	
	local ResistanceText01 = LUI.UIText.new()
	ResistanceText01:setLeftRight( true, false, 35, 590 )
	ResistanceText01:setTopBottom( true, false, 190, 214 )
	ResistanceText01:setRGB( 0.95, 0.9, 0.03 )
	ResistanceText01:setTTF( "fonts/escom.ttf" )
	ResistanceText01:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	ResistanceText01:setShaderVector( 0, 0.06, 0, 0, 0 )
	ResistanceText01:setShaderVector( 1, 0.02, 0, 0, 0 )
	ResistanceText01:setShaderVector( 2, 2, 0, 0, 0 )
	ResistanceText01:setLetterSpacing( 1 )
	ResistanceText01:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ResistanceText01:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	ResistanceText01:linkToElementModel( self, "resisttitle2", true, function ( model )
		local resisttitle2 = Engine.GetModelValue( model )
		if resisttitle2 then
			ResistanceText01:setText( Engine.Localize( LocalizeToUpperString( resisttitle2 ) ) )
		end
	end )
	self:addElement( ResistanceText01 )
	self.ResistanceText01 = ResistanceText01
	
	local ResistanceText10 = LUI.UIText.new()
	ResistanceText10:setLeftRight( true, false, 35, 590 )
	ResistanceText10:setTopBottom( true, false, 214, 236 )
	ResistanceText10:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ResistanceText10:setLetterSpacing( 1 )
	ResistanceText10:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ResistanceText10:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	ResistanceText10:linkToElementModel( self, "resist2short", true, function ( model )
		local resist2short = Engine.GetModelValue( model )
		if resist2short then
			ResistanceText10:setText( Engine.Localize( resist2short ) )
		end
	end )
	self:addElement( ResistanceText10 )
	self.ResistanceText10 = ResistanceText10
	
	local ResistanceText100 = LUI.UIText.new()
	ResistanceText100:setLeftRight( true, false, 35, 590 )
	ResistanceText100:setTopBottom( true, false, 276, 298 )
	ResistanceText100:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ResistanceText100:setLetterSpacing( 1 )
	ResistanceText100:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ResistanceText100:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	ResistanceText100:linkToElementModel( self, "resist3short", true, function ( model )
		local resist3short = Engine.GetModelValue( model )
		if resist3short then
			ResistanceText100:setText( Engine.Localize( resist3short ) )
		end
	end )
	self:addElement( ResistanceText100 )
	self.ResistanceText100 = ResistanceText100
	
	local OSname = LUI.UIImage.new()
	OSname:setLeftRight( true, false, 66.38, 210.88 )
	OSname:setTopBottom( true, false, 43.56, 56.7 )
	OSname:setImage( RegisterImage( "uie_t7_menu_cp_vault_screen_coalescense" ) )
	self:addElement( OSname )
	self.OSname = OSname
	
	local Logobar = LUI.UIImage.new()
	Logobar:setLeftRight( true, false, 69.38, 91.5 )
	Logobar:setTopBottom( true, false, 58.34, 67.87 )
	Logobar:setImage( RegisterImage( "uie_t7_menu_cp_vault_screen_logo_bar" ) )
	self:addElement( Logobar )
	self.Logobar = Logobar
	
	local Logobar0 = LUI.UIImage.new()
	Logobar0:setLeftRight( true, false, 88.38, 97.5 )
	Logobar0:setTopBottom( true, false, 58.34, 67.47 )
	Logobar0:setImage( RegisterImage( "uie_t7_menu_cp_vault_screen_logo_bars" ) )
	self:addElement( Logobar0 )
	self.Logobar0 = Logobar0
	
	local toprightnumbers = LUI.UIImage.new()
	toprightnumbers:setLeftRight( true, false, 557, 586.4 )
	toprightnumbers:setTopBottom( true, false, 59.49, 68.31 )
	toprightnumbers:setImage( RegisterImage( "uie_t7_menu_cp_vault_screen_top_rightbar_numbers" ) )
	self:addElement( toprightnumbers )
	self.toprightnumbers = toprightnumbers
	
	local topRightBar = LUI.UIImage.new()
	topRightBar:setLeftRight( true, false, 395.65, 591.05 )
	topRightBar:setTopBottom( true, false, 40.85, 60.39 )
	topRightBar:setImage( RegisterImage( "uie_t7_menu_cp_vault_screen_top_rightbar" ) )
	self:addElement( topRightBar )
	self.topRightBar = topRightBar
	
	local Line000 = LUI.UIImage.new()
	Line000:setLeftRight( true, false, 14, 597.66 )
	Line000:setTopBottom( true, false, 76.52, 81.02 )
	Line000:setImage( RegisterImage( "uie_t7_menu_cp_vault_screen_longbar" ) )
	self:addElement( Line000 )
	self.Line000 = Line000
	
	local Logobar00 = LUI.UIImage.new()
	Logobar00:setLeftRight( true, false, 104.63, 113.76 )
	Logobar00:setTopBottom( true, false, 58.34, 67.47 )
	Logobar00:setImage( RegisterImage( "uie_t7_menu_cp_vault_screen_logo_bars" ) )
	self:addElement( Logobar00 )
	self.Logobar00 = Logobar00
	
	local Logobar000 = LUI.UIImage.new()
	Logobar000:setLeftRight( true, false, 96.5, 105.63 )
	Logobar000:setTopBottom( true, false, 58.34, 67.47 )
	Logobar000:setImage( RegisterImage( "uie_t7_menu_cp_vault_screen_logo_bars" ) )
	self:addElement( Logobar000 )
	self.Logobar000 = Logobar000
	
	local Logobar001 = LUI.UIImage.new()
	Logobar001:setLeftRight( true, false, 112.76, 121.88 )
	Logobar001:setTopBottom( true, false, 58.34, 67.47 )
	Logobar001:setImage( RegisterImage( "uie_t7_menu_cp_vault_screen_logo_bars" ) )
	self:addElement( Logobar001 )
	self.Logobar001 = Logobar001
	
	local logo = LUI.UIImage.new()
	logo:setLeftRight( true, false, 28.38, 63.34 )
	logo:setTopBottom( true, false, 35.56, 70.52 )
	logo:setImage( RegisterImage( "uie_t7_menu_cp_datavault_logo" ) )
	self:addElement( logo )
	self.logo = logo
	
	local buttons0 = LUI.UIImage.new()
	buttons0:setLeftRight( true, false, 366, 590 )
	buttons0:setTopBottom( true, false, 318.4, 327.36 )
	buttons0:setImage( RegisterImage( "uie_t7_menu_cp_vault_screen_bottombtn" ) )
	self:addElement( buttons0 )
	self.buttons0 = buttons0
	
	local Line0000 = LUI.UIImage.new()
	Line0000:setLeftRight( true, false, 14, 597.66 )
	Line0000:setTopBottom( true, false, 308.52, 313.02 )
	Line0000:setImage( RegisterImage( "uie_t7_menu_cp_vault_screen_longbar" ) )
	self:addElement( Line0000 )
	self.Line0000 = Line0000
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ResistanceText:close()
		element.ResistanceText00:close()
		element.ResistanceText1:close()
		element.ResistanceText01:close()
		element.ResistanceText10:close()
		element.ResistanceText100:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
