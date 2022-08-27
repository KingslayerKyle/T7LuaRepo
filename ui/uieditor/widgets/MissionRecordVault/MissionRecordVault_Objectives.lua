-- 30c8705ddb6899c617c7deb4b8d5fc56
-- This hash is used for caching, delete to decompile the file again

CoD.MissionRecordVault_Objectives = InheritFrom( LUI.UIElement )
CoD.MissionRecordVault_Objectives.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MissionRecordVault_Objectives )
	self.id = "MissionRecordVault_Objectives"
	self.soundSet = "CAC_PrimaryWeapon"
	self:setLeftRight( true, false, 0, 450 )
	self:setTopBottom( true, false, 0, 315 )
	
	local SecTitleBG = LUI.UIImage.new()
	SecTitleBG:setLeftRight( true, false, -43, 436 )
	SecTitleBG:setTopBottom( true, false, 122.5, 170.72 )
	SecTitleBG:setAlpha( 0.65 )
	SecTitleBG:setImage( RegisterImage( "uie_t7_menu_cp_vault_sec_title_bg" ) )
	self:addElement( SecTitleBG )
	self.SecTitleBG = SecTitleBG
	
	local Description = LUI.UIText.new()
	Description:setLeftRight( true, false, 48, 418 )
	Description:setTopBottom( true, false, 186, 206 )
	Description:setAlpha( 0.55 )
	Description:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Description:subscribeToGlobalModel( controller, "MissionRecordVaultMapInfo", "mapDescription", function ( model )
		local mapDescription = Engine.GetModelValue( model )
		if mapDescription then
			Description:setText( Engine.Localize( mapDescription ) )
		end
	end )
	self:addElement( Description )
	self.Description = Description
	
	local Objective = LUI.UIText.new()
	Objective:setLeftRight( true, false, 48, 471 )
	Objective:setTopBottom( true, false, 137, 157 )
	Objective:setRGB( 1, 0.42, 0.07 )
	Objective:setTTF( "fonts/escom.ttf" )
	Objective:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	Objective:setShaderVector( 0, 0.06, 0, 0, 0 )
	Objective:setShaderVector( 1, 0.02, 0, 0, 0 )
	Objective:setShaderVector( 2, 1, 0, 0, 0 )
	Objective:setLetterSpacing( 2 )
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
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( true, false, 3, 31 )
	Image3:setTopBottom( false, false, -36, -32 )
	Image3:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image30 = LUI.UIImage.new()
	Image30:setLeftRight( true, false, 3, 31 )
	Image30:setTopBottom( false, false, 9, 13 )
	Image30:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	Image30:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image30 )
	self.Image30 = Image30
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Description:close()
		element.Objective:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

