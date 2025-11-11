require( "lua.Shared.LuaEnum" )
require( "ui.utility.OverlayUtility" )

CoD.AnalyticsUtility = {}
CoD.AnalyticsUtility.SurveyResult = LuaEnum.createEnum( "SkipBack", "SkipRead", "No", "Yes" )
CoD.AnalyticsUtility.RecordPostMatchSurveyResult = function ( controller, surveyResult )
	local data = {
		surveyId = 1
	}
	local survey = CoD.AnalyticsUtility.Surveys[data.surveyId]
	data.result = surveyResult
	local f1_local0 = CoD.GetPlayerStats( controller )
	local afterActionReportStats = f1_local0.AfterActionReportStats
	data.matchId = afterActionReportStats.demoFileId:get()
	data.buttons = survey.order[1] .. survey.order[2] .. survey.order[3]
	LuaUtils.LogClientTrack( "postmatch_survey", data )
	LuaUtils.FlushClientTrack()
end

CoD.AnalyticsUtility.shuffle = function ( t )
	local n = #t
	while 2 <= n do
		local k = math.random( n )
		local f2_local0 = t[k]
		t[k] = t[n]
		t[n] = f2_local0
		n = n - 1
	end
	return t
end

CoD.AnalyticsUtility.Surveys = {}
CoD.AnalyticsUtility.Surveys[1] = {
	buttons = {
		{
			models = {
				displayText = "MENU_SKIP_CAPS1"
			},
			properties = {
				action = function ( self, element, controller, actionParam, menu )
					CoD.AnalyticsUtility.RecordPostMatchSurveyResult( controller, CoD.AnalyticsUtility.SurveyResult.SkipRead )
					GoBack( self, controller )
				end
			}
		},
		{
			models = {
				displayText = "MENU_YES_CAPS"
			},
			properties = {
				action = function ( self, element, controller, actionParam, menu )
					CoD.AnalyticsUtility.RecordPostMatchSurveyResult( controller, CoD.AnalyticsUtility.SurveyResult.Yes )
					GoBack( self, controller )
				end
			}
		},
		{
			models = {
				displayText = "MENU_NO_CAPS"
			},
			properties = {
				action = function ( self, element, controller, actionParam, menu )
					CoD.AnalyticsUtility.RecordPostMatchSurveyResult( controller, CoD.AnalyticsUtility.SurveyResult.No )
					GoBack( self, controller )
				end
			}
		}
	},
	order = CoD.AnalyticsUtility.shuffle( {
		1,
		2,
		3
	} )
}
CoD.AnalyticsUtility.GoBack = function ()
	return function ( self, element, controller, menu )
		CoD.AnalyticsUtility.RecordPostMatchSurveyResult( controller, CoD.AnalyticsUtility.SurveyResult.SkipBack )
		GoBack( menu, controller )
	end
	
end

CoD.OverlayUtility.AddSystemOverlay( "PostMatchSurvey", {
	menuName = "SystemOverlay_Full",
	title = "MENU_SURVEY_1",
	description = "MENU_SURVEY_INTRO",
	image = "",
	categoryType = CoD.OverlayUtility.OverlayTypes.Connection,
	[CoD.OverlayUtility.GoBackPropertyName] = CoD.AnalyticsUtility.GoBack,
	listDatasource = function ()
		DataSources.PostMatchSurveyButtons = DataSourceHelpers.ListSetup( "PostMatchSurveyButtons", function ( controller )
			local r = {}
			local survey = CoD.AnalyticsUtility.Surveys[1]
			local order = survey.order
			for i = 1, #order, 1 do
				r[i] = survey.buttons[order[i]]
			end
			return r
		end, true, nil )
		return "PostMatchSurveyButtons"
	end
} )
