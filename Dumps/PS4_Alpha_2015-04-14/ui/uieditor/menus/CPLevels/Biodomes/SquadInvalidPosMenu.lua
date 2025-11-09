LUI.createMenu.SquadInvalidPosMenu = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "SquadInvalidPosMenu" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	local menu = self
	
	local SquadInvalidPosText = LUI.UIText.new()
	SquadInvalidPosText:setLeftRight( true, true, 390, -390 )
	SquadInvalidPosText:setTopBottom( true, true, 149, -546 )
	SquadInvalidPosText:setRGB( 1, 0, 0 )
	SquadInvalidPosText:setText( Engine.Localize( "CP_MI_SING_BIODOMES_INVALID_POS" ) )
	SquadInvalidPosText:setTTF( "fonts/default.ttf" )
	SquadInvalidPosText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	SquadInvalidPosText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( SquadInvalidPosText )
	self.SquadInvalidPosText = SquadInvalidPosText
	
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

