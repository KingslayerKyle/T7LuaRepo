require( "ui.uieditor.widgets.Scoreboard.ScoreboardFactionScoresList" )
require( "ui.uieditor.widgets.Scoreboard.ScoreboardFactionWidget" )
require( "ui.uieditor.widgets.Scoreboard.ScoreboardHeaderWidget" )
require( "ui.uieditor.widgets.Scoreboard.ScoreboardClientMuteButtonPrompt" )

local UpdateWidgetSizes = function ( self )
	local team1ListHeight = self.ScoreboardFactionScoresList.Team1.height
	local team2ListHeight = self.ScoreboardFactionScoresList.Team2.height
	if not team1ListHeight or not team2ListHeight then
		return 
	end
	local factionWidget1Top = 35
	local factionWidget1Bottom = 35 + team1ListHeight - 1
	self.ScoreboardFactionWidget1:setTopBottom( true, false, factionWidget1Top, factionWidget1Bottom )
	local factionWidget2Top = factionWidget1Bottom + 5
	local factionWidget2Bottom = factionWidget2Top + team2ListHeight - 1
	self.ScoreboardFactionWidget2:setTopBottom( true, false, factionWidget2Top, factionWidget2Bottom )
	if team2ListHeight == 0 then
		self.ScoreboardFactionWidget2:close()
	end
	self.ScoreboardClientMuteButtonPrompt:setTopBottom( true, false, factionWidget2Bottom, factionWidget2Bottom + 32 )
end

local HasListWidgetCountChanged = function ( list )
	return list.requestedRowCount ~= #list.layoutItems
end

local PostLoadFunc = function ( self, controller )
	LUI.OverrideFunction_CallOriginalFirst( self.ScoreboardFactionScoresList.Team1, "updateLayout", function ( element )
		UpdateWidgetSizes( self )
	end )
	LUI.OverrideFunction_CallOriginalFirst( self.ScoreboardFactionScoresList.Team2, "updateLayout", function ( element )
		UpdateWidgetSizes( self )
	end )
	local numTeams = Engine.GetCurrentTeamCount()
	if numTeams < 2 then
		self.ScoreboardFactionWidget2:close()
		self.ScoreboardFactionScoresList.Team2:close()
	end
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		self.m_inputDisabled = Engine.GetModelValue( model ) ~= 1
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
		else
			local parent = self:getParent()
			if parent and parent.ScrStkContainer then
				parent.ScrStkContainer:processEvent( {
					name = "gain_focus",
					controller = controller
				} )
			end
		end
	end, false )
end

