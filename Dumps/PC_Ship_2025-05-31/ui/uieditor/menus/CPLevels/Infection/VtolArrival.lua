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
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "VtolArrival.buttonPrompts" )
	local f1_local1 = self
	
	local Text = LUI.UIText.new()
	Text:setLeftRight( true, false, 64, 1216 )
	Text:setTopBottom( true, false, 255, 360 )
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
		menu = f1_local1
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "VtolArrival.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

