LUI.createMenu.codfu_characterselect = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "codfu_characterselect" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "none"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	local menu = self
	
	local Label0 = LUI.UITightText.new()
	Label0:setLeftRight( true, false, 473, 807 )
	Label0:setTopBottom( true, false, 36, 61 )
	Label0:setRGB( 1, 1, 1 )
	Label0:setText( Engine.Localize( "MENU_CODFU_PICK_YOUR_FIGHTER" ) )
	Label0:setTTF( "fonts/default.ttf" )
	self:addElement( Label0 )
	self.Label0 = Label0
	
	local Emblem1 = LUI.UIImage.new()
	Emblem1:setLeftRight( true, false, 128, 256 )
	Emblem1:setTopBottom( true, false, 520, 648 )
	Emblem1:setRGB( 1, 1, 1 )
	Emblem1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Emblem1 )
	self.Emblem1 = Emblem1
	
	local Emblem2 = LUI.UIImage.new()
	Emblem2:setLeftRight( true, false, 384, 512 )
	Emblem2:setTopBottom( true, false, 520, 648 )
	Emblem2:setRGB( 1, 1, 1 )
	Emblem2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Emblem2 )
	self.Emblem2 = Emblem2
	
	local Emblem3 = LUI.UIImage.new()
	Emblem3:setLeftRight( true, false, 768, 896 )
	Emblem3:setTopBottom( true, false, 520, 648 )
	Emblem3:setRGB( 1, 1, 1 )
	Emblem3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Emblem3 )
	self.Emblem3 = Emblem3
	
	local Emblem4 = LUI.UIImage.new()
	Emblem4:setLeftRight( true, false, 1024, 1152 )
	Emblem4:setTopBottom( true, false, 520, 648 )
	Emblem4:setRGB( 1, 1, 1 )
	Emblem4:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Emblem4 )
	self.Emblem4 = Emblem4
	
	local Timer = LUI.UITightText.new()
	Timer:setLeftRight( true, false, 544, 736 )
	Timer:setTopBottom( true, false, 571.5, 596.5 )
	Timer:setRGB( 1, 1, 1 )
	Timer:setTTF( "fonts/default.ttf" )
	Timer:setupGameTimer()
	Timer:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self:addElement( Timer )
	self.Timer = Timer
	
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		LockInput( self, controller, false )
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

