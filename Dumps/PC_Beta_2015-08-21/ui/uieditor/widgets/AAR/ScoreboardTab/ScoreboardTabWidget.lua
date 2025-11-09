require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_VignetteBack" )
require( "ui.uieditor.widgets.AAR.ScoreboardTab.AARScoreboardHeaderWidget" )
require( "ui.uieditor.widgets.Scoreboard.ScoreboardWidget" )
require( "ui.uieditor.widgets.AAR.ScoreboardTab.AARScoreboardRowWidget" )
require( "ui.uieditor.widgets.AAR.ScoreboardTab.NemesisWidget" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	local f1_local0 = Engine.GetCurrentTeamCount()
	local f1_local1 = {}
	for f1_local2 = 1, f1_local0, 1 do
		local f1_local5 = DataSources["ScoreboardTeam" .. f1_local2 .. "List"]
		if f1_local5 then
			local f1_local6 = Engine.GetModel( Engine.GetGlobalModel(), "scoreboard.team" .. f1_local2 )
			local f1_local7 = f1_local5.getCount( {
				scoreboardInfoModel = f1_local6
			} )
			for f1_local8 = 1, f1_local7, 1 do
				table.insert( f1_local1, Engine.GetModelValue( Engine.GetModel( f1_local5.getItem( f1_arg1, {
					scoreboardInfoModel = f1_local6
				}, f1_local8 ), "clientNum" ) ) )
			end
		end
	end
	local f1_local2 = CoD.GetPlayerStats( f1_arg1 )
	local f1_local4 = string.gsub( f1_local2.AfterActionReportStats.nemesisName:get(), "%[.+%]", "" )
	local f1_local11 = 0
	for f1_local8, f1_local9 in ipairs( f1_local1 ) do
		if f1_local9 and GetScoreboardPlayerName( f1_arg1, f1_local9 ) == f1_local4 then
			f1_local11 = f1_local8
			break
		end
	end
	f1_local5 = 25
	f1_local6 = 2
	if f1_local11 ~= 0 and f1_local4 ~= "" then
		f1_local7 = (f1_local5 + f1_local6) * f1_local11
		f1_arg0.NemesisWidget:setTopBottom( true, false, f1_local7, f1_local7 + 100 )
	else
		f1_arg0.NemesisWidget:close()
	end
end

local PreLoadFunc = function ( self, controller )
	CoD.ScoreboardUtility.SetScoreboardUIModels( controller )
end

CoD.ScoreboardTabWidget = InheritFrom( LUI.UIElement )
CoD.ScoreboardTabWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ScoreboardTabWidget )
	self.id = "ScoreboardTabWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 526 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local VignetteBack = CoD.VehicleGround_VignetteBack.new( menu, controller )
	VignetteBack:setLeftRight( true, false, 0, 1280 )
	VignetteBack:setTopBottom( true, false, -94.37, 625.63 )
	self:addElement( VignetteBack )
	self.VignetteBack = VignetteBack
	
	local AARScoreboardHeaderWidget = CoD.AARScoreboardHeaderWidget.new( menu, controller )
	AARScoreboardHeaderWidget:setLeftRight( true, false, 67, 1017 )
	AARScoreboardHeaderWidget:setTopBottom( true, false, 7.5, 34.5 )
	AARScoreboardHeaderWidget:setAlpha( 0 )
	self:addElement( AARScoreboardHeaderWidget )
	self.AARScoreboardHeaderWidget = AARScoreboardHeaderWidget
	
	local ScoreboardWidget0 = CoD.ScoreboardWidget.new( menu, controller )
	ScoreboardWidget0:setLeftRight( true, false, 67, 1047 )
	ScoreboardWidget0:setTopBottom( true, false, 4, 656 )
	ScoreboardWidget0.ScoreboardFactionScoresList.Team1:setWidgetType( CoD.AARScoreboardRowWidget )
	ScoreboardWidget0.ScoreboardFactionScoresList.Team2:setWidgetType( CoD.AARScoreboardRowWidget )
	ScoreboardWidget0:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	ScoreboardWidget0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "forceScoreboard" ), function ( model )
		menu:updateElementState( ScoreboardWidget0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "forceScoreboard"
		} )
	end )
	self:addElement( ScoreboardWidget0 )
	self.ScoreboardWidget0 = ScoreboardWidget0
	
	local NemesisWidget = CoD.NemesisWidget.new( menu, controller )
	NemesisWidget:setLeftRight( true, false, 1020, 1250 )
	NemesisWidget:setTopBottom( true, false, 372, 474 )
	self:addElement( NemesisWidget )
	self.NemesisWidget = NemesisWidget
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local VignetteBackFrame2 = function ( VignetteBack, event )
					if not event.interrupted then
						VignetteBack:beginAnimation( "keyframe", 519, false, false, CoD.TweenType.Linear )
					end
					VignetteBack:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( VignetteBack, event )
					else
						VignetteBack:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				VignetteBack:completeAnimation()
				self.VignetteBack:setAlpha( 0 )
				VignetteBackFrame2( VignetteBack, {} )
			end
		}
	}
	ScoreboardWidget0.id = "ScoreboardWidget0"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.ScoreboardWidget0:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.VignetteBack:close()
		element.AARScoreboardHeaderWidget:close()
		element.ScoreboardWidget0:close()
		element.NemesisWidget:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

