require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_OverviewBackground" )
require( "ui.uieditor.widgets.TabbedWidgets.basicTabList" )
require( "ui.uieditor.widgets.TabbedWidgets.paintshopTabWidget" )
require( "ui.uieditor.widgets.FrameContainer" )

LUI.createMenu.MissionOverviewScreen = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "MissionOverviewScreen" )
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
	background:setTopBottom( false, true, -64, 0 )
	background:setRGB( 0, 0, 0 )
	background:setAlpha( 0.5 )
	background:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( background )
	self.background = background
	
	local backgroundMid = CoD.MissionRecordVault_OverviewBackground.new( self, controller )
	backgroundMid:setLeftRight( true, true, 0, 0 )
	backgroundMid:setTopBottom( true, true, 100, -64 )
	backgroundMid:setRGB( 1, 1, 1 )
	backgroundMid:linkToElementModel( self, nil, false, function ( model )
		backgroundMid:setModel( model, controller )
	end )
	backgroundMid:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return not IsSelfModelValueTrue( element, controller, "showMissionOverview" )
			end
		}
	} )
	backgroundMid:linkToElementModel( backgroundMid, "showMissionOverview", true, function ( model )
		self:updateElementState( backgroundMid, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "showMissionOverview"
		} )
	end )
	self:addElement( backgroundMid )
	self.backgroundMid = backgroundMid
	
	local backgroundTop = LUI.UIImage.new()
	backgroundTop:setLeftRight( true, true, 0, 0 )
	backgroundTop:setTopBottom( true, false, 0, 100 )
	backgroundTop:setRGB( 0, 0, 0 )
	backgroundTop:setAlpha( 0.5 )
	backgroundTop:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( backgroundTop )
	self.backgroundTop = backgroundTop
	
	local missionRecordVaultTabs = CoD.basicTabList.new( self, controller )
	missionRecordVaultTabs:setLeftRight( true, false, 64, 1154 )
	missionRecordVaultTabs:setTopBottom( true, false, 100, 140 )
	missionRecordVaultTabs:setRGB( 1, 1, 1 )
	missionRecordVaultTabs.grid:setDataSource( "MissionRecordVaultTabs" )
	missionRecordVaultTabs.grid:setWidgetType( CoD.paintshopTabWidget )
	missionRecordVaultTabs:linkToElementModel( self, nil, false, function ( model )
		missionRecordVaultTabs:setModel( model, controller )
	end )
	missionRecordVaultTabs:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return not IsSelfModelValueTrue( element, controller, "showMissionOverview" )
			end
		}
	} )
	missionRecordVaultTabs:linkToElementModel( missionRecordVaultTabs, "showMissionOverview", true, function ( model )
		self:updateElementState( missionRecordVaultTabs, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "showMissionOverview"
		} )
	end )
	self:addElement( missionRecordVaultTabs )
	self.missionRecordVaultTabs = missionRecordVaultTabs
	
	local title = LUI.UITightText.new()
	title:setLeftRight( true, false, 64, 623 )
	title:setTopBottom( true, false, 36, 84 )
	title:setRGB( 0.87, 0.88, 0.78 )
	title:setText( Engine.Localize( "CPUI_MISSION_OVERVIEW_TITLE" ) )
	title:setTTF( "fonts/escom.ttf" )
	self:addElement( title )
	self.title = title
	
	local FrameContainer = CoD.FrameContainer.new( self, controller )
	FrameContainer:setLeftRight( true, false, 64, 1216 )
	FrameContainer:setTopBottom( true, false, 150, 684 )
	FrameContainer:setRGB( 1, 1, 1 )
	FrameContainer:subscribeToGlobalModel( controller, "MissionRecordVaultMapInfo", nil, function ( model )
		FrameContainer.frame:setModel( model, controller )
	end )
	FrameContainer:linkToElementModel( self, nil, false, function ( model )
		FrameContainer:setModel( model, controller )
	end )
	FrameContainer:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return not IsSelfModelValueTrue( element, controller, "showMissionOverview" )
			end
		}
	} )
	FrameContainer:linkToElementModel( FrameContainer, "showMissionOverview", true, function ( model )
		self:updateElementState( FrameContainer, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "showMissionOverview"
		} )
	end )
	self:addElement( FrameContainer )
	self.FrameContainer = FrameContainer
	
	FrameContainer:linkToElementModel( missionRecordVaultTabs.grid, "tabWidget", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			FrameContainer.frame:changeFrameWidget( modelValue )
		end
	end )
	self.buttonPromptAddFunctions = {}
	self.buttonPromptAddFunctions.secondary = function ( menu, element, event )
		menu:addButtonPrompt( "secondary", Engine.Localize( "CPUI_BACK_TO_SAFEHOUSE" ), "ESCAPE", element )
		return true
	end
	
	self.buttonPromptAddFunctions.primary = function ( menu, element, event )
		if IsSelfModelValueTrue( element, controller, "showMissionOverview" ) then
			menu:addButtonPrompt( "primary", Engine.Localize( "CPUI_HIDE_MISSION_OVERVIEW" ), "ENTER", element )
			return true
		else
			menu:addButtonPrompt( "primary", Engine.Localize( "CPUI_SHOW_MISSION_OVERVIEW" ), "ENTER", element )
			return true
		end
	end
	
	self:linkToElementModel( self, "showMissionOverview", true, function ( model )
		local element = self
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "showMissionOverview"
		}
		if not element.buttonPromptAddFunctions.primary( self, element, event ) then
			self:removeButtonPrompt( "primary", element )
		end
	end )
	self.buttonPromptAddFunctions.secondary( self, self, {
		controller = controller
	} )
	self.buttonPromptAddFunctions.primary( self, self, {
		controller = controller
	} )
	self:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "secondary" or event.button == "key_shortcut" and event.key == "ESCAPE") then
			SendMenuResponse( self, "MissionRecordVaultMenu", "closed", controller )
			LockInput( self, controller, false )
		end
		if not self.occludedBy and (event.button == "primary" or event.button == "key_shortcut" and event.key == "ENTER") then
			if IsSelfModelValueTrue( element, controller, "showMissionOverview" ) then
				SetSelfModelValue( self, element, controller, "showMissionOverview", false )
			else
				SetSelfModelValue( self, element, controller, "showMissionOverview", true )
			end
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
	FrameContainer.id = "FrameContainer"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.FrameContainer:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	self.close = function ( self )
		self.backgroundMid:close()
		self.missionRecordVaultTabs:close()
		self.FrameContainer:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

