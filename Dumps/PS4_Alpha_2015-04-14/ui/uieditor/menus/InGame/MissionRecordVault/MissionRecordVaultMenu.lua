require( "ui.uieditor.widgets.TabbedWidgets.basicTabList" )
require( "ui.uieditor.widgets.TabbedWidgets.paintshopTabWidget" )
require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_Overview" )
require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_Challenges" )
require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_Performance" )
require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_ReplayMission" )

local PreLoadFunc = function ( self, controller )
	local highestMapReachedModel = Engine.GetModel( self:getModel(), "highestMapReached" )
	if highestMapReachedModel ~= nil then
		if nil == CoD.MissionRecordVaultMenu then
			CoD.MissionRecordVaultMenu = {}
		end
		CoD.MissionRecordVaultMenu.highestMapReached = Engine.GetModelValue( highestMapReachedModel )
	end
end

local PostLoadFunc = function ( self, controller )
	local oldClose = self.close
	self.close = function ( self )
		self:unsubscribeFromAllModels()
		oldClose( self )
	end
	
end

LUI.createMenu.MissionRecordVaultMenu = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "MissionRecordVaultMenu" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, true, 0, 0 )
	background:setTopBottom( true, true, 0, 0 )
	background:setRGB( 0, 0, 0 )
	background:setAlpha( 0.5 )
	background:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( background )
	self.background = background
	
	local frame = LUI.UIFrame.new( self, controller, 0, 0 )
	frame:setLeftRight( true, false, 64, 1216 )
	frame:setTopBottom( true, false, 150, 684 )
	frame:setRGB( 1, 1, 1 )
	frame:linkToElementModel( self, nil, false, function ( model )
		frame:setModel( model, controller )
	end )
	self:addElement( frame )
	self.frame = frame
	
	local missionRecordVaultTabs = CoD.basicTabList.new( self, controller )
	missionRecordVaultTabs:setLeftRight( true, false, 64, 1154 )
	missionRecordVaultTabs:setTopBottom( true, false, 100, 140 )
	missionRecordVaultTabs:setRGB( 1, 1, 1 )
	missionRecordVaultTabs.grid:setDataSource( "MissionRecordVaultTabs" )
	missionRecordVaultTabs.grid:setWidgetType( CoD.paintshopTabWidget )
	self:addElement( missionRecordVaultTabs )
	self.missionRecordVaultTabs = missionRecordVaultTabs
	
	local title = LUI.UITightText.new()
	title:setLeftRight( true, false, 64, 426 )
	title:setTopBottom( true, false, 36, 84 )
	title:setRGB( 0.87, 0.88, 0.78 )
	title:setText( Engine.Localize( "CPUI_MISSION_RECORD_VAULT" ) )
	title:setTTF( "fonts/escom.ttf" )
	self:addElement( title )
	self.title = title
	
	frame:linkToElementModel( missionRecordVaultTabs.grid, "tabWidget", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			frame:changeFrameWidget( modelValue )
		end
	end )
	self.buttonPromptAddFunctions = {}
	self.buttonPromptAddFunctions.primary = function ( menu, element, event )
		menu:addButtonPrompt( "primary", Engine.Localize( "MENU_SELECT_CAPS" ), "ENTER", element )
		return true
	end
	
	self.buttonPromptAddFunctions.secondary = function ( menu, element, event )
		menu:addButtonPrompt( "secondary", Engine.Localize( "MENU_BACK_CAPS" ), "ESCAPE", element )
		return true
	end
	
	self.buttonPromptAddFunctions.primary( self, self, {
		controller = controller
	} )
	self.buttonPromptAddFunctions.secondary( self, self, {
		controller = controller
	} )
	self:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and event.button ~= "primary" and event.button == "key_shortcut" and event.key == "ENTER" then
			
		else
			
		end
		if not self.occludedBy and (event.button == "secondary" or event.button == "key_shortcut" and event.key == "ESCAPE") then
			SendMenuResponse( self, "MissionRecordVaultMenu", "closed", controller )
			LockInput( self, controller, false )
			Close( self, controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		PlayClipOnElement( self, {
			elementName = "selectMenuWidget",
			clipName = ""
		}, controller )
		LockInput( self, controller, true )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	frame.id = "frame"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.frame:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	self.close = function ( self )
		self.missionRecordVaultTabs:close()
		self.frame:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

