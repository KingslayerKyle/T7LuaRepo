-- ec683c34fff4a5f189f48e22174c13e1
-- This hash is used for caching, delete to decompile the file again

LUI.createMenu.MissleLauncherEquipHint = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "MissleLauncherEquipHint" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "MissleLauncherEquipHint.buttonPrompts" )
	local f1_local1 = self
	
	local MissileLauncherHint = LUI.UIText.new()
	MissileLauncherHint:setLeftRight( true, true, 390, -307 )
	MissileLauncherHint:setTopBottom( true, true, 168.5, -523.5 )
	MissileLauncherHint:setText( Engine.Localize( "CP_MI_SING_BLACKSTATION_LAUNCHER_EQUIP_HINT" ) )
	MissileLauncherHint:setTTF( "fonts/default.ttf" )
	MissileLauncherHint:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	MissileLauncherHint:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( MissileLauncherHint )
	self.MissileLauncherHint = MissileLauncherHint
	
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f1_local1
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "MissleLauncherEquipHint.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

