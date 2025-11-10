require( "ui.uieditor.widgets.AAR.ScoreboardTab.AARScoreboardHeaderWidget" )
require( "ui.uieditor.widgets.Scoreboard.ScoreboardWidget" )
require( "ui.uieditor.widgets.AAR.ScoreboardTab.AARScoreboardRowWidget" )
require( "ui.uieditor.widgets.AAR.ScoreboardTab.NemesisWidget" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	local f1_local0 = Engine.GetCurrentTeamCount()
	local f1_local1 = {}
	local f1_local2 = 0
	for f1_local3 = 1, f1_local0, 1 do
		local f1_local6 = DataSources["ScoreboardTeam" .. f1_local3 .. "List"]
		if f1_local6 then
			local f1_local7 = Engine.GetModel( Engine.GetGlobalModel(), "scoreboard.team" .. f1_local3 )
			local f1_local8 = f1_local6.getCount( {
				scoreboardInfoModel = f1_local7
			} )
			if f1_local3 == 1 then
				f1_local2 = f1_local8
			end
			for f1_local9 = 1, f1_local8, 1 do
				table.insert( f1_local1, Engine.GetModelValue( Engine.GetModel( f1_local6.getItem( f1_arg1, {
					scoreboardInfoModel = f1_local7
				}, f1_local9 ), "clientNum" ) ) )
			end
		end
	end
	local f1_local3 = CoD.GetPlayerStats( f1_arg1 )
	local f1_local5 = string.gsub( f1_local3.AfterActionReportStats.nemesisName:get(), "%[.+%]", "" )
	local f1_local12 = 0
	for f1_local9, f1_local10 in ipairs( f1_local1 ) do
		if f1_local10 and GetScoreboardPlayerName( f1_arg1, f1_local10 ) == f1_local5 then
			f1_local12 = f1_local9
			break
		end
	end
	f1_local6 = 25
	f1_local7 = 1
	if f1_local12 ~= 0 and f1_local5 ~= "" then
		f1_local8 = 1 + (f1_local6 + f1_local7) * (f1_local12 + 1)
		if f1_local12 <= f1_local2 then
			f1_local8 = f1_local8 - 4
		end
		f1_arg0.NemesisWidget:setTopBottom( true, false, f1_local8, f1_local8 + 100 )
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
	
	local AARScoreboardHeaderWidget = CoD.AARScoreboardHeaderWidget.new( menu, controller )
	AARScoreboardHeaderWidget:setLeftRight( true, false, 71.5, 1049.5 )
	AARScoreboardHeaderWidget:setTopBottom( true, false, 24.5, 55.5 )
	self:addElement( AARScoreboardHeaderWidget )
	self.AARScoreboardHeaderWidget = AARScoreboardHeaderWidget
	
	local ScoreboardWidget = CoD.ScoreboardWidget.new( menu, controller )
	ScoreboardWidget:setLeftRight( true, false, 71.5, 1102.5 )
	ScoreboardWidget:setTopBottom( true, false, 24.5, 676.5 )
	ScoreboardWidget.ScoreboardFactionScoresList.Team1:setWidgetType( CoD.AARScoreboardRowWidget )
	ScoreboardWidget.ScoreboardFactionScoresList.Team2:setWidgetType( CoD.AARScoreboardRowWidget )
	ScoreboardWidget.ScoreboardHeaderWidget:setAlpha( 0 )
	self:addElement( ScoreboardWidget )
	self.ScoreboardWidget = ScoreboardWidget
	
	local NemesisWidget = CoD.NemesisWidget.new( menu, controller )
	NemesisWidget:setLeftRight( true, false, 1045, 1275 )
	NemesisWidget:setTopBottom( true, false, 389, 491 )
	self:addElement( NemesisWidget )
	self.NemesisWidget = NemesisWidget
	
	ScoreboardWidget.id = "ScoreboardWidget"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.ScoreboardWidget:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.AARScoreboardHeaderWidget:close()
		element.ScoreboardWidget:close()
		element.NemesisWidget:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

