LUI.createMenu.MissileLauncherFire = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "MissileLauncherFire" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	local menu = self
	
	local MissileLauncherHint = LUI.UIText.new()
	MissileLauncherHint:setLeftRight( true, true, 390, -390 )
	MissileLauncherHint:setTopBottom( true, true, 168.5, -521.5 )
	MissileLauncherHint:setRGB( 1, 1, 1 )
	MissileLauncherHint:setText( Engine.Localize( "CP_MI_SING_BLACKSTATION_LAUNCHER_FIRE" ) )
	MissileLauncherHint:setTTF( "fonts/default.ttf" )
	MissileLauncherHint:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	MissileLauncherHint:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( MissileLauncherHint )
	self.MissileLauncherHint = MissileLauncherHint
	
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = menu
	} )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

