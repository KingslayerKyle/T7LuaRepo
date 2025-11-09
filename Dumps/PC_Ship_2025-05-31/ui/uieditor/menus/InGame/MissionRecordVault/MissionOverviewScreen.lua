require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_OverviewBackground" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.FrameContainer" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TabBar" )

LUI.createMenu.MissionOverviewScreen = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "MissionOverviewScreen" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "MissionOverviewScreen.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local backgroundMid = CoD.MissionRecordVault_OverviewBackground.new( self, controller )
	backgroundMid:setLeftRight( true, true, 0, 0 )
	backgroundMid:setTopBottom( true, true, -17, 16 )
	backgroundMid:linkToElementModel( self, nil, false, function ( model )
		backgroundMid:setModel( model, controller )
	end )
	backgroundMid:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return not IsSelfModelValueEqualTo( element, controller, "showMissionOverview", 1 )
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
	
	local black = LUI.UIImage.new()
	black:setLeftRight( true, true, 0, 0 )
	black:setTopBottom( false, false, -274, -233 )
	black:setRGB( 0, 0, 0 )
	self:addElement( black )
	self.black = black
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics:setTopBottom( true, true, 95, -7.75 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local FrameContainer = CoD.FrameContainer.new( self, controller )
	FrameContainer:setLeftRight( false, false, -576, 576 )
	FrameContainer:setTopBottom( true, false, 137, 647 )
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
				return not IsSelfModelValueEqualTo( element, controller, "showMissionOverview", 1 )
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
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "CPUI_MISSION_OVERVIEW_TITLE" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "CPUI_MISSION_OVERVIEW_TITLE" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_gunsmith" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local missionRecordVaultTabs = CoD.FE_TabBar.new( self, controller )
	missionRecordVaultTabs:setLeftRight( true, true, 0, 1216 )
	missionRecordVaultTabs:setTopBottom( true, false, 86, 127 )
	missionRecordVaultTabs:setAlpha( 0 )
	missionRecordVaultTabs.Tabs.grid:setDataSource( "MissionRecordVaultTabs" )
	missionRecordVaultTabs:linkToElementModel( self, nil, false, function ( model )
		missionRecordVaultTabs:setModel( model, controller )
	end )
	self:addElement( missionRecordVaultTabs )
	self.missionRecordVaultTabs = missionRecordVaultTabs
	
	FrameContainer:linkToElementModel( missionRecordVaultTabs.Tabs.grid, "tabWidget", true, function ( model )
		local tabWidget = Engine.GetModelValue( model )
		if tabWidget then
			FrameContainer.frame:changeFrameWidget( tabWidget )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				black:completeAnimation()
				self.black:setAlpha( 1 )
				self.clipFinished( black, {} )
				missionRecordVaultTabs:completeAnimation()
				self.missionRecordVaultTabs:setAlpha( 1 )
				self.clipFinished( missionRecordVaultTabs, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				black:completeAnimation()
				self.black:setAlpha( 0 )
				self.clipFinished( black, {} )
				missionRecordVaultTabs:completeAnimation()
				self.missionRecordVaultTabs:setAlpha( 0 )
				self.clipFinished( missionRecordVaultTabs, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return not IsSelfModelValueEqualTo( element, controller, "showMissionOverview", 1 )
			end
		}
	} )
	self:linkToElementModel( self, "showMissionOverview", true, function ( model )
		self:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "showMissionOverview"
		} )
	end )
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f15_local0 = nil
		PlayClipOnElement( self, {
			elementName = "selectMenuWidget",
			clipName = ""
		}, controller )
		PrepareOpenMenuInSafehouse( controller )
		if not f15_local0 then
			f15_local0 = self:dispatchEventToChildren( event )
		end
		return f15_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		SendMenuResponse( self, "MissionRecordVaultMenu", "closed", controller )
		PrepareCloseMenuInSafehouse( controller )
		Close( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "CPUI_BACK_TO_SAFEHOUSE" )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "TAB", function ( element, menu, controller, model )
		if IsMenuModelValueEqualTo( menu, "showMissionOverview", 1 ) then
			SetMenuModelValue( menu, "showMissionOverview", 0 )
			UpdateButtonPromptState( menu, element, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
			return true
		else
			SetMenuModelValue( menu, "showMissionOverview", 1 )
			UpdateButtonPromptState( menu, element, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
			return true
		end
	end, function ( element, menu, controller )
		if IsMenuModelValueEqualTo( menu, "showMissionOverview", 1 ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "CPUI_HIDE_MISSION_OVERVIEW" )
			return true
		else
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "CPUI_SHOW_MISSION_OVERVIEW" )
			return true
		end
	end, false )
	FrameContainer.id = "FrameContainer"
	MenuFrame:setModel( self.buttonModel, controller )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.backgroundMid:close()
		element.FEMenuLeftGraphics:close()
		element.FrameContainer:close()
		element.MenuFrame:close()
		element.missionRecordVaultTabs:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "MissionOverviewScreen.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

