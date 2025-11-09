require( "ui.uieditor.widgets.Scoreboard.ScoreboardFactionScoresList" )
require( "ui.uieditor.widgets.Scoreboard.ScoreboardFactionWidget" )
require( "ui.uieditor.widgets.Scoreboard.ScoreboardHeaderWidget" )
require( "ui.uieditor.widgets.Scoreboard.ScoreboardWidgetButtonContainer" )

local f0_local0 = function ( f1_arg0 )
	local f1_local0 = f1_arg0.ScoreboardFactionScoresList.Team1.height
	local f1_local1 = f1_arg0.ScoreboardFactionScoresList.Team2.height
	if not f1_local0 or not f1_local1 then
		return 
	end
	local f1_local2 = 35
	local f1_local3 = 35 + f1_local0 - 1
	f1_arg0.ScoreboardFactionWidget1:setTopBottom( true, false, f1_local2, f1_local3 )
	local f1_local4 = f1_local3 + 5
	local f1_local5 = f1_local4 + f1_local1 - 1
	f1_arg0.ScoreboardFactionWidget2:setTopBottom( true, false, f1_local4, f1_local5 )
	if f1_local1 == 0 then
		f1_arg0.ScoreboardFactionWidget2:close()
	end
	f1_arg0.ScoreboardWidgetButtonContainer:setTopBottom( true, false, f1_local5, f1_local5 + 32 )
end

local f0_local1 = function ( f2_arg0 )
	return f2_arg0.requestedRowCount ~= #f2_arg0.layoutItems
end

