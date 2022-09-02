-- 4e125a7c55a51a786a37d04c457fd4af
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.Killcam.KillcamHeader" )
require( "ui.uieditor.widgets.EndGameFlow.Top3PlayersScreenScoreWidget2" )
require( "ui.uieditor.widgets.EndGameFlow.Top3PlayersScreenScoreWidget1" )
require( "ui.uieditor.widgets.EndGameFlow.Top3PlayersScreenScoreWidget3" )
require( "ui.uieditor.widgets.EndGameFlow.KillcamWidgetFctnPnl" )
require( "ui.uieditor.widgets.HUD.Outcome.WinnerFactionInfo" )
require( "ui.uieditor.widgets.CharacterCustomization.tauntWidget" )

local PostLoadFunc = function ( self, controller, menu )
	self:subscribeToGlobalModel( controller, "PerController", "scriptNotify", function ( model )
		if IsParamModelEqualToString( model, "show_outcome" ) then
			local f2_local0 = CoD.GetScriptNotifyData( model )
			if f2_local0[4] == Enum.team_t.TEAM_BAD or HUD_IsFFA() then
				self.WinnerFactionInfo:close()
			end
		end
	end )
	self:subscribeToModel( Engine.CreateModel( Engine.GetModelForController( controller ), "displayTop3Players" ), function ( model )
		if Engine.GetModelValue( model ) == 1 then
			self.KillcamHeader.KillcamWidgetTitle0.KillcamText0:setText( Engine.Localize( "MENU_TOP_SCORERS_CAPS" ) )
			local f3_local0 = Engine.UpdateTopPlayerUIModels( controller )
			if f3_local0 < 3 or Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( controller ), "displayTopPlayer3" ) ) == 0 then
				self.Player3ScoreWidget:close()
			end
			if f3_local0 < 2 or Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( controller ), "displayTopPlayer2" ) ) == 0 then
				self.Player2ScoreWidget:close()
			end
			self:setAlpha( 1 )
			self:playClip( "DefaultClip" )
		end
	end )
end

local PreLoadFunc = function ( self, controller )
	Engine.UpdateTopPlayerUIModels( controller )
	local f4_local0 = 3
	for f4_local1 = 1, f4_local0, 1 do
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "displayTopPlayer" .. f4_local1 ), 0 )
	end
	Engine.SetModelValue( Engine.CreateModel( DataSources.TopScorerMenuData.getModel( controller ), "showGestures" ), false )
	self:subscribeToModel( Engine.CreateModel( Engine.GetModelForController( controller ), "forceScoreboard" ), function ( model )
		if Engine.GetModelValue( model ) == 1 then
			self:setAlpha( 0 )
		end
	end )
	local f4_local2 = Engine.GetModel( Engine.GetGlobalModel(), "factions" )
	if not f4_local2 then
		Engine.CreateModel( Engine.GetGlobalModel(), "factions" )
	end
	Engine.SetModelValue( Engine.CreateModel( f4_local2, "winnersFactionDisplayName" ), "" )
	Engine.SetModelValue( Engine.CreateModel( f4_local2, "winnersFactionIcon" ), "" )
end

