require( "ui.uieditor.widgets.AbilityWheel.AbilityWheel_Texture" )
require( "ui.uieditor.widgets.BackgroundFrames.CACBackgroundNew" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.CybercoreInfoModelWidget" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.CybercoreUpgradeTreeWidget" )
require( "ui.uieditor.widgets.Footer.fe_FooterContainer_NOTLobby" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TabBar" )
require( "ui.uieditor.widgets.PC.Utility.XCamMouseControl" )

DataSources.CybercoreUpgradeMenu = {
	getModel = function ( controller )
		local cybercoreUpgradeMenuModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CybercoreUpgradeMenu" )
		local coreModel = Engine.GetModel( cybercoreUpgradeMenuModel, "selectedCore" )
		if coreModel == nil then
			local initialCoreRef = "cybercore_control"
			coreModel = Engine.CreateModel( cybercoreUpgradeMenuModel, "selectedCore" )
			Engine.SetModelValue( coreModel, initialCoreRef )
		end
		local coreRef = Engine.GetModelValue( coreModel )
		local cybercoreName = ""
		for _, category in ipairs( CoD.CACUtility.CybercoreGroupNames ) do
			if category.itemRef == coreRef then
				cybercoreName = category.name
				break
			end
		end
		Engine.SetModelValue( Engine.CreateModel( cybercoreUpgradeMenuModel, "currentCybercoreName" ), cybercoreName )
		return cybercoreUpgradeMenuModel
	end
}
DataSources.CybercoreGroups = DataSourceHelpers.ListSetup( "CybercoreGroups", function ( controller )
	local cybercoreCategoryList = {}
	table.insert( cybercoreCategoryList, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderl
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	for _, category in ipairs( CoD.CACUtility.CybercoreGroupNames ) do
		table.insert( cybercoreCategoryList, {
			models = {
				tabName = category.name
			},
			properties = {
				itemName = category.name,
				itemRef = category.itemRef
			}
		} )
	end
	table.insert( cybercoreCategoryList, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderr
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	return cybercoreCategoryList
end, true )
local PreLoadFunc = function ( self, controller )
	self.disableBlur = true
end

local PostLoadFunc = function ( self, controller )
	self.upgradeTree:updateTree( controller )
	CoD.CACUtility.CreateUnlockTokenModels( controller )
end

LUI.hudMenuType.CybercoreUpgrade = "hud"
LUI.createMenu.CybercoreUpgrade = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "CybercoreUpgrade" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CybercoreUpgrade.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local CACBackgroundNew0 = CoD.CACBackgroundNew.new( self, controller )
	CACBackgroundNew0:setLeftRight( 0, 1, 0, 0 )
	CACBackgroundNew0:setTopBottom( 0, 1, 0, 0 )
	CACBackgroundNew0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_cybercore" ) )
	CACBackgroundNew0:subscribeToGlobalModel( controller, "CybercoreUpgradeMenu", "currentCybercoreName", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CACBackgroundNew0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( LocalizeIntoString( "CPUI_CORE_UPGRADES_CAPS", LocalizeToUpperString( modelValue ) ) )
		end
	end )
	CACBackgroundNew0:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		ShowHeaderKickerAndIcon( self )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( CACBackgroundNew0 )
	self.CACBackgroundNew0 = CACBackgroundNew0
	
	local BlackPanel = LUI.UIImage.new()
	BlackPanel:setLeftRight( 0, 0, 94, 777 )
	BlackPanel:setTopBottom( 0, 1, 187, -55 )
	BlackPanel:setRGB( 0, 0, 0 )
	BlackPanel:setAlpha( 0.5 )
	self:addElement( BlackPanel )
	self.BlackPanel = BlackPanel
	
	local Texture = CoD.AbilityWheel_Texture.new( self, controller )
	Texture:setLeftRight( 0, 0, 94, 777 )
	Texture:setTopBottom( 0, 0, 208, 990 )
	self:addElement( Texture )
	self.Texture = Texture
	
	local TabbarBacking = LUI.UIImage.new()
	TabbarBacking:setLeftRight( 0, 1, 0, 0 )
	TabbarBacking:setTopBottom( 0, 0, 128, 188 )
	TabbarBacking:setRGB( 0, 0, 0 )
	self:addElement( TabbarBacking )
	self.TabbarBacking = TabbarBacking
	
	local Line5 = LUI.UIImage.new()
	Line5:setLeftRight( 0.5, 0.5, -960, -164 )
	Line5:setTopBottom( 0.5, 0.5, -353, -347 )
	Line5:setImage( RegisterImage( "uie_t7_menu_frontend_titlelinem" ) )
	Line5:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Line5 )
	self.Line5 = Line5
	
	local Line4 = LUI.UIImage.new()
	Line4:setLeftRight( 0.5, 0.5, -960, -164 )
	Line4:setTopBottom( 0.5, 0.5, 243, 249 )
	Line4:setAlpha( 0 )
	Line4:setImage( RegisterImage( "uie_t7_menu_frontend_titlelinem" ) )
	Line4:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Line4 )
	self.Line4 = Line4
	
	local Line40 = LUI.UIImage.new()
	Line40:setLeftRight( 0.5, 0.5, -960, -164 )
	Line40:setTopBottom( 0.5, 0.5, 32, 36 )
	Line40:setAlpha( 0 )
	Line40:setImage( RegisterImage( "uie_t7_menu_frontend_titlelinem" ) )
	Line40:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Line40 )
	self.Line40 = Line40
	
	local Line3 = LUI.UIImage.new()
	Line3:setLeftRight( 0.5, 0.5, -972, -164 )
	Line3:setTopBottom( 0.5, 0.5, 447, 453 )
	Line3:setAlpha( 0 )
	Line3:setImage( RegisterImage( "uie_t7_menu_frontend_titlelinem" ) )
	Line3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Line3 )
	self.Line3 = Line3
	
	local Line2 = LUI.UIImage.new()
	Line2:setLeftRight( 0, 1, 844, -128 )
	Line2:setTopBottom( 0.5, 0.5, 359, 363 )
	Line2:setAlpha( 0 )
	Line2:setImage( RegisterImage( "uie_t7_menu_frontend_titlelinem" ) )
	Line2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Line2 )
	self.Line2 = Line2
	
	local Line1 = LUI.UIImage.new()
	Line1:setLeftRight( 0, 1, 844, -128 )
	Line1:setTopBottom( 0.5, 0.5, 286, 301 )
	Line1:setAlpha( 0 )
	Line1:setImage( RegisterImage( "uie_t7_menu_frontend_titlelinem" ) )
	Line1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Line1 )
	self.Line1 = Line1
	
	local upgradeTree = CoD.CybercoreUpgradeTreeWidget.new( self, controller )
	upgradeTree:setLeftRight( 0, 0, -77, 973 )
	upgradeTree:setTopBottom( 0, 0, 28, 1025 )
	upgradeTree:subscribeToGlobalModel( controller, "CybercoreAbilityUpgradeTree", nil, function ( model )
		upgradeTree:setModel( model, controller )
	end )
	upgradeTree:registerEventHandler( "record_curr_focused_elem_id", function ( element, event )
		local retVal = nil
		if element.RecordCurrFocusedElemID then
			retVal = element:RecordCurrFocusedElemID( event )
		elseif element.super.RecordCurrFocusedElemID then
			retVal = element.super:RecordCurrFocusedElemID( event )
		end
		UpdateElementModelToFocusedElementModel( self, element, "infoWidget", event )
		UpdateElementState( self, "infoWidget", controller )
		return retVal
	end )
	self:addElement( upgradeTree )
	self.upgradeTree = upgradeTree
	
	local infoWidget = CoD.CybercoreInfoModelWidget.new( self, controller )
	infoWidget:setLeftRight( 0, 1, 844, -114 )
	infoWidget:setTopBottom( 0, 0, 180.5, 1059.5 )
	self:addElement( infoWidget )
	self.infoWidget = infoWidget
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( 0, 1, -16, 20 )
	CategoryListLine:setTopBottom( 0, 0, 120, 132 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local Pixel2 = LUI.UIImage.new()
	Pixel2:setLeftRight( 0.5, 0.5, -920, -866 )
	Pixel2:setTopBottom( 0, 0, 279, 285 )
	Pixel2:setAlpha( 0 )
	Pixel2:setYRot( -180 )
	Pixel2:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel2 )
	self.Pixel2 = Pixel2
	
	local feFooterContainer = CoD.fe_FooterContainer_NOTLobby.new( self, controller )
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
	
	local coreTabList = CoD.FE_TabBar.new( self, controller )
	coreTabList:setLeftRight( 0, 1, 0, 3000 )
	coreTabList:setTopBottom( 0, 0, 126, 188 )
	coreTabList.Tabs.grid:setDataSource( "CybercoreGroups" )
	coreTabList:registerEventHandler( "list_active_changed", function ( element, event )
		local retVal = nil
		Cybercore_TabChanged( self, element, controller )
		return retVal
	end )
	self:addElement( coreTabList )
	self.coreTabList = coreTabList
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( 0, 0, 29, 107 )
	FEMenuLeftGraphics:setTopBottom( 0, 1, 142, -12 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local FEMenuLeftGraphics0 = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics0:setLeftRight( 1, 1, -87, -9 )
	FEMenuLeftGraphics0:setTopBottom( 0, 1, 142, -12 )
	FEMenuLeftGraphics0:setYRot( 180 )
	self:addElement( FEMenuLeftGraphics0 )
	self.FEMenuLeftGraphics0 = FEMenuLeftGraphics0
	
	local XCamMouseControl = CoD.XCamMouseControl.new( self, controller )
	XCamMouseControl:setLeftRight( 0.5, 0.5, 0, 568 )
	XCamMouseControl:setTopBottom( 0, 1, 408, -246 )
	self:addElement( XCamMouseControl )
	self.XCamMouseControl = XCamMouseControl
	
	self:mergeStateConditions( {
		{
			stateName = "Control",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "CybercoreUpgradeMenu.selectedCore", "cybercore_control" )
			end
		},
		{
			stateName = "Martial",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "CybercoreUpgradeMenu.selectedCore", "cybercore_martial" )
			end
		},
		{
			stateName = "Chaos",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "CybercoreUpgradeMenu.selectedCore", "cybercore_chaos" )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CybercoreUpgradeMenu.selectedCore" ), function ( model )
		self:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CybercoreUpgradeMenu.selectedCore"
		} )
	end )
	self:registerEventHandler( "menu_opened", function ( element, event )
		local retVal = nil
		if TestAndSetFirstTimeMenu( controller, "com_firsttime_cybertech" ) then
			OpenGenericLargePopup( self, controller, "MENU_FIRSTTIME_CYBERTECH", "MENU_FIRSTTIME_CYBERTECH2", "com_firsttime_cybertech_image", "MENU_FIRSTTIME_CYBERTECH_BUTTONTEXT", "", "" )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		PrepareOpenMenuInSafehouse( controller )
		SendClientScriptMenuChangeNotify( controller, self, true )
		SetPerControllerTableProperty( controller, "isInCybercoreUpgrade", true )
		ShowHeaderIconOnly( self )
		SetElementStateByElementName( self, "CACBackgroundNew0", controller, "Update" )
		PlayClip( self, "intro", controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		UploadStats( self, controller )
		PrepareCloseMenuInSafehouse( controller )
		SendClientScriptMenuChangeNotify( controller, menu, false )
		SetPerControllerTableProperty( controller, "isInCybercoreUpgrade", nil )
		SendOwnMenuResponse( menu, controller, "closed" )
		PlaySoundSetSound( self, "menu_go_back" )
		ClearMenuSavedState( menu )
		Close( self, controller )
		SendClientScriptNotifyForAdjustedClient( controller, "CustomClass_closed", "" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, nil, function ( element, menu, controller, model )
		if CACShowRotatePrompt( self, element, controller ) then
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if CACShowRotatePrompt( self, element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "PLATFORM_EMBLEM_ROTATE_LAYER", nil )
			return true
		else
			return false
		end
	end, false )
	upgradeTree.id = "upgradeTree"
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
		self.upgradeTree:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.CACBackgroundNew0:close()
		self.Texture:close()
		self.upgradeTree:close()
		self.infoWidget:close()
		self.feFooterContainer:close()
		self.coreTabList:close()
		self.FEMenuLeftGraphics:close()
		self.FEMenuLeftGraphics0:close()
		self.XCamMouseControl:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "CybercoreUpgrade.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

