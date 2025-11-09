require( "ui.uieditor.menus.CAC.CybercoreSelectionMenu" )
require( "ui.uieditor.widgets.AbilityWheel.AbilityWheel_Texture" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer_ExposedValues" )
require( "ui.uieditor.widgets.BackgroundFrames.CACBackgroundNoHero" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.CybercoreLoadoutWidget" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.chooseClassCPClient_Ingame" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.chooseClassInGameClassList" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ChooseClass_ClassSetTabWidget" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ChooseClass_ClassSetTabPip_InGame" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.chooseClassWidget_Ingame" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.Footer.fe_FooterContainer_NOTLobby" )

DataSources.ClassSetTabs = DataSourceHelpers.ListSetup( "ClassSetTabs", function ( f1_arg0 )
	local f1_local0 = {}
	local f1_local1 = Engine.Localize( "MPUI_CUSTOM_CLASSES" )
	if IsClassSetsAvailableForCurrentGameMode() then
		f1_local1 = Engine.GetClassSetName( f1_arg0, Engine.GetCurrentClassSetIndex( f1_arg0 ) )
	end
	table.insert( f1_local0, {
		models = {
			tabName = f1_local1,
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

local PostLoadFunc = function ( f5_arg0, f5_arg1 )
	if not CoD.MenuNavigation then
		CoD.MenuNavigation = {}
	end
	CoD.MenuNavigation[f5_arg1] = {
		{
			"class"
		}
	}
	if IsClassSetsAvailableForCurrentGameMode() then
		f5_arg0.classSetName:setText( Engine.Localize( Engine.GetClassSetName( f5_arg1, Engine.GetCurrentClassSetIndex( f5_arg1 ) ) ) )
	end
	f5_arg0.classList.navigation = {
		right = nil
	}
	f5_arg0.chooseClassWidget.m_inputDisabled = true
	f5_arg0:linkToElementModel( f5_arg0.ClassSetTabWidget.Internal.Tabs, nil, false, function ( model )
		if IsCACCustomClassCountDefault( f5_arg1 ) then
			return 
		else
			Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f5_arg1 ), "classSetValue" ), Engine.GetModelValue( Engine.GetModel( model, "classSetId" ) ) )
			f5_arg0.ClassSetTabWidget.Internal.IndicatorsGrid:updateDataSource()
			f5_arg0.classList.classList:updateDataSource()
		end
	end )
	CoD.CACUtility.ForceStreamAttachmentImages( f5_arg1 )
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
	Texture:setLeftRight( false, false, -140, 640 )
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
	Backing:setLeftRight( false, false, -576, -262 )
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
	title:setLeftRight( false, false, -544, -265 )
	title:setTopBottom( true, false, 54, 102 )
	title:setRGB( 0.5, 0.51, 0.52 )
	title:setAlpha( 0 )
	title:setText( Engine.Localize( "MPUI_CHOOSE_CLASS_CAPS" ) )
	title:setTTF( "fonts/default.ttf" )
	self:addElement( title )
	self.title = title
	
	local CybercoreLoadoutWidget0 = CoD.CybercoreLoadoutWidget.new( self, controller )
	CybercoreLoadoutWidget0:setLeftRight( false, false, -555, -262 )
	CybercoreLoadoutWidget0:setTopBottom( true, false, 111, 290 )
	CybercoreLoadoutWidget0:setAlpha( 0 )
	self:addElement( CybercoreLoadoutWidget0 )
	self.CybercoreLoadoutWidget0 = CybercoreLoadoutWidget0
	
	local loadoutSubHeader = LUI.UITightText.new()
	loadoutSubHeader:setLeftRight( true, false, 64, 357 )
	loadoutSubHeader:setTopBottom( true, false, 298, 323 )
	loadoutSubHeader:setAlpha( 0 )
	loadoutSubHeader:setText( LocalizeToUpperString( "MENU_CHOOSE_LOADOUT" ) )
	loadoutSubHeader:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	self:addElement( loadoutSubHeader )
	self.loadoutSubHeader = loadoutSubHeader
	
	local chooseClassCPClientIngame0 = CoD.chooseClassCPClient_Ingame.new( self, controller )
	chooseClassCPClientIngame0:setLeftRight( false, false, -555, -275 )
	chooseClassCPClientIngame0:setTopBottom( true, false, 89, 134 )
	chooseClassCPClientIngame0:setAlpha( 0 )
	self:addElement( chooseClassCPClientIngame0 )
	self.chooseClassCPClientIngame0 = chooseClassCPClientIngame0
	
	local classList = CoD.chooseClassInGameClassList.new( self, controller )
	classList:setLeftRight( false, false, -555, -275 )
	classList:setTopBottom( true, false, 134, 642 )
	self:addElement( classList )
	self.classList = classList
	
	local ClassSetTabWidget = CoD.ChooseClass_ClassSetTabWidget.new( self, controller )
	ClassSetTabWidget:setLeftRight( false, false, -559.5, -270.5 )
	ClassSetTabWidget:setTopBottom( true, false, 94, 134 )
	ClassSetTabWidget:setAlpha( 0 )
	ClassSetTabWidget.Internal.Tabs:setDataSource( "ClassSetTabs" )
	ClassSetTabWidget.Internal.IndicatorsGrid:setWidgetType( CoD.ChooseClass_ClassSetTabPip_InGame )
	ClassSetTabWidget.Internal.IndicatorsGrid:setDataSource( "ClassSetTabs" )
	ClassSetTabWidget:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsSelfInState( self, "ClassSetTabs" )
			end
		}
	} )
	self:addElement( ClassSetTabWidget )
	self.ClassSetTabWidget = ClassSetTabWidget
	
	local classSetName = LUI.UIText.new()
	classSetName:setLeftRight( false, false, -555, -283 )
	classSetName:setTopBottom( true, false, 122, 142 )
	classSetName:setRGB( 0.79, 0.79, 0.79 )
	classSetName:setAlpha( 0 )
	classSetName:setZoom( 10 )
	classSetName:setText( Engine.Localize( "MPUI_CUSTOM_CLASSES" ) )
	classSetName:setTTF( "fonts/escom.ttf" )
	classSetName:setLetterSpacing( 1 )
	classSetName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	classSetName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( classSetName )
	self.classSetName = classSetName
	
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
	FEMenuLeftGraphics:setTopBottom( true, true, 86, -16.75 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local feFooterContainer = CoD.fe_FooterContainer_NOTLobby.new( self, controller )
	feFooterContainer:setLeftRight( true, true, 0, 0 )
	feFooterContainer:setTopBottom( false, true, -65, 0 )
	feFooterContainer:registerEventHandler( "menu_loaded", function ( element, event )
		local f11_local0 = nil
		SizeToSafeArea( element, controller )
		if not f11_local0 then
			f11_local0 = element:dispatchEventToChildren( event )
		end
		return f11_local0
	end )
	self:addElement( feFooterContainer )
	self.feFooterContainer = feFooterContainer
	
	background:linkToElementModel( classList.classList, nil, false, function ( model )
		background:setModel( model, controller )
	end )
	chooseClassWidget:linkToElementModel( classList.classList, nil, false, function ( model )
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
				self.CybercoreLoadoutWidget0:setLeftRight( false, false, -555, -262 )
				self.CybercoreLoadoutWidget0:setTopBottom( true, false, 111, 290 )
				self.CybercoreLoadoutWidget0:setAlpha( 0 )
				self.clipFinished( CybercoreLoadoutWidget0, {} )
				loadoutSubHeader:completeAnimation()
				self.loadoutSubHeader:setLeftRight( false, false, -576, -283 )
				self.loadoutSubHeader:setTopBottom( true, false, 298, 323 )
				self.loadoutSubHeader:setAlpha( 0 )
				self.clipFinished( loadoutSubHeader, {} )
				chooseClassCPClientIngame0:completeAnimation()
				self.chooseClassCPClientIngame0:setLeftRight( false, false, -555, -275 )
				self.chooseClassCPClientIngame0:setTopBottom( true, false, 89, 134 )
				self.chooseClassCPClientIngame0:setAlpha( 0 )
				self.clipFinished( chooseClassCPClientIngame0, {} )
				classSetName:completeAnimation()
				self.classSetName:setAlpha( 0 )
				self.clipFinished( classSetName, {} )
			end
		},
		Campaign = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )
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
				self.CybercoreLoadoutWidget0:setLeftRight( false, false, -566, -273 )
				self.CybercoreLoadoutWidget0:setTopBottom( true, false, 109, 288 )
				self.CybercoreLoadoutWidget0:setAlpha( 1 )
				self.clipFinished( CybercoreLoadoutWidget0, {} )
				loadoutSubHeader:completeAnimation()
				self.loadoutSubHeader:setLeftRight( false, false, -559, -273 )
				self.loadoutSubHeader:setTopBottom( true, false, 298, 323 )
				self.loadoutSubHeader:setAlpha( 1 )
				self.clipFinished( loadoutSubHeader, {} )
				chooseClassCPClientIngame0:completeAnimation()
				self.chooseClassCPClientIngame0:setLeftRight( false, false, -559, -279 )
				self.chooseClassCPClientIngame0:setTopBottom( true, false, 327, 372 )
				self.chooseClassCPClientIngame0:setAlpha( 1 )
				self.clipFinished( chooseClassCPClientIngame0, {} )
				classList:completeAnimation()
				self.classList:setLeftRight( false, false, -555, -275 )
				self.classList:setTopBottom( true, false, 372, 880 )
				self.clipFinished( classList, {} )
				classSetName:completeAnimation()
				self.classSetName:setAlpha( 0 )
				self.clipFinished( classSetName, {} )
			end
		},
		CampaignNoCybercore = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )
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
				self.CybercoreLoadoutWidget0:setLeftRight( false, false, -566, -273 )
				self.CybercoreLoadoutWidget0:setTopBottom( true, false, 109, 288 )
				self.CybercoreLoadoutWidget0:setAlpha( 0 )
				self.clipFinished( CybercoreLoadoutWidget0, {} )
				loadoutSubHeader:completeAnimation()
				self.loadoutSubHeader:setLeftRight( false, false, -559, -273 )
				self.loadoutSubHeader:setTopBottom( true, false, 298, 323 )
				self.loadoutSubHeader:setAlpha( 0 )
				self.clipFinished( loadoutSubHeader, {} )
				chooseClassCPClientIngame0:completeAnimation()
				self.chooseClassCPClientIngame0:setLeftRight( false, false, -555, -275 )
				self.chooseClassCPClientIngame0:setTopBottom( true, false, 89, 134 )
				self.chooseClassCPClientIngame0:setAlpha( 1 )
				self.clipFinished( chooseClassCPClientIngame0, {} )
				classList:completeAnimation()
				self.classList:setLeftRight( false, false, -555, -275 )
				self.classList:setTopBottom( true, false, 134, 642 )
				self.clipFinished( classList, {} )
				classSetName:completeAnimation()
				self.classSetName:setAlpha( 0 )
				self.clipFinished( classSetName, {} )
			end
		},
		ClassSetTabs = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )
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
				self.CybercoreLoadoutWidget0:setLeftRight( false, false, -555, -262 )
				self.CybercoreLoadoutWidget0:setTopBottom( true, false, 111, 290 )
				self.CybercoreLoadoutWidget0:setAlpha( 0 )
				self.clipFinished( CybercoreLoadoutWidget0, {} )
				loadoutSubHeader:completeAnimation()
				self.loadoutSubHeader:setLeftRight( true, false, 64, 357 )
				self.loadoutSubHeader:setTopBottom( true, false, 298, 323 )
				self.loadoutSubHeader:setAlpha( 0 )
				self.clipFinished( loadoutSubHeader, {} )
				classList:completeAnimation()
				self.classList:setLeftRight( false, false, -555, -275 )
				self.classList:setTopBottom( true, false, 148, 656 )
				self.clipFinished( classList, {} )
				ClassSetTabWidget:completeAnimation()
				self.ClassSetTabWidget:setAlpha( 1 )
				self.clipFinished( ClassSetTabWidget, {} )
				classSetName:completeAnimation()
				self.classSetName:setAlpha( 0 )
				self.clipFinished( classSetName, {} )
			end
		},
		ClassSetNoPrestige = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )
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
				self.CybercoreLoadoutWidget0:setLeftRight( false, false, -555, -262 )
				self.CybercoreLoadoutWidget0:setTopBottom( true, false, 111, 290 )
				self.CybercoreLoadoutWidget0:setAlpha( 0 )
				self.clipFinished( CybercoreLoadoutWidget0, {} )
				loadoutSubHeader:completeAnimation()
				self.loadoutSubHeader:setLeftRight( true, false, 64, 357 )
				self.loadoutSubHeader:setTopBottom( true, false, 298, 323 )
				self.loadoutSubHeader:setAlpha( 0 )
				self.clipFinished( loadoutSubHeader, {} )
				classList:completeAnimation()
				self.classList:setLeftRight( false, false, -555, -275 )
				self.classList:setTopBottom( true, false, 148, 656 )
				self.clipFinished( classList, {} )
				ClassSetTabWidget:completeAnimation()
				self.ClassSetTabWidget:setAlpha( 0 )
				self.clipFinished( ClassSetTabWidget, {} )
				classSetName:completeAnimation()
				self.classSetName:setAlpha( 1 )
				self.clipFinished( classSetName, {} )
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
				local f21_local0 = IsMultiplayer()
				if f21_local0 then
					f21_local0 = IsPublicOrLeagueGame( controller )
					if f21_local0 then
						f21_local0 = not IsCACCustomClassCountDefault( controller )
					end
				end
				return f21_local0
			end
		},
		{
			stateName = "ClassSetNoPrestige",
			condition = function ( menu, element, event )
				return IsMultiplayer() and not IsCACClassSetsCountDefault( controller )
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
		local f25_local0 = self
		local f25_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		}
		CoD.Menu.UpdateButtonShownState( f25_local0, self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
		CoD.Menu.UpdateButtonShownState( f25_local0, self, controller, Enum.LUIButton.LUI_KEY_LB )
		CoD.Menu.UpdateButtonShownState( f25_local0, self, controller, Enum.LUIButton.LUI_KEY_RB )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.cybercoreSelectMenuDisabled" ), function ( model )
		local f26_local0 = self
		local f26_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.cybercoreSelectMenuDisabled"
		}
		CoD.Menu.UpdateButtonShownState( f26_local0, self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f27_local0 = nil
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
		if not f27_local0 then
			f27_local0 = self:dispatchEventToChildren( event )
		end
		return f27_local0
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
		if IsCampaign() and not IsMulticoreActivated( controller ) and not IsCybercoreMenuDisabled( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "" )
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
		if IsCampaign() and CanUseSharedLoadouts( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_LB, "" )
			return false
		elseif IsMultiplayer() and not IsCACCustomClassCountDefault( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_LB, "" )
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
		if IsCampaign() and CanUseSharedLoadouts( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RB, "" )
			return false
		elseif IsMultiplayer() and not IsCACCustomClassCountDefault( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RB, "" )
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