CoD.Top3PlayersScreenWidget = InheritFrom( LUI.UIElement )
CoD.Top3PlayersScreenWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.Top3PlayersScreenWidget )
	self.id = "Top3PlayersScreenWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local KillcamHeader = CoD.KillcamHeader.new( menu, controller )
	KillcamHeader:setLeftRight( true, true, 0, 0 )
	KillcamHeader:setTopBottom( true, false, 0, 128 )
	KillcamHeader:mergeStateConditions( {
		{
			stateName = "Killcam",
			condition = function ( menu, element, event )
				local f7_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM )
				if f7_local0 then
					if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_NEMESIS_KILLCAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_FINAL_KILLCAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM ) then
						f7_local0 = AlwaysFalse()
					else
						f7_local0 = false
					end
				end
				return f7_local0
			end
		},
		{
			stateName = "FinalKillcam",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_FINAL_KILLCAM ) and AlwaysFalse()
			end
		},
		{
			stateName = "RoundEndingKillcam",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM ) and AlwaysFalse()
			end
		},
		{
			stateName = "NemesisKillcam",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_NEMESIS_KILLCAM ) and AlwaysFalse()
			end
		}
	} )
	KillcamHeader:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM ), function ( model )
		menu:updateElementState( KillcamHeader, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM
		} )
	end )
	KillcamHeader:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_NEMESIS_KILLCAM ), function ( model )
		menu:updateElementState( KillcamHeader, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_NEMESIS_KILLCAM
		} )
	end )
	KillcamHeader:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_FINAL_KILLCAM ), function ( model )
		menu:updateElementState( KillcamHeader, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_FINAL_KILLCAM
		} )
	end )
	KillcamHeader:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM ), function ( model )
		menu:updateElementState( KillcamHeader, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM
		} )
	end )
	self:addElement( KillcamHeader )
	self.KillcamHeader = KillcamHeader
	
	local Player2ScoreWidget = CoD.Top3PlayersScreenScoreWidget2.new( menu, controller )
	Player2ScoreWidget:setLeftRight( false, false, -499.33, -224.33 )
	Player2ScoreWidget:setTopBottom( false, true, -176.35, -72.35 )
	Player2ScoreWidget:subscribeToGlobalModel( controller, "TopScorerMenuData", "2", function ( model )
		Player2ScoreWidget:setModel( model, controller )
	end )
	self:addElement( Player2ScoreWidget )
	self.Player2ScoreWidget = Player2ScoreWidget
	
	local Player1ScoreWidget = CoD.Top3PlayersScreenScoreWidget1.new( menu, controller )
	Player1ScoreWidget:setLeftRight( false, false, -137.5, 137.5 )
	Player1ScoreWidget:setTopBottom( false, true, -144.35, -45.35 )
	Player1ScoreWidget:subscribeToGlobalModel( controller, "TopScorerMenuData", "1", function ( model )
		Player1ScoreWidget:setModel( model, controller )
	end )
	self:addElement( Player1ScoreWidget )
	self.Player1ScoreWidget = Player1ScoreWidget
	
	local Player3ScoreWidget = CoD.Top3PlayersScreenScoreWidget3.new( menu, controller )
	Player3ScoreWidget:setLeftRight( false, false, 224.47, 499.47 )
	Player3ScoreWidget:setTopBottom( false, true, -176.35, -72.35 )
	Player3ScoreWidget:subscribeToGlobalModel( controller, "TopScorerMenuData", "3", function ( model )
		Player3ScoreWidget:setModel( model, controller )
	end )
	self:addElement( Player3ScoreWidget )
	self.Player3ScoreWidget = Player3ScoreWidget
	
	local KillcamWidgetFctnPnl0 = CoD.KillcamWidgetFctnPnl.new( menu, controller )
	KillcamWidgetFctnPnl0:setLeftRight( true, false, 0, 400 )
	KillcamWidgetFctnPnl0:setTopBottom( true, false, 0, 200 )
	KillcamWidgetFctnPnl0:setRGB( 0.4, 0.4, 0.4 )
	self:addElement( KillcamWidgetFctnPnl0 )
	self.KillcamWidgetFctnPnl0 = KillcamWidgetFctnPnl0
	
	local WinnerFactionInfo = CoD.WinnerFactionInfo.new( menu, controller )
	WinnerFactionInfo:setLeftRight( true, false, 0, 390 )
	WinnerFactionInfo:setTopBottom( true, false, 0, 180 )
	WinnerFactionInfo.KillcamWidgetTitleStatus0.SubTitle:setText( Engine.Localize( "MENU_WINNERS_CAPS" ) )
	WinnerFactionInfo:subscribeToGlobalModel( controller, "FactionsGlobal", "winnersFactionDisplayName", function ( model )
		local winnersFactionDisplayName = Engine.GetModelValue( model )
		if winnersFactionDisplayName then
			WinnerFactionInfo.WeaponNameWidget0.weaponNameLabel:setText( Engine.Localize( winnersFactionDisplayName ) )
		end
	end )
	WinnerFactionInfo:subscribeToGlobalModel( controller, "FactionsGlobal", "winnersFactionIcon", function ( model )
		local winnersFactionIcon = Engine.GetModelValue( model )
		if winnersFactionIcon then
			WinnerFactionInfo.OutcomeFactionIcon.OutcomeFactionIconItem.WinningTeamFactionIcon0:setImage( RegisterImage( winnersFactionIcon ) )
		end
	end )
	WinnerFactionInfo:subscribeToGlobalModel( controller, "FactionsGlobal", "winnersFactionIcon", function ( model )
		local winnersFactionIcon = Engine.GetModelValue( model )
		if winnersFactionIcon then
			WinnerFactionInfo.OutcomeFactionIcon.OutcomeFactionIconItem.WinningTeamFactionIcon:setImage( RegisterImage( winnersFactionIcon ) )
		end
	end )
	WinnerFactionInfo:subscribeToGlobalModel( controller, "FactionsGlobal", "winnersFactionIcon", function ( model )
		local winnersFactionIcon = Engine.GetModelValue( model )
		if winnersFactionIcon then
			WinnerFactionInfo.OutcomeFactionIcon.OutcomeFactionIconItemForCodCaster.WinningTeamFactionIcon0:setImage( RegisterImage( winnersFactionIcon ) )
		end
	end )
	WinnerFactionInfo:subscribeToGlobalModel( controller, "FactionsGlobal", "winnersFactionIcon", function ( model )
		local winnersFactionIcon = Engine.GetModelValue( model )
		if winnersFactionIcon then
			WinnerFactionInfo.OutcomeFactionIcon.OutcomeFactionIconItemForCodCaster.WinningTeamFactionIcon:setImage( RegisterImage( winnersFactionIcon ) )
		end
	end )
	self:addElement( WinnerFactionInfo )
	self.WinnerFactionInfo = WinnerFactionInfo
	
	local gesturesOn = CoD.tauntWidget.new( menu, controller )
	gesturesOn:setLeftRight( false, true, -272.22, -64 )
	gesturesOn:setTopBottom( true, false, 14, 140 )
	gesturesOn:setScale( 0.85 )
	gesturesOn:linkToElementModel( self, nil, false, function ( model )
		gesturesOn:setModel( model, controller )
	end )
	self:addElement( gesturesOn )
	self.gesturesOn = gesturesOn
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

				local KillcamHeaderFrame2 = function ( KillcamHeader, event )
					if not event.interrupted then
						KillcamHeader:beginAnimation( "keyframe", 620, false, true, CoD.TweenType.Linear )
					end
					KillcamHeader:setLeftRight( true, true, 0, 0 )
					KillcamHeader:setTopBottom( true, false, 0, 128 )
					KillcamHeader:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( KillcamHeader, event )
					else
						KillcamHeader:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				KillcamHeader:completeAnimation()
				self.KillcamHeader:setLeftRight( true, true, 0, 0 )
				self.KillcamHeader:setTopBottom( true, false, -64, 64 )
				self.KillcamHeader:setAlpha( 0 )
				KillcamHeaderFrame2( KillcamHeader, {} )
				local Player2ScoreWidgetFrame2 = function ( Player2ScoreWidget, event )
					local Player2ScoreWidgetFrame3 = function ( Player2ScoreWidget, event )
						if not event.interrupted then
							Player2ScoreWidget:beginAnimation( "keyframe", 499, false, true, CoD.TweenType.Linear )
						end
						Player2ScoreWidget:setLeftRight( false, false, -499.33, -224.33 )
						Player2ScoreWidget:setTopBottom( false, true, -176.35, -72.35 )
						Player2ScoreWidget:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Player2ScoreWidget, event )
						else
							Player2ScoreWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Player2ScoreWidgetFrame3( Player2ScoreWidget, event )
						return 
					else
						Player2ScoreWidget:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
						Player2ScoreWidget:registerEventHandler( "transition_complete_keyframe", Player2ScoreWidgetFrame3 )
					end
				end
				
				Player2ScoreWidget:completeAnimation()
				self.Player2ScoreWidget:setLeftRight( false, false, -499.33, -224.33 )
				self.Player2ScoreWidget:setTopBottom( false, true, -211.35, -107.35 )
				self.Player2ScoreWidget:setAlpha( 0 )
				Player2ScoreWidgetFrame2( Player2ScoreWidget, {} )
				local Player1ScoreWidgetFrame2 = function ( Player1ScoreWidget, event )
					if not event.interrupted then
						Player1ScoreWidget:beginAnimation( "keyframe", 500, false, true, CoD.TweenType.Linear )
					end
					Player1ScoreWidget:setLeftRight( false, false, -137.5, 137.5 )
					Player1ScoreWidget:setTopBottom( false, true, -144.35, -45.35 )
					Player1ScoreWidget:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Player1ScoreWidget, event )
					else
						Player1ScoreWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Player1ScoreWidget:completeAnimation()
				self.Player1ScoreWidget:setLeftRight( false, false, -137.5, 137.5 )
				self.Player1ScoreWidget:setTopBottom( false, true, -179.35, -80.35 )
				self.Player1ScoreWidget:setAlpha( 0 )
				Player1ScoreWidgetFrame2( Player1ScoreWidget, {} )
				local Player3ScoreWidgetFrame2 = function ( Player3ScoreWidget, event )
					local Player3ScoreWidgetFrame3 = function ( Player3ScoreWidget, event )
						if not event.interrupted then
							Player3ScoreWidget:beginAnimation( "keyframe", 500, false, true, CoD.TweenType.Linear )
						end
						Player3ScoreWidget:setLeftRight( false, false, 224.47, 499.47 )
						Player3ScoreWidget:setTopBottom( false, true, -176.35, -72.35 )
						Player3ScoreWidget:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Player3ScoreWidget, event )
						else
							Player3ScoreWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Player3ScoreWidgetFrame3( Player3ScoreWidget, event )
						return 
					else
						Player3ScoreWidget:beginAnimation( "keyframe", 469, false, false, CoD.TweenType.Linear )
						Player3ScoreWidget:registerEventHandler( "transition_complete_keyframe", Player3ScoreWidgetFrame3 )
					end
				end
				
				Player3ScoreWidget:completeAnimation()
				self.Player3ScoreWidget:setLeftRight( false, false, 224.47, 499.47 )
				self.Player3ScoreWidget:setTopBottom( false, true, -211.35, -107.35 )
				self.Player3ScoreWidget:setAlpha( 0 )
				Player3ScoreWidgetFrame2( Player3ScoreWidget, {} )
				local KillcamWidgetFctnPnl0Frame2 = function ( KillcamWidgetFctnPnl0, event )
					if not event.interrupted then
						KillcamWidgetFctnPnl0:beginAnimation( "keyframe", 839, false, false, CoD.TweenType.Linear )
					end
					KillcamWidgetFctnPnl0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( KillcamWidgetFctnPnl0, event )
					else
						KillcamWidgetFctnPnl0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				KillcamWidgetFctnPnl0:completeAnimation()
				self.KillcamWidgetFctnPnl0:setAlpha( 0 )
				KillcamWidgetFctnPnl0Frame2( KillcamWidgetFctnPnl0, {} )
				local WinnerFactionInfoFrame2 = function ( WinnerFactionInfo, event )
					local WinnerFactionInfoFrame3 = function ( WinnerFactionInfo, event )
						if not event.interrupted then
							WinnerFactionInfo:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Bounce )
						end
						WinnerFactionInfo:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( WinnerFactionInfo, event )
						else
							WinnerFactionInfo:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						WinnerFactionInfoFrame3( WinnerFactionInfo, event )
						return 
					else
						WinnerFactionInfo:beginAnimation( "keyframe", 519, false, false, CoD.TweenType.Linear )
						WinnerFactionInfo:registerEventHandler( "transition_complete_keyframe", WinnerFactionInfoFrame3 )
					end
				end
				
				WinnerFactionInfo:completeAnimation()
				self.WinnerFactionInfo:setAlpha( 0 )
				WinnerFactionInfoFrame2( WinnerFactionInfo, {} )
			end
		}
	}
	self:subscribeToGlobalModel( controller, "TopScorerMenuData", "showGestures", function ( model )
		local f34_local0 = self
		if IsParamModelEqualTo( model, true ) then
			CallCustomElementFunction_Self( self, "showGestures", model )
		end
	end )
	KillcamHeader.id = "KillcamHeader"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.KillcamHeader:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.KillcamHeader:close()
		element.Player2ScoreWidget:close()
		element.Player1ScoreWidget:close()
		element.Player3ScoreWidget:close()
		element.KillcamWidgetFctnPnl0:close()
		element.WinnerFactionInfo:close()
		element.gesturesOn:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

