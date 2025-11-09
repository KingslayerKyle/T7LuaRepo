LUI.createMenu.CACWaitMenu = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "CACWaitMenu" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	local menu = self
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, true, 0, 0 )
	Background:setTopBottom( true, true, 0, 0 )
	Background:setRGB( 0, 0, 0 )
	Background:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Background )
	self.Background = Background
	
	local Label = LUI.UITightText.new()
	Label:setLeftRight( false, false, -143, 143 )
	Label:setTopBottom( true, false, 347.5, 372.5 )
	Label:setText( Engine.Localize( LocalizeString( "COOP_WAITING_ALL_PLAYERS" ) ) )
	Label:setTTF( "fonts/default.ttf" )
	self:addElement( Label )
	self.Label = Label
	
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SendMenuResponse( self, "CACWaitMenu", "Open", controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
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

