require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_VignetteBack" )
require( "ui.uieditor.widgets.AAR.ScoreboardTab.AARScoreboardHeaderWidget" )
require( "ui.uieditor.widgets.Scoreboard.ScoreboardWidget" )
require( "ui.uieditor.widgets.AAR.ScoreboardTab.AARScoreboardRowWidget" )
require( "ui.uieditor.widgets.AAR.ScoreboardTab.NemesisWidget" )

local PostLoadFunc = function ( self, controller )
	local teamCount = Engine.GetCurrentTeamCount()
	local teamsCombined = {}
	for teamIndex = 1, teamCount, 1 do
		local datasourceTable = DataSources["ScoreboardTeam" .. teamIndex .. "List"]
		if datasourceTable then
			local scoreboardInfoModel = Engine.GetModel( Engine.GetGlobalModel(), "scoreboard.team" .. teamIndex )
			local count = datasourceTable.getCount( {
				scoreboardInfoModel = scoreboardInfoModel
			} )
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
	local spacing = 2
	if rowNum ~= 0 and nemesisName ~= "" then
		local nemesisWidgetTop = (rowHeight + spacing) * rowNum
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.VignetteBack:close()
		self.AARScoreboardHeaderWidget:close()
		self.ScoreboardWidget0:close()
		self.NemesisWidget:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

