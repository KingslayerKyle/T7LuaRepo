require( "ui.uieditor.widgets.MPHudWidgets.CodCaster.CodCasterTimer" )
require( "ui.uieditor.widgets.CodCaster.CodCasterHeaderGameModeWidget" )
require( "ui.uieditor.widgets.CodCaster.codcaster_ScoreLogoWidget" )
require( "ui.uieditor.widgets.CodCaster.codcasterRoundsContainer" )

local PostLoadFunc = function ( self, controller, menu )
	self.ModeAndMapName:setText( Engine.Localize( Engine.StructTableLookupString( "game_types", "name", Engine.GetCurrentGameType(), "name_ref" ) ) )
	self.spectatedPlayerTeam = CoD.SafeGetModelValue( Engine.GetModelForController( controller ), "deadSpectator.playerTeam" )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "deadSpectator.playerTeam" ), function ( model )
		local modelValue = Engine.GetModelValue( model )
		if self.spectatedPlayerTeam ~= modelValue then
			if modelValue == Enum.team_t.TEAM_AXIS then
				self:playClip( "SpectatingTeamAxis" )
			elseif modelValue == Enum.team_t.TEAM_ALLIES then
				self:playClip( "SpectatingTeamAllies" )
			end
		end
		self.spectatedPlayerTeam = modelValue
	end )
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
	
	local codcasterScoreLogoWidgetDarkOps = CoD.codcaster_ScoreLogoWidget.new( menu, controller )
	codcasterScoreLogoWidgetDarkOps:setLeftRight( false, true, -246, -38 )
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
	codcasterScoreLogoWidgetDarkOps:subscribeToGlobalModel( controller, "Factions", "axisFactionColor", function ( model )
		local axisFactionColor = Engine.GetModelValue( model )
		if axisFactionColor then
			codcasterScoreLogoWidgetDarkOps.testElementFull:setRGB( CodcasterGetAccentColorForTeamColor( controller, "team2", axisFactionColor ) )
		end
	end )
	codcasterScoreLogoWidgetDarkOps:subscribeToGlobalModel( controller, "Factions", "axisFactionColor", function ( model )
		local axisFactionColor = Engine.GetModelValue( model )
		if axisFactionColor then
			codcasterScoreLogoWidgetDarkOps.testElement:setRGB( axisFactionColor )
		end
	end )
	codcasterScoreLogoWidgetDarkOps:subscribeToGlobalModel( controller, "Factions", "axisFactionColor", function ( model )
		local axisFactionColor = Engine.GetModelValue( model )
		if axisFactionColor then
			codcasterScoreLogoWidgetDarkOps.testElement0Full:setRGB( CodcasterGetAccentColorForTeamColor( controller, "team2", axisFactionColor ) )
		end
	end )
	codcasterScoreLogoWidgetDarkOps:subscribeToGlobalModel( controller, "Factions", "axisFactionColor", function ( model )
		local axisFactionColor = Engine.GetModelValue( model )
		if axisFactionColor then
			codcasterScoreLogoWidgetDarkOps.testElement0:setRGB( axisFactionColor )
		end
	end )
	codcasterScoreLogoWidgetDarkOps:mergeStateConditions( {
		{
			stateName = "SpectatingThisTeam",
			condition = function ( menu, element, event )
				return IsCodCasterSpectatingPlayerInTeam( controller, Enum.team_t.TEAM_AXIS )
			end
		}
	} )
	codcasterScoreLogoWidgetDarkOps:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "deadSpectator.playerTeam" ), function ( model )
		menu:updateElementState( codcasterScoreLogoWidgetDarkOps, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "deadSpectator.playerTeam"
		} )
	end )
	self:addElement( codcasterScoreLogoWidgetDarkOps )
	self.codcasterScoreLogoWidgetDarkOps = codcasterScoreLogoWidgetDarkOps
	
	local codcasterScoreLogoWidgetBlackOps = CoD.codcaster_ScoreLogoWidget.new( menu, controller )
	codcasterScoreLogoWidgetBlackOps:setLeftRight( true, false, 36.93, 245.93 )
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
	codcasterScoreLogoWidgetBlackOps:subscribeToGlobalModel( controller, "Factions", "alliesFactionColor", function ( model )
		local alliesFactionColor = Engine.GetModelValue( model )
		if alliesFactionColor then
			codcasterScoreLogoWidgetBlackOps.testElementFull:setRGB( CodcasterGetAccentColorForTeamColor( controller, "team1", alliesFactionColor ) )
		end
	end )
	codcasterScoreLogoWidgetBlackOps:subscribeToGlobalModel( controller, "Factions", "alliesFactionColor", function ( model )
		local alliesFactionColor = Engine.GetModelValue( model )
		if alliesFactionColor then
			codcasterScoreLogoWidgetBlackOps.testElement:setRGB( alliesFactionColor )
		end
	end )
	codcasterScoreLogoWidgetBlackOps:subscribeToGlobalModel( controller, "Factions", "alliesFactionColor", function ( model )
		local alliesFactionColor = Engine.GetModelValue( model )
		if alliesFactionColor then
			codcasterScoreLogoWidgetBlackOps.testElement0Full:setRGB( CodcasterGetAccentColorForTeamColor( controller, "team1", alliesFactionColor ) )
		end
	end )
	codcasterScoreLogoWidgetBlackOps:subscribeToGlobalModel( controller, "Factions", "alliesFactionColor", function ( model )
		local alliesFactionColor = Engine.GetModelValue( model )
		if alliesFactionColor then
			codcasterScoreLogoWidgetBlackOps.testElement0:setRGB( alliesFactionColor )
		end
	end )
	codcasterScoreLogoWidgetBlackOps:mergeStateConditions( {
		{
			stateName = "SpectatingThisTeam",
			condition = function ( menu, element, event )
				return IsCodCasterSpectatingPlayerInTeam( controller, Enum.team_t.TEAM_ALLIES )
			end
		}
	} )
	codcasterScoreLogoWidgetBlackOps:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "deadSpectator.playerTeam" ), function ( model )
		menu:updateElementState( codcasterScoreLogoWidgetBlackOps, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "deadSpectator.playerTeam"
		} )
	end )
	self:addElement( codcasterScoreLogoWidgetBlackOps )
	self.codcasterScoreLogoWidgetBlackOps = codcasterScoreLogoWidgetBlackOps
	
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
	light:setAlpha( 0.35 )
	light:setImage( RegisterImage( "uie_t7_codcaster_light" ) )
	light:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( light )
	self.light = light
	
	local codcasterRoundsContainer = CoD.codcasterRoundsContainer.new( menu, controller )
	codcasterRoundsContainer:setLeftRight( true, false, 246.93, 342.68 )
	codcasterRoundsContainer:setTopBottom( true, false, 82, 122 )
	codcasterRoundsContainer:setScale( 0.9 )
	codcasterRoundsContainer:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return IsSingleRound( controller )
			end
		},
		{
			stateName = "Overtime",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_OVERTIME )
			end
		},
		{
			stateName = "RoundBasedNoLimit",
			condition = function ( menu, element, event )
				return not HasRoundLimit( controller )
			end
		},
		{
			stateName = "RoundBasedLimitedRounds",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	codcasterRoundsContainer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_OVERTIME ), function ( model )
		menu:updateElementState( codcasterRoundsContainer, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_OVERTIME
		} )
	end )
	self:addElement( codcasterRoundsContainer )
	self.codcasterRoundsContainer = codcasterRoundsContainer
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				codcasterScoreLogoWidgetDarkOps:completeAnimation()
				self.codcasterScoreLogoWidgetDarkOps:setScale( 1 )
				self.clipFinished( codcasterScoreLogoWidgetDarkOps, {} )
				codcasterRoundsContainer:completeAnimation()
				self.codcasterRoundsContainer:setAlpha( 1 )
				self.clipFinished( codcasterRoundsContainer, {} )
			end,
			SpectatingTeamAxis = function ()
				self:setupElementClipCounter( 3 )
				local codcasterScoreLogoWidgetDarkOpsFrame2 = function ( codcasterScoreLogoWidgetDarkOps, event )
					local codcasterScoreLogoWidgetDarkOpsFrame3 = function ( codcasterScoreLogoWidgetDarkOps, event )
						if not event.interrupted then
							codcasterScoreLogoWidgetDarkOps:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
						end
						codcasterScoreLogoWidgetDarkOps:setScale( 1 )
						if event.interrupted then
							self.clipFinished( codcasterScoreLogoWidgetDarkOps, event )
						else
							codcasterScoreLogoWidgetDarkOps:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						codcasterScoreLogoWidgetDarkOpsFrame3( codcasterScoreLogoWidgetDarkOps, event )
						return 
					else
						codcasterScoreLogoWidgetDarkOps:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						codcasterScoreLogoWidgetDarkOps:setScale( 1.1 )
						codcasterScoreLogoWidgetDarkOps:registerEventHandler( "transition_complete_keyframe", codcasterScoreLogoWidgetDarkOpsFrame3 )
					end
				end
				
				codcasterScoreLogoWidgetDarkOps:completeAnimation()
				self.codcasterScoreLogoWidgetDarkOps:setScale( 1 )
				codcasterScoreLogoWidgetDarkOpsFrame2( codcasterScoreLogoWidgetDarkOps, {} )
				local teamNameDarkOpsFrame2 = function ( teamNameDarkOps, event )
					local teamNameDarkOpsFrame3 = function ( teamNameDarkOps, event )
						if not event.interrupted then
							teamNameDarkOps:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
						end
						teamNameDarkOps:setLeftRight( false, true, -213.5, -52.5 )
						teamNameDarkOps:setTopBottom( true, false, 30, 46 )
						teamNameDarkOps:setScale( 1 )
						if event.interrupted then
							self.clipFinished( teamNameDarkOps, event )
						else
							teamNameDarkOps:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						teamNameDarkOpsFrame3( teamNameDarkOps, event )
						return 
					else
						teamNameDarkOps:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						teamNameDarkOps:setTopBottom( true, false, 26, 42 )
						teamNameDarkOps:setScale( 1.1 )
						teamNameDarkOps:registerEventHandler( "transition_complete_keyframe", teamNameDarkOpsFrame3 )
					end
				end
				
				teamNameDarkOps:completeAnimation()
				self.teamNameDarkOps:setLeftRight( false, true, -213.5, -52.5 )
				self.teamNameDarkOps:setTopBottom( true, false, 30, 46 )
				self.teamNameDarkOps:setScale( 1 )
				teamNameDarkOpsFrame2( teamNameDarkOps, {} )
				local teamScoreDarkOpsFrame2 = function ( teamScoreDarkOps, event )
					local teamScoreDarkOpsFrame3 = function ( teamScoreDarkOps, event )
						if not event.interrupted then
							teamScoreDarkOps:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
						end
						teamScoreDarkOps:setScale( 1 )
						if event.interrupted then
							self.clipFinished( teamScoreDarkOps, event )
						else
							teamScoreDarkOps:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						teamScoreDarkOpsFrame3( teamScoreDarkOps, event )
						return 
					else
						teamScoreDarkOps:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						teamScoreDarkOps:setScale( 1.1 )
						teamScoreDarkOps:registerEventHandler( "transition_complete_keyframe", teamScoreDarkOpsFrame3 )
					end
				end
				
				teamScoreDarkOps:completeAnimation()
				self.teamScoreDarkOps:setScale( 1 )
				teamScoreDarkOpsFrame2( teamScoreDarkOps, {} )
			end,
			SpectatingTeamAllies = function ()
				self:setupElementClipCounter( 3 )
				local codcasterScoreLogoWidgetBlackOpsFrame2 = function ( codcasterScoreLogoWidgetBlackOps, event )
					local codcasterScoreLogoWidgetBlackOpsFrame3 = function ( codcasterScoreLogoWidgetBlackOps, event )
						if not event.interrupted then
							codcasterScoreLogoWidgetBlackOps:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
						end
						codcasterScoreLogoWidgetBlackOps:setScale( 1 )
						if event.interrupted then
							self.clipFinished( codcasterScoreLogoWidgetBlackOps, event )
						else
							codcasterScoreLogoWidgetBlackOps:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						codcasterScoreLogoWidgetBlackOpsFrame3( codcasterScoreLogoWidgetBlackOps, event )
						return 
					else
						codcasterScoreLogoWidgetBlackOps:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						codcasterScoreLogoWidgetBlackOps:setScale( 1.1 )
						codcasterScoreLogoWidgetBlackOps:registerEventHandler( "transition_complete_keyframe", codcasterScoreLogoWidgetBlackOpsFrame3 )
					end
				end
				
				codcasterScoreLogoWidgetBlackOps:completeAnimation()
				self.codcasterScoreLogoWidgetBlackOps:setScale( 1 )
				codcasterScoreLogoWidgetBlackOpsFrame2( codcasterScoreLogoWidgetBlackOps, {} )
				local teamNameBlackOpsFrame2 = function ( teamNameBlackOps, event )
					local teamNameBlackOpsFrame3 = function ( teamNameBlackOps, event )
						if not event.interrupted then
							teamNameBlackOps:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
						end
						teamNameBlackOps:setLeftRight( true, false, 54, 217 )
						teamNameBlackOps:setTopBottom( true, false, 30, 46 )
						teamNameBlackOps:setScale( 1 )
						if event.interrupted then
							self.clipFinished( teamNameBlackOps, event )
						else
							teamNameBlackOps:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						teamNameBlackOpsFrame3( teamNameBlackOps, event )
						return 
					else
						teamNameBlackOps:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						teamNameBlackOps:setTopBottom( true, false, 26, 42 )
						teamNameBlackOps:setScale( 1.1 )
						teamNameBlackOps:registerEventHandler( "transition_complete_keyframe", teamNameBlackOpsFrame3 )
					end
				end
				
				teamNameBlackOps:completeAnimation()
				self.teamNameBlackOps:setLeftRight( true, false, 54, 217 )
				self.teamNameBlackOps:setTopBottom( true, false, 30, 46 )
				self.teamNameBlackOps:setScale( 1 )
				teamNameBlackOpsFrame2( teamNameBlackOps, {} )
				local teamScoreBlackOpsFrame2 = function ( teamScoreBlackOps, event )
					local teamScoreBlackOpsFrame3 = function ( teamScoreBlackOps, event )
						if not event.interrupted then
							teamScoreBlackOps:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
						end
						teamScoreBlackOps:setScale( 1 )
						if event.interrupted then
							self.clipFinished( teamScoreBlackOps, event )
						else
							teamScoreBlackOps:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						teamScoreBlackOpsFrame3( teamScoreBlackOps, event )
						return 
					else
						teamScoreBlackOps:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						teamScoreBlackOps:setScale( 1.1 )
						teamScoreBlackOps:registerEventHandler( "transition_complete_keyframe", teamScoreBlackOpsFrame3 )
					end
				end
				
				teamScoreBlackOps:completeAnimation()
				self.teamScoreBlackOps:setScale( 1 )
				teamScoreBlackOpsFrame2( teamScoreBlackOps, {} )
			end
		},
		TenThousandPLus = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				teamScoreDarkOps:completeAnimation()
				self.teamScoreDarkOps:setScale( 0.7 )
				self.clipFinished( teamScoreDarkOps, {} )
				teamScoreBlackOps:completeAnimation()
				self.teamScoreBlackOps:setScale( 0.7 )
				self.clipFinished( teamScoreBlackOps, {} )
				codcasterRoundsContainer:completeAnimation()
				self.codcasterRoundsContainer:setAlpha( 1 )
				self.clipFinished( codcasterRoundsContainer, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CodCasterTimer:close()
		element.CodCasterHeaderGameModeWidget:close()
		element.codcasterScoreLogoWidgetDarkOps:close()
		element.codcasterScoreLogoWidgetBlackOps:close()
		element.codcasterRoundsContainer:close()
		element.ModeAndMapName:close()
		element.teamNameDarkOps:close()
		element.teamNameBlackOps:close()
		element.teamScoreDarkOps:close()
		element.teamScoreBlackOps:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

