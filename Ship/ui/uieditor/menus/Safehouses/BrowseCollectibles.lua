-- b53a6b750b79f82ceb9010e7731fca9a
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.menus.Safehouses.PlaceSmallCollectible" )
require( "ui.uieditor.menus.Safehouses.PlaceMediumCollectible" )
require( "ui.uieditor.menus.Safehouses.PlaceLargeCollectible" )
require( "ui.uieditor.widgets.StartMenu.CP.StartMenu_CampaignBG" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Safehouse.SafeHouseGrid" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.Safehouse.browseCollectibleInspectionArea" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TabBar" )
require( "ui.uieditor.widgets.PC.Utility.XCamMouseControl" )

local PostLoadFunc = function ( self, controller, menu )
	self.CollectibleAudioLog = function ( f2_arg0, f2_arg1, f2_arg2 )
		local f2_local0 = f2_arg2:getModel()
		if f2_local0 then
			f2_local0 = Engine.GetModel( f2_local0, "audioLog" )
		end
		local f2_local1 = f2_local0 and Engine.GetModelValue( f2_local0 )
		if f2_arg1.currentAudioAlias ~= nil and f2_arg1.currentAudioAlias ~= "" then
			StopSoundAlias( f2_arg1.currentAudioAlias )
		end
		if f2_local1 ~= nil and f2_local1 ~= "" then
			PlaySoundAlias( f2_local1 )
			f2_arg1.currentAudioAlias = f2_local1
		end
	end
	
end

LUI.createMenu.BrowseCollectibles = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "BrowseCollectibles" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "BrowseCollectibles.buttonPrompts" )
	local f3_local1 = self
	self.anyChildUsesUpdateState = true
	
	local StartMenuCampaignBG = CoD.StartMenu_CampaignBG.new( f3_local1, controller )
	StartMenuCampaignBG:setLeftRight( true, true, 0, 0 )
	StartMenuCampaignBG:setTopBottom( true, true, 0, 0 )
	self:addElement( StartMenuCampaignBG )
	self.StartMenuCampaignBG = StartMenuCampaignBG
	
	local ImgVignetteFull = LUI.UIImage.new()
	ImgVignetteFull:setLeftRight( true, true, 0, 0 )
	ImgVignetteFull:setTopBottom( true, true, 0, 0 )
	ImgVignetteFull:setAlpha( 0 )
	ImgVignetteFull:setImage( RegisterImage( "uie_img_t7_hud_fx_vignette_fullblue" ) )
	ImgVignetteFull:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_multiply" ) )
	self:addElement( ImgVignetteFull )
	self.ImgVignetteFull = ImgVignetteFull
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( f3_local1, controller )
	LeftPanel:setLeftRight( false, false, -576, -210.45 )
	LeftPanel:setTopBottom( true, true, 80, -37 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local TabBacking = LUI.UIImage.new()
	TabBacking:setLeftRight( true, true, 0, 0 )
	TabBacking:setTopBottom( true, false, 126, 85 )
	TabBacking:setRGB( 0, 0, 0 )
	self:addElement( TabBacking )
	self.TabBacking = TabBacking
	
	local collectibles = LUI.UIList.new( f3_local1, controller, 7, 0, nil, false, false, 0, 0, false, false )
	collectibles:makeFocusable()
	collectibles:setLeftRight( false, false, -565, -221 )
	collectibles:setTopBottom( true, true, 149, -110 )
	collectibles:setDataSource( "CollectiblesList" )
	collectibles:setWidgetType( CoD.SafeHouseGrid )
	collectibles:setHorizontalCount( 3 )
	collectibles:setVerticalCount( 4 )
	collectibles:setSpacing( 7 )
	collectibles:setVerticalCounter( CoD.verticalCounter )
	self:addElement( collectibles )
	self.collectibles = collectibles
	
	local browseCollectibleInspectionArea0 = CoD.browseCollectibleInspectionArea.new( f3_local1, controller )
	browseCollectibleInspectionArea0:setLeftRight( false, false, -195, 576 )
	browseCollectibleInspectionArea0:setTopBottom( true, false, 148, 640 )
	self:addElement( browseCollectibleInspectionArea0 )
	self.browseCollectibleInspectionArea0 = browseCollectibleInspectionArea0
	
	local GenericMenuFrame0 = CoD.GenericMenuFrame.new( f3_local1, controller )
	GenericMenuFrame0:setLeftRight( true, true, 0, 0 )
	GenericMenuFrame0:setTopBottom( true, true, 0, 0 )
	GenericMenuFrame0.titleLabel:setText( Engine.Localize( LocalizeToUpperString( "CPUI_COLLECTIBLES_CAPS" ) ) )
	GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( LocalizeToUpperString( "CPUI_COLLECTIBLES_CAPS" ) ) )
	GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_collectible" ) )
	self:addElement( GenericMenuFrame0 )
	self.GenericMenuFrame0 = GenericMenuFrame0
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( f3_local1, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics:setTopBottom( true, true, 93, -10 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local basicTabList = CoD.FE_TabBar.new( f3_local1, controller )
	basicTabList:setLeftRight( true, true, 0, 1216 )
	basicTabList:setTopBottom( true, false, 85, 126 )
	basicTabList.Tabs.grid:setDataSource( "PlaceCollectiblesTabs" )
	basicTabList:registerEventHandler( "list_active_changed", function ( element, event )
		local f4_local0 = nil
		SetElementPropertyOnPerControllerTable( controller, "inspectingCollectibleSize", element, "collectibleSize" )
		UpdateElementDataSource( self, "collectibles" )
		SendClientScriptPropertyNotifyForAdjustedClient( controller, element, "collectible_size", "collectibleSize" )
		return f4_local0
	end )
	self:addElement( basicTabList )
	self.basicTabList = basicTabList
	
	local XCamMouseControl = CoD.XCamMouseControl.new( f3_local1, controller )
	XCamMouseControl:setLeftRight( false, false, 0, 379 )
	XCamMouseControl:setTopBottom( true, true, 235, -185 )
	self:addElement( XCamMouseControl )
	self.XCamMouseControl = XCamMouseControl
	
	browseCollectibleInspectionArea0:linkToElementModel( collectibles, nil, false, function ( model )
		browseCollectibleInspectionArea0:setModel( model, controller )
	end )
	self:linkToElementModel( self, "unlocked", true, function ( model )
		local f6_local0 = self
		local f6_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "unlocked"
		}
		CoD.Menu.UpdateButtonShownState( f6_local0, f3_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( f6_local0, f3_local1, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	self:linkToElementModel( self, "audioLog", true, function ( model )
		local f7_local0 = self
		local f7_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "audioLog"
		}
		CoD.Menu.UpdateButtonShownState( f7_local0, f3_local1, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	self:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f8_local0 = nil
		SendClientScriptPropertyNotifyForAdjustedClientTwoParam( controller, element, "collectible_update", "inspecting", "model" )
		return f8_local0
	end )
	self:registerEventHandler( "menu_opened", function ( element, event )
		local f9_local0 = nil
		if TestAndSetFirstTimeMenu( controller, "com_firsttime_collectibles" ) then
			OpenGenericLargePopup( f3_local1, controller, "MENU_FIRSTTIME_COLLECTIBLES", "MENU_FIRSTTIME_COLLECTIBLES2", "com_firsttime_collectibles_image", "MENU_FIRSTTIME_COLLECTIBLES_BUTTONTEXT", "", "" )
		end
		if not f9_local0 then
			f9_local0 = element:dispatchEventToChildren( event )
		end
		return f9_local0
	end )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local f10_local0 = nil
		SendClientScriptMenuChangeNotify( controller, f3_local1, true )
		PrepareOpenMenuInSafehouse( controller )
		SetPerControllerTableProperty( controller, "inspectingMap", nil )
		ShowHeaderIconOnly( f3_local1 )
		SetElementStateByElementName( self, "GenericMenuFrame0", controller, "Update" )
		PlayClipOnElement( self, {
			elementName = "GenericMenuFrame0",
			clipName = "Intro"
		}, controller )
		PlayClip( self, "Intro", controller )
		if not f10_local0 then
			f10_local0 = element:dispatchEventToChildren( event )
		end
		return f10_local0
	end )
	f3_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f11_arg0, f11_arg1, f11_arg2, f11_arg3 )
		SendClientScriptMenuChangeNotify( f11_arg2, f11_arg1, false )
		PrepareCloseMenuInSafehouse( f11_arg2 )
		SetPerControllerTableProperty( f11_arg2, "inspectingCollectibleSize", nil )
		SendOwnMenuResponse( f11_arg1, f11_arg2, "closed" )
		PlaySoundSetSound( self, "menu_go_back" )
		ClearSavedState( self, f11_arg2 )
		Close( self, f11_arg2 )
		return true
	end, function ( f12_arg0, f12_arg1, f12_arg2 )
		CoD.Menu.SetButtonLabel( f12_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	f3_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f13_arg0, f13_arg1, f13_arg2, f13_arg3 )
		if IsPerControllerTablePropertyEnumValue( f13_arg2, "inspectingCollectibleSize", Enum.bunkCollectibleSizes_e.COLLECTIBLE_SIZE_SMALL ) and IsSelfModelValueTrue( f13_arg0, f13_arg2, "unlocked" ) then
			SetElementPropertyOnPerControllerTable( f13_arg2, "placeCollectibleMapName", f13_arg0, "mapName" )
			SetElementModelOnPerControllerTable( f13_arg2, "placeCollectibleName", f13_arg0, "name" )
			NavigateToMenu( self, "PlaceSmallCollectible", true, f13_arg2 )
			return true
		elseif IsPerControllerTablePropertyEnumValue( f13_arg2, "inspectingCollectibleSize", Enum.bunkCollectibleSizes_e.COLLECTIBLE_SIZE_MEDIUM ) and IsSelfModelValueTrue( f13_arg0, f13_arg2, "unlocked" ) then
			SetElementPropertyOnPerControllerTable( f13_arg2, "placeCollectibleMapName", f13_arg0, "mapName" )
			SetElementModelOnPerControllerTable( f13_arg2, "placeCollectibleName", f13_arg0, "name" )
			NavigateToMenu( self, "PlaceMediumCollectible", true, f13_arg2 )
			return true
		elseif IsPerControllerTablePropertyEnumValue( f13_arg2, "inspectingCollectibleSize", Enum.bunkCollectibleSizes_e.COLLECTIBLE_SIZE_LARGE ) and IsSelfModelValueTrue( f13_arg0, f13_arg2, "unlocked" ) then
			SetElementPropertyOnPerControllerTable( f13_arg2, "placeCollectibleMapName", f13_arg0, "mapName" )
			SetElementModelOnPerControllerTable( f13_arg2, "placeCollectibleName", f13_arg0, "name" )
			NavigateToMenu( self, "PlaceLargeCollectible", true, f13_arg2 )
			return true
		else
			
		end
	end, function ( f14_arg0, f14_arg1, f14_arg2 )
		CoD.Menu.SetButtonLabel( f14_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if IsPerControllerTablePropertyEnumValue( f14_arg2, "inspectingCollectibleSize", Enum.bunkCollectibleSizes_e.COLLECTIBLE_SIZE_SMALL ) and IsSelfModelValueTrue( f14_arg0, f14_arg2, "unlocked" ) then
			return true
		elseif IsPerControllerTablePropertyEnumValue( f14_arg2, "inspectingCollectibleSize", Enum.bunkCollectibleSizes_e.COLLECTIBLE_SIZE_MEDIUM ) and IsSelfModelValueTrue( f14_arg0, f14_arg2, "unlocked" ) then
			return true
		elseif IsPerControllerTablePropertyEnumValue( f14_arg2, "inspectingCollectibleSize", Enum.bunkCollectibleSizes_e.COLLECTIBLE_SIZE_LARGE ) and IsSelfModelValueTrue( f14_arg0, f14_arg2, "unlocked" ) then
			return true
		else
			return false
		end
	end, false )
	f3_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "L", function ( f15_arg0, f15_arg1, f15_arg2, f15_arg3 )
		if IsSelfModelValueTrue( f15_arg0, f15_arg2, "unlocked" ) and IsSelfModelValueNonEmptyString( f15_arg0, f15_arg2, "audioLog" ) then
			CallCustomElementFunction_Self( self, "CollectibleAudioLog", f15_arg1, f15_arg0 )
			return true
		else
			
		end
	end, function ( f16_arg0, f16_arg1, f16_arg2 )
		CoD.Menu.SetButtonLabel( f16_arg1, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "COLLECTIBLE_AUDIOLOG" )
		if IsSelfModelValueTrue( f16_arg0, f16_arg2, "unlocked" ) and IsSelfModelValueNonEmptyString( f16_arg0, f16_arg2, "audioLog" ) then
			return true
		else
			return false
		end
	end, false )
	f3_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, nil, function ( f17_arg0, f17_arg1, f17_arg2, f17_arg3 )
		return true
	end, function ( f18_arg0, f18_arg1, f18_arg2 )
		CoD.Menu.SetButtonLabel( f18_arg1, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "PLATFORM_EMBLEM_ROTATE_LAYER" )
		return true
	end, false )
	collectibles.id = "collectibles"
	GenericMenuFrame0:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f3_local1
	} )
	if not self:restoreState() then
		self.collectibles:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.StartMenuCampaignBG:close()
		element.LeftPanel:close()
		element.collectibles:close()
		element.browseCollectibleInspectionArea0:close()
		element.GenericMenuFrame0:close()
		element.FEMenuLeftGraphics:close()
		element.basicTabList:close()
		element.XCamMouseControl:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "BrowseCollectibles.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

