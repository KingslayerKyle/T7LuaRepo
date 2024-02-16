require( "ui.T6.CoDBase" )
require( "ui.T6.CoDMenu" )

CoD.Migration = {}
LUI.createMenu.migration_ingame = function ( controller, frame )
	local menu = CoD.Menu.New( "migration_ingame" )
	if Engine.IsInGame() and Engine.IsSplitscreen() then
		menu:sizeToSafeArea( controller )
	end
	local elementDarkenBg = LUI.UIImage.new()
	elementDarkenBg:setLeftRight( false, false, -1280, 1280 )
	elementDarkenBg:setTopBottom( false, false, -720, 720 )
	elementDarkenBg:setRGB( 0, 0, 0 )
	menu:addElement( elementDarkenBg )
	local spinnerSize = 64
	local spinner = LUI.UIImage.new( {
		shaderVector0 = {
			0,
			0,
			0,
			0
		}
	} )
	spinner:setLeftRight( false, false, -spinnerSize / 2, spinnerSize / 2 )
	spinner:setTopBottom( false, false, -spinnerSize / 2, spinnerSize / 2 )
	spinner:setImage( RegisterMaterial( "lui_loader" ) )
	menu:addElement( spinner )
	local migratingOffset = 10
	local migratingTop = spinnerSize / 2 + migratingOffset
	local migratingHostsLabel = LUI.UIText.new()
	migratingHostsLabel:setLeftRight( true, true, 0, 0 )
	migratingHostsLabel:setTopBottom( false, false, migratingTop, migratingTop + CoD.textSize.Condensed )
	migratingHostsLabel:setFont( CoD.fonts.Condensed )
	migratingHostsLabel:setAlignment( LUI.Alignment.Center )
	migratingHostsLabel:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	migratingHostsLabel:setText( Engine.Localize( "MP_MIGRATINGHOSTS_CAPS" ) )
	menu:addElement( migratingHostsLabel )
	return menu
end

