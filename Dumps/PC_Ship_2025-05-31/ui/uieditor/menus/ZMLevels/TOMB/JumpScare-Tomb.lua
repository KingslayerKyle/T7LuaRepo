LUI.createMenu.JumpScare-Tomb = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "JumpScare-Tomb" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "JumpScare-Tomb.buttonPrompts" )
	local f1_local1 = self
	
	local JumpScare = LUI.UIImage.new()
	JumpScare:setLeftRight( true, false, 215.5, 1063.5 )
	JumpScare:setTopBottom( true, false, -21, 743 )
	JumpScare:setImage( RegisterImage( "uie_t7_zm_ori_wth_dog_c" ) )
	self:addElement( JumpScare )
	self.JumpScare = JumpScare
	
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f1_local1
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "JumpScare-Tomb.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