local PostLoadFunc = function ( f3_arg0, f3_arg1 )
	LUI.OverrideFunction_CallOriginalFirst( f3_arg0.ScoreboardFactionScoresList.Team1, "updateLayout", function ( element )
		f0_local0( f3_arg0 )
	end )
	LUI.OverrideFunction_CallOriginalFirst( f3_arg0.ScoreboardFactionScoresList.Team2, "updateLayout", function ( element )
		f0_local0( f3_arg0 )
	end )
	if Engine.GetCurrentTeamCount() < 2 then
		f3_arg0.ScoreboardFactionWidget2:close()
		f3_arg0.ScoreboardFactionScoresList.Team2:close()
	end
	f3_arg0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( f3_arg1 ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		f3_arg0.m_inputDisabled = Engine.GetModelValue( model ) ~= 1
		if not f3_arg0.m_inputDisabled then
			local f6_local0 = {
				clientNum = Engine.GetClientNum( f3_arg1 )
			}
			f3_arg0:loseFocus( {
				name = "lose_focus",
				controller = f3_arg1
			} )
			local f6_local1 = {
				f3_arg0.ScoreboardFactionScoresList.Team1,
				f3_arg0.ScoreboardFactionScoresList.Team2
			}
			for f6_local5, f6_local6 in ipairs( f6_local1 ) do
				f6_local6.m_focusable = f6_local6:findItem( f6_local0, nil, true ) ~= nil
			end
			f3_arg0:gainFocus( {
				name = "gain_focus",
				controller = f3_arg1
			} )
			for f6_local5, f6_local6 in ipairs( f6_local1 ) do
				f6_local6.m_focusable = true
			end
		else
			local f6_local0 = f3_arg0:getParent()
			if f6_local0 and f6_local0.ScrStkContainer then
				f6_local0.ScrStkContainer:processEvent( {
					name = "gain_focus",
					controller = f3_arg1
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
		local f9_local0 = ScoreboardFactionScoresList
		local f9_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "scoreboardInfo.muteButtonPromptVisible"
		}
		CoD.Menu.UpdateButtonShownState( f9_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	ScoreboardFactionScoresList:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "forceScoreboard" ), function ( model )
		local f10_local0 = ScoreboardFactionScoresList
		local f10_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "forceScoreboard"
		}
		CoD.Menu.UpdateButtonShownState( f10_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	ScoreboardFactionScoresList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f11_local0 = nil
		UpdateScoreboardClientMuteButtonPrompt( element, controller )
		return f11_local0
	end )
	ScoreboardFactionScoresList:registerEventHandler( "gain_focus", function ( element, event )
		local f12_local0 = nil
		if element.gainFocus then
			f12_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f12_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f12_local0
	end )
	ScoreboardFactionScoresList:registerEventHandler( "lose_focus", function ( element, event )
		local f13_local0 = nil
		if element.loseFocus then
			f13_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f13_local0 = element.super:loseFocus( event )
		end
		return f13_local0
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
		local alliesFactionIcon = Engine.GetModelValue( model )
		if alliesFactionIcon then
			ScoreboardFactionWidget1.FactionIcon:setImage( RegisterImage( alliesFactionIcon ) )
		end
	end )
	ScoreboardFactionWidget1:subscribeToGlobalModel( controller, "GameScore", "alliesScore", function ( model )
		local alliesScore = Engine.GetModelValue( model )
		if alliesScore then
			ScoreboardFactionWidget1.Score:setText( Engine.Localize( alliesScore ) )
		end
	end )
	ScoreboardFactionWidget1:subscribeToGlobalModel( controller, "GameScore", "alliesScore", function ( model )
		local alliesScore = Engine.GetModelValue( model )
		if alliesScore then
			ScoreboardFactionWidget1.Score0.Numbers:setText( Engine.Localize( alliesScore ) )
		end
	end )
	ScoreboardFactionWidget1:subscribeToGlobalModel( controller, "Factions", "alliesFactionDisplayName", function ( model )
		local alliesFactionDisplayName = Engine.GetModelValue( model )
		if alliesFactionDisplayName then
			ScoreboardFactionWidget1.ScoreboardFactionNameWidget.FactionName:setText( Engine.Localize( alliesFactionDisplayName ) )
		end
	end )
	ScoreboardFactionWidget1:subscribeToGlobalModel( controller, "Factions", "alliesFactionColor", function ( model )
		local alliesFactionColor = Engine.GetModelValue( model )
		if alliesFactionColor then
			ScoreboardFactionWidget1.FactionColor:setRGB( alliesFactionColor )
		end
	end )
	self:addElement( ScoreboardFactionWidget1 )
	self.ScoreboardFactionWidget1 = ScoreboardFactionWidget1
	
	local ScoreboardFactionWidget2 = CoD.ScoreboardFactionWidget.new( menu, controller )
	ScoreboardFactionWidget2:setLeftRight( true, false, -25, 175 )
	ScoreboardFactionWidget2:setTopBottom( true, false, 272, 505 )
	ScoreboardFactionWidget2:subscribeToGlobalModel( controller, "Factions", "axisFactionIcon", function ( model )
		local axisFactionIcon = Engine.GetModelValue( model )
		if axisFactionIcon then
			ScoreboardFactionWidget2.FactionIcon:setImage( RegisterImage( axisFactionIcon ) )
		end
	end )
	ScoreboardFactionWidget2:subscribeToGlobalModel( controller, "GameScore", "axisScore", function ( model )
		local axisScore = Engine.GetModelValue( model )
		if axisScore then
			ScoreboardFactionWidget2.Score:setText( Engine.Localize( axisScore ) )
		end
	end )
	ScoreboardFactionWidget2:subscribeToGlobalModel( controller, "GameScore", "axisScore", function ( model )
		local axisScore = Engine.GetModelValue( model )
		if axisScore then
			ScoreboardFactionWidget2.Score0.Numbers:setText( Engine.Localize( axisScore ) )
		end
	end )
	ScoreboardFactionWidget2:subscribeToGlobalModel( controller, "Factions", "axisFactionDisplayName", function ( model )
		local axisFactionDisplayName = Engine.GetModelValue( model )
		if axisFactionDisplayName then
			ScoreboardFactionWidget2.ScoreboardFactionNameWidget.FactionName:setText( Engine.Localize( axisFactionDisplayName ) )
		end
	end )
	ScoreboardFactionWidget2:subscribeToGlobalModel( controller, "Factions", "axisFactionColor", function ( model )
		local axisFactionColor = Engine.GetModelValue( model )
		if axisFactionColor then
			ScoreboardFactionWidget2.FactionColor:setRGB( axisFactionColor )
		end
	end )
	self:addElement( ScoreboardFactionWidget2 )
	self.ScoreboardFactionWidget2 = ScoreboardFactionWidget2
	
	local ScoreboardHeaderWidget = CoD.ScoreboardHeaderWidget.new( menu, controller )
	ScoreboardHeaderWidget:setLeftRight( true, false, -25, 971 )
	ScoreboardHeaderWidget:setTopBottom( true, false, 0, 32 )
	self:addElement( ScoreboardHeaderWidget )
	self.ScoreboardHeaderWidget = ScoreboardHeaderWidget
	
	local ScoreboardWidgetButtonContainer = CoD.ScoreboardWidgetButtonContainer.new( menu, controller )
	ScoreboardWidgetButtonContainer:setLeftRight( true, false, -38, 407 )
	ScoreboardWidgetButtonContainer:setTopBottom( true, false, 504, 536 )
	self:addElement( ScoreboardWidgetButtonContainer )
	self.ScoreboardWidgetButtonContainer = ScoreboardWidgetButtonContainer
	
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
				ScoreboardWidgetButtonContainer:completeAnimation()
				self.ScoreboardWidgetButtonContainer:setAlpha( 0 )
				self.clipFinished( ScoreboardWidgetButtonContainer, {} )
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
				ScoreboardWidgetButtonContainer:completeAnimation()
				self.ScoreboardWidgetButtonContainer:setAlpha( 1 )
				self.clipFinished( ScoreboardWidgetButtonContainer, {} )
			end
		},
		ForceVisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
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
	ScoreboardWidgetButtonContainer:setModel( menu.buttonModel, controller )
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.ScoreboardFactionScoresList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ScoreboardFactionScoresList:close()
		element.ScoreboardFactionWidget1:close()
		element.ScoreboardFactionWidget2:close()
		element.ScoreboardHeaderWidget:close()
		element.ScoreboardWidgetButtonContainer:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

