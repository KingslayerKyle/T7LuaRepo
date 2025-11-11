require( "ui.uieditor.widgets.MPHudWidgets.WarScoreboard.WarScoreboard" )
require( "ui.uieditor.widgets.Scoreboard.ScoreboardFactionScoresList" )
require( "ui.uieditor.widgets.Scoreboard.ScoreboardFactionWidget" )
require( "ui.uieditor.widgets.Scoreboard.ScoreboardHeaderWidget" )
require( "ui.uieditor.widgets.Scoreboard.ScoreboardWidgetButtonContainer" )

local UpdateWidgetSizes = function ( self, controller )
	local upperFactionWidget = self.ScoreboardFactionWidget1
	local lowerFactionWidget = self.ScoreboardFactionWidget2
	local upperFactionScoreList = self.ScoreboardFactionScoresList.Team1
	local lowerFactionScoreList = self.ScoreboardFactionScoresList.Team2
	local codCasterModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CodCaster" )
	local showCasterBoardModel = Engine.CreateModel( codCasterModel, "showCodCasterScoreboard" )
	local showCasterBoard = Engine.GetModelValue( showCasterBoardModel )
	if (not IsCodCaster( controller ) or not showCasterBoard) and IsInGame() and IsTeamBasedGame( controller ) and Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED ) then
		local scoreboardInfo = Engine.GetScoreboardData( controller )
		if scoreboardInfo.scores.TEAM_ALLIES < scoreboardInfo.scores.TEAM_AXIS then
			local temp = upperFactionWidget
			upperFactionWidget = lowerFactionWidget
			lowerFactionWidget = temp
			temp = upperFactionScoreList
			upperFactionScoreList = lowerFactionScoreList
			lowerFactionScoreList = temp
		end
	end
	local upperTeamListHeight = upperFactionScoreList.height
	local lowerTeamListHeight = lowerFactionScoreList.height
	if not upperTeamListHeight or not lowerTeamListHeight then
		return 
	end
	local upperFactionTop = 34
	local upperFactionBottom = upperFactionTop + upperTeamListHeight
	self.ScoreboardFactionWidget3:setTopBottom( true, false, upperFactionTop, upperFactionBottom )
	upperFactionWidget:setTopBottom( true, false, upperFactionTop, upperFactionBottom )
	upperFactionScoreList:setPriority( 0 )
	upperFactionScoreList.navigation = {
		down = lowerFactionScoreList
	}
	local spacer = 3
	local lowerFactionTop = upperFactionBottom + spacer
	local lowerFactionBottom = lowerFactionTop + lowerTeamListHeight
	lowerFactionWidget:setTopBottom( true, false, lowerFactionTop, lowerFactionBottom )
	lowerFactionScoreList:setPriority( 1 )
	lowerFactionScoreList.navigation = {
		up = upperFactionScoreList
	}
	if IsCodCaster( controller ) and showCasterBoard then
		self.ScoreboardWidgetButtonContainer:setTopBottom( true, false, upperFactionBottom, upperFactionBottom + 32 )
	elseif IsTeamBasedGame( controller ) then
		self.ScoreboardWidgetButtonContainer:setTopBottom( true, false, lowerFactionBottom, lowerFactionBottom + 32 )
	else
		self.ScoreboardWidgetButtonContainer:setTopBottom( true, false, upperFactionBottom, upperFactionBottom + 32 )
	end
end

local HasListWidgetCountChanged = function ( list )
	return list.requestedRowCount ~= #list.layoutItems
end

