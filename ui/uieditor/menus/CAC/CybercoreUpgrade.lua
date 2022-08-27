-- 20a69bb69a3c40de7d534bbd8fafb80c
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.BackgroundFrames.CACBackgroundNew" )
require( "ui.uieditor.widgets.AbilityWheel.AbilityWheel_Texture" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.CybercoreUpgradeTreeWidget" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.CybercoreInfoModelWidget" )
require( "ui.uieditor.widgets.Footer.fe_FooterContainer_NOTLobby" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TabBar" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.PC.Utility.XCamMouseControl" )

DataSources.CybercoreUpgradeMenu = {
	getModel = function ( f1_arg0 )
		local f1_local0 = Engine.CreateModel( Engine.GetModelForController( f1_arg0 ), "CybercoreUpgradeMenu" )
		local f1_local1 = Engine.GetModel( f1_local0, "selectedCore" )
		if f1_local1 == nil then
			local f1_local2 = "cybercore_control"
			f1_local1 = Engine.CreateModel( f1_local0, "selectedCore" )
			Engine.SetModelValue( f1_local1, f1_local2 )
		end
		local f1_local2 = Engine.GetModelValue( f1_local1 )
		local f1_local3 = ""
		for f1_local7, f1_local8 in ipairs( CoD.CACUtility.CybercoreGroupNames ) do
			if f1_local8.itemRef == f1_local2 then
				f1_local3 = f1_local8.name
				break
			end
		end
		Engine.SetModelValue( Engine.CreateModel( f1_local0, "currentCybercoreName" ), f1_local3 )
		return f1_local0
	end
}
DataSources.CybercoreGroups = DataSourceHelpers.ListSetup( "CybercoreGroups", function ( f2_arg0 )
	local f2_local0 = {}
	table.insert( f2_local0, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderl
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	for f2_local4, f2_local5 in ipairs( CoD.CACUtility.CybercoreGroupNames ) do
		table.insert( f2_local0, {
			models = {
				tabName = f2_local5.name
			},
			properties = {
				itemName = f2_local5.name,
				itemRef = f2_local5.itemRef
			}
		} )
	end
	table.insert( f2_local0, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderr
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	return f2_local0
end, true )
local PreLoadFunc = function ( self, controller )
	self.disableBlur = true
end

local PostLoadFunc = function ( f4_arg0, f4_arg1 )
	f4_arg0.upgradeTree:updateTree( f4_arg1 )
	CoD.CACUtility.CreateUnlockTokenModels( f4_arg1 )
end

LUI.hudMenuType.CybercoreUpgrade = "hud"
LUI.createMenu.CybercoreUpgrade = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "CybercoreUpgrade" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CybercoreUpgrade.buttonPrompts" )
	local f5_local1 = self
	self.anyChildUsesUpdateState = true
	
	local CACBackgroundNew0 = CoD.CACBackgroundNew.new( f5_local1, controller )
	CACBackgroundNew0:setLeftRight( true, true, 0, 0 )
	CACBackgroundNew0:setTopBottom( true, true, 0, 0 )
	CACBackgroundNew0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_cybercore" ) )
	CACBackgroundNew0:subscribeToGlobalModel( controller, "CybercoreUpgradeMenu", "currentCybercoreName", function ( model )
		local currentCybercoreName = Engine.GetModelValue( model )
		if currentCybercoreName then
			CACBackgroundNew0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( LocalizeIntoString( "CPUI_CORE_UPGRADES_CAPS", LocalizeToUpperString( currentCybercoreName ) ) ) )
		end
	end )
	CACBackgroundNew0:registerEventHandler( "menu_loaded", function ( element, event )
		local f7_local0 = nil
		ShowHeaderKickerAndIcon( f5_local1 )
		if not f7_local0 then
			f7_local0 = element:dispatchEventToChildren( event )
		end
		return f7_local0
	end )
	self:addElement( CACBackgroundNew0 )
	self.CACBackgroundNew0 = CACBackgroundNew0
	
	local BlackPanel = LUI.UIImage.new()
	BlackPanel:setLeftRight( true, false, 62.87, 518 )
	BlackPanel:setTopBottom( true, true, 125, -36.5 )
	BlackPanel:setRGB( 0, 0, 0 )
	BlackPanel:setAlpha( 0.5 )
	self:addElement( BlackPanel )
	self.BlackPanel = BlackPanel
	
	local Texture = CoD.AbilityWheel_Texture.new( f5_local1, controller )
	Texture:setLeftRight( true, false, 62.87, 518 )
	Texture:setTopBottom( true, false, 139, 660 )
	self:addElement( Texture )
	self.Texture = Texture
	
	local TabbarBacking = LUI.UIImage.new()
	TabbarBacking:setLeftRight( true, true, 0, 0 )
	TabbarBacking:setTopBottom( true, false, 85, 125 )
	TabbarBacking:setRGB( 0, 0, 0 )
	self:addElement( TabbarBacking )
	self.TabbarBacking = TabbarBacking
	
	local Line5 = LUI.UIImage.new()
	Line5:setLeftRight( false, false, -640, -109 )
	Line5:setTopBottom( false, false, -235, -231 )
	Line5:setImage( RegisterImage( "uie_t7_menu_frontend_titlelinem" ) )
	Line5:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Line5 )
	self.Line5 = Line5
	
	local Line4 = LUI.UIImage.new()
	Line4:setLeftRight( false, false, -640, -109 )
	Line4:setTopBottom( false, false, 162, 166 )
	Line4:setAlpha( 0 )
	Line4:setImage( RegisterImage( "uie_t7_menu_frontend_titlelinem" ) )
	Line4:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Line4 )
	self.Line4 = Line4
	
	local Line40 = LUI.UIImage.new()
	Line40:setLeftRight( false, false, -640, -109 )
	Line40:setTopBottom( false, false, 21, 24 )
	Line40:setAlpha( 0 )
	Line40:setImage( RegisterImage( "uie_t7_menu_frontend_titlelinem" ) )
	Line40:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Line40 )
	self.Line40 = Line40
	
	local Line3 = LUI.UIImage.new()
	Line3:setLeftRight( false, false, -648, -109 )
	Line3:setTopBottom( false, false, 298, 302 )
	Line3:setAlpha( 0 )
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
	
	local upgradeTree = CoD.CybercoreUpgradeTreeWidget.new( f5_local1, controller )
	upgradeTree:setLeftRight( true, false, -51, 649 )
	upgradeTree:setTopBottom( true, false, 19, 683.5 )
	upgradeTree:subscribeToGlobalModel( controller, "CybercoreAbilityUpgradeTree", nil, function ( model )
		upgradeTree:setModel( model, controller )
	end )
	upgradeTree:registerEventHandler( "record_curr_focused_elem_id", function ( element, event )
		local f9_local0 = nil
		if element.RecordCurrFocusedElemID then
			f9_local0 = element:RecordCurrFocusedElemID( event )
		elseif element.super.RecordCurrFocusedElemID then
			f9_local0 = element.super:RecordCurrFocusedElemID( event )
		end
		UpdateElementModelToFocusedElementModel( self, element, "infoWidget", event )
		UpdateElementState( self, "infoWidget", controller )
		return f9_local0
	end )
	self:addElement( upgradeTree )
	self.upgradeTree = upgradeTree
	
	local infoWidget = CoD.CybercoreInfoModelWidget.new( f5_local1, controller )
	infoWidget:setLeftRight( true, true, 563, -76 )
	infoWidget:setTopBottom( true, false, 120, 706 )
	self:addElement( infoWidget )
	self.infoWidget = infoWidget
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, true, -11, 13 )
	CategoryListLine:setTopBottom( true, false, 80, 88 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local Pixel2 = LUI.UIImage.new()
	Pixel2:setLeftRight( false, false, -613.13, -577.13 )
	Pixel2:setTopBottom( true, false, 186, 190 )
	Pixel2:setAlpha( 0 )
	Pixel2:setYRot( -180 )
	Pixel2:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel2 )
	self.Pixel2 = Pixel2
	
	local feFooterContainer = CoD.fe_FooterContainer_NOTLobby.new( f5_local1, controller )
	feFooterContainer:setLeftRight( true, true, 0, 0 )
	feFooterContainer:setTopBottom( false, true, -65, 0 )
	feFooterContainer:registerEventHandler( "menu_loaded", function ( element, event )
		local f10_local0 = nil
		SizeToSafeArea( element, controller )
		if not f10_local0 then
			f10_local0 = element:dispatchEventToChildren( event )
		end
		return f10_local0
	end )
	self:addElement( feFooterContainer )
	self.feFooterContainer = feFooterContainer
	
	local coreTabList = CoD.FE_TabBar.new( f5_local1, controller )
	coreTabList:setLeftRight( true, true, 0, 2000 )
	coreTabList:setTopBottom( true, false, 84, 125 )
	coreTabList.Tabs.grid:setDataSource( "CybercoreGroups" )
	coreTabList:registerEventHandler( "list_active_changed", function ( element, event )
		local f11_local0 = nil
		Cybercore_TabChanged( self, element, controller )
		return f11_local0
	end )
	self:addElement( coreTabList )
	self.coreTabList = coreTabList
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( f5_local1, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics:setTopBottom( true, true, 95, -7.75 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local FEMenuLeftGraphics0 = CoD.FE_Menu_LeftGraphics.new( f5_local1, controller )
	FEMenuLeftGraphics0:setLeftRight( false, true, -58, -6 )
	FEMenuLeftGraphics0:setTopBottom( true, true, 95, -7.75 )
	FEMenuLeftGraphics0:setYRot( 180 )
	self:addElement( FEMenuLeftGraphics0 )
	self.FEMenuLeftGraphics0 = FEMenuLeftGraphics0
	
	local XCamMouseControl = CoD.XCamMouseControl.new( f5_local1, controller )
	XCamMouseControl:setLeftRight( false, false, 0, 379 )
	XCamMouseControl:setTopBottom( true, true, 272, -164.11 )
	self:addElement( XCamMouseControl )
	self.XCamMouseControl = XCamMouseControl
	
	upgradeTree.navigation = {
		right = infoWidget,
		down = infoWidget
	}
	infoWidget.navigation = {
		left = upgradeTree,
		up = upgradeTree
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
		f5_local1:updateElementState( self, {
			name = "model_validation",
			menu = f5_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CybercoreUpgradeMenu.selectedCore"
		} )
	end )
	CoD.Menu.AddNavigationHandler( f5_local1, self, controller )
	self:registerEventHandler( "menu_opened", function ( element, event )
		local f16_local0 = nil
		if TestAndSetFirstTimeMenu( controller, "com_firsttime_cybertech" ) then
			OpenGenericLargePopup( f5_local1, controller, "MENU_FIRSTTIME_CYBERTECH", "MENU_FIRSTTIME_CYBERTECH2", "com_firsttime_cybertech_image", "MENU_FIRSTTIME_CYBERTECH_BUTTONTEXT", "", "" )
		end
		if not f16_local0 then
			f16_local0 = element:dispatchEventToChildren( event )
		end
		return f16_local0
	end )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local f17_local0 = nil
		PrepareOpenMenuInSafehouse( controller )
		SendClientScriptMenuChangeNotify( controller, f5_local1, true )
		SetPerControllerTableProperty( controller, "isInCybercoreUpgrade", true )
		ShowHeaderIconOnly( f5_local1 )
		SetElementStateByElementName( self, "CACBackgroundNew0", controller, "Update" )
		PlayClip( self, "intro", controller )
		if not f17_local0 then
			f17_local0 = element:dispatchEventToChildren( event )
		end
		return f17_local0
	end )
	f5_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f18_arg0, f18_arg1, f18_arg2, f18_arg3 )
		UploadStats( self, f18_arg2 )
		PrepareCloseMenuInSafehouse( f18_arg2 )
		SendClientScriptMenuChangeNotify( f18_arg2, f18_arg1, false )
		SetPerControllerTableProperty( f18_arg2, "isInCybercoreUpgrade", nil )
		SendOwnMenuResponse( f18_arg1, f18_arg2, "closed" )
		PlaySoundSetSound( self, "menu_go_back" )
		ClearMenuSavedState( f18_arg1 )
		Close( self, f18_arg2 )
		SendClientScriptNotifyForAdjustedClient( f18_arg2, "CustomClass_closed", "" )
		return true
	end, function ( f19_arg0, f19_arg1, f19_arg2 )
		CoD.Menu.SetButtonLabel( f19_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	f5_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, nil, function ( f20_arg0, f20_arg1, f20_arg2, f20_arg3 )
		if CACShowRotatePrompt( self, f20_arg0, f20_arg2 ) then
			return true
		else
			
		end
	end, function ( f21_arg0, f21_arg1, f21_arg2 )
		CoD.Menu.SetButtonLabel( f21_arg1, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "PLATFORM_EMBLEM_ROTATE_LAYER" )
		if CACShowRotatePrompt( self, f21_arg0, f21_arg2 ) then
			return true
		else
			return false
		end
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
		menu = f5_local1
	} )
	if not self:restoreState() then
		self.upgradeTree:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CACBackgroundNew0:close()
		element.Texture:close()
		element.upgradeTree:close()
		element.infoWidget:close()
		element.feFooterContainer:close()
		element.coreTabList:close()
		element.FEMenuLeftGraphics:close()
		element.FEMenuLeftGraphics0:close()
		element.XCamMouseControl:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "CybercoreUpgrade.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

