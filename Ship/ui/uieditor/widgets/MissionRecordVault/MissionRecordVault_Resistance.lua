-- 4d351b70ccade43a8636133bd7b51cd3
-- This hash is used for caching, delete to decompile the file again

CoD.MissionRecordVault_Resistance = InheritFrom( LUI.UIElement )
CoD.MissionRecordVault_Resistance.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.MissionRecordVault_Resistance )
	self.id = "MissionRecordVault_Resistance"
	self.soundSet = "CAC_PrimaryWeapon"
	self:setLeftRight( true, false, 0, 708 )
	self:setTopBottom( true, false, 0, 227 )
	
	local SecTitleBG = LUI.UIImage.new()
	SecTitleBG:setLeftRight( true, false, 0, 834 )
	SecTitleBG:setTopBottom( true, false, 0, 47.07 )
	SecTitleBG:setAlpha( 0.65 )
	SecTitleBG:setImage( RegisterImage( "uie_t7_menu_cp_vault_sec_titlebig_bg" ) )
	self:addElement( SecTitleBG )
	self.SecTitleBG = SecTitleBG
	
	local ResistanceTitle = LUI.UIText.new()
	ResistanceTitle:setLeftRight( true, false, 46, 430 )
	ResistanceTitle:setTopBottom( true, false, 15, 35 )
	ResistanceTitle:setAlpha( 0.9 )
	ResistanceTitle:setText( Engine.Localize( "CPUI_EXPECTED_RESISTANCE_TITLE_CAPS" ) )
	ResistanceTitle:setTTF( "fonts/escom.ttf" )
	ResistanceTitle:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	ResistanceTitle:setShaderVector( 0, 0.06, 0, 0, 0 )
	ResistanceTitle:setShaderVector( 1, 0.02, 0, 0, 0 )
	ResistanceTitle:setShaderVector( 2, 1, 0, 0, 0 )
	ResistanceTitle:setLetterSpacing( 2 )
	ResistanceTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ResistanceTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ResistanceTitle )
	self.ResistanceTitle = ResistanceTitle
	
	local ResistanceText = LUI.UIText.new()
	ResistanceText:setLeftRight( true, false, 47, 221 )
	ResistanceText:setTopBottom( true, false, 69, 88 )
	ResistanceText:setRGB( 0.95, 0.89, 0.03 )
	ResistanceText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ResistanceText:setLetterSpacing( 1 )
	ResistanceText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ResistanceText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	ResistanceText:subscribeToGlobalModel( controller, "MissionRecordVaultMapInfo", "resisttitle1", function ( model )
		local resisttitle1 = Engine.GetModelValue( model )
		if resisttitle1 then
			ResistanceText:setText( Engine.Localize( LocalizeToUpperString( resisttitle1 ) ) )
		end
	end )
	self:addElement( ResistanceText )
	self.ResistanceText = ResistanceText
	
	local ResistanceText0 = LUI.UIText.new()
	ResistanceText0:setLeftRight( true, false, 268, 442 )
	ResistanceText0:setTopBottom( true, false, 69, 88 )
	ResistanceText0:setRGB( 0.95, 0.89, 0.03 )
	ResistanceText0:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ResistanceText0:setLetterSpacing( 1 )
	ResistanceText0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ResistanceText0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	ResistanceText0:subscribeToGlobalModel( controller, "MissionRecordVaultMapInfo", "resisttitle2", function ( model )
		local resisttitle2 = Engine.GetModelValue( model )
		if resisttitle2 then
			ResistanceText0:setText( Engine.Localize( LocalizeToUpperString( resisttitle2 ) ) )
		end
	end )
	self:addElement( ResistanceText0 )
	self.ResistanceText0 = ResistanceText0
	
	local ResistanceText00 = LUI.UIText.new()
	ResistanceText00:setLeftRight( true, false, 496.5, 670.5 )
	ResistanceText00:setTopBottom( true, false, 69, 88 )
	ResistanceText00:setRGB( 0.95, 0.89, 0.03 )
	ResistanceText00:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ResistanceText00:setLetterSpacing( 1 )
	ResistanceText00:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ResistanceText00:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	ResistanceText00:subscribeToGlobalModel( controller, "MissionRecordVaultMapInfo", "resisttitle3", function ( model )
		local resisttitle3 = Engine.GetModelValue( model )
		if resisttitle3 then
			ResistanceText00:setText( Engine.Localize( LocalizeToUpperString( resisttitle3 ) ) )
		end
	end )
	self:addElement( ResistanceText00 )
	self.ResistanceText00 = ResistanceText00
	
	local Desc01 = LUI.UIText.new()
	Desc01:setLeftRight( true, false, 47, 228 )
	Desc01:setTopBottom( true, false, 103, 122 )
	Desc01:setAlpha( 0.55 )
	Desc01:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Desc01:setLineSpacing( 1 )
	Desc01:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Desc01:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Desc01:subscribeToGlobalModel( controller, "MissionRecordVaultMapInfo", "resist1", function ( model )
		local resist1 = Engine.GetModelValue( model )
		if resist1 then
			Desc01:setText( Engine.Localize( resist1 ) )
		end
	end )
	self:addElement( Desc01 )
	self.Desc01 = Desc01
	
	local Desc010 = LUI.UIText.new()
	Desc010:setLeftRight( true, false, 268, 467 )
	Desc010:setTopBottom( true, false, 103, 122 )
	Desc010:setAlpha( 0.55 )
	Desc010:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Desc010:setLineSpacing( 1 )
	Desc010:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Desc010:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Desc010:subscribeToGlobalModel( controller, "MissionRecordVaultMapInfo", "resist2", function ( model )
		local resist2 = Engine.GetModelValue( model )
		if resist2 then
			Desc010:setText( Engine.Localize( resist2 ) )
		end
	end )
	self:addElement( Desc010 )
	self.Desc010 = Desc010
	
	local Desc0100 = LUI.UIText.new()
	Desc0100:setLeftRight( true, false, 497, 691 )
	Desc0100:setTopBottom( true, false, 103, 122 )
	Desc0100:setAlpha( 0.55 )
	Desc0100:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Desc0100:setLineSpacing( 1 )
	Desc0100:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Desc0100:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Desc0100:subscribeToGlobalModel( controller, "MissionRecordVaultMapInfo", "resist3", function ( model )
		local resist3 = Engine.GetModelValue( model )
		if resist3 then
			Desc0100:setText( Engine.Localize( resist3 ) )
		end
	end )
	self:addElement( Desc0100 )
	self.Desc0100 = Desc0100
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( true, false, 2, 30 )
	Image3:setTopBottom( true, false, -1, 3 )
	Image3:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image30 = LUI.UIImage.new()
	Image30:setLeftRight( true, false, 2, 30 )
	Image30:setTopBottom( true, false, 44, 48 )
	Image30:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	Image30:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image30 )
	self.Image30 = Image30
	
	local line0 = LUI.UIImage.new()
	line0:setLeftRight( true, false, 475.14, 476.14 )
	line0:setTopBottom( true, false, 59.16, 189.16 )
	line0:setAlpha( 0.5 )
	self:addElement( line0 )
	self.line0 = line0
	
	local spacer = LUI.UIImage.new()
	spacer:setLeftRight( true, false, -53, -36 )
	spacer:setTopBottom( true, false, -20, 108 )
	spacer:setAlpha( 0 )
	self:addElement( spacer )
	self.spacer = spacer
	
	local line00 = LUI.UIImage.new()
	line00:setLeftRight( true, false, 233.14, 234.14 )
	line00:setTopBottom( true, false, 59.16, 189.16 )
	line00:setAlpha( 0.5 )
	self:addElement( line00 )
	self.line00 = line00
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ResistanceText:close()
		element.ResistanceText0:close()
		element.ResistanceText00:close()
		element.Desc01:close()
		element.Desc010:close()
		element.Desc0100:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
