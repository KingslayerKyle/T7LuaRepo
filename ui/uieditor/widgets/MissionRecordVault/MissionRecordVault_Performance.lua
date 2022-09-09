-- 6174d51cd01dd1d98c6a41e892434837
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.BorderThin" )
require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_PerformanceCollectible" )
require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_Heading" )
require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_lines" )
require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_Difficulty" )

local PreLoadFunc = function ( self, controller )
	CoD.perController[controller].inspectingMap = Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "MissionRecordVaultMapInfo.mapId" ) )

	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ()
		CoD.perController[controller].inspectingMap = nil
	end )
end

CoD.MissionRecordVault_Performance = InheritFrom( LUI.UIElement )
CoD.MissionRecordVault_Performance.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.MissionRecordVault_Performance )
	self.id = "MissionRecordVault_Performance"
	self.soundSet = "CAC_PrimaryWeapon"
	self:setLeftRight( true, false, 0, 1152 )
	self:setTopBottom( true, false, 0, 520 )
	self.anyChildUsesUpdateState = true
	
	local BorderThinKills0 = CoD.BorderThin.new( menu, controller )
	BorderThinKills0:setLeftRight( true, false, -9, 343.72 )
	BorderThinKills0:setTopBottom( true, false, 130, 250.56 )
	self:addElement( BorderThinKills0 )
	self.BorderThinKills0 = BorderThinKills0
	
	local TextBox0 = LUI.UIText.new()
	TextBox0:setLeftRight( true, false, -1, 338 )
	TextBox0:setTopBottom( true, false, 110, 128 )
	TextBox0:setText( Engine.Localize( "MENU_SCORE_CAPS" ) )
	TextBox0:setTTF( "fonts/escom.ttf" )
	TextBox0:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	TextBox0:setShaderVector( 0, 0.06, 0, 0, 0 )
	TextBox0:setShaderVector( 1, 0.02, 0, 0, 0 )
	TextBox0:setShaderVector( 2, 1, 0, 0, 0 )
	TextBox0:setLetterSpacing( 1 )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	local score = LUI.UIText.new()
	score:setLeftRight( true, false, -5, 343.72 )
	score:setTopBottom( true, false, 161.78, 216.78 )
	score:setTTF( "fonts/escom.ttf" )
	score:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_cheap_blur" ) )
	score:setShaderVector( 0, 0, 1, 0, 0 )
	score:setShaderVector( 1, 0, 0, 0, 0 )
	score:setShaderVector( 2, 0, 0, 0, 0 )
	score:setShaderVector( 3, 0, 0, 0, 0 )
	score:setShaderVector( 4, 0, 0, 0, 0 )
	score:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	score:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	score:subscribeToGlobalModel( controller, "MissionRecordVaultMapInfo", "SCORE", function ( model )
		local SCORE = Engine.GetModelValue( model )
		if SCORE then
			score:setText( SCORE )
		end
	end )
	self:addElement( score )
	self.score = score
	
	local TextBox1 = LUI.UIText.new()
	TextBox1:setLeftRight( true, false, -1, 338 )
	TextBox1:setTopBottom( true, false, 283, 301 )
	TextBox1:setText( Engine.Localize( "MENU_DIFFICULTY_CAPS" ) )
	TextBox1:setTTF( "fonts/escom.ttf" )
	TextBox1:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	TextBox1:setShaderVector( 0, 0.06, 0, 0, 0 )
	TextBox1:setShaderVector( 1, 0.02, 0, 0, 0 )
	TextBox1:setShaderVector( 2, 1, 0, 0, 0 )
	TextBox1:setLetterSpacing( 1 )
	TextBox1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox1 )
	self.TextBox1 = TextBox1
	
	local TextBox2 = LUI.UIText.new()
	TextBox2:setLeftRight( true, false, 475.5, 596.5 )
	TextBox2:setTopBottom( true, false, 110, 128 )
	TextBox2:setText( Engine.Localize( "MENU_KILLS_CAPS" ) )
	TextBox2:setTTF( "fonts/escom.ttf" )
	TextBox2:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	TextBox2:setShaderVector( 0, 0.06, 0, 0, 0 )
	TextBox2:setShaderVector( 1, 0.02, 0, 0, 0 )
	TextBox2:setShaderVector( 2, 1, 0, 0, 0 )
	TextBox2:setLetterSpacing( 1 )
	TextBox2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox2 )
	self.TextBox2 = TextBox2
	
	local TextBox3 = LUI.UIText.new()
	TextBox3:setLeftRight( true, false, 626.5, 746.5 )
	TextBox3:setTopBottom( true, false, 111, 129 )
	TextBox3:setText( Engine.Localize( "MENU_ASSISTS_CAPS" ) )
	TextBox3:setTTF( "fonts/escom.ttf" )
	TextBox3:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	TextBox3:setShaderVector( 0, 0.06, 0, 0, 0 )
	TextBox3:setShaderVector( 1, 0.02, 0, 0, 0 )
	TextBox3:setShaderVector( 2, 1, 0, 0, 0 )
	TextBox3:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox3:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox3 )
	self.TextBox3 = TextBox3
	
	local BorderThinKills = CoD.BorderThin.new( menu, controller )
	BorderThinKills:setLeftRight( true, false, 469.5, 602.5 )
	BorderThinKills:setTopBottom( true, false, 130, 248.99 )
	self:addElement( BorderThinKills )
	self.BorderThinKills = BorderThinKills
	
	local BorderThin0 = CoD.BorderThin.new( menu, controller )
	BorderThin0:setLeftRight( true, false, 620.5, 752.5 )
	BorderThin0:setTopBottom( true, false, 130, 248.99 )
	self:addElement( BorderThin0 )
	self.BorderThin0 = BorderThin0
	
	local TextBox4 = LUI.UIText.new()
	TextBox4:setLeftRight( true, false, 863.5, 1070.5 )
	TextBox4:setTopBottom( true, false, 109, 127 )
	TextBox4:setText( Engine.Localize( "MENU_COLLECTIBLES_CAPS" ) )
	TextBox4:setTTF( "fonts/escom.ttf" )
	TextBox4:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	TextBox4:setShaderVector( 0, 0.06, 0, 0, 0 )
	TextBox4:setShaderVector( 1, 0.02, 0, 0, 0 )
	TextBox4:setShaderVector( 2, 1, 0, 0, 0 )
	TextBox4:setLetterSpacing( 1 )
	TextBox4:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox4:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox4 )
	self.TextBox4 = TextBox4
	
	local Collectibles = LUI.GridLayout.new( menu, controller, false, 0, 0, 7, 0, nil, nil, false, false, 0, 0, false, false )
	Collectibles:setLeftRight( true, false, 858.5, 1075.5 )
	Collectibles:setTopBottom( true, false, 131, 430 )
	Collectibles:setWidgetType( CoD.MissionRecordVault_PerformanceCollectible )
	Collectibles:setHorizontalCount( 2 )
	Collectibles:setVerticalCount( 3 )
	Collectibles:setSpacing( 7 )
	Collectibles:setDataSource( "CollectiblesList" )
	self:addElement( Collectibles )
	self.Collectibles = Collectibles
	
	local TextBox5 = LUI.UIText.new()
	TextBox5:setLeftRight( true, false, 469.5, 602.5 )
	TextBox5:setTopBottom( true, false, 161.78, 216.78 )
	TextBox5:setTTF( "fonts/escom.ttf" )
	TextBox5:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_cheap_blur" ) )
	TextBox5:setShaderVector( 0, 0, 1, 0, 0 )
	TextBox5:setShaderVector( 1, 0, 0, 0, 0 )
	TextBox5:setShaderVector( 2, 0, 0, 0, 0 )
	TextBox5:setShaderVector( 3, 0, 0, 0, 0 )
	TextBox5:setShaderVector( 4, 0, 0, 0, 0 )
	TextBox5:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextBox5:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	TextBox5:subscribeToGlobalModel( controller, "MissionRecordVaultMapInfo", "KILLS", function ( model )
		local KILLS = Engine.GetModelValue( model )
		if KILLS then
			TextBox5:setText( KILLS )
		end
	end )
	self:addElement( TextBox5 )
	self.TextBox5 = TextBox5
	
	local TextBox6 = LUI.UIText.new()
	TextBox6:setLeftRight( true, false, 620.5, 752.5 )
	TextBox6:setTopBottom( true, false, 161.78, 216.78 )
	TextBox6:setTTF( "fonts/escom.ttf" )
	TextBox6:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_cheap_blur" ) )
	TextBox6:setShaderVector( 0, 0, 1, 0, 0 )
	TextBox6:setShaderVector( 1, 0, 0, 0, 0 )
	TextBox6:setShaderVector( 2, 0, 0, 0, 0 )
	TextBox6:setShaderVector( 3, 0, 0, 0, 0 )
	TextBox6:setShaderVector( 4, 0, 0, 0, 0 )
	TextBox6:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextBox6:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	TextBox6:subscribeToGlobalModel( controller, "MissionRecordVaultMapInfo", "ASSISTS", function ( model )
		local ASSISTS = Engine.GetModelValue( model )
		if ASSISTS then
			TextBox6:setText( ASSISTS )
		end
	end )
	self:addElement( TextBox6 )
	self.TextBox6 = TextBox6
	
	local TitleBG = LUI.UIImage.new()
	TitleBG:setLeftRight( true, false, -80, 399 )
	TitleBG:setTopBottom( true, false, 5, 75 )
	TitleBG:setImage( RegisterImage( "uie_t7_menu_cp_vault_pri_title_bg" ) )
	self:addElement( TitleBG )
	self.TitleBG = TitleBG
	
	local MissionRecordVaultHeading = CoD.MissionRecordVault_Heading.new( menu, controller )
	MissionRecordVaultHeading:setLeftRight( true, false, -9, 1221 )
	MissionRecordVaultHeading:setTopBottom( true, false, -3, 100 )
	MissionRecordVaultHeading:subscribeToGlobalModel( controller, "MissionRecordVaultMapInfo", "mapName", function ( model )
		local mapName = Engine.GetModelValue( model )
		if mapName then
			MissionRecordVaultHeading.Title:setText( LocalizeToUpperString( mapName ) )
		end
	end )
	self:addElement( MissionRecordVaultHeading )
	self.MissionRecordVaultHeading = MissionRecordVaultHeading
	
	local PerformanceTitleIncomplete = LUI.UIText.new()
	PerformanceTitleIncomplete:setLeftRight( true, false, 10, 338 )
	PerformanceTitleIncomplete:setTopBottom( true, false, 50, 68 )
	PerformanceTitleIncomplete:setAlpha( 0.5 )
	PerformanceTitleIncomplete:setText( Engine.Localize( "CPUI_PERFORMANCE_TITLE_INCOMPLETE" ) )
	PerformanceTitleIncomplete:setTTF( "fonts/escom.ttf" )
	PerformanceTitleIncomplete:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	PerformanceTitleIncomplete:setShaderVector( 0, 0.06, 0, 0, 0 )
	PerformanceTitleIncomplete:setShaderVector( 1, 0.02, 0, 0, 0 )
	PerformanceTitleIncomplete:setShaderVector( 2, 1, 0, 0, 0 )
	PerformanceTitleIncomplete:setLetterSpacing( 1 )
	PerformanceTitleIncomplete:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	PerformanceTitleIncomplete:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( PerformanceTitleIncomplete )
	self.PerformanceTitleIncomplete = PerformanceTitleIncomplete
	
	local PerformanceTitle = LUI.UIText.new()
	PerformanceTitle:setLeftRight( true, false, 10, 343.72 )
	PerformanceTitle:setTopBottom( true, false, 50, 68 )
	PerformanceTitle:setAlpha( 0.5 )
	PerformanceTitle:setText( Engine.Localize( "CPUI_PERFORMANCE_TITLE" ) )
	PerformanceTitle:setTTF( "fonts/escom.ttf" )
	PerformanceTitle:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	PerformanceTitle:setShaderVector( 0, 0.06, 0, 0, 0 )
	PerformanceTitle:setShaderVector( 1, 0.02, 0, 0, 0 )
	PerformanceTitle:setShaderVector( 2, 1, 0, 0, 0 )
	PerformanceTitle:setLetterSpacing( 1 )
	PerformanceTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	PerformanceTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( PerformanceTitle )
	self.PerformanceTitle = PerformanceTitle
	
	local MissionRecordVaultlines000 = CoD.MissionRecordVault_lines.new( menu, controller )
	MissionRecordVaultlines000:setLeftRight( true, false, -32, 858.5 )
	MissionRecordVaultlines000:setTopBottom( true, false, 300.56, 304.56 )
	MissionRecordVaultlines000:setAlpha( 0.35 )
	self:addElement( MissionRecordVaultlines000 )
	self.MissionRecordVaultlines000 = MissionRecordVaultlines000
	
	local MissionRecordVaultlines0000 = CoD.MissionRecordVault_lines.new( menu, controller )
	MissionRecordVaultlines0000:setLeftRight( true, false, -32, 1211.14 )
	MissionRecordVaultlines0000:setTopBottom( true, false, 428.56, 432.56 )
	MissionRecordVaultlines0000:setAlpha( 0.35 )
	self:addElement( MissionRecordVaultlines0000 )
	self.MissionRecordVaultlines0000 = MissionRecordVaultlines0000
	
	local MissionRecordVaultlines00000 = CoD.MissionRecordVault_lines.new( menu, controller )
	MissionRecordVaultlines00000:setLeftRight( true, false, -32, 1211.14 )
	MissionRecordVaultlines00000:setTopBottom( true, false, 498.56, 502.56 )
	MissionRecordVaultlines00000:setAlpha( 0.35 )
	self:addElement( MissionRecordVaultlines00000 )
	self.MissionRecordVaultlines00000 = MissionRecordVaultlines00000
	
	local MissionRecordVaultlines0 = CoD.MissionRecordVault_lines.new( menu, controller )
	MissionRecordVaultlines0:setLeftRight( true, false, -33, 1210.14 )
	MissionRecordVaultlines0:setTopBottom( true, false, 128.56, 132.56 )
	MissionRecordVaultlines0:setAlpha( 0.35 )
	self:addElement( MissionRecordVaultlines0 )
	self.MissionRecordVaultlines0 = MissionRecordVaultlines0
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( true, false, -34, -6 )
	Image3:setTopBottom( true, false, 128, 132 )
	Image3:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image30 = LUI.UIImage.new()
	Image30:setLeftRight( true, false, -34, -6 )
	Image30:setTopBottom( true, false, 248, 252 )
	Image30:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	Image30:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image30 )
	self.Image30 = Image30
	
	local Image300 = LUI.UIImage.new()
	Image300:setLeftRight( true, false, -34, -6 )
	Image300:setTopBottom( true, false, 301, 305 )
	Image300:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	Image300:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image300 )
	self.Image300 = Image300
	
	local Image3000 = LUI.UIImage.new()
	Image3000:setLeftRight( true, false, -34, -6 )
	Image3000:setTopBottom( true, false, 422, 426 )
	Image3000:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	Image3000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image3000 )
	self.Image3000 = Image3000
	
	local MissionRecordVaultlines001 = CoD.MissionRecordVault_lines.new( menu, controller )
	MissionRecordVaultlines001:setLeftRight( true, false, -33, 858.5 )
	MissionRecordVaultlines001:setTopBottom( true, false, 246.56, 250.56 )
	MissionRecordVaultlines001:setAlpha( 0.35 )
	self:addElement( MissionRecordVaultlines001 )
	self.MissionRecordVaultlines001 = MissionRecordVaultlines001
	
	local MissionRecordVaultDifficulty0 = CoD.MissionRecordVault_Difficulty.new( menu, controller )
	MissionRecordVaultDifficulty0:setLeftRight( true, false, -9, 343.72 )
	MissionRecordVaultDifficulty0:setTopBottom( true, false, 303, 423.56 )
	MissionRecordVaultDifficulty0:linkToElementModel( self, nil, false, function ( model )
		MissionRecordVaultDifficulty0:setModel( model, controller )
	end )
	self:addElement( MissionRecordVaultDifficulty0 )
	self.MissionRecordVaultDifficulty0 = MissionRecordVaultDifficulty0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				PerformanceTitleIncomplete:completeAnimation()
				self.PerformanceTitleIncomplete:setAlpha( 0 )
				self.clipFinished( PerformanceTitleIncomplete, {} )

				PerformanceTitle:completeAnimation()
				self.PerformanceTitle:setAlpha( 0.5 )
				self.clipFinished( PerformanceTitle, {} )
			end
		},
		MissionIncomplete = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				PerformanceTitleIncomplete:completeAnimation()
				self.PerformanceTitleIncomplete:setAlpha( 0.5 )
				self.clipFinished( PerformanceTitleIncomplete, {} )

				PerformanceTitle:completeAnimation()
				self.PerformanceTitle:setAlpha( 0 )
				self.clipFinished( PerformanceTitle, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "MissionIncomplete",
			condition = function ( menu, element, event )
				return not MissionRecordMapComplete( element, controller )
			end
		}
	} )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BorderThinKills0:close()
		element.BorderThinKills:close()
		element.BorderThin0:close()
		element.Collectibles:close()
		element.MissionRecordVaultHeading:close()
		element.MissionRecordVaultlines000:close()
		element.MissionRecordVaultlines0000:close()
		element.MissionRecordVaultlines00000:close()
		element.MissionRecordVaultlines0:close()
		element.MissionRecordVaultlines001:close()
		element.MissionRecordVaultDifficulty0:close()
		element.score:close()
		element.TextBox5:close()
		element.TextBox6:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
