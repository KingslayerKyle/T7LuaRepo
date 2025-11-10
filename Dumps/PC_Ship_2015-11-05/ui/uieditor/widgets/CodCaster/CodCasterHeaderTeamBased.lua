require( "ui.uieditor.widgets.MPHudWidgets.CodCaster.CodCasterTimer" )
require( "ui.uieditor.widgets.CodCaster.CodCasterHeaderGameModeWidget" )
require( "ui.uieditor.widgets.CodCaster.codcaster_ScoreLogoWidget" )

local PostLoadFunc = function ( self, controller, menu )
	self.ModeAndMapName:setText( Engine.Localize( Engine.StructTableLookupString( "game_types", "name", Engine.GetCurrentGameType(), "name_ref" ) ) )
end

CoD.CodCasterHeaderTeamBased = InheritFrom( LUI.UIElement )
CoD.CodCasterHeaderTeamBased.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CodCasterHeaderTeamBased )
	self.id = "CodCasterHeaderTeamBased"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 591 )
	self:setTopBottom( true, false, 0, 131 )
	self.anyChildUsesUpdateState = true
	
	local modeBG00 = LUI.UIImage.new()
	modeBG00:setLeftRight( false, false, -284, 283 )
	modeBG00:setTopBottom( true, false, 0, 258.06 )
	modeBG00:setAlpha( 0.5 )
	modeBG00:setImage( RegisterImage( "uie_t7_codcaster_centerheader" ) )
	self:addElement( modeBG00 )
	self.modeBG00 = modeBG00
	
	local modeBG = LUI.UIImage.new()
	modeBG:setLeftRight( false, false, -284, 283 )
	modeBG:setTopBottom( true, false, 0, 258.06 )
	modeBG:setImage( RegisterImage( "uie_t7_codcaster_centerheader" ) )
	self:addElement( modeBG )
	self.modeBG = modeBG
	
	local CodCasterTimer = CoD.CodCasterTimer.new( menu, controller )
	CodCasterTimer:setLeftRight( false, false, -35.7, 36.3 )
	CodCasterTimer:setTopBottom( true, false, 51.5, 87.5 )
	self:addElement( CodCasterTimer )
	self.CodCasterTimer = CodCasterTimer
	
	local teamNameDarkOps = LUI.UIText.new()
	teamNameDarkOps:setLeftRight( false, true, -213.5, -52.5 )
	teamNameDarkOps:setTopBottom( true, false, 30, 46 )
	teamNameDarkOps:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	teamNameDarkOps:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	teamNameDarkOps:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_MIDDLE )
	teamNameDarkOps:subscribeToGlobalModel( controller, "Factions", "axisFactionDisplayName", function ( model )
		local axisFactionDisplayName = Engine.GetModelValue( model )
		if axisFactionDisplayName then
			teamNameDarkOps:setText( axisFactionDisplayName )
		end
	end )
	self:addElement( teamNameDarkOps )
	self.teamNameDarkOps = teamNameDarkOps
	
	local teamNameBlackOps = LUI.UIText.new()
	teamNameBlackOps:setLeftRight( true, false, 54, 217 )
	teamNameBlackOps:setTopBottom( true, false, 30, 46 )
	teamNameBlackOps:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	teamNameBlackOps:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	teamNameBlackOps:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_MIDDLE )
	teamNameBlackOps:subscribeToGlobalModel( controller, "Factions", "alliesFactionDisplayName", function ( model )
		local alliesFactionDisplayName = Engine.GetModelValue( model )
		if alliesFactionDisplayName then
			teamNameBlackOps:setText( alliesFactionDisplayName )
		end
	end )
	self:addElement( teamNameBlackOps )
	self.teamNameBlackOps = teamNameBlackOps
	
	local ModeAndMapName = LUI.UIText.new()
	ModeAndMapName:setLeftRight( false, false, -94.7, 93.3 )
	ModeAndMapName:setTopBottom( true, false, 12.5, 29.5 )
	ModeAndMapName:setRGB( ColorSet.BadgeText.r, ColorSet.BadgeText.g, ColorSet.BadgeText.b )
	ModeAndMapName:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	ModeAndMapName:setLetterSpacing( -0.5 )
	ModeAndMapName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ModeAndMapName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	ModeAndMapName:subscribeToGlobalModel( controller, "Scoreboard", "gameType", function ( model )
		local gameType = Engine.GetModelValue( model )
		if gameType then
			ModeAndMapName:setText( LocalizeToUpperString( gameType ) )
		end
	end )
	self:addElement( ModeAndMapName )
	self.ModeAndMapName = ModeAndMapName
	
	local CodCasterHeaderGameModeWidget = CoD.CodCasterHeaderGameModeWidget.new( menu, controller )
	CodCasterHeaderGameModeWidget:setLeftRight( false, false, -250, 252 )
	CodCasterHeaderGameModeWidget:setTopBottom( true, false, 100, 130 )
	self:addElement( CodCasterHeaderGameModeWidget )
	self.CodCasterHeaderGameModeWidget = CodCasterHeaderGameModeWidget
	
	local InnerCircle = LUI.UIImage.new()
	InnerCircle:setLeftRight( false, true, -293.5, -208.5 )
	InnerCircle:setTopBottom( true, false, 38.37, 106.37 )
	InnerCircle:setImage( RegisterImage( "uie_t7_codcaster_innercircle" ) )
	self:addElement( InnerCircle )
	self.InnerCircle = InnerCircle
	
	local InnerCircle0 = LUI.UIImage.new()
	InnerCircle0:setLeftRight( true, false, 209.11, 294.11 )
	InnerCircle0:setTopBottom( true, false, 38.37, 106.37 )
	InnerCircle0:setYRot( 180 )
	InnerCircle0:setImage( RegisterImage( "uie_t7_codcaster_innercircle" ) )
	self:addElement( InnerCircle0 )
	self.InnerCircle0 = InnerCircle0
	
	local codcasterScoreLogoWidgetDarkOps = CoD.codcaster_ScoreLogoWidget.new( menu, controller )
	codcasterScoreLogoWidgetDarkOps:setLeftRight( false, true, -244, -36 )
	codcasterScoreLogoWidgetDarkOps:setTopBottom( true, false, 42, 109 )
	codcasterScoreLogoWidgetDarkOps:subscribeToGlobalModel( controller, "Factions", "axisFactionColor", function ( model )
		local axisFactionColor = Engine.GetModelValue( model )
		if axisFactionColor then
			codcasterScoreLogoWidgetDarkOps.teamcolor:setRGB( axisFactionColor )
		end
	end )
	codcasterScoreLogoWidgetDarkOps:subscribeToGlobalModel( controller, "Factions", "axisFactionIcon", function ( model )
		local axisFactionIcon = Engine.GetModelValue( model )
		if axisFactionIcon then
			codcasterScoreLogoWidgetDarkOps.logo:setImage( RegisterImage( axisFactionIcon ) )
		end
	end )
	self:addElement( codcasterScoreLogoWidgetDarkOps )
	self.codcasterScoreLogoWidgetDarkOps = codcasterScoreLogoWidgetDarkOps
	
	local codcasterScoreLogoWidgetBlackOps = CoD.codcaster_ScoreLogoWidget.new( menu, controller )
	codcasterScoreLogoWidgetBlackOps:setLeftRight( true, false, 36, 245 )
	codcasterScoreLogoWidgetBlackOps:setTopBottom( true, false, 42, 109 )
	codcasterScoreLogoWidgetBlackOps:setYRot( 180 )
	codcasterScoreLogoWidgetBlackOps:subscribeToGlobalModel( controller, "Factions", "alliesFactionColor", function ( model )
		local alliesFactionColor = Engine.GetModelValue( model )
		if alliesFactionColor then
			codcasterScoreLogoWidgetBlackOps.teamcolor:setRGB( alliesFactionColor )
		end
	end )
	codcasterScoreLogoWidgetBlackOps:subscribeToGlobalModel( controller, "Factions", "alliesFactionIcon", function ( model )
		local alliesFactionIcon = Engine.GetModelValue( model )
		if alliesFactionIcon then
			codcasterScoreLogoWidgetBlackOps.logo:setImage( RegisterImage( alliesFactionIcon ) )
		end
	end )
	self:addElement( codcasterScoreLogoWidgetBlackOps )
	self.codcasterScoreLogoWidgetBlackOps = codcasterScoreLogoWidgetBlackOps
	
	local teamScoreDarkOps = LUI.UIText.new()
	teamScoreDarkOps:setLeftRight( false, true, -240, -160 )
	teamScoreDarkOps:setTopBottom( true, false, 56, 98 )
	teamScoreDarkOps:setRGB( 0, 0, 0 )
	teamScoreDarkOps:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	teamScoreDarkOps:setLetterSpacing( -2 )
	teamScoreDarkOps:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	teamScoreDarkOps:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	teamScoreDarkOps:subscribeToGlobalModel( controller, "GameScore", "axisScore", function ( model )
		local axisScore = Engine.GetModelValue( model )
		if axisScore then
			teamScoreDarkOps:setText( Engine.Localize( axisScore ) )
		end
	end )
	self:addElement( teamScoreDarkOps )
	self.teamScoreDarkOps = teamScoreDarkOps
	
	local teamScoreBlackOps = LUI.UIText.new()
	teamScoreBlackOps:setLeftRight( true, false, 160, 240 )
	teamScoreBlackOps:setTopBottom( true, false, 56, 98 )
	teamScoreBlackOps:setRGB( 0, 0, 0 )
	teamScoreBlackOps:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	teamScoreBlackOps:setLetterSpacing( -2 )
	teamScoreBlackOps:setLineSpacing( -1 )
	teamScoreBlackOps:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	teamScoreBlackOps:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_MIDDLE )
	teamScoreBlackOps:subscribeToGlobalModel( controller, "GameScore", "alliesScore", function ( model )
		local alliesScore = Engine.GetModelValue( model )
		if alliesScore then
			teamScoreBlackOps:setText( Engine.Localize( alliesScore ) )
		end
	end )
	self:addElement( teamScoreBlackOps )
	self.teamScoreBlackOps = teamScoreBlackOps
	
	local light = LUI.UIImage.new()
	light:setLeftRight( true, false, 142.11, 452.11 )
	light:setTopBottom( true, false, 8, 167 )
	light:setImage( RegisterImage( "uie_t7_codcaster_light" ) )
	light:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( light )
	self.light = light
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		TenThousandPLus = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				teamScoreDarkOps:completeAnimation()
				self.teamScoreDarkOps:setScale( 0.7 )
				self.clipFinished( teamScoreDarkOps, {} )
				teamScoreBlackOps:completeAnimation()
				self.teamScoreBlackOps:setScale( 0.7 )
				self.clipFinished( teamScoreBlackOps, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CodCasterTimer:close()
		element.CodCasterHeaderGameModeWidget:close()
		element.codcasterScoreLogoWidgetDarkOps:close()
		element.codcasterScoreLogoWidgetBlackOps:close()
		element.teamNameDarkOps:close()
		element.teamNameBlackOps:close()
		element.ModeAndMapName:close()
		element.teamScoreDarkOps:close()
		element.teamScoreBlackOps:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