local PostLoadFunc = function ( self, controller, menu )
	LUI.OverrideFunction_CallOriginalFirst( self.ScoreboardFactionScoresList.Team1, "updateLayout", function ( element )
		UpdateWidgetSizes( self, controller )
	end )
	LUI.OverrideFunction_CallOriginalFirst( self.ScoreboardFactionScoresList.Team2, "updateLayout", function ( element )
		UpdateWidgetSizes( self, controller )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED ), function ()
		UpdateWidgetSizes( self, controller )
	end, false )
	local numTeams = Engine.GetCurrentTeamCount()
	if numTeams < 2 then
		self.ScoreboardFactionWidget2:close()
		self.ScoreboardFactionScoresList.Team2:close()
	end
	local updateScoreboardNavigation = function ( self, disable )
		self.ScoreboardFactionScoresList.Team1.m_disableNavigation = disable
		self.ScoreboardFactionScoresList.Team2.m_disableNavigation = disable
	end
	
	local updateVisibility = function ( inputDisabled )
		self.m_inputDisabled = inputDisabled
		updateScoreboardNavigation( self, self.m_inputDisabled )
		if not self.m_inputDisabled then
			local modelsToFind = {
				clientNum = Engine.GetClientNum( controller )
			}
			self:loseFocus( {
				name = "lose_focus",
				controller = controller
			} )
			local teamLists = {
				self.ScoreboardFactionScoresList.Team1,
				self.ScoreboardFactionScoresList.Team2
			}
			for _, teamList in ipairs( teamLists ) do
				local result = teamList:findItem( modelsToFind, nil, true )
				teamList.m_focusable = result ~= nil
			end
			self:gainFocus( {
				name = "gain_focus",
				controller = controller
			} )
			for _, teamList in ipairs( teamLists ) do
				teamList.m_focusable = true
			end
		end
	end
	
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( self, state )
		if state ~= "Visible" and state ~= "ForceVisible" then
			local f9_local0 = false
		else
			local inputEnabled = true
		end
		updateVisibility( not f9_local0 )
	end )
end

local PreLoadFunc = function ( self, controller )
	Engine.CreateModel( Engine.GetModelForController( controller ), "forceScoreboard" )
	CoD.ScoreboardUtility.SetScoreboardUIModels( controller )
	local codCasterModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CodCaster" )
	local showCasterBoardModel = Engine.CreateModel( codCasterModel, "showCodCasterScoreboard" )
	Engine.SetModelValue( showCasterBoardModel, false )
end

