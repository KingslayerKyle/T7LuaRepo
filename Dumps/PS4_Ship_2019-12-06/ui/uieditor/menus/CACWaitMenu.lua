LUI.createMenu.CACWaitMenu = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "CACWaitMenu" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CACWaitMenu.buttonPrompts" )
	local f1_local1 = self
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, true, 0, 0 )
	Background:setTopBottom( true, true, 0, 0 )
	Background:setRGB( 0, 0, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local Label = LUI.UITightText.new()
	Label:setLeftRight( false, false, -143, 143 )
	Label:setTopBottom( true, false, 347.5, 372.5 )
	Label:setText( Engine.Localize( LocalizeString( "COOP_WAITING_ALL_PLAYERS" ) ) )
	Label:setTTF( "fonts/default.ttf" )
	self:addElement( Label )
	self.Label = Label
	
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f2_local0 = nil
		SendMenuResponse( self, "CACWaitMenu", "Open", controller )
		if not f2_local0 then
			f2_local0 = self:dispatchEventToChildren( event )
		end
		return f2_local0
	end )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f1_local1
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "CACWaitMenu.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

