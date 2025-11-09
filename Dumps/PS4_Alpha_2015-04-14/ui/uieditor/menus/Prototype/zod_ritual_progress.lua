LUI.createMenu.zod_ritual_progress = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "zod_ritual_progress" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	
	local TextBox0 = LUI.UIText.new()
	TextBox0:setLeftRight( true, false, 278, 1002 )
	TextBox0:setTopBottom( true, false, 332.5, 387.5 )
	TextBox0:setRGB( 1, 1, 1 )
	TextBox0:setText( Engine.Localize( "ZM_ZOD_DEFEND_AREA_IN_PROGRESS" ) )
	TextBox0:setTTF( "fonts/GatewayA2.ttf" )
	TextBox0:setAlignment( LUI.Alignment.Center )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		controller = controller
	} )
	if PostLoadFunc then
		PostLoadFunc( self )
	end
	return self
end

