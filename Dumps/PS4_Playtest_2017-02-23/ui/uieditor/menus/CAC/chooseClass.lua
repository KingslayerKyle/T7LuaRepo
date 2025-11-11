require( "ui.uieditor.menus.CAC.Popups.ClassOptions" )
require( "ui.uieditor.widgets.BackgroundFrames.CACBackgroundNew" )
require( "ui.uieditor.widgets.CAC.cac_BlackFadeIn" )
require( "ui.uieditor.widgets.CAC.List1ButtonChooseClass" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ChooseClass_ClassSetTabPip" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ChooseClass_ClassSetTabWidget" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.chooseClassButtonList" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.chooseClassWidget" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.InfopanePreviewWidget" )
require( "ui.uieditor.widgets.Footer.fe_FooterContainer_NOTLobby" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.PC.Utility.XCamMouseControl" )
require( "ui.uieditor.widgets.Pregame.Pregame_TimerOverlay" )

DataSources.ClassSetTabs = DataSourceHelpers.ListSetup( "ClassSetTabs", function ( controller )
	local tabsTable = {}
	if not IsClassSetsAvailableForCurrentGameMode() then
		return tabsTable
	end
	local classSetsOwned = Engine.GetNumberOfClassSetsOwned( controller )
	local maxClassSets = Dvar.purchasedClassSetCount:get()
	local currentClassSetIndex = Engine.GetCurrentClassSetIndex( controller )
	if classSetsOwned <= currentClassSetIndex then
		currentClassSetIndex = 0
		Engine.SetCurrentClassSetIndex( controller, currentClassSetIndex )
	end
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "currentClassSetIndex" ), currentClassSetIndex )
	for classSetIndex = 1, maxClassSets, 1 do
		local classSetNum = classSetIndex - 1
		local classSetName = Engine.GetClassSetName( controller, classSetNum )
		local f1_local2 = classSetNum == classSetsOwned
		local f1_local3 = table.insert
		local f1_local4 = tabsTable
		local f1_local5 = {}
		local f1_local6 = {
			tabName = classSetName,
			customClassName = classSetName,
			classSetId = classSetNum
		}
		local f1_local7
		if f1_local2 or classSetsOwned > classSetNum then
			f1_local7 = false
		else
			f1_local7 = true
		end
		f1_local6.isDisabled = f1_local7
		f1_local6.isExtraSlotsPrompt = f1_local2
		f1_local5.models = f1_local6
		f1_local5.properties = {
			selectIndex = classSetNum == currentClassSetIndex
		}
		f1_local3( f1_local4, f1_local5 )
	end
	return tabsTable
end, nil, nil, function ( controller, list, listModel )
	local classSetsUpdatedModel = Engine.CreateModel( Engine.GetModelForController( controller ), "classSetsUpdated" )
	if list.updateSubscription then
		list:removeSubscription( list.updateSubscription )
	end
	list.updateSubscription = list:subscribeToModel( classSetsUpdatedModel, function ()
		list:updateDataSource()
	end, false )
end )
local PreLoadFunc = function ( self, controller )
	self.disableBlur = true
	LUI.OverrideFunction_CallOriginalFirst( self, "setModel", function ( menu, model )
		menu:processEvent( {
			name = "update_state",
			menu = menu
		} )
	end )
	if CoD.isCampaign then
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "currentClassSetIndex" ), 0 )
		CoD.CACUtility.SetDefaultCACRoot( controller )
		if Gunsmith_IsEnabled( self, controller ) then
			CoD.CraftUtility.Gunsmith.ParseDDL( controller, Enum.StorageFileType.STORAGE_GUNSMITH )
		end
	end
end

local PostLoadFunc = function ( self, controller )
	if CoD.CACUtility.FromCustomClass then
		self:playSound( "cac_reenter" )
		CoD.CACUtility.FromCustomClass = false
	else
		self:playSound( "cac_enter" )
	end
	self.buttonList.navigation = {
		right = nil
	}
	self.chooseClassWidget.m_inputDisabled = true
	if not CoD.CACUtility.UnlockablesTable then
		CoD.CACUtility.UnlockablesTable = CoD.CACUtility.GetUnlockablesTable( controller )
	end
	CoD.CACUtility.CreateUnlockTokenModels( controller )
	CoD.PrestigeUtility.CreatePermanentUnlockTokenModel( controller )
	CoD.CACUtility.SetCACMenuHeroInfoModels( controller )
	local heroIndex = Engine.GetEquippedHero( controller, Enum.eModes.MODE_MULTIPLAYER )
	Engine.SendClientScriptNotify( controller, "choose_class_preview", {
		event = "opened",
		index = heroIndex
	} )
end

