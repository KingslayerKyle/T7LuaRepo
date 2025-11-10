require( "ui.uieditor.widgets.MPHudWidgets.CodCaster.CodCasterTimer" )
require( "ui.uieditor.widgets.CodCaster.CodCasterHeaderGameModeWidget" )
require( "ui.uieditor.widgets.CodCaster.codcaster_ScoreLogoWidget" )
require( "ui.uieditor.widgets.HelperWidgets.TextWithBg" )

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
	modeBG0:setLeftRight( false, false, -295.3, 295.3 )
	modeBG0:setTopBottom( true, false, 1, 259.06 )
	modeBG0:setAlpha( 0.5 )
	modeBG0:setImage( RegisterImage( "uie_t7_codcaster_centerheader" ) )
	self:addElement( modeBG0 )
	self.modeBG0 = modeBG0
	
	local modeBG00 = LUI.UIImage.new()
	modeBG00:setLeftRight( false, false, -295.3, 295.3 )
	modeBG00:setTopBottom( true, false, 1, 259.06 )
	modeBG00:setAlpha( 0.5 )
	modeBG00:setImage( RegisterImage( "uie_t7_codcaster_centerheader" ) )
	self:addElement( modeBG00 )
	self.modeBG00 = modeBG00
	
	local modeBG = LUI.UIImage.new()
	modeBG:setLeftRight( false, false, -295.3, 295.3 )
	modeBG:setTopBottom( true, false, 1, 259.06 )
	modeBG:setAlpha( 0.5 )
	modeBG:setImage( RegisterImage( "uie_t7_codcaster_centerheader" ) )
	self:addElement( modeBG )
	self.modeBG = modeBG
	
	local CodCasterTimer = CoD.CodCasterTimer.new( menu, controller )
	CodCasterTimer:setLeftRight( false, false, -36, 36 )
	CodCasterTimer:setTopBottom( true, false, 57.37, 93.37 )
	self:addElement( CodCasterTimer )
	self.CodCasterTimer = CodCasterTimer
	
	local ModeAndMapName = LUI.UIText.new()
	ModeAndMapName:setLeftRight( false, false, -94.7, 93.3 )
	ModeAndMapName:setTopBottom( true, false, 12.5, 29.5 )
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
	
	local CodCasterHeaderGameModeWidget = CoD.CodCasterHeaderGameModeWidget.new( menu, controller )
	CodCasterHeaderGameModeWidget:setLeftRight( false, false, -249.7, 252.3 )
	CodCasterHeaderGameModeWidget:setTopBottom( true, false, 101, 131 )
	self:addElement( CodCasterHeaderGameModeWidget )
	self.CodCasterHeaderGameModeWidget = CodCasterHeaderGameModeWidget
	
	local light = LUI.UIImage.new()
	light:setLeftRight( true, false, 142.11, 452.11 )
	light:setTopBottom( true, false, 0, 159 )
	light:setImage( RegisterImage( "uie_t7_codcaster_light" ) )
	light:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( light )
	self.light = light
	
	local codcasterScoreLogoWidget1 = CoD.codcaster_ScoreLogoWidget.new( menu, controller )
	codcasterScoreLogoWidget1:setLeftRight( true, false, 5.57, 215.32 )
	codcasterScoreLogoWidget1:setTopBottom( true, false, 44.96, 111.79 )
	codcasterScoreLogoWidget1:setYRot( 180 )
	codcasterScoreLogoWidget1.logo:setImage( RegisterImage( "uie_t7_codcaster_faction1" ) )
	codcasterScoreLogoWidget1:subscribeToGlobalModel( controller, "Factions", "axisFactionColor", function ( model )
		local axisFactionColor = Engine.GetModelValue( model )
		if axisFactionColor then
			codcasterScoreLogoWidget1.teamcolor:setRGB( axisFactionColor )
		end
	end )
	codcasterScoreLogoWidget1:subscribeToGlobalModel( controller, "TopPlayerInfoData1", "xuid", function ( model )
		local xuid = Engine.GetModelValue( model )
		if xuid then
			codcasterScoreLogoWidget1.emblem:setupPlayerEmblemByXUID( xuid )
		end
	end )
	self:addElement( codcasterScoreLogoWidget1 )
	self.codcasterScoreLogoWidget1 = codcasterScoreLogoWidget1
	
	local widget1Score = LUI.UIText.new()
	widget1Score:setLeftRight( true, false, 125.2, 205.2 )
	widget1Score:setTopBottom( true, false, 58.5, 100.5 )
	widget1Score:setRGB( 0, 0, 0 )
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
	
	local widget1position = CoD.TextWithBg.new( menu, controller )
	widget1position:setLeftRight( false, false, -257.9, -238.4 )
	widget1position:setTopBottom( true, false, 107.3, 132.27 )
	widget1position.Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	widget1position:subscribeToGlobalModel( controller, "TopPlayerInfoData1", "position", function ( model )
		local position = Engine.GetModelValue( model )
		if position then
			widget1position.Text:setText( Engine.Localize( position ) )
		end
	end )
	self:addElement( widget1position )
	self.widget1position = widget1position
	
	local widget1Name = LUI.UIText.new()
	widget1Name:setLeftRight( true, false, 68.89, 215.32 )
	widget1Name:setTopBottom( true, false, 111.79, 127.79 )
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
	
	local codcasterScoreLogoWidget2 = CoD.codcaster_ScoreLogoWidget.new( menu, controller )
	codcasterScoreLogoWidget2:setLeftRight( true, false, 192.23, 401.98 )
	codcasterScoreLogoWidget2:setTopBottom( true, false, 44.96, 111.79 )
	codcasterScoreLogoWidget2:setYRot( 180 )
	codcasterScoreLogoWidget2.logo:setImage( RegisterImage( "uie_t7_codcaster_faction1" ) )
	codcasterScoreLogoWidget2:subscribeToGlobalModel( controller, "Factions", "axisFactionColor", function ( model )
		local axisFactionColor = Engine.GetModelValue( model )
		if axisFactionColor then
			codcasterScoreLogoWidget2.teamcolor:setRGB( axisFactionColor )
		end
	end )
	codcasterScoreLogoWidget2:subscribeToGlobalModel( controller, "TopPlayerInfoData2", "xuid", function ( model )
		local xuid = Engine.GetModelValue( model )
		if xuid then
			codcasterScoreLogoWidget2.emblem:setupPlayerEmblemByXUID( xuid )
		end
	end )
	self:addElement( codcasterScoreLogoWidget2 )
	self.codcasterScoreLogoWidget2 = codcasterScoreLogoWidget2
	
	local widget2Score = LUI.UIText.new()
	widget2Score:setLeftRight( true, false, 316.11, 396.11 )
	widget2Score:setTopBottom( true, false, 58.5, 100.5 )
	widget2Score:setRGB( 0, 0, 0 )
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
	
	local widget2Position = CoD.TextWithBg.new( menu, controller )
	widget2Position:setLeftRight( false, false, -70.17, -50.67 )
	widget2Position:setTopBottom( true, false, 107.3, 132.27 )
	widget2Position.Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	widget2Position:subscribeToGlobalModel( controller, "TopPlayerInfoData2", "position", function ( model )
		local position = Engine.GetModelValue( model )
		if position then
			widget2Position.Text:setText( Engine.Localize( position ) )
		end
	end )
	self:addElement( widget2Position )
	self.widget2Position = widget2Position
	
	local widget2Name = LUI.UIText.new()
	widget2Name:setLeftRight( true, false, 248.61, 396.11 )
	widget2Name:setTopBottom( true, false, 111.79, 127.79 )
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
	
	local codcasterScoreLogoWidget3 = CoD.codcaster_ScoreLogoWidget.new( menu, controller )
	codcasterScoreLogoWidget3:setLeftRight( true, false, 375.16, 584.91 )
	codcasterScoreLogoWidget3:setTopBottom( true, false, 44.96, 111.79 )
	codcasterScoreLogoWidget3:setYRot( 180 )
	codcasterScoreLogoWidget3.logo:setImage( RegisterImage( "uie_t7_codcaster_faction1" ) )
	codcasterScoreLogoWidget3:subscribeToGlobalModel( controller, "Factions", "axisFactionColor", function ( model )
		local axisFactionColor = Engine.GetModelValue( model )
		if axisFactionColor then
			codcasterScoreLogoWidget3.teamcolor:setRGB( axisFactionColor )
		end
	end )
	codcasterScoreLogoWidget3:subscribeToGlobalModel( controller, "TopPlayerInfoData3", "xuid", function ( model )
		local xuid = Engine.GetModelValue( model )
		if xuid then
			codcasterScoreLogoWidget3.emblem:setupPlayerEmblemByXUID( xuid )
		end
	end )
	self:addElement( codcasterScoreLogoWidget3 )
	self.codcasterScoreLogoWidget3 = codcasterScoreLogoWidget3
	
	local widget3Score = LUI.UIText.new()
	widget3Score:setLeftRight( true, false, 499.29, 579.29 )
	widget3Score:setTopBottom( true, false, 58.5, 100.5 )
	widget3Score:setRGB( 0, 0, 0 )
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
	
	local widget3Position = CoD.TextWithBg.new( menu, controller )
	widget3Position:setLeftRight( false, false, 112.73, 132.23 )
	widget3Position:setTopBottom( true, false, 107.3, 132.27 )
	widget3Position.Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	widget3Position:subscribeToGlobalModel( controller, "TopPlayerInfoData3", "position", function ( model )
		local position = Engine.GetModelValue( model )
		if position then
			widget3Position.Text:setText( Engine.Localize( position ) )
		end
	end )
	self:addElement( widget3Position )
	self.widget3Position = widget3Position
	
	local widget3Name = LUI.UIText.new()
	widget3Name:setLeftRight( true, false, 431.51, 579.29 )
	widget3Name:setTopBottom( true, false, 111.79, 127.79 )
	widget3Name:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	widget3Name:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	widget3Name:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	widget3Name:subscribeToGlobalModel( controller, "TopPlayerInfoData3", "name", function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			widget3Name:setText( Engine.Localize( name ) )
		end
	end )
	self:addElement( widget3Name )
	self.widget3Name = widget3Name
	
	local codcasterScoreLogoWidgetSelf = CoD.codcaster_ScoreLogoWidget.new( menu, controller )
	codcasterScoreLogoWidgetSelf:setLeftRight( true, false, 375.16, 584.91 )
	codcasterScoreLogoWidgetSelf:setTopBottom( true, false, 44.96, 111.79 )
	codcasterScoreLogoWidgetSelf:setYRot( 180 )
	codcasterScoreLogoWidgetSelf.logo:setImage( RegisterImage( "uie_t7_codcaster_faction1" ) )
	codcasterScoreLogoWidgetSelf:subscribeToGlobalModel( controller, "Factions", "axisFactionColor", function ( model )
		local axisFactionColor = Engine.GetModelValue( model )
		if axisFactionColor then
			codcasterScoreLogoWidgetSelf.teamcolor:setRGB( axisFactionColor )
		end
	end )
	codcasterScoreLogoWidgetSelf:subscribeToGlobalModel( controller, "SelfPlayerInfoData", "xuid", function ( model )
		local xuid = Engine.GetModelValue( model )
		if xuid then
			codcasterScoreLogoWidgetSelf.emblem:setupPlayerEmblemByXUID( xuid )
		end
	end )
	self:addElement( codcasterScoreLogoWidgetSelf )
	self.codcasterScoreLogoWidgetSelf = codcasterScoreLogoWidgetSelf
	
	local widgetSelfScore = LUI.UIText.new()
	widgetSelfScore:setLeftRight( true, false, 499.29, 579.29 )
	widgetSelfScore:setTopBottom( true, false, 58.5, 100.5 )
	widgetSelfScore:setRGB( 0, 0, 0 )
	widgetSelfScore:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	widgetSelfScore:setLetterSpacing( -2 )
	widgetSelfScore:setLineSpacing( -1 )
	widgetSelfScore:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	widgetSelfScore:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_MIDDLE )
	widgetSelfScore:subscribeToGlobalModel( controller, "SelfPlayerInfoData", "score", function ( model )
		local score = Engine.GetModelValue( model )
		if score then
			widgetSelfScore:setText( Engine.Localize( score ) )
		end
	end )
	self:addElement( widgetSelfScore )
	self.widgetSelfScore = widgetSelfScore
	
	local widgetSelfName = LUI.UIText.new()
	widgetSelfName:setLeftRight( true, false, 431.51, 579.29 )
	widgetSelfName:setTopBottom( true, false, 111.79, 127.79 )
	widgetSelfName:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	widgetSelfName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	widgetSelfName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	widgetSelfName:subscribeToGlobalModel( controller, "SelfPlayerInfoData", "name", function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			widgetSelfName:setText( Engine.Localize( name ) )
		end
	end )
	self:addElement( widgetSelfName )
	self.widgetSelfName = widgetSelfName
	
	local widgetSelfPosition = CoD.TextWithBg.new( menu, controller )
	widgetSelfPosition:setLeftRight( false, false, 112.73, 132.23 )
	widgetSelfPosition:setTopBottom( true, false, 107.3, 132.27 )
	widgetSelfPosition.Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	widgetSelfPosition:subscribeToGlobalModel( controller, "SelfPlayerInfoData", "position", function ( model )
		local position = Engine.GetModelValue( model )
		if position then
			widgetSelfPosition.Text:setText( Engine.Localize( position ) )
		end
	end )
	self:addElement( widgetSelfPosition )
	self.widgetSelfPosition = widgetSelfPosition
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				codcasterScoreLogoWidget3:completeAnimation()
				self.codcasterScoreLogoWidget3:setAlpha( 1 )
				self.clipFinished( codcasterScoreLogoWidget3, {} )
				widget3Score:completeAnimation()
				self.widget3Score:setAlpha( 1 )
				self.clipFinished( widget3Score, {} )
				widget3Position:completeAnimation()
				self.widget3Position:setAlpha( 1 )
				self.clipFinished( widget3Position, {} )
				widget3Name:completeAnimation()
				self.widget3Name:setAlpha( 1 )
				self.clipFinished( widget3Name, {} )
				codcasterScoreLogoWidgetSelf:completeAnimation()
				self.codcasterScoreLogoWidgetSelf:setAlpha( 0 )
				self.clipFinished( codcasterScoreLogoWidgetSelf, {} )
				widgetSelfScore:completeAnimation()
				self.widgetSelfScore:setAlpha( 0 )
				self.clipFinished( widgetSelfScore, {} )
				widgetSelfName:completeAnimation()
				self.widgetSelfName:setAlpha( 0 )
				self.clipFinished( widgetSelfName, {} )
				widgetSelfPosition:completeAnimation()
				self.widgetSelfPosition:setAlpha( 0 )
				self.clipFinished( widgetSelfPosition, {} )
			end
		},
		SelfNotInTop3 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				codcasterScoreLogoWidget3:completeAnimation()
				self.codcasterScoreLogoWidget3:setAlpha( 0 )
				self.clipFinished( codcasterScoreLogoWidget3, {} )
				widget3Score:completeAnimation()
				self.widget3Score:setAlpha( 0 )
				self.clipFinished( widget3Score, {} )
				widget3Position:completeAnimation()
				self.widget3Position:setAlpha( 0 )
				self.clipFinished( widget3Position, {} )
				widget3Name:completeAnimation()
				self.widget3Name:setAlpha( 0 )
				self.clipFinished( widget3Name, {} )
				codcasterScoreLogoWidgetSelf:completeAnimation()
				self.codcasterScoreLogoWidgetSelf:setAlpha( 1 )
				self.clipFinished( codcasterScoreLogoWidgetSelf, {} )
				widgetSelfScore:completeAnimation()
				self.widgetSelfScore:setAlpha( 1 )
				self.clipFinished( widgetSelfScore, {} )
				widgetSelfName:completeAnimation()
				self.widgetSelfName:setAlpha( 1 )
				self.clipFinished( widgetSelfName, {} )
				widgetSelfPosition:completeAnimation()
				self.widgetSelfPosition:setAlpha( 1 )
				self.clipFinished( widgetSelfPosition, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "SelfNotInTop3",
			condition = function ( menu, element, event )
				return not IsModelValueTrue( controller, "selfPlayerInfo.intop3" )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "selfPlayerInfo.intop3" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "selfPlayerInfo.intop3"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CodCasterTimer:close()
		element.CodCasterHeaderGameModeWidget:close()
		element.codcasterScoreLogoWidget1:close()
		element.widget1position:close()
		element.codcasterScoreLogoWidget2:close()
		element.widget2Position:close()
		element.codcasterScoreLogoWidget3:close()
		element.widget3Position:close()
		element.codcasterScoreLogoWidgetSelf:close()
		element.widgetSelfPosition:close()
		element.ModeAndMapName:close()
		element.widget1Score:close()
		element.widget1Name:close()
		element.widget2Score:close()
		element.widget2Name:close()
		element.widget3Score:close()
		element.widget3Name:close()
		element.widgetSelfScore:close()
		element.widgetSelfName:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