local PreLoadFunc = function ( self, controller )
	Engine.CreateModel( Engine.GetModelForController( controller ), "forceScoreboard" )
	CoD.ScoreboardUtility.SetScoreboardUIModels( controller )
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
	self:setLeftRight( true, false, 0, 1006 )
	self:setTopBottom( true, false, 0, 526 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local ScoreboardFactionScoresList = CoD.ScoreboardFactionScoresList.new( menu, controller )
	ScoreboardFactionScoresList:setLeftRight( true, false, 178, 1006 )
	ScoreboardFactionScoresList:setTopBottom( true, false, 35, 647 )
	ScoreboardFactionScoresList:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "scoreboardInfo.muteButtonPromptVisible" ), function ( model )
		local element = ScoreboardFactionScoresList
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "scoreboardInfo.muteButtonPromptVisible"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
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
		if not ScoreboardMuteButtonPromptHidden( controller ) then
			ToggleScoreboardClientMute( element, controller )
			return true
		elseif ScoreboardVisible( controller ) then
			BlockGameFromKeyEvent( controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not ScoreboardMuteButtonPromptHidden( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		elseif ScoreboardVisible( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "" )
			return false
		else
			return false
		end
	end, false )
	self:addElement( ScoreboardFactionScoresList )
	self.ScoreboardFactionScoresList = ScoreboardFactionScoresList
	
	local ScoreboardFactionWidget1 = CoD.ScoreboardFactionWidget.new( menu, controller )
	ScoreboardFactionWidget1:setLeftRight( true, false, -25, 175 )
	ScoreboardFactionWidget1:setTopBottom( true, false, 35, 268 )
	ScoreboardFactionWidget1:subscribeToGlobalModel( controller, "Factions", "alliesFactionIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ScoreboardFactionWidget1.FactionIcon:setImage( RegisterImage( modelValue ) )
		end
	end )
	ScoreboardFactionWidget1:subscribeToGlobalModel( controller, "GameScore", "alliesScore", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ScoreboardFactionWidget1.Score:setText( Engine.Localize( modelValue ) )
		end
	end )
	ScoreboardFactionWidget1:subscribeToGlobalModel( controller, "GameScore", "alliesScore", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ScoreboardFactionWidget1.Score0.Numbers:setText( Engine.Localize( modelValue ) )
		end
	end )
	ScoreboardFactionWidget1:subscribeToGlobalModel( controller, "Factions", "alliesFactionDisplayName", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ScoreboardFactionWidget1.ScoreboardFactionNameWidget.FactionName:setText( Engine.Localize( modelValue ) )
		end
	end )
	ScoreboardFactionWidget1:subscribeToGlobalModel( controller, "Factions", "alliesFactionColor", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ScoreboardFactionWidget1.FactionColor:setRGB( modelValue )
		end
	end )
	self:addElement( ScoreboardFactionWidget1 )
	self.ScoreboardFactionWidget1 = ScoreboardFactionWidget1
	
	local ScoreboardFactionWidget2 = CoD.ScoreboardFactionWidget.new( menu, controller )
	ScoreboardFactionWidget2:setLeftRight( true, false, -25, 175 )
	ScoreboardFactionWidget2:setTopBottom( true, false, 272, 505 )
	ScoreboardFactionWidget2:subscribeToGlobalModel( controller, "Factions", "axisFactionIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ScoreboardFactionWidget2.FactionIcon:setImage( RegisterImage( modelValue ) )
		end
	end )
	ScoreboardFactionWidget2:subscribeToGlobalModel( controller, "GameScore", "axisScore", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ScoreboardFactionWidget2.Score:setText( Engine.Localize( modelValue ) )
		end
	end )
	ScoreboardFactionWidget2:subscribeToGlobalModel( controller, "GameScore", "axisScore", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ScoreboardFactionWidget2.Score0.Numbers:setText( Engine.Localize( modelValue ) )
		end
	end )
	ScoreboardFactionWidget2:subscribeToGlobalModel( controller, "Factions", "axisFactionDisplayName", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ScoreboardFactionWidget2.ScoreboardFactionNameWidget.FactionName:setText( Engine.Localize( modelValue ) )
		end
	end )
	ScoreboardFactionWidget2:subscribeToGlobalModel( controller, "Factions", "axisFactionColor", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ScoreboardFactionWidget2.FactionColor:setRGB( modelValue )
		end
	end )
	self:addElement( ScoreboardFactionWidget2 )
	self.ScoreboardFactionWidget2 = ScoreboardFactionWidget2
	
	local ScoreboardHeaderWidget = CoD.ScoreboardHeaderWidget.new( menu, controller )
	ScoreboardHeaderWidget:setLeftRight( true, false, -25, 971 )
	ScoreboardHeaderWidget:setTopBottom( true, false, 0, 32 )
	self:addElement( ScoreboardHeaderWidget )
	self.ScoreboardHeaderWidget = ScoreboardHeaderWidget
	
	local ScoreboardClientMuteButtonPrompt = CoD.ScoreboardClientMuteButtonPrompt.new( menu, controller )
	ScoreboardClientMuteButtonPrompt:setLeftRight( true, false, -25, 203 )
	ScoreboardClientMuteButtonPrompt:setTopBottom( true, false, 505, 536 )
	ScoreboardClientMuteButtonPrompt.label:setText( Engine.Localize( "$(scoreboardInfo.muteButtonPromptText)" ) )
	ScoreboardClientMuteButtonPrompt:subscribeToGlobalModel( controller, "Controller", "primary_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ScoreboardClientMuteButtonPrompt.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( ScoreboardClientMuteButtonPrompt )
	self.ScoreboardClientMuteButtonPrompt = ScoreboardClientMuteButtonPrompt
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
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
				ScoreboardClientMuteButtonPrompt:completeAnimation()
				self.ScoreboardClientMuteButtonPrompt:setAlpha( 0 )
				self.clipFinished( ScoreboardClientMuteButtonPrompt, {} )
			end,
			Intro = function ()
				self:setupElementClipCounter( 4 )
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
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				ScoreboardFactionScoresList:completeAnimation()
				self.ScoreboardFactionScoresList:setAlpha( 1 )
				self.clipFinished( ScoreboardFactionScoresList, {} )
				ScoreboardFactionWidget1:completeAnimation()
				self.ScoreboardFactionWidget1:setAlpha( 1 )
				self.clipFinished( ScoreboardFactionWidget1, {} )
				ScoreboardFactionWidget2:completeAnimation()
				self.ScoreboardFactionWidget2:setAlpha( 1 )
				self.clipFinished( ScoreboardFactionWidget2, {} )
				ScoreboardHeaderWidget:completeAnimation()
				self.ScoreboardHeaderWidget:setAlpha( 1 )
				self.clipFinished( ScoreboardHeaderWidget, {} )
				ScoreboardClientMuteButtonPrompt:completeAnimation()
				self.ScoreboardClientMuteButtonPrompt:setAlpha( 1 )
				self.clipFinished( ScoreboardClientMuteButtonPrompt, {} )
			end
		},
		ForceVisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				ScoreboardFactionScoresList:completeAnimation()
				self.ScoreboardFactionScoresList:setAlpha( 1 )
				self.clipFinished( ScoreboardFactionScoresList, {} )
				ScoreboardFactionWidget1:completeAnimation()
				self.ScoreboardFactionWidget1:setAlpha( 1 )
				self.clipFinished( ScoreboardFactionWidget1, {} )
				ScoreboardFactionWidget2:completeAnimation()
				self.ScoreboardFactionWidget2:setAlpha( 1 )
				self.clipFinished( ScoreboardFactionWidget2, {} )
				ScoreboardHeaderWidget:completeAnimation()
				self.ScoreboardHeaderWidget:setAlpha( 1 )
				self.clipFinished( ScoreboardHeaderWidget, {} )
				ScoreboardClientMuteButtonPrompt:completeAnimation()
				self.ScoreboardClientMuteButtonPrompt:setAlpha( 1 )
				self.clipFinished( ScoreboardClientMuteButtonPrompt, {} )
			end
		}
	}
	self:mergeStateConditions( {
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
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
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
	ScoreboardFactionScoresList.id = "ScoreboardFactionScoresList"
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
		self.ScoreboardClientMuteButtonPrompt:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

