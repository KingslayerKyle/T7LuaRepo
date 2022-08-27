-- 8da8b251c36294d5685607af19a74f72
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.menus.CAC.Popups.ClassOptions" )
require( "ui.uieditor.widgets.CAC.cac_BlackFadeIn" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.chooseClassWidget" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.chooseClassButtonList" )
require( "ui.uieditor.widgets.CAC.List1ButtonChooseClass" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ChooseClass_ClassSetTabWidget" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ChooseClass_ClassSetTabPip" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.InfopanePreviewWidget" )
require( "ui.uieditor.widgets.Footer.fe_FooterContainer_NOTLobby" )
require( "ui.uieditor.widgets.BackgroundFrames.CACBackgroundNew" )
require( "ui.uieditor.widgets.Pregame.Pregame_TimerOverlay" )
require( "ui.uieditor.widgets.PC.Utility.XCamMouseControl" )

DataSources.ClassSetTabs = DataSourceHelpers.ListSetup( "ClassSetTabs", function ( f1_arg0 )
	local f1_local0 = {}
	if not IsClassSetsAvailableForCurrentGameMode() then
		return f1_local0
	end
	local f1_local1 = Engine.GetNumberOfClassSetsOwned( f1_arg0 )
	local f1_local2 = Dvar.purchasedClassSetCount:get()
	local f1_local3 = Engine.GetCurrentClassSetIndex( f1_arg0 )
	if f1_local1 <= f1_local3 then
		f1_local3 = 0
		Engine.SetCurrentClassSetIndex( f1_arg0, f1_local3 )
	end
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f1_arg0 ), "currentClassSetIndex" ), f1_local3 )
	for f1_local4 = 1, f1_local2, 1 do
		local f1_local7 = f1_local4 - 1
		local f1_local8 = Engine.Localize( Engine.GetClassSetName( f1_arg0, f1_local7 ) )
		local f1_local9 = f1_local7 == f1_local1
		local f1_local10 = table.insert
		local f1_local11 = f1_local0
		local f1_local12 = {}
		local f1_local13 = {
			tabName = f1_local8,
			customClassName = f1_local8,
			classSetId = f1_local7
		}
		local f1_local14
		if f1_local9 or f1_local1 > f1_local7 then
			f1_local14 = false
		else
			f1_local14 = true
		end
		f1_local13.isDisabled = f1_local14
		f1_local13.isExtraSlotsPrompt = f1_local9
		f1_local12.models = f1_local13
		f1_local12.properties = {
			selectIndex = f1_local7 == f1_local3
		}
		f1_local10( f1_local11, f1_local12 )
	end
	return f1_local0
end, nil, nil, function ( f2_arg0, f2_arg1, f2_arg2 )
	local f2_local0 = Engine.CreateModel( Engine.GetModelForController( f2_arg0 ), "classSetsUpdated" )
	if f2_arg1.updateSubscription then
		f2_arg1:removeSubscription( f2_arg1.updateSubscription )
	end
	f2_arg1.updateSubscription = f2_arg1:subscribeToModel( f2_local0, function ()
		f2_arg1:updateDataSource()
	end, false )
end )
local PreLoadFunc = function ( self, controller )
	self.disableBlur = true
	LUI.OverrideFunction_CallOriginalFirst( self, "setModel", function ( element, controller )
		element:processEvent( {
			name = "update_state",
			menu = element
		} )
	end )
	if CoD.isCampaign then
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "currentClassSetIndex" ), 0 )
		CoD.CACUtility.SetDefaultCACRoot( controller )
		if Gunsmith_IsEnabled( self, controller ) then
			CoD.CraftUtility.Gunsmith.ParseDDL( controller, Enum.StorageFileType.STORAGE_GUNSMITH )
		end
	end
	CheckGCCatchUp()
end

local PostLoadFunc = function ( f6_arg0, f6_arg1 )
	if CoD.CACUtility.FromCustomClass then
		f6_arg0:playSound( "cac_reenter" )
		CoD.CACUtility.FromCustomClass = false
	else
		f6_arg0:playSound( "cac_enter" )
	end
	f6_arg0.buttonList.navigation = {
		right = nil
	}
	f6_arg0.chooseClassWidget.m_inputDisabled = true
	if not CoD.UnlockablesTable then
		CoD.UnlockablesTable = CoD.GetUnlockablesTable( f6_arg1 )
	end
	CoD.CACUtility.CreateUnlockTokenModels( f6_arg1 )
	CoD.PrestigeUtility.CreatePermanentUnlockTokenModel( f6_arg1 )
	CoD.CACUtility.SetCACMenuHeroInfoModels( f6_arg1 )
	Engine.SendClientScriptNotify( f6_arg1, "choose_class_preview", "opened", Engine.GetEquippedHero( f6_arg1, Enum.eModes.MODE_MULTIPLAYER ) )
	CoD.CACUtility.ForceStreamAttachmentImages( f6_arg1 )
end

