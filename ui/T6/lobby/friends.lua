-- c29c6ca251c0ed6636b71d652b8580a1
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.menus.Spinner" )

CoD.Friends = {}
CoD.Friends.GetRootUIModel = function ( f1_arg0 )
	return Engine.GetModel( Engine.GetGlobalModel(), "unifiedListRoot" )
end

CoD.Friends.GetCountUIModel = function ( f2_arg0 )
	return Engine.GetModel( CoD.Friends.GetRootUIModel( f2_arg0 ), "count" )
end

CoD.Friends.GetUpdateUIModel = function ( f3_arg0 )
	return Engine.GetModel( CoD.Friends.GetRootUIModel( f3_arg0 ), "update" )
end

CoD.Friends.GetItemUIModel = function ( f4_arg0, f4_arg1 )
	return Engine.GetModel( f4_arg0, "member" .. f4_arg1 - 1 )
end

CoD.Friends.GetCount = function ( f5_arg0 )
	return Engine.GetModelValue( Engine.GetModel( Engine.GetModel( Engine.GetGlobalModel(), "unifiedListRoot" ), "count" ) )
end

