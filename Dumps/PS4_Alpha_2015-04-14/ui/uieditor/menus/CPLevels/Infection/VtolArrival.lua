LUI.hudMenuType.VtolArrival = "hud"
LUI.createMenu.VtolArrival = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "VtolArrival" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	local menu = self
	
	local Text = LUI.UIText.new()
	Text:setLeftRight( true, false, 64, 1216 )
	Text:setTopBottom( true, false, 255, 360 )
	Text:setRGB( 1, 1, 1 )
	Text:setText( Engine.Localize( "Vtol Arrival Placeholder" ) )
	Text:setTTF( "fonts/default.ttf" )
	Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Text )
	self.Text = Text
	
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

