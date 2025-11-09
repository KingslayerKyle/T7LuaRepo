require( "ui.uieditor.widgets.HUD.GenericUpdateBar" )

LUI.createMenu.ZodRitualProgress = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "ZodRitualProgress" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	local menu = self
	
	local TextBox0 = LUI.UIText.new()
	TextBox0:setLeftRight( true, false, 278, 1002 )
	TextBox0:setTopBottom( true, false, 450.5, 484.5 )
	TextBox0:setRGB( 1, 1, 1 )
	TextBox0:setText( Engine.Localize( "ZM_ZOD_DEFEND_AREA_IN_PROGRESS" ) )
	TextBox0:setTTF( "fonts/default.ttf" )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	local GenericUpdateBar0 = CoD.GenericUpdateBar.new( menu, controller )
	GenericUpdateBar0:setLeftRight( true, false, 406.5, 873.5 )
	GenericUpdateBar0:setTopBottom( true, false, 499, 520 )
	GenericUpdateBar0:setRGB( 1, 0, 0 )
	self:addElement( GenericUpdateBar0 )
	self.GenericUpdateBar0 = GenericUpdateBar0
	
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = menu
	} )
	self.close = function ( self )
		self.GenericUpdateBar0:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

