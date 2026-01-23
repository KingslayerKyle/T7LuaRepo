LUI.createMenu.CPKillcam = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "CPKillcam" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "HUD"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CPKillcam.buttonPrompts" )
	local f1_local1 = self
	
	local KillcamPrompt = LUI.UITightText.new()
	KillcamPrompt:setLeftRight( true, true, 569, -569 )
	KillcamPrompt:setTopBottom( true, true, 589, -100 )
	KillcamPrompt:setText( Engine.Localize( "MENU_CP_KILLCAM_PROMPT" ) )
	KillcamPrompt:setTTF( "fonts/default.ttf" )
	self:addElement( KillcamPrompt )
	self.KillcamPrompt = KillcamPrompt
	
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f1_local1
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "CPKillcam.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

