LUI.createMenu.FullBlack = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "FullBlack" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "none"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "FullBlack.buttonPrompts" )
	local f1_local1 = self
	
	local Fullscreen = LUI.UIImage.new()
	Fullscreen:setLeftRight( true, false, 0, 1280 )
	Fullscreen:setTopBottom( true, false, 0, 720 )
	Fullscreen:setImage( RegisterImage( "uie_default_black_0" ) )
	self:addElement( Fullscreen )
	self.Fullscreen = Fullscreen
	
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f1_local1
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "FullBlack.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

