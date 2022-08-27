-- d41d8cd98f00b204e9800998ecf8427e
-- This hash is used for caching, delete to decompile the file again

local PostLoadFunc = function ( self, controller, menu )
	self:setPriority( 49 )
	self.MissionStarting:setText( Engine.Localize( "MENU_MISSION_STARTING", 60 ) )
	self.MissionStarting:setAlpha( 0 )
	self:subscribeToGlobalModel( controller, "PerController", "scriptNotify", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue == "mission_starting_countdown" then
			local f2_local1 = CoD.GetScriptNotifyData( model )
			self.MissionStarting:setText( Engine.Localize( "MENU_MISSION_STARTING", tostring( f2_local1[1] ) ) )
			self.MissionStarting:setAlpha( 1 )
		elseif modelValue == "mission_starting_hide" then
			self.MissionStarting:setAlpha( 0 )
		end
	end )
end

LUI.createMenu.MissionStarting = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "MissionStarting" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "HUD"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "MissionStarting.buttonPrompts" )
	local f3_local1 = self
	
	local MissionStarting = LUI.UIText.new()
	MissionStarting:setLeftRight( true, false, 337.75, 1112.25 )
	MissionStarting:setTopBottom( true, false, 46, 76 )
	MissionStarting:setText( Engine.Localize( "MENU_MISSION_STARTING" ) )
	MissionStarting:setTTF( "fonts/default.ttf" )
	MissionStarting:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	MissionStarting:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_MIDDLE )
	self:addElement( MissionStarting )
	self.MissionStarting = MissionStarting
	
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f3_local1
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "MissionStarting.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

