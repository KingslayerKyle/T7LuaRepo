-- ab26384f5148ef39e63b7c918cebd7d4
-- This hash is used for caching, delete to decompile the file again

require( "lua.Shared.LuaEnums" )
require( "ui.T7.Utility.OverlayUtility" )

CoD.AnalyticsUtility = {}
CoD.AnalyticsUtility.SurveyResult = LuaEnums.createEnum( "SkipBack", "SkipRead", "No", "Yes" )
function RecordPostMatchSurveyResult( f1_arg0, f1_arg1 )
	local f1_local0 = {
		surveyId = 1
	}
	local f1_local1 = CoD.AnalyticsUtility.Surveys[f1_local0.surveyId]
	f1_local0.result = f1_arg1
	local f1_local2 = CoD.GetPlayerStats( f1_arg0 )
	f1_local0.matchId = f1_local2.AfterActionReportStats.demoFileId:get()
	f1_local0.buttons = f1_local1.order[1] .. f1_local1.order[2] .. f1_local1.order[3]
	LuaUtils.LogClientTrack( "postmatch_survey", f1_local0 )
	LuaUtils.FlushClientTrack()
end

function shuffle( f2_arg0 )
	local f2_local0 = #f2_arg0
	while 2 <= f2_local0 do
		local f2_local1 = math.random( f2_local0 )
		local f2_local2 = f2_arg0[f2_local1]
		f2_arg0[f2_local1] = f2_arg0[f2_local0]
		f2_arg0[f2_local0] = f2_local2
		f2_local0 = f2_local0 - 1
	end
	return f2_arg0
end

CoD.AnalyticsUtility.Surveys = {}
CoD.AnalyticsUtility.Surveys[1] = {
	buttons = {
		{
			models = {
				displayText = "MENU_SKIP_CAPS1"
			},
			properties = {
				action = function ( f3_arg0, f3_arg1, f3_arg2, f3_arg3, f3_arg4 )
					RecordPostMatchSurveyResult( f3_arg2, CoD.AnalyticsUtility.SurveyResult.SkipRead )
					GoBack( f3_arg0, f3_arg2 )
				end
			}
		},
		{
			models = {
				displayText = "MENU_YES_CAPS"
			},
			properties = {
				action = function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3, f4_arg4 )
					RecordPostMatchSurveyResult( f4_arg2, CoD.AnalyticsUtility.SurveyResult.Yes )
					GoBack( f4_arg0, f4_arg2 )
				end
			}
		},
		{
			models = {
				displayText = "MENU_NO_CAPS"
			},
			properties = {
				action = function ( f5_arg0, f5_arg1, f5_arg2, f5_arg3, f5_arg4 )
					RecordPostMatchSurveyResult( f5_arg2, CoD.AnalyticsUtility.SurveyResult.No )
					GoBack( f5_arg0, f5_arg2 )
				end
			}
		}
	},
	order = shuffle( {
		1,
		2,
		3
	} )
}
CoD.AnalyticsUtility.GoBack = function ()
	return function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3 )
		RecordPostMatchSurveyResult( f7_arg2, CoD.AnalyticsUtility.SurveyResult.SkipBack )
		GoBack( f7_arg3, f7_arg2 )
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
		DataSources.PostMatchSurveyButtons = DataSourceHelpers.ListSetup( "PostMatchSurveyButtons", function ( f9_arg0 )
			local f9_local0 = {}
			local f9_local1 = CoD.AnalyticsUtility.Surveys[1]
			local f9_local2 = f9_local1.order
			for f9_local3 = 1, #f9_local2, 1 do
				f9_local0[f9_local3] = f9_local1.buttons[f9_local2[f9_local3]]
			end
			return f9_local0
		end, true, nil )
		return "PostMatchSurveyButtons"
	end
} )
