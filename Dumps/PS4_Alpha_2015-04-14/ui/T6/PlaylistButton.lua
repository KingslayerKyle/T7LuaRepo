require( "ui.T6.CategoryButton" )

CoD.PlaylistButton = {}
CoD.PlaylistButton.Action = function ( self, event )
	if self.actionEventName ~= nil then
		if self.itemInfo.loadName == nil or Engine.IsChunkInstalledByFileName( self.itemInfo.loadName ) then
			self:dispatchEventToParent( {
				name = self.actionEventName,
				controller = event.controller,
				itemInfo = self.itemInfo,
				listIndex = self.listIndex,
				category = self.category
			} )
		else
			Engine.PrefetchByFileName( self.itemInfo.loadName )
		end
	end
end

CoD.PlaylistButton.new = function ( defaultAnimationState, actionEventName, gainFocusEventName, loseFocusEventName, itemInfo, listIndex, category )
	local playlistButton = CoD.CategoryButton.new( defaultAnimationState, actionEventName, gainFocusEventName, loseFocusEventName, itemInfo )
	playlistButton.id = "CoD9Button.PlaylistButton." .. itemInfo.name
	playlistButton.listIndex = listIndex
	playlistButton.category = category
	playlistButton:registerEventHandler( "button_action", CoD.PlaylistButton.Action )
	playlistButton:registerEventHandler( "partylobby_update", CoD.PlaylistButton.Refresh )
	playlistButton:registerEventHandler( "gamelobby_update", CoD.PlaylistButton.Refresh )
	return playlistButton
end

CoD.PlaylistButton.Refresh = function ( self, event )
	if self.itemInfo.index ~= nil and Engine.IsPlaylistLocked( event.controller, self.itemInfo.index ) then
		self:disable()
	else
		self:enable()
	end
end