LUI.createMenu.chooseClass = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "chooseClass" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "CAC"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "chooseClass.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local Fullscreen = LUI.UIImage.new()
	Fullscreen:setLeftRight( 0, 1, 0, 0 )
	Fullscreen:setTopBottom( 0, 1, 0, 0 )
	Fullscreen:setRGB( 0, 0, 0 )
	Fullscreen:setAlpha( 0 )
	self:addElement( Fullscreen )
	self.Fullscreen = Fullscreen
	
	local cacBlackFadeIn = CoD.cac_BlackFadeIn.new( self, controller )
	cacBlackFadeIn:setLeftRight( 0, 1, 0, 0 )
	cacBlackFadeIn:setTopBottom( 0, 1, 0, 0 )
	self:addElement( cacBlackFadeIn )
	self.cacBlackFadeIn = cacBlackFadeIn
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	LeftPanel:setLeftRight( 0.5, 0.5, -864, -393 )
	LeftPanel:setTopBottom( 0, 1, 117, -873 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	LeftPanel:setAlpha( 0.09 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local chooseClassWidget = CoD.chooseClassWidget.new( self, controller )
	chooseClassWidget:setLeftRight( 0.5, 0.5, -372, 140 )
	chooseClassWidget:setTopBottom( 0, 0, 128, 1026 )
	chooseClassWidget:setAlpha( 0 )
	self:addElement( chooseClassWidget )
	self.chooseClassWidget = chooseClassWidget
	
	local buttonList = CoD.chooseClassButtonList.new( self, controller )
	buttonList:setLeftRight( 0.5, 0.5, -844, -424 )
	buttonList:setTopBottom( 0, 0, 204.5, 711.5 )
	self:addElement( buttonList )
	self.buttonList = buttonList
	
	local ExtraSlotDescription = LUI.UIText.new()
	ExtraSlotDescription:setLeftRight( 0, 0, 106, 526 )
	ExtraSlotDescription:setTopBottom( 0, 0, 280, 318 )
	ExtraSlotDescription:setAlpha( 0 )
	ExtraSlotDescription:setText( Engine.Localize( "MENU_EXTRASLOTS_PACK_DESC" ) )
	ExtraSlotDescription:setTTF( "fonts/default.ttf" )
	ExtraSlotDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ExtraSlotDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ExtraSlotDescription )
	self.ExtraSlotDescription = ExtraSlotDescription
	
	local BuyExtraSlotsBtn = CoD.List1ButtonChooseClass.new( self, controller )
	BuyExtraSlotsBtn:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "ExtraSlots",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	BuyExtraSlotsBtn:setLeftRight( 0, 0, 106, 526 )
	BuyExtraSlotsBtn:setTopBottom( 0, 0, 232, 280 )
	BuyExtraSlotsBtn:setAlpha( 0 )
	BuyExtraSlotsBtn.btnDisplayText:setText( Engine.Localize( "MENU_EXTRASLOTS_BUY_CAPS" ) )
	BuyExtraSlotsBtn.btnDisplayTextStroke:setText( Engine.Localize( "MENU_EXTRASLOTS_BUY_CAPS" ) )
	BuyExtraSlotsBtn:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	BuyExtraSlotsBtn:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( BuyExtraSlotsBtn, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsMenuInState( menu, "ExtraSlots" ) then
			OpenPurchaseExtraSlotsOverlay( self, controller, menu )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsMenuInState( menu, "ExtraSlots" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( BuyExtraSlotsBtn )
	self.BuyExtraSlotsBtn = BuyExtraSlotsBtn
	
	local ClassSetTabWidget = CoD.ChooseClass_ClassSetTabWidget.new( self, controller )
	ClassSetTabWidget:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsClassSetsAvailableForCurrentGameMode()
			end
		}
	} )
	ClassSetTabWidget:setLeftRight( 0, 0, 106, 540 )
	ClassSetTabWidget:setTopBottom( 0, 0, 129, 189 )
	ClassSetTabWidget.Internal.Tabs:setDataSource( "ClassSetTabs" )
	ClassSetTabWidget.Internal.IndicatorsGrid:setWidgetType( CoD.ChooseClass_ClassSetTabPip )
	ClassSetTabWidget.Internal.IndicatorsGrid:setDataSource( "ClassSetTabs" )
	self:addElement( ClassSetTabWidget )
	self.ClassSetTabWidget = ClassSetTabWidget
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( 0, 0, 29, 107 )
	FEMenuLeftGraphics:setTopBottom( 0, 1, 129, -25 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local CustomClasspreviewWidget = CoD.InfopanePreviewWidget.new( self, controller )
	CustomClasspreviewWidget:setLeftRight( 0.5, 0.5, 106.5, 1381.5 )
	CustomClasspreviewWidget:setTopBottom( 0.5, 0.5, -354, 540 )
	CustomClasspreviewWidget:setAlpha( 0.43 )
	CustomClasspreviewWidget:linkToElementModel( self, nil, false, function ( model )
		CustomClasspreviewWidget:setModel( model, controller )
	end )
	self:addElement( CustomClasspreviewWidget )
	self.CustomClasspreviewWidget = CustomClasspreviewWidget
	
	local feFooterContainer = CoD.fe_FooterContainer_NOTLobby.new( self, controller )
	feFooterContainer:mergeStateConditions( {
		{
			stateName = "WithHeroesHead",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	feFooterContainer:setLeftRight( 0, 1, 0, 0 )
	feFooterContainer:setTopBottom( 1, 1, -98, 0 )
	feFooterContainer:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SizeToSafeArea( element, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( feFooterContainer )
	self.feFooterContainer = feFooterContainer
	
	local background = CoD.CACBackgroundNew.new( self, controller )
	background:setLeftRight( 0, 1, 0, 0 )
	background:setTopBottom( 0, 1, 0, 0 )
	background.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( LocalizeToUpperString( GetStringforGameMode( "MENU_CHOOSE_LOADOUT", "MPUI_CHOOSE_CLASS", "MPUI_CHOOSE_CLASS", "MPUI_CHOOSE_CLASS_CAPS" ) ) )
	self:addElement( background )
	self.background = background
	
	local PregameTimerOverlay = CoD.Pregame_TimerOverlay.new( self, controller )
	PregameTimerOverlay:mergeStateConditions( {
		{
			stateName = "ChooseClass",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	PregameTimerOverlay:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.state" ), function ( model )
		self:updateElementState( PregameTimerOverlay, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.Pregame.state"
		} )
	end )
	PregameTimerOverlay:setLeftRight( 0, 1, 0, 0 )
	PregameTimerOverlay:setTopBottom( 0, 1, 0, 0 )
	self:addElement( PregameTimerOverlay )
	self.PregameTimerOverlay = PregameTimerOverlay
	
	local XCamMouseControl = CoD.XCamMouseControl.new( self, controller )
	XCamMouseControl:setLeftRight( 0.5, 0.5, 242, 1382 )
	XCamMouseControl:setTopBottom( 0, 1, 186, -130 )
	self:addElement( XCamMouseControl )
	self.XCamMouseControl = XCamMouseControl
	
	chooseClassWidget:linkToElementModel( buttonList.buttonList, nil, false, function ( model )
		chooseClassWidget:setModel( model, controller )
	end )
	background:linkToElementModel( buttonList.buttonList, nil, false, function ( model )
		background:setModel( model, controller )
	end )
	chooseClassWidget.navigation = {
		left = buttonList
	}
	buttonList.navigation = {
		left = BuyExtraSlotsBtn,
		up = BuyExtraSlotsBtn,
		right = chooseClassWidget
	}
	BuyExtraSlotsBtn.navigation = {
		right = buttonList,
		down = buttonList
	}
	self.resetProperties = function ()
		LeftPanel:completeAnimation()
		chooseClassWidget:completeAnimation()
		buttonList:completeAnimation()
		CustomClasspreviewWidget:completeAnimation()
		Fullscreen:completeAnimation()
		cacBlackFadeIn:completeAnimation()
		background:completeAnimation()
		FEMenuLeftGraphics:completeAnimation()
		ExtraSlotDescription:completeAnimation()
		BuyExtraSlotsBtn:completeAnimation()
		LeftPanel:setLeftRight( 0.5, 0.5, -864, -393 )
		LeftPanel:setTopBottom( 0, 1, 117, -873 )
		LeftPanel:setAlpha( 0.09 )
		chooseClassWidget:setLeftRight( 0.5, 0.5, -372, 140 )
		chooseClassWidget:setTopBottom( 0, 0, 128, 1026 )
		chooseClassWidget:setAlpha( 0 )
		chooseClassWidget:setZoom( 0 )
		buttonList:setLeftRight( 0.5, 0.5, -844, -424 )
		buttonList:setTopBottom( 0, 0, 204.5, 711.5 )
		buttonList:setAlpha( 1 )
		CustomClasspreviewWidget:setLeftRight( 0.5, 0.5, 106.5, 1381.5 )
		CustomClasspreviewWidget:setTopBottom( 0.5, 0.5, -354, 540 )
		CustomClasspreviewWidget:setAlpha( 0.43 )
		Fullscreen:setAlpha( 0 )
		cacBlackFadeIn:setAlpha( 1 )
		background:setAlpha( 1 )
		FEMenuLeftGraphics:setAlpha( 1 )
		ExtraSlotDescription:setAlpha( 0 )
		BuyExtraSlotsBtn:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( 0.5, 0.5, -863.5, 176.5 )
				self.LeftPanel:setTopBottom( 0, 1, 118, 54 )
				self.LeftPanel:setAlpha( 1 )
				self.clipFinished( LeftPanel, {} )
				chooseClassWidget:completeAnimation()
				self.chooseClassWidget:setAlpha( 1 )
				self.clipFinished( chooseClassWidget, {} )
				buttonList:completeAnimation()
				self.buttonList:setLeftRight( 0.5, 0.5, -844, -424 )
				self.buttonList:setTopBottom( 0, 0, 204, 456 )
				self.clipFinished( buttonList, {} )
				CustomClasspreviewWidget:completeAnimation()
				self.CustomClasspreviewWidget:setAlpha( 0 )
				self.clipFinished( CustomClasspreviewWidget, {} )
			end,
			Intro = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				local LeftPanelFrame2 = function ( LeftPanel, event )
					local LeftPanelFrame3 = function ( LeftPanel, event )
						local LeftPanelFrame4 = function ( LeftPanel, event )
							if not event.interrupted then
								LeftPanel:beginAnimation( "keyframe", 410, false, true, CoD.TweenType.Linear )
							end
							LeftPanel:setLeftRight( 0.5, 0.5, -863.5, 176.5 )
							LeftPanel:setTopBottom( 0, 1, 1134, -954 )
							LeftPanel:setAlpha( 0.9 )
							if event.interrupted then
								self.clipFinished( LeftPanel, event )
							else
								LeftPanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							LeftPanelFrame4( LeftPanel, event )
							return 
						else
							LeftPanel:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
							LeftPanel:setTopBottom( 0, 1, 860, -954 )
							LeftPanel:setAlpha( 0.5 )
							LeftPanel:registerEventHandler( "transition_complete_keyframe", LeftPanelFrame4 )
						end
					end
					
					if event.interrupted then
						LeftPanelFrame3( LeftPanel, event )
						return 
					else
						LeftPanel:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
						LeftPanel:setLeftRight( 0.5, 0.5, -863.5, 176.5 )
						LeftPanel:registerEventHandler( "transition_complete_keyframe", LeftPanelFrame3 )
					end
				end
				
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( 0.5, 0.5, -864, -393 )
				self.LeftPanel:setTopBottom( 0, 1, 118, -954 )
				self.LeftPanel:setAlpha( 0 )
				LeftPanelFrame2( LeftPanel, {} )
				local chooseClassWidgetFrame2 = function ( chooseClassWidget, event )
					local chooseClassWidgetFrame3 = function ( chooseClassWidget, event )
						local chooseClassWidgetFrame4 = function ( chooseClassWidget, event )
							if not event.interrupted then
								chooseClassWidget:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Bounce )
							end
							chooseClassWidget:setAlpha( 1 )
							chooseClassWidget:setZoom( 0 )
							if event.interrupted then
								self.clipFinished( chooseClassWidget, event )
							else
								chooseClassWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							chooseClassWidgetFrame4( chooseClassWidget, event )
							return 
						else
							chooseClassWidget:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Bounce )
							chooseClassWidget:setAlpha( 1 )
							chooseClassWidget:registerEventHandler( "transition_complete_keyframe", chooseClassWidgetFrame4 )
						end
					end
					
					if event.interrupted then
						chooseClassWidgetFrame3( chooseClassWidget, event )
						return 
					else
						chooseClassWidget:beginAnimation( "keyframe", 439, false, false, CoD.TweenType.Linear )
						chooseClassWidget:registerEventHandler( "transition_complete_keyframe", chooseClassWidgetFrame3 )
					end
				end
				
				chooseClassWidget:completeAnimation()
				self.chooseClassWidget:setAlpha( 0 )
				self.chooseClassWidget:setZoom( 0 )
				chooseClassWidgetFrame2( chooseClassWidget, {} )
				local buttonListFrame2 = function ( buttonList, event )
					local buttonListFrame3 = function ( buttonList, event )
						if not event.interrupted then
							buttonList:beginAnimation( "keyframe", 560, false, false, CoD.TweenType.Bounce )
						end
						buttonList:setLeftRight( 0.5, 0.5, -844, -424 )
						buttonList:setTopBottom( 0, 0, 204, 456 )
						buttonList:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( buttonList, event )
						else
							buttonList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						buttonListFrame3( buttonList, event )
						return 
					else
						buttonList:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
						buttonList:registerEventHandler( "transition_complete_keyframe", buttonListFrame3 )
					end
				end
				
				buttonList:completeAnimation()
				self.buttonList:setLeftRight( 0.5, 0.5, -844, -424 )
				self.buttonList:setTopBottom( 0, 0, 204, 456 )
				self.buttonList:setAlpha( 0 )
				buttonListFrame2( buttonList, {} )
			end,
			Back = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				local LeftPanelFrame2 = function ( LeftPanel, event )
					local LeftPanelFrame3 = function ( LeftPanel, event )
						local LeftPanelFrame4 = function ( LeftPanel, event )
							if not event.interrupted then
								LeftPanel:beginAnimation( "keyframe", 410, false, true, CoD.TweenType.Linear )
							end
							LeftPanel:setLeftRight( 0.5, 0.5, -863.5, 176.5 )
							LeftPanel:setTopBottom( 0, 1, 1134, -954 )
							LeftPanel:setAlpha( 0.9 )
							if event.interrupted then
								self.clipFinished( LeftPanel, event )
							else
								LeftPanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							LeftPanelFrame4( LeftPanel, event )
							return 
						else
							LeftPanel:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
							LeftPanel:setTopBottom( 0, 1, 860, -954 )
							LeftPanel:setAlpha( 0.5 )
							LeftPanel:registerEventHandler( "transition_complete_keyframe", LeftPanelFrame4 )
						end
					end
					
					if event.interrupted then
						LeftPanelFrame3( LeftPanel, event )
						return 
					else
						LeftPanel:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
						LeftPanel:setLeftRight( 0.5, 0.5, -863.5, 176.5 )
						LeftPanel:registerEventHandler( "transition_complete_keyframe", LeftPanelFrame3 )
					end
				end
				
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( 0.5, 0.5, -864, -393 )
				self.LeftPanel:setTopBottom( 0, 1, 118, -954 )
				self.LeftPanel:setAlpha( 0 )
				LeftPanelFrame2( LeftPanel, {} )
				local chooseClassWidgetFrame2 = function ( chooseClassWidget, event )
					if not event.interrupted then
						chooseClassWidget:beginAnimation( "keyframe", 1000, true, true, CoD.TweenType.Linear )
					end
					chooseClassWidget:setLeftRight( 0.5, 0.5, -367, 145 )
					chooseClassWidget:setTopBottom( 0, 0, 120, 1018 )
					chooseClassWidget:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( chooseClassWidget, event )
					else
						chooseClassWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				chooseClassWidget:completeAnimation()
				self.chooseClassWidget:setLeftRight( 0.5, 0.5, -965, -215 )
				self.chooseClassWidget:setTopBottom( 0, 0, 120, 1018 )
				self.chooseClassWidget:setAlpha( 1 )
				chooseClassWidgetFrame2( chooseClassWidget, {} )
				local buttonListFrame2 = function ( buttonList, event )
					local buttonListFrame3 = function ( buttonList, event )
						if not event.interrupted then
							buttonList:beginAnimation( "keyframe", 519, false, true, CoD.TweenType.Linear )
						end
						buttonList:setLeftRight( 0.5, 0.5, -844, -424 )
						buttonList:setTopBottom( 0, 0, 204, 456 )
						if event.interrupted then
							self.clipFinished( buttonList, event )
						else
							buttonList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						buttonListFrame3( buttonList, event )
						return 
					else
						buttonList:beginAnimation( "keyframe", 479, false, false, CoD.TweenType.Linear )
						buttonList:registerEventHandler( "transition_complete_keyframe", buttonListFrame3 )
					end
				end
				
				buttonList:completeAnimation()
				self.buttonList:setLeftRight( 0.5, 0.5, -1629, -1209 )
				self.buttonList:setTopBottom( 0, 0, 204, 456 )
				buttonListFrame2( buttonList, {} )
				local CustomClasspreviewWidgetFrame2 = function ( CustomClasspreviewWidget, event )
					if not event.interrupted then
						CustomClasspreviewWidget:beginAnimation( "keyframe", 370, true, false, CoD.TweenType.Linear )
					end
					CustomClasspreviewWidget:setLeftRight( 0.5, 0.5, 109.5, 1384.5 )
					CustomClasspreviewWidget:setTopBottom( 0.5, 0.5, -354, 540 )
					CustomClasspreviewWidget:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( CustomClasspreviewWidget, event )
					else
						CustomClasspreviewWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CustomClasspreviewWidget:completeAnimation()
				self.CustomClasspreviewWidget:setLeftRight( 0.5, 0.5, -315.5, 959.5 )
				self.CustomClasspreviewWidget:setTopBottom( 0.5, 0.5, -354, 540 )
				self.CustomClasspreviewWidget:setAlpha( 1 )
				CustomClasspreviewWidgetFrame2( CustomClasspreviewWidget, {} )
			end,
			Close = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
				local FullscreenFrame2 = function ( Fullscreen, event )
					if not event.interrupted then
						Fullscreen:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					Fullscreen:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Fullscreen, event )
					else
						Fullscreen:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Fullscreen:completeAnimation()
				self.Fullscreen:setAlpha( 1 )
				FullscreenFrame2( Fullscreen, {} )
				cacBlackFadeIn:completeAnimation()
				self.cacBlackFadeIn:setAlpha( 0 )
				self.clipFinished( cacBlackFadeIn, {} )
				LeftPanel:completeAnimation()
				self.LeftPanel:setAlpha( 0 )
				self.clipFinished( LeftPanel, {} )
				buttonList:completeAnimation()
				self.buttonList:setAlpha( 0 )
				self.clipFinished( buttonList, {} )
				FEMenuLeftGraphics:completeAnimation()
				self.FEMenuLeftGraphics:setAlpha( 0 )
				self.clipFinished( FEMenuLeftGraphics, {} )
				CustomClasspreviewWidget:completeAnimation()
				self.CustomClasspreviewWidget:setAlpha( 0 )
				self.clipFinished( CustomClasspreviewWidget, {} )
				background:completeAnimation()
				self.background:setAlpha( 0 )
				self.clipFinished( background, {} )
			end
		},
		ExtraSlots = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( 0.5, 0.5, -864, -393 )
				self.LeftPanel:setTopBottom( 0, 1, 117, -79 )
				self.LeftPanel:setAlpha( 1 )
				self.clipFinished( LeftPanel, {} )
				buttonList:completeAnimation()
				self.buttonList:setLeftRight( 0.5, 0.5, -844, -424 )
				self.buttonList:setTopBottom( 0, 0, 204, 456 )
				self.buttonList:setAlpha( 0 )
				self.clipFinished( buttonList, {} )
				ExtraSlotDescription:completeAnimation()
				self.ExtraSlotDescription:setAlpha( 1 )
				self.clipFinished( ExtraSlotDescription, {} )
				BuyExtraSlotsBtn:completeAnimation()
				self.BuyExtraSlotsBtn:setAlpha( 1 )
				self.clipFinished( BuyExtraSlotsBtn, {} )
				CustomClasspreviewWidget:completeAnimation()
				self.CustomClasspreviewWidget:setAlpha( 0 )
				self.clipFinished( CustomClasspreviewWidget, {} )
			end,
			Intro = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				local LeftPanelFrame2 = function ( LeftPanel, event )
					local LeftPanelFrame3 = function ( LeftPanel, event )
						local LeftPanelFrame4 = function ( LeftPanel, event )
							if not event.interrupted then
								LeftPanel:beginAnimation( "keyframe", 410, false, true, CoD.TweenType.Linear )
							end
							LeftPanel:setLeftRight( 0.5, 0.5, -863.5, 176.5 )
							LeftPanel:setTopBottom( 0, 1, 1134, -954 )
							LeftPanel:setAlpha( 0.9 )
							if event.interrupted then
								self.clipFinished( LeftPanel, event )
							else
								LeftPanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							LeftPanelFrame4( LeftPanel, event )
							return 
						else
							LeftPanel:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
							LeftPanel:setTopBottom( 0, 1, 860, -954 )
							LeftPanel:setAlpha( 0.5 )
							LeftPanel:registerEventHandler( "transition_complete_keyframe", LeftPanelFrame4 )
						end
					end
					
					if event.interrupted then
						LeftPanelFrame3( LeftPanel, event )
						return 
					else
						LeftPanel:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
						LeftPanel:setLeftRight( 0.5, 0.5, -863.5, 176.5 )
						LeftPanel:registerEventHandler( "transition_complete_keyframe", LeftPanelFrame3 )
					end
				end
				
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( 0.5, 0.5, -864, -393 )
				self.LeftPanel:setTopBottom( 0, 1, 118, -954 )
				self.LeftPanel:setAlpha( 0 )
				LeftPanelFrame2( LeftPanel, {} )
				local chooseClassWidgetFrame2 = function ( chooseClassWidget, event )
					local chooseClassWidgetFrame3 = function ( chooseClassWidget, event )
						local chooseClassWidgetFrame4 = function ( chooseClassWidget, event )
							if not event.interrupted then
								chooseClassWidget:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Bounce )
							end
							chooseClassWidget:setAlpha( 1 )
							chooseClassWidget:setZoom( 0 )
							if event.interrupted then
								self.clipFinished( chooseClassWidget, event )
							else
								chooseClassWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							chooseClassWidgetFrame4( chooseClassWidget, event )
							return 
						else
							chooseClassWidget:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Bounce )
							chooseClassWidget:setAlpha( 1 )
							chooseClassWidget:registerEventHandler( "transition_complete_keyframe", chooseClassWidgetFrame4 )
						end
					end
					
					if event.interrupted then
						chooseClassWidgetFrame3( chooseClassWidget, event )
						return 
					else
						chooseClassWidget:beginAnimation( "keyframe", 439, false, false, CoD.TweenType.Linear )
						chooseClassWidget:registerEventHandler( "transition_complete_keyframe", chooseClassWidgetFrame3 )
					end
				end
				
				chooseClassWidget:completeAnimation()
				self.chooseClassWidget:setAlpha( 0 )
				self.chooseClassWidget:setZoom( 0 )
				chooseClassWidgetFrame2( chooseClassWidget, {} )
				local buttonListFrame2 = function ( buttonList, event )
					local buttonListFrame3 = function ( buttonList, event )
						if not event.interrupted then
							buttonList:beginAnimation( "keyframe", 560, false, false, CoD.TweenType.Bounce )
						end
						buttonList:setLeftRight( 0.5, 0.5, -844, -424 )
						buttonList:setTopBottom( 0, 0, 204, 456 )
						buttonList:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( buttonList, event )
						else
							buttonList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						buttonListFrame3( buttonList, event )
						return 
					else
						buttonList:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
						buttonList:registerEventHandler( "transition_complete_keyframe", buttonListFrame3 )
					end
				end
				
				buttonList:completeAnimation()
				self.buttonList:setLeftRight( 0.5, 0.5, -844, -424 )
				self.buttonList:setTopBottom( 0, 0, 204, 456 )
				self.buttonList:setAlpha( 0 )
				buttonListFrame2( buttonList, {} )
			end,
			Back = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				local LeftPanelFrame2 = function ( LeftPanel, event )
					local LeftPanelFrame3 = function ( LeftPanel, event )
						local LeftPanelFrame4 = function ( LeftPanel, event )
							if not event.interrupted then
								LeftPanel:beginAnimation( "keyframe", 410, false, true, CoD.TweenType.Linear )
							end
							LeftPanel:setLeftRight( 0.5, 0.5, -863.5, 176.5 )
							LeftPanel:setTopBottom( 0, 1, 1134, -954 )
							LeftPanel:setAlpha( 0.9 )
							if event.interrupted then
								self.clipFinished( LeftPanel, event )
							else
								LeftPanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							LeftPanelFrame4( LeftPanel, event )
							return 
						else
							LeftPanel:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
							LeftPanel:setTopBottom( 0, 1, 860, -954 )
							LeftPanel:setAlpha( 0.5 )
							LeftPanel:registerEventHandler( "transition_complete_keyframe", LeftPanelFrame4 )
						end
					end
					
					if event.interrupted then
						LeftPanelFrame3( LeftPanel, event )
						return 
					else
						LeftPanel:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
						LeftPanel:setLeftRight( 0.5, 0.5, -863.5, 176.5 )
						LeftPanel:registerEventHandler( "transition_complete_keyframe", LeftPanelFrame3 )
					end
				end
				
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( 0.5, 0.5, -864, -393 )
				self.LeftPanel:setTopBottom( 0, 1, 118, -954 )
				self.LeftPanel:setAlpha( 0 )
				LeftPanelFrame2( LeftPanel, {} )
				local chooseClassWidgetFrame2 = function ( chooseClassWidget, event )
					if not event.interrupted then
						chooseClassWidget:beginAnimation( "keyframe", 1000, true, true, CoD.TweenType.Linear )
					end
					chooseClassWidget:setLeftRight( 0.5, 0.5, -367, 145 )
					chooseClassWidget:setTopBottom( 0, 0, 120, 1018 )
					chooseClassWidget:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( chooseClassWidget, event )
					else
						chooseClassWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				chooseClassWidget:completeAnimation()
				self.chooseClassWidget:setLeftRight( 0.5, 0.5, -965, -215 )
				self.chooseClassWidget:setTopBottom( 0, 0, 120, 1018 )
				self.chooseClassWidget:setAlpha( 1 )
				chooseClassWidgetFrame2( chooseClassWidget, {} )
				local buttonListFrame2 = function ( buttonList, event )
					local buttonListFrame3 = function ( buttonList, event )
						if not event.interrupted then
							buttonList:beginAnimation( "keyframe", 519, false, true, CoD.TweenType.Linear )
						end
						buttonList:setLeftRight( 0.5, 0.5, -844, -424 )
						buttonList:setTopBottom( 0, 0, 204, 456 )
						if event.interrupted then
							self.clipFinished( buttonList, event )
						else
							buttonList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						buttonListFrame3( buttonList, event )
						return 
					else
						buttonList:beginAnimation( "keyframe", 479, false, false, CoD.TweenType.Linear )
						buttonList:registerEventHandler( "transition_complete_keyframe", buttonListFrame3 )
					end
				end
				
				buttonList:completeAnimation()
				self.buttonList:setLeftRight( 0.5, 0.5, -1629, -1209 )
				self.buttonList:setTopBottom( 0, 0, 204, 456 )
				buttonListFrame2( buttonList, {} )
				local CustomClasspreviewWidgetFrame2 = function ( CustomClasspreviewWidget, event )
					if not event.interrupted then
						CustomClasspreviewWidget:beginAnimation( "keyframe", 370, true, false, CoD.TweenType.Linear )
					end
					CustomClasspreviewWidget:setLeftRight( 0.5, 0.5, 109.5, 1384.5 )
					CustomClasspreviewWidget:setTopBottom( 0.5, 0.5, -354, 540 )
					CustomClasspreviewWidget:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( CustomClasspreviewWidget, event )
					else
						CustomClasspreviewWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CustomClasspreviewWidget:completeAnimation()
				self.CustomClasspreviewWidget:setLeftRight( 0.5, 0.5, -315.5, 959.5 )
				self.CustomClasspreviewWidget:setTopBottom( 0.5, 0.5, -354, 540 )
				self.CustomClasspreviewWidget:setAlpha( 1 )
				CustomClasspreviewWidgetFrame2( CustomClasspreviewWidget, {} )
			end,
			Close = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
				local FullscreenFrame2 = function ( Fullscreen, event )
					if not event.interrupted then
						Fullscreen:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					Fullscreen:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Fullscreen, event )
					else
						Fullscreen:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Fullscreen:completeAnimation()
				self.Fullscreen:setAlpha( 1 )
				FullscreenFrame2( Fullscreen, {} )
				cacBlackFadeIn:completeAnimation()
				self.cacBlackFadeIn:setAlpha( 0 )
				self.clipFinished( cacBlackFadeIn, {} )
				LeftPanel:completeAnimation()
				self.LeftPanel:setAlpha( 0 )
				self.clipFinished( LeftPanel, {} )
				buttonList:completeAnimation()
				self.buttonList:setAlpha( 0 )
				self.clipFinished( buttonList, {} )
				FEMenuLeftGraphics:completeAnimation()
				self.FEMenuLeftGraphics:setAlpha( 0 )
				self.clipFinished( FEMenuLeftGraphics, {} )
				CustomClasspreviewWidget:completeAnimation()
				self.CustomClasspreviewWidget:setAlpha( 0 )
				self.clipFinished( CustomClasspreviewWidget, {} )
				background:completeAnimation()
				self.background:setAlpha( 0 )
				self.clipFinished( background, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "ExtraSlots",
			condition = function ( menu, element, event )
				local f63_local0 = IsClassSetsAvailableForCurrentGameMode()
				if f63_local0 then
					if not DoesPlayerHaveExtraSlotsItem( controller ) then
						f63_local0 = IsModelValueGreaterThan( controller, "currentClassSetIndex", 0 )
					else
						f63_local0 = false
					end
				end
				return f63_local0
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentClassSetIndex" ), function ( model )
		self:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentClassSetIndex"
		} )
	end )
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "update_class", function ( element, event )
		local retVal = nil
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:registerEventHandler( "menu_opened", function ( element, event )
		local retVal = nil
		if IsCampaign() and TestAndSetFirstTimeMenu( controller, "com_firsttime_armory" ) then
			OpenGenericLargePopup( self, controller, "MENU_FIRSTTIME_ARMORY", "MENU_FIRSTTIME_ARMORY2", "com_firsttime_armory_image", "MENU_FIRSTTIME_ARMORY_BUTTONTEXT", "", "" )
		else
			SetElementStateByElementName( self, "background", controller, "Intro" )
			PlayClipOnElement( self, {
				elementName = "cacElemsSideListCustomClass0",
				clipName = "Intro"
			}, controller )
			PlayClip( self, "Intro", controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		if IsInGame() then
			SetElementStateByElementName( self, "background", controller, "Update" )
			PlayClip( self, "Back", controller )
			LockInput( self, controller, true )
			SetCharacterModeToCurrentSessionMode( self, element, controller )
			RefreshCharacterCustomization( self, element, controller )
			SendClientScriptMenuChangeNotify( controller, self, true )
			PlayClipOnElement( self, {
				elementName = "cacBlackFadeIn",
				clipName = "Intro"
			}, controller )
			ShowHeaderKickerAndIcon( self )
			PrepareOpenMenuInSafehouse( controller )
			SetHeadingKickerText( "MENU_CAMPAIGN" )
		else
			SetElementStateByElementName( self, "background", controller, "Update" )
			PlayClip( self, "Back", controller )
			SetCharacterModeToCurrentSessionMode( self, element, controller )
			RefreshCharacterCustomization( self, element, controller )
			SendClientScriptMenuChangeNotify( controller, self, true )
			ShowHeaderKickerAndIcon( self )
			SetHeadingKickerTextToGameMode( "MPUI_PUBLIC_MATCH_LOBBY" )
			PlayClipOnElement( self, {
				elementName = "chooseClassWidget",
				clipName = "WildcardDefault"
			}, controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		if IsInGame() then
			SendOwnMenuResponse( menu, controller, "closed" )
			Close( self, controller )
			ClearSavedState( self, controller )
			SaveLoadout( self, controller )
			ResetCustomClassStartingFocus( self, element, controller, true )
			LockInput( self, controller, false )
			SendClientScriptMenuChangeNotify( controller, menu, false )
			PrepareCloseMenuInSafehouse( controller )
			UploadStats( self, controller )
			MarkCACPaintshopDataDirty( self, controller )
			return true
		elseif IsMenuInState( menu, "ExtraSlots" ) then
			ClearSavedState( self, controller )
			SaveLoadout( self, controller )
			UploadStats( self, controller )
			ResetCustomClassStartingFocus( self, element, controller, true )
			MarkCACPaintshopDataDirty( self, controller )
			SendClientScriptMenuChangeNotify( controller, menu, false )
			ForceNotifyPregameUpdate( self, element, controller )
			SetPerControllerTableProperty( controller, "updateNewBreadcrumbs", true )
			GoBack( self, controller )
			ForceLobbyButtonUpdate( controller )
			CopyLoadoutToClassSet( controller )
			ClearMenuSavedState( menu )
			return true
		else
			ClearSavedState( self, controller )
			SaveLoadout( self, controller )
			UploadStats( self, controller )
			ResetCustomClassStartingFocus( self, element, controller, true )
			MarkCACPaintshopDataDirty( self, controller )
			SendClientScriptMenuChangeNotify( controller, menu, false )
			ForceNotifyPregameUpdate( self, element, controller )
			SetPerControllerTableProperty( controller, "updateNewBreadcrumbs", true )
			GoBack( self, controller )
			ForceLobbyButtonUpdate( controller )
			CopyLoadoutToClassSet( controller )
			return true
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_START, "O", function ( element, menu, controller, model )
		if not IsPerControllerTablePropertyValue( controller, "enableClassOptions", false ) then
			OpenPopup( self, "ClassOptions", controller, "", "" )
			PlaySoundSetSound( self, "menu_sub" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsPerControllerTablePropertyValue( controller, "enableClassOptions", false ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_CLASS_OPTIONS", nil )
			return true
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, nil, function ( element, menu, controller, model )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "PLATFORM_EMBLEM_ROTATE_LAYER", nil )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_LB, nil, function ( element, menu, controller, model )
		if IsClassSetsAvailableForCurrentGameMode() and not DoesPlayerHaveExtraSlotsItem( controller ) then
			SetChooseClassMenuFromExtraSlotPromptState( self, controller, menu, "buttonList", "buttonList" )
			return true
		elseif IsClassSetsAvailableForCurrentGameMode() then
			DecrementClassSetAndUpdateElementDataSource( self, controller, menu, "buttonList", "buttonList" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsClassSetsAvailableForCurrentGameMode() and not DoesPlayerHaveExtraSlotsItem( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_LB, "", nil )
			return false
		elseif IsClassSetsAvailableForCurrentGameMode() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_LB, "", nil )
			return false
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RB, nil, function ( element, menu, controller, model )
		if IsClassSetsAvailableForCurrentGameMode() and not DoesPlayerHaveExtraSlotsItem( controller ) and ShowCACExtraClassBreadcrumb( controller ) then
			SetSeenExtraClassSets( controller )
			UpdateElementState( self, "ClassSetTabWidget", controller )
			SetChooseClassMenuToExtraSlotPromptState( self, controller, menu, "buttonList", "buttonList" )
			return true
		elseif IsClassSetsAvailableForCurrentGameMode() and not DoesPlayerHaveExtraSlotsItem( controller ) then
			SetChooseClassMenuToExtraSlotPromptState( self, controller, menu, "buttonList", "buttonList" )
			return true
		elseif IsClassSetsAvailableForCurrentGameMode() then
			IncrementClassSetAndUpdateElementDataSource( self, controller, menu, "buttonList", "buttonList" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsClassSetsAvailableForCurrentGameMode() and not DoesPlayerHaveExtraSlotsItem( controller ) and ShowCACExtraClassBreadcrumb( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RB, "", nil )
			return false
		elseif IsClassSetsAvailableForCurrentGameMode() and not DoesPlayerHaveExtraSlotsItem( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RB, "", nil )
			return false
		elseif IsClassSetsAvailableForCurrentGameMode() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RB, "", nil )
			return false
		else
			return false
		end
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, state )
		if IsMenuInState( self, "DefaultState" ) then
			MakeElementFocusable( self, "buttonList", controller )
			MakeElementNotFocusable( self, "BuyExtraSlotsBtn", controller )
			SetFocusToElement( self, "buttonList", controller )
			SetChooseClassMenuFromExtraSlotPromptState( self, controller, self, "buttonList", "buttonList" )
		elseif IsMenuInState( self, "ExtraSlots" ) then
			MakeElementFocusable( self, "BuyExtraSlotsBtn", controller )
			MakeElementNotFocusable( self, "buttonList", controller )
			SetFocusToElement( self, "BuyExtraSlotsBtn", controller )
			SetChooseClassMenuToExtraSlotPromptState( self, controller, self, "buttonList", "buttonList" )
		end
	end )
	chooseClassWidget.id = "chooseClassWidget"
	buttonList.id = "buttonList"
	BuyExtraSlotsBtn.id = "BuyExtraSlotsBtn"
	feFooterContainer:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.buttonList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.cacBlackFadeIn:close()
		self.LeftPanel:close()
		self.chooseClassWidget:close()
		self.buttonList:close()
		self.BuyExtraSlotsBtn:close()
		self.ClassSetTabWidget:close()
		self.FEMenuLeftGraphics:close()
		self.CustomClasspreviewWidget:close()
		self.feFooterContainer:close()
		self.background:close()
		self.PregameTimerOverlay:close()
		self.XCamMouseControl:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "chooseClass.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

