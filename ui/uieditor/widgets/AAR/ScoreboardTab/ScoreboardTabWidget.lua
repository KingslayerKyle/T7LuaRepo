-- 4deda420e40f731a6ed30dfe176b2541
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.AAR.ScoreboardTab.AARScoreboardHeaderWidget" )
require( "ui.uieditor.widgets.Scoreboard.ScoreboardWidget" )
require( "ui.uieditor.widgets.AAR.ScoreboardTab.AARScoreboardRowWidget" )
require( "ui.uieditor.widgets.AAR.ScoreboardTab.NemesisWidget" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	local f1_local0 = Engine.GetCurrentTeamCount()
	local f1_local1 = CoD.GetPlayerStats( f1_arg1 )
	local f1_local2 = string.gsub( f1_local1.AfterActionReportStats.nemesisName:get(), "%[.+%]", "" )
	local f1_local3 = false
	if f1_local2 ~= "" then
		local f1_local4 = IsTeamBasedOrInfect( f1_arg1 )
		for f1_local5 = 1, f1_local0, 1 do
			local f1_local8 = DataSources["ScoreboardTeam" .. f1_local5 .. "List"]
			if f1_local8 then
				local f1_local9 = Engine.GetModel( Engine.GetGlobalModel(), "scoreboard.team" .. f1_local5 )
				local f1_local10 = f1_local8.getCount( {
					scoreboardInfoModel = f1_local9
				} )
				for f1_local11 = 1, f1_local10, 1 do
					local f1_local14 = Engine.GetModelValue( Engine.GetModel( f1_local8.getItem( f1_arg1, {
						scoreboardInfoModel = f1_local9
					}, f1_local11 ), "clientNum" ) )
					if GetScoreboardPlayerName( f1_arg1, f1_local14 ) == f1_local2 then
						local f1_local15 = nil
						local f1_local16 = function ( f2_arg0, f2_arg1 )
							local f2_local0 = LUI.getTableFromPath( "ScoreboardWidget.ScoreboardFactionScoresList.Team" .. f2_arg0, f1_arg0 )
							if not f2_local0 then
								Engine.PrintWarning( Enum.consoleLabel.LABEL_LUI, "WARNING: Could not find scoreboard team list, nemesis widget will not be created." )
								return nil
							else
								return f2_local0:findItem( {
									clientNum = f2_arg1
								} )
							end
						end
						
						if f1_local4 then
							f1_local15 = f1_local16( f1_local5, f1_local14 )
						else
							f1_local15 = f1_local16( 1, f1_local14 )
						end
						if f1_local15 then
							f1_local3 = true
							f1_arg0:removeElement( f1_arg0.NemesisWidget )
							f1_arg0.NemesisWidget:setLeftRight( false, true, 2, 2 )
							f1_arg0.NemesisWidget:setTopBottom( false, false, 0, 0 )
							f1_local15:addElement( f1_arg0.NemesisWidget )
						end
					end
				end
			end
		end
	end
	if not f1_local3 then
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
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.ScoreboardWidget:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
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

