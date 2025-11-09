LUI.createMenu.SquadStartMenu = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "SquadStartMenu" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	local menu = self
	
	local SquadStartMessage = LUI.UIText.new()
	SquadStartMessage:setLeftRight( true, true, 390, -390 )
	SquadStartMessage:setTopBottom( true, true, 171, -524 )
	SquadStartMessage:setRGB( 0.35, 0.35, 1 )
	SquadStartMessage:setText( Engine.Localize( "CP_MI_SING_BIODOMES_SQUAD_INIT" ) )
	SquadStartMessage:setTTF( "fonts/default.ttf" )
	SquadStartMessage:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	SquadStartMessage:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( SquadStartMessage )
	self.SquadStartMessage = SquadStartMessage
	
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

