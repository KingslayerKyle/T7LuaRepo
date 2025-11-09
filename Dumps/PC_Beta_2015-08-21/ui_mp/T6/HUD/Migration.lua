require( "ui.T6.CoDBase" )
require( "ui.T6.CoDMenu" )

CoD.Migration = {}
LUI.createMenu.migration_ingame = function ( f1_arg0, f1_arg1 )
	local f1_local0 = CoD.Menu.New( "migration_ingame" )
	if Engine.IsInGame() and Engine.IsSplitscreen() then
		f1_local0:sizeToSafeArea( f1_arg0 )
	end
	local self = LUI.UIImage.new()
	self:setLeftRight( false, false, -1280, 1280 )
	self:setTopBottom( false, false, -720, 720 )
	self:setRGB( 0, 0, 0 )
	f1_local0:addElement( self )
	local f1_local2 = 64
	local f1_local3 = LUI.UIImage.new( {
		shaderVector0 = {
			0,
			0,
			0,
			0
		}
	} )
	f1_local3:setLeftRight( false, false, -f1_local2 / 2, f1_local2 / 2 )
	f1_local3:setTopBottom( false, false, -f1_local2 / 2, f1_local2 / 2 )
	f1_local3:setImage( RegisterMaterial( "lui_loader" ) )
	f1_local0:addElement( f1_local3 )
	local f1_local4 = f1_local2 / 2 + 10
	local f1_local5 = LUI.UIText.new()
	f1_local5:setLeftRight( true, true, 0, 0 )
	f1_local5:setTopBottom( false, false, f1_local4, f1_local4 + CoD.textSize.Condensed )
	f1_local5:setFont( CoD.fonts.Condensed )
	f1_local5:setAlignment( LUI.Alignment.Center )
	f1_local5:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	f1_local5:setText( Engine.Localize( "MP_MIGRATINGHOSTS_CAPS" ) )
	f1_local0:addElement( f1_local5 )
	return f1_local0
end

