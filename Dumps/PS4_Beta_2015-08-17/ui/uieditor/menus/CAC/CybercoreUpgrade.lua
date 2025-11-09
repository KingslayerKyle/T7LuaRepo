require( "ui.uieditor.widgets.BackgroundFrames.CACBackgroundNew" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.CybercoreUpgradeTreeWidget" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.CybercoreInfoModelWidget" )
require( "ui.uieditor.widgets.CAC.cac_ElemsSideList" )
require( "ui.uieditor.widgets.TabbedWidgets.craftTabList" )
require( "ui.uieditor.widgets.TabbedWidgets.paintshopTabWidget" )
require( "ui.uieditor.widgets.Footer.fe_FooterContainer_NOTLobby" )

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
	self.soundSet = "CAC_SecondaryAttachment"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CybercoreUpgrade.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local CACBackgroundNew0 = CoD.CACBackgroundNew.new( self, controller )
	CACBackgroundNew0:setLeftRight( true, true, 0, 0 )
	CACBackgroundNew0:setTopBottom( true, true, 0, 0 )
	CACBackgroundNew0:subscribeToGlobalModel( controller, "CybercoreUpgradeMenu", "currentCybercoreName", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CACBackgroundNew0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( LocalizeIntoString( "CPUI_CORE_UPGRADES_CAPS", LocalizeToUpperString( modelValue ) ) ) )
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
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	LeftPanel:setLeftRight( true, false, 64, 528 )
	LeftPanel:setTopBottom( true, false, 129, 684 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local Line5 = LUI.UIImage.new()
	Line5:setLeftRight( true, true, 0, -749 )
	Line5:setTopBottom( false, false, -235, -231 )
	Line5:setImage( RegisterImage( "uie_t7_menu_frontend_titlelinem" ) )
	Line5:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Line5 )
	self.Line5 = Line5
	
	local Line4 = LUI.UIImage.new()
	Line4:setLeftRight( true, true, 0, -749 )
	Line4:setTopBottom( false, false, 162, 166 )
	Line4:setImage( RegisterImage( "uie_t7_menu_frontend_titlelinem" ) )
	Line4:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Line4 )
	self.Line4 = Line4
	
	local Line40 = LUI.UIImage.new()
	Line40:setLeftRight( true, true, 0, -749 )
	Line40:setTopBottom( false, false, 21, 24 )
	Line40:setImage( RegisterImage( "uie_t7_menu_frontend_titlelinem" ) )
	Line40:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Line40 )
	self.Line40 = Line40
	
	local Line3 = LUI.UIImage.new()
	Line3:setLeftRight( true, true, -8, -749 )
	Line3:setTopBottom( false, false, 298, 302 )
	Line3:setImage( RegisterImage( "uie_t7_menu_frontend_titlelinem" ) )
	Line3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Line3 )
	self.Line3 = Line3
	
	local Line2 = LUI.UIImage.new()
	Line2:setLeftRight( true, true, 563, -85 )
	Line2:setTopBottom( false, false, 239, 242 )
	Line2:setAlpha( 0 )
	Line2:setImage( RegisterImage( "uie_t7_menu_frontend_titlelinem" ) )
	Line2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Line2 )
	self.Line2 = Line2
	
	local Line1 = LUI.UIImage.new()
	Line1:setLeftRight( true, true, 563, -85 )
	Line1:setTopBottom( false, false, 191, 200.78 )
	Line1:setAlpha( 0 )
	Line1:setImage( RegisterImage( "uie_t7_menu_frontend_titlelinem" ) )
	Line1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Line1 )
	self.Line1 = Line1
	
	local upgradeTree = CoD.CybercoreUpgradeTreeWidget.new( self, controller )
	upgradeTree:setLeftRight( true, false, -51, 649 )
	upgradeTree:setTopBottom( true, false, 19, 683.5 )
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
		FocusCybercoreUpgradeItem( self, controller )
		return retVal
	end )
	self:addElement( upgradeTree )
	self.upgradeTree = upgradeTree
	
	local infoWidget = CoD.CybercoreInfoModelWidget.new( self, controller )
	infoWidget:setLeftRight( false, false, -86, 555 )
	infoWidget:setTopBottom( true, false, 124, 710 )
	self:addElement( infoWidget )
	self.infoWidget = infoWidget
	
	local ElemsSideList = CoD.cac_ElemsSideList.new( self, controller )
	ElemsSideList:setLeftRight( true, false, 11, 78.87 )
	ElemsSideList:setTopBottom( true, false, 48, 718 )
	self:addElement( ElemsSideList )
	self.ElemsSideList = ElemsSideList
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, false, -11, 1293 )
	CategoryListLine:setTopBottom( true, false, 80, 88 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local Pixel6 = LUI.UIImage.new()
	Pixel6:setLeftRight( true, false, 26.87, 62.87 )
	Pixel6:setTopBottom( true, false, 302, 306 )
	Pixel6:setYRot( -180 )
	Pixel6:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel6:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel6 )
	self.Pixel6 = Pixel6
	
	local Pixel5 = LUI.UIImage.new()
	Pixel5:setLeftRight( true, false, 26.87, 62.87 )
	Pixel5:setTopBottom( true, false, 337, 341 )
	Pixel5:setYRot( -180 )
	Pixel5:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel5:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel5 )
	self.Pixel5 = Pixel5
	
	local Pixel4 = LUI.UIImage.new()
	Pixel4:setLeftRight( true, false, 26.87, 62.87 )
	Pixel4:setTopBottom( true, false, 449, 453 )
	Pixel4:setYRot( -180 )
	Pixel4:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel4:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel4 )
	self.Pixel4 = Pixel4
	
	local Pixel3 = LUI.UIImage.new()
	Pixel3:setLeftRight( true, false, 26.87, 62.87 )
	Pixel3:setTopBottom( true, false, 604, 608 )
	Pixel3:setYRot( -180 )
	Pixel3:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel3 )
	self.Pixel3 = Pixel3
	
	local Pixel2 = LUI.UIImage.new()
	Pixel2:setLeftRight( true, false, 26.87, 62.87 )
	Pixel2:setTopBottom( true, false, 186, 190 )
	Pixel2:setYRot( -180 )
	Pixel2:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel2 )
	self.Pixel2 = Pixel2
	
	local ElemsSideList0 = CoD.cac_ElemsSideList.new( self, controller )
	ElemsSideList0:setLeftRight( true, false, 1212.13, 1280 )
	ElemsSideList0:setTopBottom( true, false, 48, 718 )
	self:addElement( ElemsSideList0 )
	self.ElemsSideList0 = ElemsSideList0
	
	local coreTabList = CoD.craftTabList.new( self, controller )
	coreTabList:setLeftRight( true, false, 64, 1304 )
	coreTabList:setTopBottom( true, false, 84, 124 )
	coreTabList.grid:setDataSource( "CybercoreGroups" )
	coreTabList.grid:setWidgetType( CoD.paintshopTabWidget )
	coreTabList:registerEventHandler( "list_active_changed", function ( element, event )
		local retVal = nil
		Cybercore_TabChanged( self, element, controller )
		return retVal
	end )
	self:addElement( coreTabList )
	self.coreTabList = coreTabList
	
	local feFooterContainer = CoD.fe_FooterContainer_NOTLobby.new( self, controller )
	feFooterContainer:setLeftRight( true, true, 0, 0 )
	feFooterContainer:setTopBottom( false, true, -65, 0 )
	self:addElement( feFooterContainer )
	self.feFooterContainer = feFooterContainer
	
	upgradeTree.navigation = {
		right = infoWidget,
		down = infoWidget
	}
	infoWidget.navigation = {
		left = upgradeTree,
		up = upgradeTree
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				Line2:completeAnimation()
				self.Line2:setLeftRight( true, true, 611, -182 )
				self.Line2:setTopBottom( false, false, -30, -26 )
				self.Line2:setRGB( 1, 1, 1 )
				self.Line2:setAlpha( 0 )
				self.clipFinished( Line2, {} )
				Line1:completeAnimation()
				self.Line1:setLeftRight( true, true, 611, -182 )
				self.Line1:setTopBottom( false, false, 7.78, 10.78 )
				self.Line1:setRGB( 1, 1, 1 )
				self.Line1:setAlpha( 0 )
				self.clipFinished( Line1, {} )
				ElemsSideList:completeAnimation()
				self.ElemsSideList:setLeftRight( true, false, 2, 69.87 )
				self.ElemsSideList:setTopBottom( true, false, 48, 718 )
				self.ElemsSideList:setAlpha( 0.17 )
				self.clipFinished( ElemsSideList, {} )
				CategoryListLine:completeAnimation()
				self.CategoryListLine:setLeftRight( true, false, 0, 1293 )
				self.CategoryListLine:setTopBottom( true, false, 80, 88 )
				self.CategoryListLine:setAlpha( 1 )
				self.clipFinished( CategoryListLine, {} )
				Pixel6:completeAnimation()
				self.Pixel6:setAlpha( 1 )
				self.clipFinished( Pixel6, {} )
				Pixel5:completeAnimation()
				self.Pixel5:setAlpha( 1 )
				self.clipFinished( Pixel5, {} )
				Pixel4:completeAnimation()
				self.Pixel4:setAlpha( 1 )
				self.clipFinished( Pixel4, {} )
				Pixel3:completeAnimation()
				self.Pixel3:setAlpha( 1 )
				self.clipFinished( Pixel3, {} )
				Pixel2:completeAnimation()
				self.Pixel2:setAlpha( 1 )
				self.clipFinished( Pixel2, {} )
			end
		},
		Control = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Martial = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Chaos = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
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
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		LockInput( self, controller, true )
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
		LockInput( self, controller, false )
		SendClientScriptMenuChangeNotify( controller, menu, false )
		SetPerControllerTableProperty( controller, "isInCybercoreUpgrade", nil )
		SendOwnMenuResponse( menu, controller, "closed" )
		PlaySoundSetSound( self, "menu_go_back" )
		ClearMenuSavedState( menu )
		Close( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	upgradeTree.id = "upgradeTree"
	infoWidget.id = "infoWidget"
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
		self.LeftPanel:close()
		self.upgradeTree:close()
		self.infoWidget:close()
		self.ElemsSideList:close()
		self.ElemsSideList0:close()
		self.coreTabList:close()
		self.feFooterContainer:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "CybercoreUpgrade.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

