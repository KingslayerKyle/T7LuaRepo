require( "ui.uieditor.menus.CAC.CybercoreSelectionMenu" )
require( "ui.uieditor.widgets.AbilityWheel.AbilityWheel_Texture" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer_ExposedValues" )
require( "ui.uieditor.widgets.BackgroundFrames.CACBackgroundNoHero" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.CybercoreLoadoutWidget" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.chooseClassCPClient_Ingame" )
require( "ui.uieditor.widgets.CAC.List1ButtonChooseClass" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ChooseClass_ClassSetTabWidget" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.chooseClassWidget_Ingame" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.Footer.fe_FooterContainer_NOTLobby" )

DataSources.ClassSetTabs = DataSourceHelpers.ListSetup( "ClassSetTabs", function ( f1_arg0 )
	local f1_local0 = {}
	table.insert( f1_local0, {
		models = {
			tabName = Engine.Localize( "MPUI_CUSTOM_CLASSES" ),
			classSetId = CoD.PrestigeUtility.ChooseClassSets.Custom
		}
	} )
	table.insert( f1_local0, {
		models = {
			tabName = Engine.Localize( "MPUI_DEFAULT_CLASSES" ),
			classSetId = CoD.PrestigeUtility.ChooseClassSets.Default
		}
	} )
	return f1_local0
end )
local PreLoadFunc = function ( self, controller )
	CoD.CACUtility.SetDefaultCACRoot( controller )
	LUI.OverrideFunction_CallOriginalFirst( self, "setModel", function ( element, controller )
		element:processEvent( {
			name = "update_state",
			menu = element
		} )
	end )
	if not CoD.perController[controller].isInMobileArmory then
		local f2_local0 = CoD.SafeGetModelValue( self:getModel(), "isInMobileArmory" )
		CoD.perController[controller].isInMobileArmory = f2_local0 and f2_local0 == 1
	end
	if IsCampaign() then
		local f2_local0 = nil
		if CoD.perController[controller].isInMobileArmory then
			f2_local0 = CoD.SafeGetModelValue( self:getModel(), "fieldOpsKitClassNum" )
		else
			f2_local0 = Engine.GetCustomClassCount( controller ) + 1
		end
		if f2_local0 ~= nil then
			CoD.perController[controller].fieldOpsKitClassNum = f2_local0
		end
	end
	self:registerEventHandler( "open_migration_menu", function ( element, event )
		StartMenuResumeGame( element, event.controller )
		CloseStartMenu( element, event.controller )
	end )
	local f2_local0 = Engine.GetModelForController( controller )
	if not Engine.GetModel( f2_local0, "hudItems" ) then
		Engine.CreateModel( f2_local0, "hudItems" )
	end
	if not Engine.GetModel( f2_local0, "hudItems.cybercoreSelectMenuDisabled" ) then
		Engine.CreateModel( f2_local0, "hudItems.cybercoreSelectMenuDisabled" )
	end
	if not IsCACCustomClassCountDefault( controller ) then
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "classSetValue" ), CoD.PrestigeUtility.ChooseClassSets.Custom )
	end
end

local PostLoadFunc = function ( f5_arg0 )
	local f5_local0 = f5_arg0:getOwner()
	if not CoD.MenuNavigation then
		CoD.MenuNavigation = {}
	end
	CoD.MenuNavigation[f5_local0] = {
		{
			"class"
		}
	}
	f5_arg0.classList.navigation = {
		right = nil
	}
	f5_arg0.chooseClassWidget.m_inputDisabled = true
	f5_arg0:linkToElementModel( f5_arg0.ClassSetTabWidget.Internal.Tabs.grid, nil, false, function ( model )
		if IsCACCustomClassCountDefault( f5_local0 ) then
			return 
		else
			Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f5_local0 ), "classSetValue" ), Engine.GetModelValue( Engine.GetModel( model, "classSetId" ) ) )
			f5_arg0.ClassSetTabWidget.Internal.IndicatorsGrid:updateDataSource()
			f5_arg0.classList:updateDataSource()
		end
	end )
end