LUI.createMenu.chooseClass = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "chooseClass" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "CAC"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "chooseClass.buttonPrompts" )
	local f7_local1 = self
	self.anyChildUsesUpdateState = true
	
	local Fullscreen = LUI.UIImage.new()
	Fullscreen:setLeftRight( true, true, 0, 0 )
	Fullscreen:setTopBottom( true, true, 0, 0 )
	Fullscreen:setRGB( 0, 0, 0 )
	Fullscreen:setAlpha( 0 )
	Fullscreen:setImage( RegisterImage( "uie_default_black_0" ) )
	self:addElement( Fullscreen )
	self.Fullscreen = Fullscreen
	
	local cacBlackFadeIn = CoD.cac_BlackFadeIn.new( f7_local1, controller )
	cacBlackFadeIn:setLeftRight( true, true, 0, 0 )
	cacBlackFadeIn:setTopBottom( true, true, 0, 0 )
	self:addElement( cacBlackFadeIn )
	self.cacBlackFadeIn = cacBlackFadeIn
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( f7_local1, controller )
	LeftPanel:setLeftRight( false, false, -576, -262 )
	LeftPanel:setTopBottom( true, true, 78, -582.02 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	LeftPanel:setAlpha( 0.09 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local chooseClassWidget = CoD.chooseClassWidget.new( f7_local1, controller )
	chooseClassWidget:setLeftRight( false, false, -247.5, 93.5 )
	chooseClassWidget:setTopBottom( true, false, 85, 684 )
	chooseClassWidget:setAlpha( 0 )
	self:addElement( chooseClassWidget )
	self.chooseClassWidget = chooseClassWidget
	
	local buttonList = CoD.chooseClassButtonList.new( f7_local1, controller )
	buttonList:setLeftRight( false, false, -563, -283 )
	buttonList:setTopBottom( true, false, 136, 474 )
	self:addElement( buttonList )
	self.buttonList = buttonList
	
	local ExtraSlotDescription = LUI.UIText.new()
	ExtraSlotDescription:setLeftRight( true, false, 71, 351 )
	ExtraSlotDescription:setTopBottom( true, false, 186.58, 211.58 )
	ExtraSlotDescription:setAlpha( 0 )
	ExtraSlotDescription:setText( Engine.Localize( "MENU_EXTRASLOTS_PACK_DESC" ) )
	ExtraSlotDescription:setTTF( "fonts/default.ttf" )
	ExtraSlotDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ExtraSlotDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ExtraSlotDescription )
	self.ExtraSlotDescription = ExtraSlotDescription
	
	local BuyExtraSlotsBtn = CoD.List1ButtonChooseClass.new( f7_local1, controller )
	BuyExtraSlotsBtn:setLeftRight( true, false, 71, 351 )
	BuyExtraSlotsBtn:setTopBottom( true, false, 154.58, 186.58 )
	BuyExtraSlotsBtn:setAlpha( 0 )
	BuyExtraSlotsBtn.btnDisplayText:setText( Engine.Localize( "MENU_EXTRASLOTS_BUY_CAPS" ) )
	BuyExtraSlotsBtn.btnDisplayTextStroke:setText( Engine.Localize( "MENU_EXTRASLOTS_BUY_CAPS" ) )
	BuyExtraSlotsBtn:registerEventHandler( "gain_focus", function ( element, event )
		local f8_local0 = nil
		if element.gainFocus then
			f8_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f8_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f7_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f8_local0
	end )
	BuyExtraSlotsBtn:registerEventHandler( "lose_focus", function ( element, event )
		local f9_local0 = nil
		if element.loseFocus then
			f9_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f9_local0 = element.super:loseFocus( event )
		end
		return f9_local0
	end )
	f7_local1:AddButtonCallbackFunction( BuyExtraSlotsBtn, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f10_arg0, f10_arg1, f10_arg2, f10_arg3 )
		if IsMenuInState( f10_arg1, "ExtraSlots" ) then
			OpenPurchaseExtraSlotsOverlay( self, f10_arg2, f10_arg1 )
			return true
		else
			
		end
	end, function ( f11_arg0, f11_arg1, f11_arg2 )
		if IsMenuInState( f11_arg1, "ExtraSlots" ) then
			CoD.Menu.SetButtonLabel( f11_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
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
	self:addElement( BuyExtraSlotsBtn )
	self.BuyExtraSlotsBtn = BuyExtraSlotsBtn
	
	local ClassSetTabWidget = CoD.ChooseClass_ClassSetTabWidget.new( f7_local1, controller )
	ClassSetTabWidget:setLeftRight( true, false, 71, 360 )
	ClassSetTabWidget:setTopBottom( true, false, 86, 126 )
	ClassSetTabWidget.Internal.Tabs:setDataSource( "ClassSetTabs" )
	ClassSetTabWidget.Internal.IndicatorsGrid:setWidgetType( CoD.ChooseClass_ClassSetTabPip )
	ClassSetTabWidget.Internal.IndicatorsGrid:setDataSource( "ClassSetTabs" )
	ClassSetTabWidget:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsClassSetsAvailableForCurrentGameMode()
			end
		}
	} )
	self:addElement( ClassSetTabWidget )
	self.ClassSetTabWidget = ClassSetTabWidget
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( f7_local1, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics:setTopBottom( true, true, 86, -16.75 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local CustomClasspreviewWidget = CoD.InfopanePreviewWidget.new( f7_local1, controller )
	CustomClasspreviewWidget:setLeftRight( false, false, 71, 921 )
	CustomClasspreviewWidget:setTopBottom( false, false, -236, 360 )
	CustomClasspreviewWidget:setAlpha( 0.43 )
	CustomClasspreviewWidget:linkToElementModel( self, nil, false, function ( model )
		CustomClasspreviewWidget:setModel( model, controller )
	end )
	self:addElement( CustomClasspreviewWidget )
	self.CustomClasspreviewWidget = CustomClasspreviewWidget
	
	local feFooterContainer = CoD.fe_FooterContainer_NOTLobby.new( f7_local1, controller )
	feFooterContainer:setLeftRight( true, true, 0, 0 )
	feFooterContainer:setTopBottom( false, true, -65, 0 )
	feFooterContainer:registerEventHandler( "menu_loaded", function ( element, event )
		local f16_local0 = nil
		SizeToSafeArea( element, controller )
		if not f16_local0 then
			f16_local0 = element:dispatchEventToChildren( event )
		end
		return f16_local0
	end )
	feFooterContainer:mergeStateConditions( {
		{
			stateName = "WithHeroesHead",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( feFooterContainer )
	self.feFooterContainer = feFooterContainer
	
	local background = CoD.CACBackgroundNew.new( f7_local1, controller )
	background:setLeftRight( true, true, 0, 0 )
	background:setTopBottom( true, true, 0, 0 )
	background.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( LocalizeToUpperString( GetStringforGameMode( "MENU_CHOOSE_LOADOUT", "MPUI_CHOOSE_CLASS", "MPUI_CHOOSE_CLASS", "MPUI_CHOOSE_CLASS_CAPS" ) ) )
	self:addElement( background )
	self.background = background
	
	local PregameTimerOverlay = CoD.Pregame_TimerOverlay.new( f7_local1, controller )
	PregameTimerOverlay:setLeftRight( true, true, 0, 0 )
	PregameTimerOverlay:setTopBottom( true, true, 0, 0 )
	PregameTimerOverlay:mergeStateConditions( {
		{
			stateName = "ChooseClass",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	PregameTimerOverlay:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.state" ), function ( model )
		f7_local1:updateElementState( PregameTimerOverlay, {
			name = "model_validation",
			menu = f7_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.Pregame.state"
		} )
	end )
	self:addElement( PregameTimerOverlay )
	self.PregameTimerOverlay = PregameTimerOverlay
	
	local XCamMouseControl = CoD.XCamMouseControl.new( f7_local1, controller )
	XCamMouseControl:setLeftRight( false, false, 161.5, 921.5 )
	XCamMouseControl:setTopBottom( true, true, 124, -86 )
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
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				Fullscreen:completeAnimation()
				self.Fullscreen:setAlpha( 0 )
				self.clipFinished( Fullscreen, {} )
				cacBlackFadeIn:completeAnimation()
				self.cacBlackFadeIn:setAlpha( 1 )
				self.clipFinished( cacBlackFadeIn, {} )
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( false, false, -576, 117.5 )
				self.LeftPanel:setTopBottom( true, true, 78, 36 )
				self.LeftPanel:setAlpha( 1 )
				self.clipFinished( LeftPanel, {} )
				chooseClassWidget:completeAnimation()
				self.chooseClassWidget:setAlpha( 1 )
				self.chooseClassWidget:setZoom( 0 )
				self.clipFinished( chooseClassWidget, {} )
				buttonList:completeAnimation()
				self.buttonList:setLeftRight( false, false, -563, -283 )
				self.buttonList:setTopBottom( true, false, 136, 304 )
				self.buttonList:setAlpha( 1 )
				self.buttonList:setZoom( 0 )
				self.clipFinished( buttonList, {} )
				ExtraSlotDescription:completeAnimation()
				self.ExtraSlotDescription:setAlpha( 0 )
				self.clipFinished( ExtraSlotDescription, {} )
				BuyExtraSlotsBtn:completeAnimation()
				self.BuyExtraSlotsBtn:setAlpha( 0 )
				self.clipFinished( BuyExtraSlotsBtn, {} )
				CustomClasspreviewWidget:completeAnimation()
				self.CustomClasspreviewWidget:setLeftRight( false, false, 71, 921 )
				self.CustomClasspreviewWidget:setTopBottom( false, false, -236, 360 )
				self.CustomClasspreviewWidget:setAlpha( 0 )
				self.clipFinished( CustomClasspreviewWidget, {} )
				background:completeAnimation()
				background.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:completeAnimation()
				self.background:setAlpha( 1 )
				self.background.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( LocalizeToUpperString( GetStringforGameMode( "MENU_CHOOSE_LOADOUT", "MPUI_CHOOSE_CLASS", "MPUI_CHOOSE_CLASS", "MPUI_CHOOSE_CLASS_CAPS" ) ) )
				self.clipFinished( background, {} )
			end,
			Intro = function ()
				self:setupElementClipCounter( 4 )
				local LeftPanelFrame2 = function ( LeftPanel, event )
					local LeftPanelFrame3 = function ( LeftPanel, event )
						local LeftPanelFrame4 = function ( LeftPanel, event )
							if not event.interrupted then
								LeftPanel:beginAnimation( "keyframe", 410, false, true, CoD.TweenType.Linear )
							end
							LeftPanel:setLeftRight( false, false, -576, 117.5 )
							LeftPanel:setTopBottom( true, true, 756, -636 )
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
							LeftPanel:setTopBottom( true, true, 573, -636 )
							LeftPanel:setAlpha( 0.5 )
							LeftPanel:registerEventHandler( "transition_complete_keyframe", LeftPanelFrame4 )
						end
					end
					
					if event.interrupted then
						LeftPanelFrame3( LeftPanel, event )
						return 
					else
						LeftPanel:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
						LeftPanel:setLeftRight( false, false, -576, 117.5 )
						LeftPanel:registerEventHandler( "transition_complete_keyframe", LeftPanelFrame3 )
					end
				end
				
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( false, false, -576, -262 )
				self.LeftPanel:setTopBottom( true, true, 78, -636 )
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
						buttonList:setLeftRight( false, false, -563, -283 )
						buttonList:setTopBottom( true, false, 136, 304 )
						buttonList:setAlpha( 1 )
						buttonList:setZoom( 0 )
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
				self.buttonList:setLeftRight( false, false, -563, -283 )
				self.buttonList:setTopBottom( true, false, 136, 304 )
				self.buttonList:setAlpha( 0 )
				self.buttonList:setZoom( 0 )
				buttonListFrame2( buttonList, {} )
				CustomClasspreviewWidget:completeAnimation()
				self.CustomClasspreviewWidget:setLeftRight( false, false, 71, 921 )
				self.CustomClasspreviewWidget:setTopBottom( false, false, -236, 360 )
				self.clipFinished( CustomClasspreviewWidget, {} )
			end,
			Back = function ()
				self:setupElementClipCounter( 4 )
				local LeftPanelFrame2 = function ( LeftPanel, event )
					local LeftPanelFrame3 = function ( LeftPanel, event )
						local LeftPanelFrame4 = function ( LeftPanel, event )
							if not event.interrupted then
								LeftPanel:beginAnimation( "keyframe", 410, false, true, CoD.TweenType.Linear )
							end
							LeftPanel:setLeftRight( false, false, -576, 117.5 )
							LeftPanel:setTopBottom( true, true, 756, -636 )
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
							LeftPanel:setTopBottom( true, true, 573, -636 )
							LeftPanel:setAlpha( 0.5 )
							LeftPanel:registerEventHandler( "transition_complete_keyframe", LeftPanelFrame4 )
						end
					end
					
					if event.interrupted then
						LeftPanelFrame3( LeftPanel, event )
						return 
					else
						LeftPanel:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
						LeftPanel:setLeftRight( false, false, -576, 117.5 )
						LeftPanel:registerEventHandler( "transition_complete_keyframe", LeftPanelFrame3 )
					end
				end
				
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( false, false, -576, -262 )
				self.LeftPanel:setTopBottom( true, true, 78, -636 )
				self.LeftPanel:setAlpha( 0 )
				LeftPanelFrame2( LeftPanel, {} )
				local chooseClassWidgetFrame2 = function ( chooseClassWidget, event )
					if not event.interrupted then
						chooseClassWidget:beginAnimation( "keyframe", 1000, true, true, CoD.TweenType.Linear )
					end
					chooseClassWidget:setLeftRight( false, false, -244.5, 96.5 )
					chooseClassWidget:setTopBottom( true, false, 80, 679 )
					chooseClassWidget:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( chooseClassWidget, event )
					else
						chooseClassWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				chooseClassWidget:completeAnimation()
				self.chooseClassWidget:setLeftRight( false, false, -643, -143 )
				self.chooseClassWidget:setTopBottom( true, false, 80, 679 )
				self.chooseClassWidget:setAlpha( 1 )
				chooseClassWidgetFrame2( chooseClassWidget, {} )
				local buttonListFrame2 = function ( buttonList, event )
					local buttonListFrame3 = function ( buttonList, event )
						if not event.interrupted then
							buttonList:beginAnimation( "keyframe", 519, false, true, CoD.TweenType.Linear )
						end
						buttonList:setLeftRight( false, false, -563, -283 )
						buttonList:setTopBottom( true, false, 136, 304 )
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
						buttonList:beginAnimation( "keyframe", 479, false, false, CoD.TweenType.Linear )
						buttonList:registerEventHandler( "transition_complete_keyframe", buttonListFrame3 )
					end
				end
				
				buttonList:completeAnimation()
				self.buttonList:setLeftRight( false, false, -1086, -806 )
				self.buttonList:setTopBottom( true, false, 136, 304 )
				self.buttonList:setAlpha( 1 )
				buttonListFrame2( buttonList, {} )
				local CustomClasspreviewWidgetFrame2 = function ( CustomClasspreviewWidget, event )
					if not event.interrupted then
						CustomClasspreviewWidget:beginAnimation( "keyframe", 370, true, false, CoD.TweenType.Linear )
					end
					CustomClasspreviewWidget:setLeftRight( false, false, 73, 923 )
					CustomClasspreviewWidget:setTopBottom( false, false, -236, 360 )
					CustomClasspreviewWidget:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( CustomClasspreviewWidget, event )
					else
						CustomClasspreviewWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CustomClasspreviewWidget:completeAnimation()
				self.CustomClasspreviewWidget:setLeftRight( false, false, -210, 640 )
				self.CustomClasspreviewWidget:setTopBottom( false, false, -236, 360 )
				self.CustomClasspreviewWidget:setAlpha( 1 )
				CustomClasspreviewWidgetFrame2( CustomClasspreviewWidget, {} )
			end,
			Close = function ()
				self:setupElementClipCounter( 8 )
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
				chooseClassWidget:completeAnimation()
				self.chooseClassWidget:setAlpha( 0 )
				self.clipFinished( chooseClassWidget, {} )
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
				self:setupElementClipCounter( 9 )
				Fullscreen:completeAnimation()
				self.Fullscreen:setAlpha( 0 )
				self.clipFinished( Fullscreen, {} )
				cacBlackFadeIn:completeAnimation()
				self.cacBlackFadeIn:setAlpha( 1 )
				self.clipFinished( cacBlackFadeIn, {} )
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( false, false, -576, -262 )
				self.LeftPanel:setTopBottom( true, true, 78, -53 )
				self.LeftPanel:setAlpha( 1 )
				self.clipFinished( LeftPanel, {} )
				chooseClassWidget:completeAnimation()
				self.chooseClassWidget:setAlpha( 0 )
				self.chooseClassWidget:setZoom( 0 )
				self.clipFinished( chooseClassWidget, {} )
				buttonList:completeAnimation()
				self.buttonList:setLeftRight( false, false, -563, -283 )
				self.buttonList:setTopBottom( true, false, 136, 304 )
				self.buttonList:setAlpha( 0 )
				self.buttonList:setZoom( 0 )
				self.clipFinished( buttonList, {} )
				ExtraSlotDescription:completeAnimation()
				self.ExtraSlotDescription:setAlpha( 1 )
				self.clipFinished( ExtraSlotDescription, {} )
				BuyExtraSlotsBtn:completeAnimation()
				self.BuyExtraSlotsBtn:setAlpha( 1 )
				self.clipFinished( BuyExtraSlotsBtn, {} )
				CustomClasspreviewWidget:completeAnimation()
				self.CustomClasspreviewWidget:setLeftRight( false, false, 71, 921 )
				self.CustomClasspreviewWidget:setTopBottom( false, false, -236, 360 )
				self.CustomClasspreviewWidget:setAlpha( 0 )
				self.clipFinished( CustomClasspreviewWidget, {} )
				background:completeAnimation()
				background.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:completeAnimation()
				self.background:setAlpha( 1 )
				self.background.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( LocalizeToUpperString( GetStringforGameMode( "MENU_CHOOSE_LOADOUT", "MPUI_CHOOSE_CLASS", "MPUI_CHOOSE_CLASS", "MPUI_CHOOSE_CLASS_CAPS" ) ) )
				self.clipFinished( background, {} )
			end,
			Intro = function ()
				self:setupElementClipCounter( 4 )
				local LeftPanelFrame2 = function ( LeftPanel, event )
					local LeftPanelFrame3 = function ( LeftPanel, event )
						local LeftPanelFrame4 = function ( LeftPanel, event )
							if not event.interrupted then
								LeftPanel:beginAnimation( "keyframe", 410, false, true, CoD.TweenType.Linear )
							end
							LeftPanel:setLeftRight( false, false, -576, 117.5 )
							LeftPanel:setTopBottom( true, true, 756, -636 )
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
							LeftPanel:setTopBottom( true, true, 573, -636 )
							LeftPanel:setAlpha( 0.5 )
							LeftPanel:registerEventHandler( "transition_complete_keyframe", LeftPanelFrame4 )
						end
					end
					
					if event.interrupted then
						LeftPanelFrame3( LeftPanel, event )
						return 
					else
						LeftPanel:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
						LeftPanel:setLeftRight( false, false, -576, 117.5 )
						LeftPanel:registerEventHandler( "transition_complete_keyframe", LeftPanelFrame3 )
					end
				end
				
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( false, false, -576, -262 )
				self.LeftPanel:setTopBottom( true, true, 78, -636 )
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
						buttonList:setLeftRight( false, false, -563, -283 )
						buttonList:setTopBottom( true, false, 136, 304 )
						buttonList:setAlpha( 1 )
						buttonList:setZoom( 0 )
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
				self.buttonList:setLeftRight( false, false, -563, -283 )
				self.buttonList:setTopBottom( true, false, 136, 304 )
				self.buttonList:setAlpha( 0 )
				self.buttonList:setZoom( 0 )
				buttonListFrame2( buttonList, {} )
				CustomClasspreviewWidget:completeAnimation()
				self.CustomClasspreviewWidget:setLeftRight( false, false, 71, 921 )
				self.CustomClasspreviewWidget:setTopBottom( false, false, -236, 360 )
				self.clipFinished( CustomClasspreviewWidget, {} )
			end,
			Back = function ()
				self:setupElementClipCounter( 4 )
				local LeftPanelFrame2 = function ( LeftPanel, event )
					local LeftPanelFrame3 = function ( LeftPanel, event )
						local LeftPanelFrame4 = function ( LeftPanel, event )
							if not event.interrupted then
								LeftPanel:beginAnimation( "keyframe", 410, false, true, CoD.TweenType.Linear )
							end
							LeftPanel:setLeftRight( false, false, -576, 117.5 )
							LeftPanel:setTopBottom( true, true, 756, -636 )
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
							LeftPanel:setTopBottom( true, true, 573, -636 )
							LeftPanel:setAlpha( 0.5 )
							LeftPanel:registerEventHandler( "transition_complete_keyframe", LeftPanelFrame4 )
						end
					end
					
					if event.interrupted then
						LeftPanelFrame3( LeftPanel, event )
						return 
					else
						LeftPanel:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
						LeftPanel:setLeftRight( false, false, -576, 117.5 )
						LeftPanel:registerEventHandler( "transition_complete_keyframe", LeftPanelFrame3 )
					end
				end
				
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( false, false, -576, -262 )
				self.LeftPanel:setTopBottom( true, true, 78, -636 )
				self.LeftPanel:setAlpha( 0 )
				LeftPanelFrame2( LeftPanel, {} )
				local chooseClassWidgetFrame2 = function ( chooseClassWidget, event )
					if not event.interrupted then
						chooseClassWidget:beginAnimation( "keyframe", 1000, true, true, CoD.TweenType.Linear )
					end
					chooseClassWidget:setLeftRight( false, false, -244.5, 96.5 )
					chooseClassWidget:setTopBottom( true, false, 80, 679 )
					chooseClassWidget:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( chooseClassWidget, event )
					else
						chooseClassWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				chooseClassWidget:completeAnimation()
				self.chooseClassWidget:setLeftRight( false, false, -643, -143 )
				self.chooseClassWidget:setTopBottom( true, false, 80, 679 )
				self.chooseClassWidget:setAlpha( 1 )
				chooseClassWidgetFrame2( chooseClassWidget, {} )
				local buttonListFrame2 = function ( buttonList, event )
					local buttonListFrame3 = function ( buttonList, event )
						if not event.interrupted then
							buttonList:beginAnimation( "keyframe", 519, false, true, CoD.TweenType.Linear )
						end
						buttonList:setLeftRight( false, false, -563, -283 )
						buttonList:setTopBottom( true, false, 136, 304 )
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
						buttonList:beginAnimation( "keyframe", 479, false, false, CoD.TweenType.Linear )
						buttonList:registerEventHandler( "transition_complete_keyframe", buttonListFrame3 )
					end
				end
				
				buttonList:completeAnimation()
				self.buttonList:setLeftRight( false, false, -1086, -806 )
				self.buttonList:setTopBottom( true, false, 136, 304 )
				self.buttonList:setAlpha( 1 )
				buttonListFrame2( buttonList, {} )
				local CustomClasspreviewWidgetFrame2 = function ( CustomClasspreviewWidget, event )
					if not event.interrupted then
						CustomClasspreviewWidget:beginAnimation( "keyframe", 370, true, false, CoD.TweenType.Linear )
					end
					CustomClasspreviewWidget:setLeftRight( false, false, 73, 923 )
					CustomClasspreviewWidget:setTopBottom( false, false, -236, 360 )
					CustomClasspreviewWidget:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( CustomClasspreviewWidget, event )
					else
						CustomClasspreviewWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CustomClasspreviewWidget:completeAnimation()
				self.CustomClasspreviewWidget:setLeftRight( false, false, -210, 640 )
				self.CustomClasspreviewWidget:setTopBottom( false, false, -236, 360 )
				self.CustomClasspreviewWidget:setAlpha( 1 )
				CustomClasspreviewWidgetFrame2( CustomClasspreviewWidget, {} )
			end,
			Close = function ()
				self:setupElementClipCounter( 8 )
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
				chooseClassWidget:completeAnimation()
				self.chooseClassWidget:setAlpha( 0 )
				self.clipFinished( chooseClassWidget, {} )
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
				local f62_local0 = IsClassSetsAvailableForCurrentGameMode()
				if f62_local0 then
					if not DoesPlayerHaveExtraSlotsItem( controller ) then
						f62_local0 = IsModelValueGreaterThan( controller, "currentClassSetIndex", 0 )
					else
						f62_local0 = false
					end
				end
				return f62_local0
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentClassSetIndex" ), function ( model )
		f7_local1:updateElementState( self, {
			name = "model_validation",
			menu = f7_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentClassSetIndex"
		} )
	end )
	CoD.Menu.AddNavigationHandler( f7_local1, self, controller )
	self:registerEventHandler( "update_class", function ( element, event )
		local f64_local0 = nil
		if not f64_local0 then
			f64_local0 = element:dispatchEventToChildren( event )
		end
		return f64_local0
	end )
	self:registerEventHandler( "menu_opened", function ( element, event )
		local f65_local0 = nil
		if IsCampaign() and TestAndSetFirstTimeMenu( controller, "com_firsttime_armory" ) then
			OpenGenericLargePopup( f7_local1, controller, "MENU_FIRSTTIME_ARMORY", "MENU_FIRSTTIME_ARMORY2", "com_firsttime_armory_image", "MENU_FIRSTTIME_ARMORY_BUTTONTEXT", "", "" )
		else
			SetElementStateByElementName( self, "background", controller, "Intro" )
			PlayClipOnElement( self, {
				elementName = "cacElemsSideListCustomClass0",
				clipName = "Intro"
			}, controller )
			PlayClip( self, "Intro", controller )
		end
		if not f65_local0 then
			f65_local0 = element:dispatchEventToChildren( event )
		end
		return f65_local0
	end )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local f66_local0 = nil
		if IsInGame() then
			SetElementStateByElementName( self, "background", controller, "Update" )
			PlayClip( self, "Back", controller )
			LockInput( self, controller, true )
			SetCharacterModeToCurrentSessionMode( self, element, controller )
			RefreshCharacterCustomization( self, element, controller )
			SendClientScriptMenuChangeNotify( controller, f7_local1, true )
			PlayClipOnElement( self, {
				elementName = "cacBlackFadeIn",
				clipName = "Intro"
			}, controller )
			ShowHeaderKickerAndIcon( f7_local1 )
			PrepareOpenMenuInSafehouse( controller )
			SetHeadingKickerText( "MENU_CAMPAIGN" )
		else
			SetElementStateByElementName( self, "background", controller, "Update" )
			PlayClip( self, "Back", controller )
			SetCharacterModeToCurrentSessionMode( self, element, controller )
			RefreshCharacterCustomization( self, element, controller )
			SendClientScriptMenuChangeNotify( controller, f7_local1, true )
			ShowHeaderKickerAndIcon( f7_local1 )
			SetHeadingKickerTextToGameMode( "MPUI_PUBLIC_MATCH_LOBBY" )
			PlayClipOnElement( self, {
				elementName = "chooseClassWidget",
				clipName = "WildcardDefault"
			}, controller )
		end
		if not f66_local0 then
			f66_local0 = element:dispatchEventToChildren( event )
		end
		return f66_local0
	end )
	f7_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f67_arg0, f67_arg1, f67_arg2, f67_arg3 )
		if IsInGame() then
			SendOwnMenuResponse( f67_arg1, f67_arg2, "closed" )
			Close( self, f67_arg2 )
			ClearSavedState( self, f67_arg2 )
			SaveLoadout( self, f67_arg2 )
			ResetCustomClassStartingFocus( self, f67_arg0, f67_arg2, true )
			LockInput( self, f67_arg2, false )
			SendClientScriptMenuChangeNotify( f67_arg2, f67_arg1, false )
			PrepareCloseMenuInSafehouse( f67_arg2 )
			UploadStats( self, f67_arg2 )
			MarkCACPaintshopDataDirty( self, f67_arg2 )
			return true
		elseif IsMenuInState( f67_arg1, "ExtraSlots" ) then
			PartyHostSetState( self, f67_arg2, CoD.PARTYHOST_STATE_NONE )
			ClearSavedState( self, f67_arg2 )
			SaveLoadout( self, f67_arg2 )
			UploadStats( self, f67_arg2 )
			ResetCustomClassStartingFocus( self, f67_arg0, f67_arg2, true )
			MarkCACPaintshopDataDirty( self, f67_arg2 )
			SendClientScriptMenuChangeNotify( f67_arg2, f67_arg1, false )
			ForceNotifyPregameUpdate( self, f67_arg0, f67_arg2 )
			SetPerControllerTableProperty( f67_arg2, "updateNewBreadcrumbs", true )
			GoBack( self, f67_arg2 )
			ForceLobbyButtonUpdate( f67_arg2 )
			CopyLoadoutToClassSet( f67_arg2 )
			ClearMenuSavedState( f67_arg1 )
			return true
		else
			PartyHostSetState( self, f67_arg2, CoD.PARTYHOST_STATE_NONE )
			ClearSavedState( self, f67_arg2 )
			SaveLoadout( self, f67_arg2 )
			UploadStats( self, f67_arg2 )
			ResetCustomClassStartingFocus( self, f67_arg0, f67_arg2, true )
			MarkCACPaintshopDataDirty( self, f67_arg2 )
			SendClientScriptMenuChangeNotify( f67_arg2, f67_arg1, false )
			ForceNotifyPregameUpdate( self, f67_arg0, f67_arg2 )
			SetPerControllerTableProperty( f67_arg2, "updateNewBreadcrumbs", true )
			GoBack( self, f67_arg2 )
			ForceLobbyButtonUpdate( f67_arg2 )
			CopyLoadoutToClassSet( f67_arg2 )
			return true
		end
	end, function ( f68_arg0, f68_arg1, f68_arg2 )
		CoD.Menu.SetButtonLabel( f68_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	f7_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_START, "O", function ( f69_arg0, f69_arg1, f69_arg2, f69_arg3 )
		if not IsPerControllerTablePropertyValue( f69_arg2, "enableClassOptions", false ) then
			OpenPopup( self, "ClassOptions", f69_arg2 )
			PlaySoundSetSound( self, "menu_sub" )
			return true
		else
			
		end
	end, function ( f70_arg0, f70_arg1, f70_arg2 )
		if not IsPerControllerTablePropertyValue( f70_arg2, "enableClassOptions", false ) then
			CoD.Menu.SetButtonLabel( f70_arg1, Enum.LUIButton.LUI_KEY_START, "MENU_CLASS_OPTIONS" )
			return true
		else
			return false
		end
	end, false )
	f7_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, nil, function ( f71_arg0, f71_arg1, f71_arg2, f71_arg3 )
		return true
	end, function ( f72_arg0, f72_arg1, f72_arg2 )
		CoD.Menu.SetButtonLabel( f72_arg1, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "PLATFORM_EMBLEM_ROTATE_LAYER" )
		return true
	end, false )
	f7_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_LB, nil, function ( f73_arg0, f73_arg1, f73_arg2, f73_arg3 )
		if IsClassSetsAvailableForCurrentGameMode() and not DoesPlayerHaveExtraSlotsItem( f73_arg2 ) then
			SetChooseClassMenuFromExtraSlotPromptState( self, f73_arg2, f73_arg1, "buttonList", "buttonList" )
			return true
		elseif IsClassSetsAvailableForCurrentGameMode() then
			DecrementClassSetAndUpdateElementDataSource( self, f73_arg2, f73_arg1, "buttonList", "buttonList" )
			return true
		else
			
		end
	end, function ( f74_arg0, f74_arg1, f74_arg2 )
		if IsClassSetsAvailableForCurrentGameMode() and not DoesPlayerHaveExtraSlotsItem( f74_arg2 ) then
			CoD.Menu.SetButtonLabel( f74_arg1, Enum.LUIButton.LUI_KEY_LB, "" )
			return false
		elseif IsClassSetsAvailableForCurrentGameMode() then
			CoD.Menu.SetButtonLabel( f74_arg1, Enum.LUIButton.LUI_KEY_LB, "" )
			return false
		else
			return false
		end
	end, false )
	f7_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RB, nil, function ( f75_arg0, f75_arg1, f75_arg2, f75_arg3 )
		if IsClassSetsAvailableForCurrentGameMode() and not DoesPlayerHaveExtraSlotsItem( f75_arg2 ) and ShowCACExtraClassBreadcrumb( f75_arg2 ) then
			SetSeenExtraClassSets( f75_arg2 )
			UpdateElementState( self, "ClassSetTabWidget", f75_arg2 )
			SetChooseClassMenuToExtraSlotPromptState( self, f75_arg2, f75_arg1, "buttonList", "buttonList" )
			return true
		elseif IsClassSetsAvailableForCurrentGameMode() and not DoesPlayerHaveExtraSlotsItem( f75_arg2 ) then
			SetChooseClassMenuToExtraSlotPromptState( self, f75_arg2, f75_arg1, "buttonList", "buttonList" )
			return true
		elseif IsClassSetsAvailableForCurrentGameMode() then
			IncrementClassSetAndUpdateElementDataSource( self, f75_arg2, f75_arg1, "buttonList", "buttonList" )
			return true
		else
			
		end
	end, function ( f76_arg0, f76_arg1, f76_arg2 )
		if IsClassSetsAvailableForCurrentGameMode() and not DoesPlayerHaveExtraSlotsItem( f76_arg2 ) and ShowCACExtraClassBreadcrumb( f76_arg2 ) then
			CoD.Menu.SetButtonLabel( f76_arg1, Enum.LUIButton.LUI_KEY_RB, "" )
			return false
		elseif IsClassSetsAvailableForCurrentGameMode() and not DoesPlayerHaveExtraSlotsItem( f76_arg2 ) then
			CoD.Menu.SetButtonLabel( f76_arg1, Enum.LUIButton.LUI_KEY_RB, "" )
			return false
		elseif IsClassSetsAvailableForCurrentGameMode() then
			CoD.Menu.SetButtonLabel( f76_arg1, Enum.LUIButton.LUI_KEY_RB, "" )
			return false
		else
			return false
		end
	end, false )
	f7_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_LTRIG, "U", function ( f77_arg0, f77_arg1, f77_arg2, f77_arg3 )
		if IsStarterPack( f77_arg2 ) then
			StarterParckPurchase( self, f77_arg2, f77_arg1 )
			return true
		else
			
		end
	end, function ( f78_arg0, f78_arg1, f78_arg2 )
		if IsStarterPack( f78_arg2 ) then
			CoD.Menu.SetButtonLabel( f78_arg1, Enum.LUIButton.LUI_KEY_LTRIG, "PLATFORM_STARTER_PACK_UPGRADE_TITLE" )
			return true
		else
			return false
		end
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, controller )
		if IsMenuInState( f7_local1, "DefaultState" ) then
			MakeElementFocusable( self, "buttonList", controller )
			MakeElementNotFocusable( self, "BuyExtraSlotsBtn", controller )
			SetFocusToElement( self, "buttonList", controller )
			SetChooseClassMenuFromExtraSlotPromptState( self, controller, f7_local1, "buttonList", "buttonList" )
		elseif IsMenuInState( f7_local1, "ExtraSlots" ) then
			MakeElementFocusable( self, "BuyExtraSlotsBtn", controller )
			MakeElementNotFocusable( self, "buttonList", controller )
			SetFocusToElement( self, "BuyExtraSlotsBtn", controller )
			SetChooseClassMenuToExtraSlotPromptState( self, controller, f7_local1, "buttonList", "buttonList" )
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
		menu = f7_local1
	} )
	if not self:restoreState() then
		self.buttonList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.cacBlackFadeIn:close()
		element.LeftPanel:close()
		element.chooseClassWidget:close()
		element.buttonList:close()
		element.BuyExtraSlotsBtn:close()
		element.ClassSetTabWidget:close()
		element.FEMenuLeftGraphics:close()
		element.CustomClasspreviewWidget:close()
		element.feFooterContainer:close()
		element.background:close()
		element.PregameTimerOverlay:close()
		element.XCamMouseControl:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "chooseClass.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

