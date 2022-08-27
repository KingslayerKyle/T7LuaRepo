-- c480c7408f049d2119cbb7c4368e28ac
-- This hash is used for caching, delete to decompile the file again

require( "ui.T6.CategoryButton" )

CoD.PlaylistButton = {}
CoD.PlaylistButton.Action = function ( f1_arg0, f1_arg1 )
	if f1_arg0.actionEventName ~= nil then
		if f1_arg0.itemInfo.loadName == nil or Engine.IsChunkInstalledByFileName( f1_arg0.itemInfo.loadName ) then
			f1_arg0:dispatchEventToParent( {
				name = f1_arg0.actionEventName,
				controller = f1_arg1.controller,
				itemInfo = f1_arg0.itemInfo,
				listIndex = f1_arg0.listIndex,
				category = f1_arg0.category
			} )
		else
			Engine.PrefetchByFileName( f1_arg0.itemInfo.loadName )
		end
	end
end

CoD.PlaylistButton.new = function ( f2_arg0, f2_arg1, f2_arg2, f2_arg3, f2_arg4, f2_arg5, f2_arg6 )
	local f2_local0 = CoD.CategoryButton.new( f2_arg0, f2_arg1, f2_arg2, f2_arg3, f2_arg4 )
	f2_local0.id = "CoD9Button.PlaylistButton." .. f2_arg4.name
	f2_local0.listIndex = f2_arg5
	f2_local0.category = f2_arg6
	f2_local0:registerEventHandler( "button_action", CoD.PlaylistButton.Action )
	f2_local0:registerEventHandler( "partylobby_update", CoD.PlaylistButton.Refresh )
	f2_local0:registerEventHandler( "gamelobby_update", CoD.PlaylistButton.Refresh )
	return f2_local0
end

CoD.PlaylistButton.Refresh = function ( f3_arg0, f3_arg1 )
	if f3_arg0.itemInfo.index ~= nil and Engine.IsPlaylistLocked( f3_arg1.controller, f3_arg0.itemInfo.index ) then
		f3_arg0:disable()
	else
		f3_arg0:enable()
	end
end

