require( "ui.uieditor.widgets.MenuSpecificWidgets.LoadingSideMission.loadingCountdownTimerWidget" )

local PostLoadFunc = function ( self )
	if CoD.SideMissionIndex then
		self.missionNameText:setText( Engine.Localize( CoD.GetMapValue( CoD.SideMissionIndex, "mapName", CoD.SideMissionIndex ) ) )
		self.missionTypeText:setText( "COOP" )
	else
		self.missionNameText:setText( "INVALID" )
		self.missionTypeText:setText( "INVALID" )
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
	self:playSound( "menu_open" )
	local menu = self
	
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
	
	local countdownTimerWidget = CoD.loadingCountdownTimerWidget.new( menu, controller )
	countdownTimerWidget:setLeftRight( false, false, -640, 640 )
	countdownTimerWidget:setTopBottom( false, false, -25, 68 )
	countdownTimerWidget:setRGB( 1, 1, 1 )
	self:addElement( countdownTimerWidget )
	self.countdownTimerWidget = countdownTimerWidget
	
	local missionTypeText = LUI.UIText.new()
	missionTypeText:setLeftRight( false, false, -544, 544 )
	missionTypeText:setTopBottom( false, false, -105.5, -64.5 )
	missionTypeText:setRGB( 1, 1, 1 )
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
		menu = menu
	} )
	self.close = function ( self )
		self.countdownTimerWidget:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

