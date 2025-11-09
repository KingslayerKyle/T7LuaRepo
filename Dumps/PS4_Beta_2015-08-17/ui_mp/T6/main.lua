require( "ui.T6.CoDBase" )
require( "ui.T6.lobby.friends" )
require( "ui.T6.lobby.lobbybase" )
require( "ui.T6.lobby.lobbymenus" )
require( "ui.T6.lobby.presence" )
require( "ui.T6.Menus.ChangeGameModePopup" )
require( "ui_mp.T6.Menus.CODTv" )
require( "ui_mp.T6.Menus.EditGameOptionsPopup" )
require( "ui_mp.T6.Menus.EditModeSpecificOptionsMenu" )
require( "ui_mp.T6.Menus.PlaylistSelectionPopup" )
require( "ui.uieditor.menus.Core_UI_require" )
require( "ui.uieditor.menus.Core_Frontend_require" )

LUI.createMenu.main = function ()
	local maxControllers = Engine.GetMaxControllerCount()
	for i = 0, maxControllers - 1, 1 do
		Engine.LockInput( i, true )
		Engine.SetUIActive( i, true )
	end
	LUI.roots.UIRootFull:addElement( CoD.SetupSafeAreaOverlay() )
	local mainMenu = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0
	} )
	mainMenu.name = "Main"
	local backgroundMaterial = nil
	if CoD.isZombie == true then
		backgroundMaterial = RegisterMaterial( "lui_bkg_zm" )
	else
		backgroundMaterial = RegisterMaterial( "lui_bkg" )
	end
	local background = LUI.UIImage.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0,
		material = backgroundMaterial
	} )
	if CoD.isMultiplayer then
		local blackBackground = LUI.UIImage.new()
		blackBackground:setLeftRight( true, true, 0, 0 )
		blackBackground:setTopBottom( true, true, 0, 0 )
		blackBackground:setRGB( 0, 0, 0 )
		blackBackground:setAlpha( 0.15 )
		mainMenu:addElement( blackBackground )
	end
	Engine.Exec( nil, "checkforinvites" )
	return mainMenu
end

DisableGlobals()
Engine.StopEditingPresetClass()
