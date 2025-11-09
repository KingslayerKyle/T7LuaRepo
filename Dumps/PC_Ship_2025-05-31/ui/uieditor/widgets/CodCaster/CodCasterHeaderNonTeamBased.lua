require( "ui.uieditor.widgets.MPHudWidgets.CodCaster.CodCasterTimer" )
require( "ui.uieditor.widgets.CodCaster.codcaster_ScoreLogoWidget_FFA" )

local PreLoadFunc = function ( self, controller )
	local f1_local0 = Engine.GetModelForController( controller )
	if not Engine.GetModel( f1_local0, "selfPlayerInfo" ) then
		Engine.CreateModel( f1_local0, "selfPlayerInfo" )
		Engine.CreateModel( f1_local0, "selfPlayerInfo.intop3" )
	end
end

local PostLoadFunc = function ( self, controller, menu )
	self.ModeAndMapName:setText( Engine.Localize( Engine.StructTableLookupString( "game_types", "name", Engine.GetCurrentGameType(), "name_ref" ) ) )
end

CoD.CodCasterHeaderNonTeamBased = InheritFrom( LUI.UIElement )
CoD.CodCasterHeaderNonTeamBased.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CodCasterHeaderNonTeamBased )
	self.id = "CodCasterHeaderNonTeamBased"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 591 )
	self:setTopBottom( true, false, 0, 131 )
	self.anyChildUsesUpdateState = true
	
	local modeBG0 = LUI.UIImage.new()
	modeBG0:setLeftRight( false, false, -301.74, 303.5 )
	modeBG0:setTopBottom( true, false, 1.96, 266.41 )
	modeBG0:setAlpha( 0.5 )
	modeBG0:setImage( RegisterImage( "uie_t7_codcaster_centerheader_ffa" ) )
	self:addElement( modeBG0 )
	self.modeBG0 = modeBG0
	
	local modeBG1 = LUI.UIImage.new()
	modeBG1:setLeftRight( false, false, -301.74, 303.5 )
	modeBG1:setTopBottom( true, false, 1.96, 266.41 )
	modeBG1:setAlpha( 0.5 )
	modeBG1:setImage( RegisterImage( "uie_t7_codcaster_centerheader_ffa" ) )
	self:addElement( modeBG1 )
	self.modeBG1 = modeBG1
	
	local modeBG = LUI.UIImage.new()
	modeBG:setLeftRight( false, false, -301.74, 303.5 )
	modeBG:setTopBottom( true, false, 1.96, 266.41 )
	modeBG:setAlpha( 0.5 )
	modeBG:setImage( RegisterImage( "uie_t7_codcaster_centerheader_ffa" ) )
	self:addElement( modeBG )
	self.modeBG = modeBG
	
	local leftBG0000 = LUI.UIImage.new()
	leftBG0000:setLeftRight( true, false, 26.1, 214.87 )
	leftBG0000:setTopBottom( true, false, 110.3, 133.23 )
	leftBG0000:setImage( RegisterImage( "uie_t7_codcaster_gamemodebacking" ) )
	self:addElement( leftBG0000 )
	self.leftBG0000 = leftBG0000
	
	local leftBG000 = LUI.UIImage.new()
	leftBG000:setLeftRight( true, false, 212.23, 401 )
	leftBG000:setTopBottom( true, false, 110.3, 133.23 )
	leftBG000:setImage( RegisterImage( "uie_t7_codcaster_gamemodebacking" ) )
	self:addElement( leftBG000 )
	self.leftBG000 = leftBG000
	
	local leftBG00 = LUI.UIImage.new()
	leftBG00:setLeftRight( true, false, 398.23, 586 )
	leftBG00:setTopBottom( true, false, 110.3, 133.23 )
	leftBG00:setImage( RegisterImage( "uie_t7_codcaster_gamemodebacking" ) )
	self:addElement( leftBG00 )
	self.leftBG00 = leftBG00
	
	local CodCasterTimer = CoD.CodCasterTimer.new( menu, controller )
	CodCasterTimer:setLeftRight( false, false, -34.7, 37.3 )
	CodCasterTimer:setTopBottom( true, false, 22.96, 58.96 )
	CodCasterTimer:setRGB( ColorSet.BadgeText.r, ColorSet.BadgeText.g, ColorSet.BadgeText.b )
	CodCasterTimer:setScale( 0.6 )
	self:addElement( CodCasterTimer )
	self.CodCasterTimer = CodCasterTimer
	
	local ModeAndMapName = LUI.UIText.new()
	ModeAndMapName:setLeftRight( false, false, -103.27, 106.48 )
	ModeAndMapName:setTopBottom( true, false, 14.5, 31.5 )
	ModeAndMapName:setRGB( ColorSet.BadgeText.r, ColorSet.BadgeText.g, ColorSet.BadgeText.b )
	ModeAndMapName:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	ModeAndMapName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ModeAndMapName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	ModeAndMapName:subscribeToGlobalModel( controller, "Scoreboard", "gameType", function ( model )
		local gameType = Engine.GetModelValue( model )
		if gameType then
			ModeAndMapName:setText( gameType )
		end
	end )
	self:addElement( ModeAndMapName )
	self.ModeAndMapName = ModeAndMapName
	
	local light = LUI.UIImage.new()
	light:setLeftRight( true, false, 142.11, 452.11 )
	light:setTopBottom( true, false, 0, 159 )
	light:setAlpha( 0.35 )
	light:setImage( RegisterImage( "uie_t7_codcaster_light" ) )
	light:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( light )
	self.light = light
	
	local codcasterScoreLogoWidgetFFA1 = CoD.codcaster_ScoreLogoWidget_FFA.new( menu, controller )
	codcasterScoreLogoWidgetFFA1:setLeftRight( true, false, 9.21, 219.21 )
	codcasterScoreLogoWidgetFFA1:setTopBottom( true, false, 51.96, 118.96 )
	codcasterScoreLogoWidgetFFA1:setScale( 0.95 )
	codcasterScoreLogoWidgetFFA1.logo:setImage( RegisterImage( "uie_t7_codcaster_faction1" ) )
	codcasterScoreLogoWidgetFFA1:subscribeToGlobalModel( controller, "Factions", "axisFactionColor", function ( model )
		local axisFactionColor = Engine.GetModelValue( model )
		if axisFactionColor then
			codcasterScoreLogoWidgetFFA1.teamcolor:setRGB( axisFactionColor )
		end
	end )
	codcasterScoreLogoWidgetFFA1:subscribeToGlobalModel( controller, "TopPlayerInfoData1", "xuid", function ( model )
		local xuid = Engine.GetModelValue( model )
		if xuid then
			codcasterScoreLogoWidgetFFA1.emblem:setupPlayerEmblemByXUID( xuid )
		end
	end )
	self:addElement( codcasterScoreLogoWidgetFFA1 )
	self.codcasterScoreLogoWidgetFFA1 = codcasterScoreLogoWidgetFFA1
	
	local widget1Score = LUI.UIText.new()
	widget1Score:setLeftRight( true, false, 126.98, 206.98 )
	widget1Score:setTopBottom( true, false, 65.5, 107.5 )
	widget1Score:setRGB( 0, 0, 0 )
	widget1Score:setScale( 0.9 )
	widget1Score:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	widget1Score:setLetterSpacing( -2 )
	widget1Score:setLineSpacing( -1 )
	widget1Score:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	widget1Score:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_MIDDLE )
	widget1Score:subscribeToGlobalModel( controller, "TopPlayerInfoData1", "score", function ( model )
		local score = Engine.GetModelValue( model )
		if score then
			widget1Score:setText( Engine.Localize( score ) )
		end
	end )
	self:addElement( widget1Score )
	self.widget1Score = widget1Score
	
	local widget1Name = LUI.UIText.new()
	widget1Name:setLeftRight( true, false, 53.89, 200.32 )
	widget1Name:setTopBottom( true, false, 112.79, 130.79 )
	widget1Name:setAlpha( 0.85 )
	widget1Name:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	widget1Name:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	widget1Name:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	widget1Name:subscribeToGlobalModel( controller, "TopPlayerInfoData1", "name", function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			widget1Name:setText( Engine.Localize( name ) )
		end
	end )
	self:addElement( widget1Name )
	self.widget1Name = widget1Name
	
	local codcasterScoreLogoWidgetFFA2 = CoD.codcaster_ScoreLogoWidget_FFA.new( menu, controller )
	codcasterScoreLogoWidgetFFA2:setLeftRight( true, false, 195.11, 405.11 )
	codcasterScoreLogoWidgetFFA2:setTopBottom( true, false, 51.96, 118.96 )
	codcasterScoreLogoWidgetFFA2:setScale( 0.95 )
	codcasterScoreLogoWidgetFFA2.logo:setImage( RegisterImage( "uie_t7_codcaster_faction1" ) )
	codcasterScoreLogoWidgetFFA2:subscribeToGlobalModel( controller, "Factions", "axisFactionColor", function ( model )
		local axisFactionColor = Engine.GetModelValue( model )
		if axisFactionColor then
			codcasterScoreLogoWidgetFFA2.teamcolor:setRGB( axisFactionColor )
		end
	end )
	codcasterScoreLogoWidgetFFA2:subscribeToGlobalModel( controller, "TopPlayerInfoData2", "xuid", function ( model )
		local xuid = Engine.GetModelValue( model )
		if xuid then
			codcasterScoreLogoWidgetFFA2.emblem:setupPlayerEmblemByXUID( xuid )
		end
	end )
	self:addElement( codcasterScoreLogoWidgetFFA2 )
	self.codcasterScoreLogoWidgetFFA2 = codcasterScoreLogoWidgetFFA2
	
	local widget2Score = LUI.UIText.new()
	widget2Score:setLeftRight( true, false, 311.11, 391.11 )
	widget2Score:setTopBottom( true, false, 65.5, 107.5 )
	widget2Score:setRGB( 0, 0, 0 )
	widget2Score:setScale( 0.9 )
	widget2Score:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	widget2Score:setLetterSpacing( -2 )
	widget2Score:setLineSpacing( -1 )
	widget2Score:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	widget2Score:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_MIDDLE )
	widget2Score:subscribeToGlobalModel( controller, "TopPlayerInfoData2", "score", function ( model )
		local score = Engine.GetModelValue( model )
		if score then
			widget2Score:setText( Engine.Localize( score ) )
		end
	end )
	self:addElement( widget2Score )
	self.widget2Score = widget2Score
	
	local widget2Name = LUI.UIText.new()
	widget2Name:setLeftRight( true, false, 240.5, 388 )
	widget2Name:setTopBottom( true, false, 113.29, 131.29 )
	widget2Name:setAlpha( 0.85 )
	widget2Name:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	widget2Name:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	widget2Name:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	widget2Name:subscribeToGlobalModel( controller, "TopPlayerInfoData2", "name", function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			widget2Name:setText( Engine.Localize( name ) )
		end
	end )
	self:addElement( widget2Name )
	self.widget2Name = widget2Name
	
	local codcasterScoreLogoWidgetFFA3 = CoD.codcaster_ScoreLogoWidget_FFA.new( menu, controller )
	codcasterScoreLogoWidgetFFA3:setLeftRight( true, false, 381, 591 )
	codcasterScoreLogoWidgetFFA3:setTopBottom( true, false, 51.96, 118.96 )
	codcasterScoreLogoWidgetFFA3:setScale( 0.95 )
	codcasterScoreLogoWidgetFFA3.logo:setImage( RegisterImage( "uie_t7_codcaster_faction1" ) )
	codcasterScoreLogoWidgetFFA3:subscribeToGlobalModel( controller, "Factions", "axisFactionColor", function ( model )
		local axisFactionColor = Engine.GetModelValue( model )
		if axisFactionColor then
			codcasterScoreLogoWidgetFFA3.teamcolor:setRGB( axisFactionColor )
		end
	end )
	codcasterScoreLogoWidgetFFA3:subscribeToGlobalModel( controller, "TopPlayerInfoData3", "xuid", function ( model )
		local xuid = Engine.GetModelValue( model )
		if xuid then
			codcasterScoreLogoWidgetFFA3.emblem:setupPlayerEmblemByXUID( xuid )
		end
	end )
	self:addElement( codcasterScoreLogoWidgetFFA3 )
	self.codcasterScoreLogoWidgetFFA3 = codcasterScoreLogoWidgetFFA3
	
	local widget3Score = LUI.UIText.new()
	widget3Score:setLeftRight( true, false, 501.29, 581.29 )
	widget3Score:setTopBottom( true, false, 65.5, 107.5 )
	widget3Score:setRGB( 0, 0, 0 )
	widget3Score:setScale( 0.9 )
	widget3Score:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	widget3Score:setLetterSpacing( -2 )
	widget3Score:setLineSpacing( -1 )
	widget3Score:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	widget3Score:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_MIDDLE )
	widget3Score:subscribeToGlobalModel( controller, "TopPlayerInfoData3", "score", function ( model )
		local score = Engine.GetModelValue( model )
		if score then
			widget3Score:setText( Engine.Localize( score ) )
		end
	end )
	self:addElement( widget3Score )
	self.widget3Score = widget3Score
	
	local bar = LUI.UIImage.new()
	bar:setLeftRight( true, false, 47.89, 48.89 )
	bar:setTopBottom( true, false, 113.79, 129.79 )
	bar:setRGB( 0, 0, 0 )
	self:addElement( bar )
	self.bar = bar
	
	local top1 = LUI.UIText.new()
	top1:setLeftRight( true, false, 30.89, 46.89 )
	top1:setTopBottom( true, false, 113.79, 130.79 )
	top1:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	top1:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	top1:setShaderVector( 0, 0.03, 0, 0, 0 )
	top1:setShaderVector( 1, 0, 0, 0, 0 )
	top1:setShaderVector( 2, 1, 0, 0, 0 )
	top1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	top1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	top1:subscribeToGlobalModel( controller, "TopPlayerInfoData1", "position", function ( model )
		local position = Engine.GetModelValue( model )
		if position then
			top1:setText( Engine.Localize( position ) )
		end
	end )
	self:addElement( top1 )
	self.top1 = top1
	
	local top2 = LUI.UIText.new()
	top2:setLeftRight( true, false, 216.23, 232.23 )
	top2:setTopBottom( true, false, 113.79, 130.79 )
	top2:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	top2:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	top2:setShaderVector( 0, 0.03, 0, 0, 0 )
	top2:setShaderVector( 1, 0, 0, 0, 0 )
	top2:setShaderVector( 2, 1, 0, 0, 0 )
	top2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	top2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	top2:subscribeToGlobalModel( controller, "TopPlayerInfoData2", "position", function ( model )
		local position = Engine.GetModelValue( model )
		if position then
			top2:setText( Engine.Localize( position ) )
		end
	end )
	self:addElement( top2 )
	self.top2 = top2
	
	local top3 = LUI.UIText.new()
	top3:setLeftRight( true, false, 401.73, 417.73 )
	top3:setTopBottom( true, false, 113.79, 130.79 )
	top3:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	top3:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	top3:setShaderVector( 0, 0.03, 0, 0, 0 )
	top3:setShaderVector( 1, 0, 0, 0, 0 )
	top3:setShaderVector( 2, 1, 0, 0, 0 )
	top3:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	top3:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	top3:subscribeToGlobalModel( controller, "TopPlayerInfoData3", "position", function ( model )
		local position = Engine.GetModelValue( model )
		if position then
			top3:setText( Engine.Localize( position ) )
		end
	end )
	self:addElement( top3 )
	self.top3 = top3
	
	local bar0 = LUI.UIImage.new()
	bar0:setLeftRight( true, false, 233.89, 234.89 )
	bar0:setTopBottom( true, false, 113.79, 129.79 )
	bar0:setRGB( 0, 0, 0 )
	self:addElement( bar0 )
	self.bar0 = bar0
	
	local bar00 = LUI.UIImage.new()
	bar00:setLeftRight( true, false, 419.89, 420.89 )
	bar00:setTopBottom( true, false, 113.79, 129.79 )
	bar00:setRGB( 0, 0, 0 )
	self:addElement( bar00 )
	self.bar00 = bar00
	
	local widget2Name0 = LUI.UIText.new()
	widget2Name0:setLeftRight( true, false, 426.73, 574.23 )
	widget2Name0:setTopBottom( true, false, 113.29, 131.29 )
	widget2Name0:setAlpha( 0.85 )
	widget2Name0:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	widget2Name0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	widget2Name0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	widget2Name0:subscribeToGlobalModel( controller, "TopPlayerInfoData3", "name", function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			widget2Name0:setText( Engine.Localize( name ) )
		end
	end )
	self:addElement( widget2Name0 )
	self.widget2Name0 = widget2Name0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CodCasterTimer:close()
		element.codcasterScoreLogoWidgetFFA1:close()
		element.codcasterScoreLogoWidgetFFA2:close()
		element.codcasterScoreLogoWidgetFFA3:close()
		element.ModeAndMapName:close()
		element.widget1Score:close()
		element.widget1Name:close()
		element.widget2Score:close()
		element.widget2Name:close()
		element.widget3Score:close()
		element.top1:close()
		element.top2:close()
		element.top3:close()
		element.widget2Name0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

