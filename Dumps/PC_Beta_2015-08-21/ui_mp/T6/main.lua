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
	local f1_local0 = Engine.GetMaxControllerCount()
	for self = 0, f1_local0 - 1, 1 do
		Engine.LockInput( self, true )
		Engine.SetUIActive( self, true )
	end
	LUI.roots.UIRootFull:addElement( CoD.SetupSafeAreaOverlay() )
	local self = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0
	} )
	self.name = "Main"
	local f1_local2 = nil
	if CoD.isZombie == true then
		f1_local2 = RegisterMaterial( "lui_bkg_zm" )
	else
		f1_local2 = RegisterMaterial( "lui_bkg" )
	end
	local f1_local3 = LUI.UIImage.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0,
		material = f1_local2
	} )
	if CoD.isMultiplayer then
		local f1_local4 = LUI.UIImage.new()
		f1_local4:setLeftRight( true, true, 0, 0 )
		f1_local4:setTopBottom( true, true, 0, 0 )
		f1_local4:setRGB( 0, 0, 0 )
		f1_local4:setAlpha( 0.15 )
		self:addElement( f1_local4 )
	end
	Engine.Exec( nil, "checkforinvites" )
	return self
end

DisableGlobals()
Engine.StopEditingPresetClass()
