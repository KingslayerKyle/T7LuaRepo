require( "ui.uieditor.widgets.AAR.ScoreboardTab.AARScoreboardHeaderWidget" )
require( "ui.uieditor.widgets.AAR.ScoreboardTab.AARScoreboardRowWidget" )
require( "ui.uieditor.widgets.AAR.ScoreboardTab.NemesisWidget" )
require( "ui.uieditor.widgets.Scoreboard.ScoreboardWidget" )

local PostLoadFunc = function ( self, controller )
	local teamCount = Engine.GetCurrentTeamCount()
	local teamsCombined = {}
	local team1RowCount = 0
	for teamIndex = 1, teamCount, 1 do
		local datasourceTable = DataSources["ScoreboardTeam" .. teamIndex .. "List"]
		if datasourceTable then
			local scoreboardInfoModel = Engine.GetModel( Engine.GetGlobalModel(), "scoreboard.team" .. teamIndex )
			local count = datasourceTable.getCount( {
				scoreboardInfoModel = scoreboardInfoModel
			} )
			if teamIndex == 1 then
				team1RowCount = count
			end
			for i = 1, count, 1 do
				local item = datasourceTable.getItem( controller, {
					scoreboardInfoModel = scoreboardInfoModel
				}, i )
				local clientNum = Engine.GetModelValue( Engine.GetModel( item, "clientNum" ) )
				table.insert( teamsCombined, clientNum )
			end
		end
	end
	local currentStats = CoD.GetPlayerStats( controller )
	local aarStats = currentStats.AfterActionReportStats
	local nemesisName = aarStats.nemesisName:get()
	nemesisName = string.gsub( nemesisName, "%[.+%]", "" )
	local rowNum = 0
	for index, f1_local2 in ipairs( teamsCombined ) do
		if f1_local2 and GetScoreboardPlayerName( controller, f1_local2 ) == nemesisName then
			rowNum = index
			break
		end
	end
	local rowHeight = 25
	local spacing = 1
	if rowNum ~= 0 and nemesisName ~= "" then
		local nemesisWidgetTop = 1 + (rowHeight + spacing) * (rowNum + 1)
		if rowNum <= team1RowCount then
			nemesisWidgetTop = nemesisWidgetTop - 4
		end
		self.NemesisWidget:setTopBottom( true, false, nemesisWidgetTop, nemesisWidgetTop + 100 )
	else
		self.NemesisWidget:close()
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
	self:setLeftRight( 0, 0, 0, 1920 )
	self:setTopBottom( 0, 0, 0, 789 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local AARScoreboardHeaderWidget = CoD.AARScoreboardHeaderWidget.new( menu, controller )
	AARScoreboardHeaderWidget:setLeftRight( 0, 0, 107, 1574 )
	AARScoreboardHeaderWidget:setTopBottom( 0, 0, 37, 83 )
	AARScoreboardHeaderWidget.GametypeAndMapName:setText( Engine.Localize( "MENU_SCOREBOARD_HEADER" ) )
	self:addElement( AARScoreboardHeaderWidget )
	self.AARScoreboardHeaderWidget = AARScoreboardHeaderWidget
	
	local ScoreboardWidget = CoD.ScoreboardWidget.new( menu, controller )
	ScoreboardWidget:setLeftRight( 0, 0, 107, 1653 )
	ScoreboardWidget:setTopBottom( 0, 0, 37, 1015 )
	ScoreboardWidget.ScoreboardFactionScoresList.Team1:setWidgetType( CoD.AARScoreboardRowWidget )
	ScoreboardWidget.ScoreboardFactionScoresList.Team2:setWidgetType( CoD.AARScoreboardRowWidget )
	ScoreboardWidget.ScoreboardHeaderWidget:setAlpha( 0 )
	self:addElement( ScoreboardWidget )
	self.ScoreboardWidget = ScoreboardWidget
	
	local NemesisWidget = CoD.NemesisWidget.new( menu, controller )
	NemesisWidget:setLeftRight( 0, 0, 1567, 1912 )
	NemesisWidget:setTopBottom( 0, 0, 583.5, 736.5 )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.AARScoreboardHeaderWidget:close()
		self.ScoreboardWidget:close()
		self.NemesisWidget:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

