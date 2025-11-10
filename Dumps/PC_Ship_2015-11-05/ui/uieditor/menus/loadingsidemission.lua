require( "ui.uieditor.widgets.MenuSpecificWidgets.LoadingSideMission.loadingCountdownTimerWidget" )

local PostLoadFunc = function ( f1_arg0 )
	if CoD.SideMissionIndex then
		f1_arg0.missionNameText:setText( Engine.Localize( CoD.GetMapValue( CoD.SideMissionIndex, "mapName", CoD.SideMissionIndex ) ) )
		f1_arg0.missionTypeText:setText( "COOP" )
	else
		f1_arg0.missionNameText:setText( "INVALID" )
		f1_arg0.missionTypeText:setText( "INVALID" )
	end
end

LUI.createMenu.LoadingSideMission = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "LoadingSideMission" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "LoadingSideMission.buttonPrompts" )
	local f2_local1 = self
	
	local missionNameText = LUI.UIText.new()
	missionNameText:setLeftRight( false, false, -544, 544 )
	missionNameText:setTopBottom( false, false, -156.5, -105.5 )
	missionNameText:setRGB( 1, 0.64, 0 )
	missionNameText:setText( Engine.Localize( "MENU_NEW" ) )
	missionNameText:setTTF( "fonts/default.ttf" )
	missionNameText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	missionNameText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( missionNameText )
	self.missionNameText = missionNameText
	
	local countdownTimerWidget = CoD.loadingCountdownTimerWidget.new( f2_local1, controller )
	countdownTimerWidget:setLeftRight( false, false, -640, 640 )
	countdownTimerWidget:setTopBottom( false, false, -25, 68 )
	self:addElement( countdownTimerWidget )
	self.countdownTimerWidget = countdownTimerWidget
	
	local missionTypeText = LUI.UIText.new()
	missionTypeText:setLeftRight( false, false, -544, 544 )
	missionTypeText:setTopBottom( false, false, -105.5, -64.5 )
	missionTypeText:setText( Engine.Localize( "MENU_NEW" ) )
	missionTypeText:setTTF( "fonts/default.ttf" )
	missionTypeText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	missionTypeText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( missionTypeText )
	self.missionTypeText = missionTypeText
	
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f2_local1
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.countdownTimerWidget:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "LoadingSideMission.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

