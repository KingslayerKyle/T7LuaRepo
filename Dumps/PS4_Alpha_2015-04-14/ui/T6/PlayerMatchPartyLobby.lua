require( "ui.T6.PartyLobby" )
require( "ui.T6.MapInfoImage" )

CoD.PlayerMatchPartyLobby = {}
CoD.PlayerMatchPartyLobby.UpdateLivestreamCamera = function ( self, event )
	if not self.livestreamCam then
		return 
	elseif Engine.IsLivestreamEnabled() and Engine.WebM_camera_IsAvailable() and Engine.WebM_camera_IsEnabled() then
		self.livestreamCam:setAlpha( 1 )
	else
		self.livestreamCam:setAlpha( 0 )
	end
end

LUI.createMenu.PlayerMatchPartyLobby = function ( controller )
	local partyLobby = CoD.PartyLobby.new( controller, "PlayerMatchPartyLobby", Engine.Localize( "MENU_MATCHMAKING_CAPS" ) )
	partyLobby:addTitle( Engine.Localize( "MENU_MATCHMAKING_CAPS" ) )
	partyLobby:setPlaylistFilter( "playermatch" )
	partyLobby.lobbyPane.body.lobbyList:setSplitscreenSignInAllowed( true )
	local mapImageLeft = 6
	local mapImageBottom = CoD.MapInfoImage.MapImageBottom
	partyLobby.livestreamCam = LUI.UIImage.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = mapImageLeft,
		right = mapImageLeft + CoD.MapInfoImage.MapImageWidth,
		topAnchor = false,
		bottomAnchor = true,
		top = mapImageBottom - CoD.MapInfoImage.MapImageHeight,
		bottom = mapImageBottom,
		material = RegisterMaterial( "livestream_cam" ),
		red = 0,
		green = 0,
		blue = 0,
		alpha = 0
	} )
	partyLobby:addElement( partyLobby.livestreamCam )
	partyLobby:registerEventHandler( "update_livestream_camera", CoD.PlayerMatchPartyLobby.UpdateLivestreamCamera )
	CoD.PlayerMatchPartyLobby.UpdateLivestreamCamera( partyLobby )
	return partyLobby
end