CoD.ScoreboardWidget = InheritFrom( LUI.UIElement )
CoD.ScoreboardWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ScoreboardWidget )
	self.id = "ScoreboardWidget"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1546 )
	self:setTopBottom( 0, 0, 0, 756 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local ScoreboardFactionScoresList = CoD.ScoreboardFactionScoresList.new( menu, controller )
	ScoreboardFactionScoresList:setLeftRight( 0, 0, 305, 1547 )
	ScoreboardFactionScoresList:setTopBottom( 0, 0, 51, 969 )
	ScoreboardFactionScoresList.Team2:setVerticalCount( 18 )
	ScoreboardFactionScoresList:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "forceScoreboard" ), function ( model )
		local element = ScoreboardFactionScoresList
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "forceScoreboard"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	ScoreboardFactionScoresList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		UpdateScoreboardClientMuteButtonPrompt( element, controller )
		return retVal
	end )
	ScoreboardFactionScoresList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	ScoreboardFactionScoresList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( ScoreboardFactionScoresList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if ScoreboardVisible( controller ) then
			BlockGameFromKeyEvent( controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if ScoreboardVisible( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "", nil )
			return false
		else
			return false
		end
	end, false )
	self:addElement( ScoreboardFactionScoresList )
	self.ScoreboardFactionScoresList = ScoreboardFactionScoresList
	
	local ScoreboardFactionWidget1 = CoD.ScoreboardFactionWidget.new( menu, controller )
	ScoreboardFactionWidget1:setLeftRight( 0, 0, 2, 302 )
	ScoreboardFactionWidget1:setTopBottom( 0, 0, 49, 399 )
	ScoreboardFactionWidget1.ffaName.FactionName:setText( Engine.Localize( "MPUI_AXIS_CAPS" ) )
	ScoreboardFactionWidget1:subscribeToGlobalModel( controller, "FactionsGlobal", "alliesFactionIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ScoreboardFactionWidget1.FactionIcon:setImage( RegisterImage( modelValue ) )
		end
	end )
	ScoreboardFactionWidget1:subscribeToGlobalModel( controller, "GameScore", "alliesScore", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ScoreboardFactionWidget1.Score0.Numbers:setText( Engine.Localize( modelValue ) )
		end
	end )
	ScoreboardFactionWidget1:subscribeToGlobalModel( controller, "FactionsGlobal", "alliesFactionDisplayName", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ScoreboardFactionWidget1.ScoreboardFactionNameWidget.FactionName:setText( Engine.Localize( modelValue ) )
		end
	end )
	ScoreboardFactionWidget1:subscribeToGlobalModel( controller, "GameScore", "firstPlaceXUID", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ScoreboardFactionWidget1.ffaEmblem:setupPlayerEmblemByXUID( modelValue )
		end
	end )
	ScoreboardFactionWidget1:subscribeToGlobalModel( controller, "GameScore", "highestScore", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ScoreboardFactionWidget1.ffaScore.Numbers:setText( Engine.Localize( modelValue ) )
		end
	end )
	ScoreboardFactionWidget1:subscribeToGlobalModel( controller, "FactionsGlobal", "alliesFactionColor", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ScoreboardFactionWidget1.FactionColor:setRGB( modelValue )
		end
	end )
	ScoreboardFactionWidget1:subscribeToGlobalModel( controller, "GameScore", "highestScoreName", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ScoreboardFactionWidget1.ScoreboardFFANameWidget.FactionName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( ScoreboardFactionWidget1 )
	self.ScoreboardFactionWidget1 = ScoreboardFactionWidget1
	
	local ScoreboardFactionWidget2 = CoD.ScoreboardFactionWidget.new( menu, controller )
	ScoreboardFactionWidget2:setLeftRight( 0, 0, 2, 302 )
	ScoreboardFactionWidget2:setTopBottom( 0, 0, 403, 753 )
	ScoreboardFactionWidget2.ffaScore.Numbers:setText( Engine.Localize( "2150" ) )
	ScoreboardFactionWidget2.ffaName.FactionName:setText( Engine.Localize( "MPUI_AXIS_CAPS" ) )
	ScoreboardFactionWidget2.ScoreboardFFANameWidget.FactionName:setText( Engine.Localize( "WWWWWWWWWWWWWWWWW" ) )
	ScoreboardFactionWidget2:subscribeToGlobalModel( controller, "FactionsGlobal", "axisFactionIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ScoreboardFactionWidget2.FactionIcon:setImage( RegisterImage( modelValue ) )
		end
	end )
	ScoreboardFactionWidget2:subscribeToGlobalModel( controller, "GameScore", "axisScore", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ScoreboardFactionWidget2.Score0.Numbers:setText( Engine.Localize( modelValue ) )
		end
	end )
	ScoreboardFactionWidget2:subscribeToGlobalModel( controller, "FactionsGlobal", "axisFactionDisplayName", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ScoreboardFactionWidget2.ScoreboardFactionNameWidget.FactionName:setText( Engine.Localize( modelValue ) )
		end
	end )
	ScoreboardFactionWidget2:subscribeToGlobalModel( controller, "FactionsGlobal", "axisFactionColor", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ScoreboardFactionWidget2.FactionColor:setRGB( modelValue )
		end
	end )
	self:addElement( ScoreboardFactionWidget2 )
	self.ScoreboardFactionWidget2 = ScoreboardFactionWidget2
	
	local ScoreboardHeaderWidget = CoD.ScoreboardHeaderWidget.new( menu, controller )
	ScoreboardHeaderWidget:setLeftRight( 0, 0, 0, 1494 )
	ScoreboardHeaderWidget:setTopBottom( 0, 0, 0, 48 )
	self:addElement( ScoreboardHeaderWidget )
	self.ScoreboardHeaderWidget = ScoreboardHeaderWidget
	
	local ScoreboardWidgetButtonContainer = CoD.ScoreboardWidgetButtonContainer.new( menu, controller )
	ScoreboardWidgetButtonContainer:setLeftRight( 0, 0, -23, 645 )
	ScoreboardWidgetButtonContainer:setTopBottom( 0, 0, 756, 804 )
	self:addElement( ScoreboardWidgetButtonContainer )
	self.ScoreboardWidgetButtonContainer = ScoreboardWidgetButtonContainer
	
	local ScoreboardFactionWidget3 = CoD.ScoreboardFactionWidget.new( menu, controller )
	ScoreboardFactionWidget3:mergeStateConditions( {
		{
			stateName = "FFA",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "CodCaster",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "CodCasterAAR",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "TeamCoDCaster",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	ScoreboardFactionWidget3:setLeftRight( 0, 0, 2, 302 )
	ScoreboardFactionWidget3:setTopBottom( 0, 0, 49, 399 )
	ScoreboardFactionWidget3.Score0.Numbers:setText( Engine.Localize( "" ) )
	ScoreboardFactionWidget3.ScoreboardFactionNameWidget.FactionName:setText( Engine.Localize( "MENU_CODCASTERS" ) )
	ScoreboardFactionWidget3.ffaScore.Numbers:setText( Engine.Localize( "" ) )
	ScoreboardFactionWidget3.ffaName.FactionName:setText( Engine.Localize( "MENU_CODCASTERS" ) )
	ScoreboardFactionWidget3.ScoreboardFFANameWidget.FactionName:setText( Engine.Localize( "" ) )
	self:addElement( ScoreboardFactionWidget3 )
	self.ScoreboardFactionWidget3 = ScoreboardFactionWidget3
	
	local WarScoreboard = CoD.WarScoreboard.new( menu, controller )
	WarScoreboard:setLeftRight( 0.5, 0.5, -720, 720 )
	WarScoreboard:setTopBottom( 0, 0, -187, 893 )
	self:addElement( WarScoreboard )
	self.WarScoreboard = WarScoreboard
	
	ScoreboardFactionScoresList.navigation = {
		left = WarScoreboard,
		up = WarScoreboard
	}
	WarScoreboard.navigation = {
		right = ScoreboardFactionScoresList,
		down = ScoreboardFactionScoresList
	}
	self.resetProperties = function ()
		ScoreboardHeaderWidget:completeAnimation()
		ScoreboardFactionWidget2:completeAnimation()
		ScoreboardFactionWidget1:completeAnimation()
		ScoreboardFactionScoresList:completeAnimation()
		ScoreboardWidgetButtonContainer:completeAnimation()
		ScoreboardFactionWidget3:completeAnimation()
		WarScoreboard:completeAnimation()
		ScoreboardHeaderWidget:setAlpha( 1 )
		ScoreboardFactionWidget2:setAlpha( 1 )
		ScoreboardFactionWidget1:setAlpha( 1 )
		ScoreboardFactionScoresList:setLeftRight( 0, 0, 305, 1547 )
		ScoreboardFactionScoresList:setTopBottom( 0, 0, 51, 969 )
		ScoreboardFactionScoresList:setAlpha( 1 )
		ScoreboardWidgetButtonContainer:setAlpha( 1 )
		ScoreboardFactionWidget3:setAlpha( 1 )
		WarScoreboard:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
				ScoreboardFactionScoresList:completeAnimation()
				self.ScoreboardFactionScoresList:setAlpha( 0 )
				self.clipFinished( ScoreboardFactionScoresList, {} )
				ScoreboardFactionWidget1:completeAnimation()
				self.ScoreboardFactionWidget1:setAlpha( 0 )
				self.clipFinished( ScoreboardFactionWidget1, {} )
				ScoreboardFactionWidget2:completeAnimation()
				self.ScoreboardFactionWidget2:setAlpha( 0 )
				self.clipFinished( ScoreboardFactionWidget2, {} )
				ScoreboardHeaderWidget:completeAnimation()
				self.ScoreboardHeaderWidget:setAlpha( 0 )
				self.clipFinished( ScoreboardHeaderWidget, {} )
				ScoreboardWidgetButtonContainer:completeAnimation()
				self.ScoreboardWidgetButtonContainer:setAlpha( 0 )
				self.clipFinished( ScoreboardWidgetButtonContainer, {} )
				ScoreboardFactionWidget3:completeAnimation()
				self.ScoreboardFactionWidget3:setAlpha( 0 )
				self.clipFinished( ScoreboardFactionWidget3, {} )
				WarScoreboard:completeAnimation()
				self.WarScoreboard:setAlpha( 0 )
				self.clipFinished( WarScoreboard, {} )
			end,
			Intro = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				local ScoreboardFactionScoresListFrame2 = function ( ScoreboardFactionScoresList, event )
					local ScoreboardFactionScoresListFrame3 = function ( ScoreboardFactionScoresList, event )
						if not event.interrupted then
							ScoreboardFactionScoresList:beginAnimation( "keyframe", 299, false, false, CoD.TweenType.Bounce )
						end
						ScoreboardFactionScoresList:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( ScoreboardFactionScoresList, event )
						else
							ScoreboardFactionScoresList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ScoreboardFactionScoresListFrame3( ScoreboardFactionScoresList, event )
						return 
					else
						ScoreboardFactionScoresList:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
						ScoreboardFactionScoresList:registerEventHandler( "transition_complete_keyframe", ScoreboardFactionScoresListFrame3 )
					end
				end
				
				ScoreboardFactionScoresList:completeAnimation()
				self.ScoreboardFactionScoresList:setAlpha( 0 )
				ScoreboardFactionScoresListFrame2( ScoreboardFactionScoresList, {} )
				local ScoreboardFactionWidget1Frame2 = function ( ScoreboardFactionWidget1, event )
					local ScoreboardFactionWidget1Frame3 = function ( ScoreboardFactionWidget1, event )
						if not event.interrupted then
							ScoreboardFactionWidget1:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Bounce )
						end
						ScoreboardFactionWidget1:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( ScoreboardFactionWidget1, event )
						else
							ScoreboardFactionWidget1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ScoreboardFactionWidget1Frame3( ScoreboardFactionWidget1, event )
						return 
					else
						ScoreboardFactionWidget1:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						ScoreboardFactionWidget1:registerEventHandler( "transition_complete_keyframe", ScoreboardFactionWidget1Frame3 )
					end
				end
				
				ScoreboardFactionWidget1:completeAnimation()
				self.ScoreboardFactionWidget1:setAlpha( 0 )
				ScoreboardFactionWidget1Frame2( ScoreboardFactionWidget1, {} )
				local ScoreboardFactionWidget2Frame2 = function ( ScoreboardFactionWidget2, event )
					local ScoreboardFactionWidget2Frame3 = function ( ScoreboardFactionWidget2, event )
						if not event.interrupted then
							ScoreboardFactionWidget2:beginAnimation( "keyframe", 179, false, false, CoD.TweenType.Bounce )
						end
						ScoreboardFactionWidget2:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( ScoreboardFactionWidget2, event )
						else
							ScoreboardFactionWidget2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ScoreboardFactionWidget2Frame3( ScoreboardFactionWidget2, event )
						return 
					else
						ScoreboardFactionWidget2:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						ScoreboardFactionWidget2:registerEventHandler( "transition_complete_keyframe", ScoreboardFactionWidget2Frame3 )
					end
				end
				
				ScoreboardFactionWidget2:completeAnimation()
				self.ScoreboardFactionWidget2:setAlpha( 0 )
				ScoreboardFactionWidget2Frame2( ScoreboardFactionWidget2, {} )
				local ScoreboardHeaderWidgetFrame2 = function ( ScoreboardHeaderWidget, event )
					if not event.interrupted then
						ScoreboardHeaderWidget:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Bounce )
					end
					ScoreboardHeaderWidget:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( ScoreboardHeaderWidget, event )
					else
						ScoreboardHeaderWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ScoreboardHeaderWidget:completeAnimation()
				self.ScoreboardHeaderWidget:setAlpha( 0 )
				ScoreboardHeaderWidgetFrame2( ScoreboardHeaderWidget, {} )
				ScoreboardFactionWidget3:completeAnimation()
				self.ScoreboardFactionWidget3:setAlpha( 0 )
				self.clipFinished( ScoreboardFactionWidget3, {} )
			end
		},
		CodCaster = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				ScoreboardFactionWidget1:completeAnimation()
				self.ScoreboardFactionWidget1:setAlpha( 0 )
				self.clipFinished( ScoreboardFactionWidget1, {} )
				ScoreboardFactionWidget2:completeAnimation()
				self.ScoreboardFactionWidget2:setAlpha( 0 )
				self.clipFinished( ScoreboardFactionWidget2, {} )
				WarScoreboard:completeAnimation()
				self.WarScoreboard:setAlpha( 0 )
				self.clipFinished( WarScoreboard, {} )
			end
		},
		WarVisible = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				ScoreboardFactionScoresList:completeAnimation()
				self.ScoreboardFactionScoresList:setAlpha( 0 )
				self.clipFinished( ScoreboardFactionScoresList, {} )
				ScoreboardFactionWidget1:completeAnimation()
				self.ScoreboardFactionWidget1:setAlpha( 0 )
				self.clipFinished( ScoreboardFactionWidget1, {} )
				ScoreboardFactionWidget2:completeAnimation()
				self.ScoreboardFactionWidget2:setAlpha( 0 )
				self.clipFinished( ScoreboardFactionWidget2, {} )
				ScoreboardHeaderWidget:completeAnimation()
				self.ScoreboardHeaderWidget:setAlpha( 0 )
				self.clipFinished( ScoreboardHeaderWidget, {} )
				ScoreboardWidgetButtonContainer:completeAnimation()
				self.ScoreboardWidgetButtonContainer:setAlpha( 0 )
				self.clipFinished( ScoreboardWidgetButtonContainer, {} )
				ScoreboardFactionWidget3:completeAnimation()
				self.ScoreboardFactionWidget3:setAlpha( 0 )
				self.clipFinished( ScoreboardFactionWidget3, {} )
			end
		},
		WarForceVisible = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				ScoreboardFactionScoresList:completeAnimation()
				self.ScoreboardFactionScoresList:setAlpha( 0 )
				self.clipFinished( ScoreboardFactionScoresList, {} )
				ScoreboardFactionWidget1:completeAnimation()
				self.ScoreboardFactionWidget1:setAlpha( 0 )
				self.clipFinished( ScoreboardFactionWidget1, {} )
				ScoreboardFactionWidget2:completeAnimation()
				self.ScoreboardFactionWidget2:setAlpha( 0 )
				self.clipFinished( ScoreboardFactionWidget2, {} )
				ScoreboardHeaderWidget:completeAnimation()
				self.ScoreboardHeaderWidget:setAlpha( 0 )
				self.clipFinished( ScoreboardHeaderWidget, {} )
				ScoreboardWidgetButtonContainer:completeAnimation()
				self.ScoreboardWidgetButtonContainer:setAlpha( 0 )
				self.clipFinished( ScoreboardWidgetButtonContainer, {} )
				ScoreboardFactionWidget3:completeAnimation()
				self.ScoreboardFactionWidget3:setAlpha( 0 )
				self.clipFinished( ScoreboardFactionWidget3, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				ScoreboardFactionWidget3:completeAnimation()
				self.ScoreboardFactionWidget3:setAlpha( 0 )
				self.clipFinished( ScoreboardFactionWidget3, {} )
				WarScoreboard:completeAnimation()
				self.WarScoreboard:setAlpha( 0 )
				self.clipFinished( WarScoreboard, {} )
			end
		},
		ForceVisible = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				ScoreboardFactionWidget3:completeAnimation()
				self.ScoreboardFactionWidget3:setAlpha( 0 )
				self.clipFinished( ScoreboardFactionWidget3, {} )
				WarScoreboard:completeAnimation()
				self.WarScoreboard:setAlpha( 0 )
				self.clipFinished( WarScoreboard, {} )
			end
		},
		ArabicFrontend = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				ScoreboardFactionScoresList:completeAnimation()
				self.ScoreboardFactionScoresList:setLeftRight( 0, 0, 189, 1431 )
				self.ScoreboardFactionScoresList:setTopBottom( 0, 0, 49, 967 )
				self.clipFinished( ScoreboardFactionScoresList, {} )
				ScoreboardFactionWidget3:completeAnimation()
				self.ScoreboardFactionWidget3:setAlpha( 0 )
				self.clipFinished( ScoreboardFactionWidget3, {} )
				WarScoreboard:completeAnimation()
				self.WarScoreboard:setAlpha( 0 )
				self.clipFinished( WarScoreboard, {} )
			end
		},
		Frontend = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				ScoreboardHeaderWidget:completeAnimation()
				self.ScoreboardHeaderWidget:setAlpha( 0 )
				self.clipFinished( ScoreboardHeaderWidget, {} )
				ScoreboardWidgetButtonContainer:completeAnimation()
				self.ScoreboardWidgetButtonContainer:setAlpha( 0 )
				self.clipFinished( ScoreboardWidgetButtonContainer, {} )
				ScoreboardFactionWidget3:completeAnimation()
				self.ScoreboardFactionWidget3:setAlpha( 0 )
				self.clipFinished( ScoreboardFactionWidget3, {} )
				WarScoreboard:completeAnimation()
				self.WarScoreboard:setAlpha( 0 )
				self.clipFinished( WarScoreboard, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "CodCaster",
			condition = function ( menu, element, event )
				local f50_local0 = IsCodCaster( controller )
				if f50_local0 then
					f50_local0 = ScoreboardVisible( controller )
					if f50_local0 then
						f50_local0 = IsModelValueTrue( controller, "CodCaster.showCodCasterScoreboard" )
					end
				end
				return f50_local0
			end
		},
		{
			stateName = "WarVisible",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and IsGametypeNewStyle()
			end
		},
		{
			stateName = "WarForceVisible",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "forceScoreboard", 1 ) and IsGametypeNewStyle()
			end
		},
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN )
			end
		},
		{
			stateName = "ForceVisible",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "forceScoreboard", 1 )
			end
		},
		{
			stateName = "ArabicFrontend",
			condition = function ( menu, element, event )
				local f55_local0
				if not IsInGame() then
					f55_local0 = IsCurrentLanguageArabic()
				else
					f55_local0 = false
				end
				return f55_local0
			end
		},
		{
			stateName = "Frontend",
			condition = function ( menu, element, event )
				return not IsInGame()
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "factions.isCoDCaster" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "factions.isCoDCaster"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "forceScoreboard" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "forceScoreboard"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CodCaster.showCodCasterScoreboard" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CodCaster.showCodCasterScoreboard"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	ScoreboardFactionScoresList.id = "ScoreboardFactionScoresList"
	ScoreboardWidgetButtonContainer:setModel( menu.buttonModel, controller )
	WarScoreboard.id = "WarScoreboard"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.ScoreboardFactionScoresList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.ScoreboardFactionScoresList:close()
		self.ScoreboardFactionWidget1:close()
		self.ScoreboardFactionWidget2:close()
		self.ScoreboardHeaderWidget:close()
		self.ScoreboardWidgetButtonContainer:close()
		self.ScoreboardFactionWidget3:close()
		self.WarScoreboard:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