LUI.createMenu.ChooseClass_InGame = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "ChooseClass_InGame" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "Loadout"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "ChooseClass_InGame.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local blackimage = LUI.UIImage.new()
	blackimage:setLeftRight( true, true, 0, 0 )
	blackimage:setTopBottom( true, true, 0, 0 )
	blackimage:setRGB( 0, 0, 0 )
	blackimage:setAlpha( 0.2 )
	blackimage:setImage( RegisterImage( "uie_default_white_255" ) )
	self:addElement( blackimage )
	self.blackimage = blackimage
	
	local BackgroundFocus = LUI.UIImage.new()
	BackgroundFocus:setLeftRight( true, true, 0, 0 )
	BackgroundFocus:setTopBottom( false, false, -378, 342 )
	BackgroundFocus:setScale( 1 )
	BackgroundFocus:setImage( RegisterImage( "uie_t7_mp_menu_cac_version6_backdrop720p" ) )
	self:addElement( BackgroundFocus )
	self.BackgroundFocus = BackgroundFocus
	
	local blackImage = LUI.UIImage.new()
	blackImage:setLeftRight( true, true, 0, 0 )
	blackImage:setTopBottom( true, true, 0, 0 )
	blackImage:setRGB( 0, 0, 0 )
	blackImage:setAlpha( 0.5 )
	blackImage:setImage( RegisterImage( "uie_default_white_255" ) )
	self:addElement( blackImage )
	self.blackImage = blackImage
	
	local Texture = CoD.AbilityWheel_Texture.new( self, controller )
	Texture:setLeftRight( true, false, 500, 1280 )
	Texture:setTopBottom( true, false, 134, 655 )
	self:addElement( Texture )
	self.Texture = Texture
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer_ExposedValues.new( self, controller )
	LeftPanel:setLeftRight( false, false, -576, -262 )
	LeftPanel:setTopBottom( true, true, 78, 0 )
	LeftPanel:setRGB( 0.24, 0.24, 0.24 )
	LeftPanel.FEButtonPanel:setShaderVector( 0, 5, 25, 0, 0 )
	LeftPanel.FEButtonPanel.Full:setShaderVector( 0, 0.03, 0.02, 0, 0 )
	LeftPanel.FEButtonPanel.Full:setShaderVector( 1, 10, 10, 0, 0 )
	LeftPanel.FEButtonPanel.Full:setupNineSliceShader( 10, 10 )
	LeftPanel:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return IsCampaign()
			end
		}
	} )
	LeftPanel:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		self:updateElementState( LeftPanel, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local Backing = LUI.UIImage.new()
	Backing:setLeftRight( true, false, 64, 378 )
	Backing:setTopBottom( true, true, 81.5, 0 )
	Backing:setRGB( 0, 0, 0 )
	Backing:setAlpha( 0.15 )
	Backing:setImage( RegisterImage( "uie_default_white_255" ) )
	self:addElement( Backing )
	self.Backing = Backing
	
	local background = CoD.CACBackgroundNoHero.new( self, controller )
	background:setLeftRight( true, true, -6, -6 )
	background:setTopBottom( true, true, 4, 4 )
	background.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MPUI_CHOOSE_CLASS_CAPS" ) )
	self:addElement( background )
	self.background = background
	
	local title = LUI.UITightText.new()
	title:setLeftRight( true, false, 96, 375 )
	title:setTopBottom( true, false, 54, 102 )
	title:setRGB( 0.5, 0.51, 0.52 )
	title:setAlpha( 0 )
	title:setText( Engine.Localize( "MPUI_CHOOSE_CLASS_CAPS" ) )
	title:setTTF( "fonts/default.ttf" )
	self:addElement( title )
	self.title = title
	
	local CybercoreLoadoutWidget0 = CoD.CybercoreLoadoutWidget.new( self, controller )
	CybercoreLoadoutWidget0:setLeftRight( true, false, 85, 378 )
	CybercoreLoadoutWidget0:setTopBottom( true, false, 111, 290 )
	CybercoreLoadoutWidget0:setAlpha( 0 )
	self:addElement( CybercoreLoadoutWidget0 )
	self.CybercoreLoadoutWidget0 = CybercoreLoadoutWidget0
	
	local loadoutSubHeader = LUI.UITightText.new()
	loadoutSubHeader:setLeftRight( true, false, 64, 357 )
	loadoutSubHeader:setTopBottom( true, false, 298, 323 )
	loadoutSubHeader:setAlpha( 0 )
	loadoutSubHeader:setText( Engine.Localize( LocalizeToUpperString( "MENU_CHOOSE_LOADOUT" ) ) )
	loadoutSubHeader:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	self:addElement( loadoutSubHeader )
	self.loadoutSubHeader = loadoutSubHeader
	
	local chooseClassCPClientIngame0 = CoD.chooseClassCPClient_Ingame.new( self, controller )
	chooseClassCPClientIngame0:setLeftRight( true, false, 85, 365 )
	chooseClassCPClientIngame0:setTopBottom( true, false, 89, 134 )
	chooseClassCPClientIngame0:setAlpha( 0 )
	self:addElement( chooseClassCPClientIngame0 )
	self.chooseClassCPClientIngame0 = chooseClassCPClientIngame0
	
	local classList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	classList:makeFocusable()
	classList:setLeftRight( true, false, 85, 365 )
	classList:setTopBottom( true, false, 134, 642 )
	classList:setDataSource( "ChooseClass_InGame" )
	classList:setWidgetType( CoD.List1ButtonChooseClass )
	classList:setVerticalCount( 15 )
	classList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f10_local0 = nil
		if IsCampaign() then
			SetCustomClassNum( self, element, controller )
		else
			UpdateClassView( self, element, controller )
		end
		return f10_local0
	end )
	classList:registerEventHandler( "gain_focus", function ( element, event )
		local f11_local0 = nil
		if element.gainFocus then
			f11_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f11_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f11_local0
	end )
	classList:registerEventHandler( "lose_focus", function ( element, event )
		local f12_local0 = nil
		if element.loseFocus then
			f12_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f12_local0 = element.super:loseFocus( event )
		end
		return f12_local0
	end )
	self:AddButtonCallbackFunction( classList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsPerControllerTablePropertyValue( controller, "isInMobileArmory", true ) then
			ChangeClass( self, element, controller )
			LockInput( self, controller, false )
			Close( self, controller )
			SetPerControllerTableProperty( controller, "isInMobileArmory", false )
			return true
		elseif not IsInGame() then
			ChangeClass( self, element, controller )
			GoBack( self, controller )
			return true
		elseif IsInGame() then
			ChangeClass( self, element, controller )
			CloseStartMenu( menu, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if IsPerControllerTablePropertyValue( controller, "isInMobileArmory", true ) then
			return true
		elseif not IsInGame() then
			return true
		elseif IsInGame() then
			return true
		else
			return false
		end
	end, false )
	self:addElement( classList )
	self.classList = classList
	
	local ClassSetTabWidget = CoD.ChooseClass_ClassSetTabWidget.new( self, controller )
	ClassSetTabWidget:setLeftRight( true, false, 80.5, 369.5 )
	ClassSetTabWidget:setTopBottom( true, false, 94, 134 )
	ClassSetTabWidget:setAlpha( 0 )
	ClassSetTabWidget.Internal.Tabs.grid:setDataSource( "ClassSetTabs" )
	ClassSetTabWidget.Internal.IndicatorsGrid:setDataSource( "ClassSetTabs" )
	self:addElement( ClassSetTabWidget )
	self.ClassSetTabWidget = ClassSetTabWidget
	
	local chooseClassWidget = CoD.chooseClassWidget_Ingame.new( self, controller )
	chooseClassWidget:setLeftRight( false, false, -251.5, 89.5 )
	chooseClassWidget:setTopBottom( true, false, 80, 684 )
	self:addElement( chooseClassWidget )
	self.chooseClassWidget = chooseClassWidget
	
	local FooterBacking = LUI.UIImage.new()
	FooterBacking:setLeftRight( false, false, -750, 750 )
	FooterBacking:setTopBottom( false, false, 300, 360 )
	FooterBacking:setRGB( 0, 0, 0 )
	FooterBacking:setAlpha( 0 )
	self:addElement( FooterBacking )
	self.FooterBacking = FooterBacking
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics:setTopBottom( true, false, 86, 703.25 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local feFooterContainer = CoD.fe_FooterContainer_NOTLobby.new( self, controller )
	feFooterContainer:setLeftRight( true, true, 0, 0 )
	feFooterContainer:setTopBottom( false, true, -65, 0 )
	feFooterContainer:registerEventHandler( "menu_loaded", function ( element, event )
		local f15_local0 = nil
		SizeToSafeArea( element, controller )
		if not f15_local0 then
			f15_local0 = element:dispatchEventToChildren( event )
		end
		return f15_local0
	end )
	self:addElement( feFooterContainer )
	self.feFooterContainer = feFooterContainer
	
	background:linkToElementModel( classList, nil, false, function ( model )
		background:setModel( model, controller )
	end )
	chooseClassWidget:linkToElementModel( classList, nil, false, function ( model )
		chooseClassWidget:setModel( model, controller )
	end )
	classList.navigation = {
		right = chooseClassWidget
	}
	chooseClassWidget.navigation = {
		left = classList
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				blackimage:completeAnimation()
				self.blackimage:setAlpha( 0.2 )
				self.clipFinished( blackimage, {} )
				BackgroundFocus:completeAnimation()
				self.BackgroundFocus:setAlpha( 0 )
				self.clipFinished( BackgroundFocus, {} )
				blackImage:completeAnimation()
				self.blackImage:setAlpha( 0 )
				self.clipFinished( blackImage, {} )
				Texture:completeAnimation()
				self.Texture:setAlpha( 0 )
				self.clipFinished( Texture, {} )
				background:completeAnimation()
				background.classAllocation:completeAnimation()
				background.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:completeAnimation()
				self.background.classAllocation:setAlpha( 1 )
				self.background.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MPUI_CHOOSE_CLASS_CAPS" ) )
				self.clipFinished( background, {} )
				CybercoreLoadoutWidget0:completeAnimation()
				self.CybercoreLoadoutWidget0:setLeftRight( true, false, 85, 378 )
				self.CybercoreLoadoutWidget0:setTopBottom( true, false, 111, 290 )
				self.CybercoreLoadoutWidget0:setAlpha( 0 )
				self.clipFinished( CybercoreLoadoutWidget0, {} )
				loadoutSubHeader:completeAnimation()
				self.loadoutSubHeader:setLeftRight( true, false, 64, 357 )
				self.loadoutSubHeader:setTopBottom( true, false, 298, 323 )
				self.loadoutSubHeader:setAlpha( 0 )
				self.clipFinished( loadoutSubHeader, {} )
				chooseClassCPClientIngame0:completeAnimation()
				self.chooseClassCPClientIngame0:setLeftRight( true, false, 85, 365 )
				self.chooseClassCPClientIngame0:setTopBottom( true, false, 89, 134 )
				self.chooseClassCPClientIngame0:setAlpha( 0 )
				self.clipFinished( chooseClassCPClientIngame0, {} )
			end
		},
		Campaign = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				blackimage:completeAnimation()
				self.blackimage:setAlpha( 1 )
				self.clipFinished( blackimage, {} )
				BackgroundFocus:completeAnimation()
				self.BackgroundFocus:setAlpha( 1 )
				self.clipFinished( BackgroundFocus, {} )
				blackImage:completeAnimation()
				self.blackImage:setAlpha( 0.5 )
				self.clipFinished( blackImage, {} )
				Texture:completeAnimation()
				self.Texture:setAlpha( 1 )
				self.clipFinished( Texture, {} )
				background:completeAnimation()
				background.classAllocation:completeAnimation()
				background.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:completeAnimation()
				self.background.classAllocation:setAlpha( 0 )
				self.background.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_LOADOUTS_CAPS" ) )
				self.clipFinished( background, {} )
				CybercoreLoadoutWidget0:completeAnimation()
				self.CybercoreLoadoutWidget0:setLeftRight( true, false, 74, 367 )
				self.CybercoreLoadoutWidget0:setTopBottom( true, false, 109, 288 )
				self.CybercoreLoadoutWidget0:setAlpha( 1 )
				self.clipFinished( CybercoreLoadoutWidget0, {} )
				loadoutSubHeader:completeAnimation()
				self.loadoutSubHeader:setLeftRight( true, false, 81, 367 )
				self.loadoutSubHeader:setTopBottom( true, false, 298, 323 )
				self.loadoutSubHeader:setAlpha( 1 )
				self.clipFinished( loadoutSubHeader, {} )
				chooseClassCPClientIngame0:completeAnimation()
				self.chooseClassCPClientIngame0:setLeftRight( true, false, 81, 361 )
				self.chooseClassCPClientIngame0:setTopBottom( true, false, 327, 372 )
				self.chooseClassCPClientIngame0:setAlpha( 1 )
				self.clipFinished( chooseClassCPClientIngame0, {} )
				classList:completeAnimation()
				self.classList:setLeftRight( true, false, 85, 365 )
				self.classList:setTopBottom( true, false, 372, 880 )
				self.clipFinished( classList, {} )
			end
		},
		CampaignNoCybercore = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				blackimage:completeAnimation()
				self.blackimage:setAlpha( 1 )
				self.clipFinished( blackimage, {} )
				BackgroundFocus:completeAnimation()
				self.BackgroundFocus:setAlpha( 1 )
				self.clipFinished( BackgroundFocus, {} )
				blackImage:completeAnimation()
				self.blackImage:setAlpha( 0.5 )
				self.clipFinished( blackImage, {} )
				Texture:completeAnimation()
				self.Texture:setAlpha( 1 )
				self.clipFinished( Texture, {} )
				background:completeAnimation()
				background.classAllocation:completeAnimation()
				background.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:completeAnimation()
				self.background.classAllocation:setAlpha( 0 )
				self.background.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_LOADOUTS_CAPS" ) )
				self.clipFinished( background, {} )
				CybercoreLoadoutWidget0:completeAnimation()
				self.CybercoreLoadoutWidget0:setLeftRight( true, false, 74, 367 )
				self.CybercoreLoadoutWidget0:setTopBottom( true, false, 109, 288 )
				self.CybercoreLoadoutWidget0:setAlpha( 0 )
				self.clipFinished( CybercoreLoadoutWidget0, {} )
				loadoutSubHeader:completeAnimation()
				self.loadoutSubHeader:setLeftRight( true, false, 81, 367 )
				self.loadoutSubHeader:setTopBottom( true, false, 298, 323 )
				self.loadoutSubHeader:setAlpha( 0 )
				self.clipFinished( loadoutSubHeader, {} )
				chooseClassCPClientIngame0:completeAnimation()
				self.chooseClassCPClientIngame0:setLeftRight( true, false, 85, 365 )
				self.chooseClassCPClientIngame0:setTopBottom( true, false, 89, 134 )
				self.chooseClassCPClientIngame0:setAlpha( 1 )
				self.clipFinished( chooseClassCPClientIngame0, {} )
				classList:completeAnimation()
				self.classList:setLeftRight( true, false, 85, 365 )
				self.classList:setTopBottom( true, false, 134, 642 )
				self.clipFinished( classList, {} )
			end
		},
		ClassSetTabs = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				blackimage:completeAnimation()
				self.blackimage:setAlpha( 0.2 )
				self.clipFinished( blackimage, {} )
				BackgroundFocus:completeAnimation()
				self.BackgroundFocus:setAlpha( 0 )
				self.clipFinished( BackgroundFocus, {} )
				blackImage:completeAnimation()
				self.blackImage:setAlpha( 0 )
				self.clipFinished( blackImage, {} )
				Texture:completeAnimation()
				self.Texture:setAlpha( 0 )
				self.clipFinished( Texture, {} )
				background:completeAnimation()
				background.classAllocation:completeAnimation()
				background.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:completeAnimation()
				self.background.classAllocation:setAlpha( 1 )
				self.background.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MPUI_CHOOSE_CLASS_CAPS" ) )
				self.clipFinished( background, {} )
				CybercoreLoadoutWidget0:completeAnimation()
				self.CybercoreLoadoutWidget0:setLeftRight( true, false, 85, 378 )
				self.CybercoreLoadoutWidget0:setTopBottom( true, false, 111, 290 )
				self.CybercoreLoadoutWidget0:setAlpha( 0 )
				self.clipFinished( CybercoreLoadoutWidget0, {} )
				loadoutSubHeader:completeAnimation()
				self.loadoutSubHeader:setLeftRight( true, false, 64, 357 )
				self.loadoutSubHeader:setTopBottom( true, false, 298, 323 )
				self.loadoutSubHeader:setAlpha( 0 )
				self.clipFinished( loadoutSubHeader, {} )
				classList:completeAnimation()
				self.classList:setLeftRight( true, false, 85, 365 )
				self.classList:setTopBottom( true, false, 148, 656 )
				self.clipFinished( classList, {} )
				ClassSetTabWidget:completeAnimation()
				self.ClassSetTabWidget:setAlpha( 1 )
				self.clipFinished( ClassSetTabWidget, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Campaign",
			condition = function ( menu, element, event )
				return IsCampaign() and not IsCybercoreMenuDisabled( controller )
			end
		},
		{
			stateName = "CampaignNoCybercore",
			condition = function ( menu, element, event )
				return IsCampaign() and IsCybercoreMenuDisabled( controller )
			end
		},
		{
			stateName = "ClassSetTabs",
			condition = function ( menu, element, event )
				local f24_local0 = IsMultiplayer()
				if f24_local0 then
					f24_local0 = IsPublicOrLeagueGame( controller )
					if f24_local0 then
						f24_local0 = not IsCACCustomClassCountDefault( controller )
					end
				end
				return f24_local0
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		self:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.cybercoreSelectMenuDisabled" ), function ( model )
		self:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.cybercoreSelectMenuDisabled"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		local f27_local0 = self
		local f27_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		}
		CoD.Menu.UpdateButtonShownState( f27_local0, self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
		CoD.Menu.UpdateButtonShownState( f27_local0, self, controller, Enum.LUIButton.LUI_KEY_LB )
		CoD.Menu.UpdateButtonShownState( f27_local0, self, controller, Enum.LUIButton.LUI_KEY_RB )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.cybercoreSelectMenuDisabled" ), function ( model )
		local f28_local0 = self
		local f28_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.cybercoreSelectMenuDisabled"
		}
		CoD.Menu.UpdateButtonShownState( f28_local0, self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f29_local0 = nil
		if IsCampaign() then
			LockInput( self, controller, true )
			PrepareOpenMenuInSafehouse( controller )
			SetElementStateByElementName( self, "background", controller, "Update" )
			PlayClipOnElement( self, {
				elementName = "background",
				clipName = "intro"
			}, controller )
			PlayClip( self, "Intro", controller )
		end
		if not f29_local0 then
			f29_local0 = self:dispatchEventToChildren( event )
		end
		return f29_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		if IsPerControllerTablePropertyValue( controller, "isInMobileArmory", true ) then
			SendMenuResponse( self, "ChooseClass_InGame", "cancel", controller )
			LockInput( self, controller, false )
			ClearMenuSavedState( menu )
			PlaySoundSetSound( self, "menu_go_back" )
			Close( self, controller )
			SetPerControllerTableProperty( controller, "isInMobileArmory", false )
			return true
		else
			SendMenuResponse( self, "ChooseClass_InGame", "cancel", controller )
			PrepareCloseMenuInSafehouse( controller )
			GoBack( self, controller )
			return true
		end
	end, function ( element, menu, controller )
		if IsPerControllerTablePropertyValue( controller, "isInMobileArmory", true ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
			return true
		else
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK" )
			return true
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "C", function ( element, menu, controller, model )
		if IsCampaign() and not IsMulticoreActivated( controller ) and not IsCybercoreMenuDisabled( controller ) then
			SetProperty( self, "isOpeningCybercore", true )
			NavigateToMenu( self, "CybercoreSelectionMenu", true, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "" )
		if IsCampaign() and not IsMulticoreActivated( controller ) and not IsCybercoreMenuDisabled( controller ) then
			return false
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_LB, nil, function ( element, menu, controller, model )
		if IsCampaign() and CanUseSharedLoadouts( controller ) then
			chooseClass_ClientChanged( self, element, controller, "-1" )
			return true
		elseif IsMultiplayer() and not IsCACCustomClassCountDefault( controller ) then
			chooseClass_TabMPClassesListLeft( self, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_LB, "" )
		if IsCampaign() and CanUseSharedLoadouts( controller ) then
			return false
		elseif IsMultiplayer() and not IsCACCustomClassCountDefault( controller ) then
			return false
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RB, nil, function ( element, menu, controller, model )
		if IsCampaign() and CanUseSharedLoadouts( controller ) then
			chooseClass_ClientChanged( self, element, controller, "1" )
			return true
		elseif IsMultiplayer() and not IsCACCustomClassCountDefault( controller ) then
			chooseClass_TabMPClassesListRight( self, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RB, "" )
		if IsCampaign() and CanUseSharedLoadouts( controller ) then
			return false
		elseif IsMultiplayer() and not IsCACCustomClassCountDefault( controller ) then
			return false
		else
			return false
		end
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		if IsPerControllerTablePropertyValue( controller, "isInMobileArmory", true ) and not PropertyIsTrue( self, "isOpeningCybercore" ) then
			LockInput( self, controller, false )
			SetPerControllerTableProperty( controller, "isInMobileArmory", false )
		end
	end )
	classList.id = "classList"
	chooseClassWidget.id = "chooseClassWidget"
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
		self.classList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Texture:close()
		element.LeftPanel:close()
		element.background:close()
		element.CybercoreLoadoutWidget0:close()
		element.chooseClassCPClientIngame0:close()
		element.classList:close()
		element.ClassSetTabWidget:close()
		element.chooseClassWidget:close()
		element.FEMenuLeftGraphics:close()
		element.feFooterContainer:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "ChooseClass_InGame.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

