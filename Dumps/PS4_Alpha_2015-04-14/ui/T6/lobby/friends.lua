require( "ui.uieditor.menus.Spinner" )
require( "ui.uieditor.menus.Lobby.Common.Popups.LobbyErrorPopup" )
require( "ui.uieditor.menus.Lobby.Common.Popups.LobbyLeavePopup" )
require( "ui.T6.Options" )

CoD.Friends = {}
CoD.Friends.GetRootUIModel = function ( controller )
	local friendsModel = Engine.GetModel( Engine.GetGlobalModel(), "unifiedListRoot" )
	return friendsModel
end

CoD.Friends.GetCountUIModel = function ( controller )
	local rootFriendsModel = CoD.Friends.GetRootUIModel( controller )
	local friendsCountModel = Engine.GetModel( rootFriendsModel, "count" )
	return friendsCountModel
end

CoD.Friends.GetUpdateUIModel = function ( controller )
	local rootFriendsModel = CoD.Friends.GetRootUIModel( controller )
	local updateModel = Engine.GetModel( rootFriendsModel, "update" )
	return updateModel
end

CoD.Friends.GetItemUIModel = function ( friendsModelRoot, index )
	return Engine.GetModel( friendsModelRoot, "member" .. index - 1 )
end

CoD.Friends.GetCount = function ( controller )
	local friendsModel = Engine.GetModel( Engine.GetGlobalModel(), "unifiedListRoot" )
	local friendsCountModel = Engine.GetModel( friendsModel, "count" )
	local count = Engine.GetModelValue( friendsCountModel )
	return count
end

