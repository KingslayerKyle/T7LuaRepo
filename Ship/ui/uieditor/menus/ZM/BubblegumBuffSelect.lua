-- 5727a76c89f6ba77645219ade57d1406
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.BubbleGumBuffs.BubbleGumBuffGumShadow" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.MenuSpecificWidgets.Scorestreaks.scorestreakVignetteContainer" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.BubbleGumBuffs.BubblegumBuffSelectFootnote" )
require( "ui.uieditor.widgets.BubbleGumBuffs.BubbleGumGridItemButton" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.Scorestreaks.scorestreaks_TitleBox" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TabBar" )
require( "ui.uieditor.widgets.TabbedWidgets.WeaponGroupsTabWidget" )
require( "ui.uieditor.widgets.PC.Utility.XCamMouseControl" )
require( "ui.uieditor.widgets.Prestige.Prestige_PermanentUnlockTokensWidget" )
require( "ui.uieditor.widgets.BubbleGumBuffs.BubbleGumBuffDescription" )
require( "ui.uieditor.widgets.ZM_LockBig" )

local PreLoadFunc = function ( self, controller )
	CoD.perController[controller].weaponCategory = "bubblegum"
	DataSources.Unlockables.setCurrentFilterItem( "bubblegum" )
	self.restoreState = function ( f2_arg0 )
		if not CoD.PrestigeUtility.isInPermanentUnlockMenu then
			local f2_local0 = Engine.GetBubbleGumBuff( controller, Engine.GetEquippedBubbleGumPack( controller ), CoD.perController[controller].bgbIndex )
			f2_arg0.TabList.Tabs.grid:findItem( nil, {
				filter = Engine.GetItemGroup( f2_local0 )
			}, true, nil )
			f2_arg0.selectionList:findItem( {
				itemIndex = f2_local0
			}, nil, true, nil )
		end
	end
	
end

local PostLoadFunc = function ( f3_arg0, f3_arg1 )
	f3_arg0.weaponCategoryList = f3_arg0.TabList
	local f3_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "UpdateOnStoreClose" )
	f3_arg0:subscribeToModel( f3_local0, function ( model )
		if Engine.GetModelValue( model ) == 0 then
			return 
		else
			CoD.UnlockablesTable = CoD.GetUnlockablesTable( f3_arg1, nil, Enum.eModes.MODE_ZOMBIES )
			f3_arg0.selectionList:updateDataSource()
			f3_arg0.TabList.Tabs.grid:updateDataSource()
			Engine.SetModelValue( model, 0 )
		end
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( f3_arg0, "close", function ( element )
		Engine.UnsubscribeAndFreeModel( f3_local0 )
	end )
end

LUI.createMenu.BubblegumBuffSelect = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "BubblegumBuffSelect" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "BubblegumBuffSelect.buttonPrompts" )
	local f6_local1 = self
	self.anyChildUsesUpdateState = true
	
	local BubbleGumBuffGumShadow = CoD.BubbleGumBuffGumShadow.new( f6_local1, controller )
	BubbleGumBuffGumShadow:setLeftRight( true, false, 819.5, 1121.13 )
	BubbleGumBuffGumShadow:setTopBottom( true, false, 241.41, 544 )
	BubbleGumBuffGumShadow:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsCACItemFromDLC( menu, element, controller ) and IsBGBItemLocked( menu, element, controller )
			end
		},
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return IsBGBItemLocked( menu, element, controller )
			end
		}
	} )
	BubbleGumBuffGumShadow:linkToElementModel( BubbleGumBuffGumShadow, "itemIndex", true, function ( model )
		f6_local1:updateElementState( BubbleGumBuffGumShadow, {
			name = "model_validation",
			menu = f6_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	self:addElement( BubbleGumBuffGumShadow )
	self.BubbleGumBuffGumShadow = BubbleGumBuffGumShadow
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( f6_local1, controller )
	LeftPanel:setLeftRight( true, false, 64, 658 )
	LeftPanel:setTopBottom( true, false, 84, 738 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local scorestreakVignetteContainer = CoD.scorestreakVignetteContainer.new( f6_local1, controller )
	scorestreakVignetteContainer:setLeftRight( true, false, 0, 1280 )
	scorestreakVignetteContainer:setTopBottom( true, false, 0, 720 )
	self:addElement( scorestreakVignetteContainer )
	self.scorestreakVignetteContainer = scorestreakVignetteContainer
	
	local BannerTab = LUI.UIImage.new()
	BannerTab:setLeftRight( true, true, 0, 0 )
	BannerTab:setTopBottom( false, false, -275, -237 )
	BannerTab:setRGB( 0, 0, 0 )
	self:addElement( BannerTab )
	self.BannerTab = BannerTab
	
	local GenericMenuFrame0 = CoD.GenericMenuFrame.new( f6_local1, controller )
	GenericMenuFrame0:setLeftRight( true, true, 0, 0 )
	GenericMenuFrame0:setTopBottom( true, true, 0, 0 )
	GenericMenuFrame0.titleLabel:setText( Engine.Localize( "MENU_BUBBLEGUM_BUFFS_CAPS" ) )
	GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_BUBBLEGUM_BUFFS_CAPS" ) )
	GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_bubblebuffs" ) )
	self:addElement( GenericMenuFrame0 )
	self.GenericMenuFrame0 = GenericMenuFrame0
	
	local BubblegumBuffSelectFootnote = CoD.BubblegumBuffSelectFootnote.new( f6_local1, controller )
	BubblegumBuffSelectFootnote:setLeftRight( false, false, 60, 524 )
	BubblegumBuffSelectFootnote:setTopBottom( false, true, -170, -74 )
	BubblegumBuffSelectFootnote:mergeStateConditions( {
		{
			stateName = "RequiresDLC",
			condition = function ( menu, element, event )
				return IsCACItemFromDLC( menu, element, controller ) and IsBGBItemLocked( menu, element, controller )
			end
		}
	} )
	BubblegumBuffSelectFootnote:linkToElementModel( BubblegumBuffSelectFootnote, "itemIndex", true, function ( model )
		f6_local1:updateElementState( BubblegumBuffSelectFootnote, {
			name = "model_validation",
			menu = f6_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	self:addElement( BubblegumBuffSelectFootnote )
	self.BubblegumBuffSelectFootnote = BubblegumBuffSelectFootnote
	
	local selectionList = LUI.UIList.new( f6_local1, controller, 7, 0, nil, true, false, 0, 0, false, false )
	selectionList:makeFocusable()
	selectionList:setLeftRight( true, false, 77, 645 )
	selectionList:setTopBottom( true, false, 152, 605 )
	selectionList:setWidgetType( CoD.BubbleGumGridItemButton )
	selectionList:setHorizontalCount( 5 )
	selectionList:setVerticalCount( 4 )
	selectionList:setSpacing( 7 )
	selectionList:setVerticalCounter( CoD.verticalCounter )
	selectionList:setDataSource( "Unlockables" )
	selectionList:linkToElementModel( selectionList, "itemIndex", true, function ( model )
		local f12_local0 = selectionList
		local f12_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		}
		CoD.Menu.UpdateButtonShownState( f12_local0, f6_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( f12_local0, f6_local1, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	selectionList:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNetworkMode" ), function ( model )
		local f13_local0 = selectionList
		local f13_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNetworkMode"
		}
		CoD.Menu.UpdateButtonShownState( f13_local0, f6_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( f13_local0, f6_local1, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	selectionList:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		local f14_local0 = selectionList
		local f14_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		}
		CoD.Menu.UpdateButtonShownState( f14_local0, f6_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( f14_local0, f6_local1, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	selectionList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f15_local0 = nil
		if IsCACItemNew( element, controller ) and not IsBGBItemLocked( f6_local1, element, controller ) then
			SetCACWeaponAsOld( self, element, controller )
			UpdateSelfElementState( f6_local1, element, controller )
			ShowBubblegumBuffModel( self, element, controller )
		else
			ShowBubblegumBuffModel( self, element, controller )
		end
		return f15_local0
	end )
	selectionList:registerEventHandler( "used_permanent_unlock_token", function ( element, event )
		local f16_local0 = nil
		ShowBubblegumBuffModel( self, element, controller )
		if not f16_local0 then
			f16_local0 = element:dispatchEventToChildren( event )
		end
		return f16_local0
	end )
	selectionList:registerEventHandler( "gain_focus", function ( element, event )
		local f17_local0 = nil
		if element.gainFocus then
			f17_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f17_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f6_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, f6_local1, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		return f17_local0
	end )
	selectionList:registerEventHandler( "lose_focus", function ( element, event )
		local f18_local0 = nil
		if element.loseFocus then
			f18_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f18_local0 = element.super:loseFocus( event )
		end
		return f18_local0
	end )
	f6_local1:AddButtonCallbackFunction( selectionList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f19_arg0, f19_arg1, f19_arg2, f19_arg3 )
		if not IsInPermanentUnlockMenu( f19_arg2 ) and not IsBGBItemLocked( f19_arg1, f19_arg0, f19_arg2 ) then
			EquipBubblegumBuff( self, f19_arg0, f19_arg2 )
			ClearMenuSavedState( f19_arg1 )
			SendClientScriptMenuChangeNotify( f19_arg2, f19_arg1, false )
			GoBack( self, f19_arg2 )
			return true
		elseif not IsInPermanentUnlockMenu( f19_arg2 ) and IsCACItemFromDLC( f19_arg1, f19_arg0, f19_arg2 ) and IsBGBItemLocked( f19_arg1, f19_arg0, f19_arg2 ) and IsLive() then
			OpenPurchaseMapPackConfirmation( f19_arg2, f19_arg0, "BubbleGumDLCStore", f19_arg1 )
			return true
		elseif IsInPermanentUnlockMenu( f19_arg2 ) and not IsPermanentlyUnlocked( f19_arg0, f19_arg2 ) and HavePermanentUnlockTokens( f19_arg2 ) then
			OpenPermanentUnlockClassItemDialog( f19_arg1, f19_arg0, f19_arg2 )
			return true
		else
			
		end
	end, function ( f20_arg0, f20_arg1, f20_arg2 )
		CoD.Menu.SetButtonLabel( f20_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if not IsInPermanentUnlockMenu( f20_arg2 ) and not IsBGBItemLocked( f20_arg1, f20_arg0, f20_arg2 ) then
			return true
		elseif not IsInPermanentUnlockMenu( f20_arg2 ) and IsCACItemFromDLC( f20_arg1, f20_arg0, f20_arg2 ) and IsBGBItemLocked( f20_arg1, f20_arg0, f20_arg2 ) and IsLive() then
			return true
		elseif IsInPermanentUnlockMenu( f20_arg2 ) and not IsPermanentlyUnlocked( f20_arg0, f20_arg2 ) and HavePermanentUnlockTokens( f20_arg2 ) then
			return true
		else
			return false
		end
	end, true )
	f6_local1:AddButtonCallbackFunction( selectionList, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "N", function ( f21_arg0, f21_arg1, f21_arg2, f21_arg3 )
		if IsCACItemFromDLC( f21_arg1, f21_arg0, f21_arg2 ) and IsBGBItemLocked( f21_arg1, f21_arg0, f21_arg2 ) and IsLive() then
			OpenDLCStore( self, f21_arg0, f21_arg2, "BubbleGumDLCStore", f21_arg1 )
			return true
		else
			
		end
	end, function ( f22_arg0, f22_arg1, f22_arg2 )
		if IsCACItemFromDLC( f22_arg1, f22_arg0, f22_arg2 ) and IsBGBItemLocked( f22_arg1, f22_arg0, f22_arg2 ) and IsLive() then
			CoD.Menu.SetButtonLabel( f22_arg1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_GO_TO_STORE" )
			return true
		else
			return false
		end
	end, false )
	self:addElement( selectionList )
	self.selectionList = selectionList
	
	local scorestreaksTitleBox = CoD.scorestreaks_TitleBox.new( f6_local1, controller )
	scorestreaksTitleBox:setLeftRight( true, false, 700, 951 )
	scorestreaksTitleBox:setTopBottom( true, false, 152, 187 )
	self:addElement( scorestreaksTitleBox )
	self.scorestreaksTitleBox = scorestreaksTitleBox
	
	local TabList = CoD.FE_TabBar.new( f6_local1, controller )
	TabList:setLeftRight( true, false, 0, 2496 )
	TabList:setTopBottom( true, false, 84, 123 )
	TabList.Tabs.grid:setWidgetType( CoD.WeaponGroupsTabWidget )
	TabList.Tabs.grid:setDataSource( "BubbleGumTabType" )
	TabList:registerEventHandler( "list_active_changed", function ( element, event )
		local f23_local0 = nil
		BubbleGumBuffSelectTabChanged( self, element, controller )
		return f23_local0
	end )
	self:addElement( TabList )
	self.TabList = TabList
	
	local LineSide0 = LUI.UIImage.new()
	LineSide0:setLeftRight( true, false, 51, 53 )
	LineSide0:setTopBottom( true, false, 76, 675 )
	LineSide0:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide0 )
	self.LineSide0 = LineSide0
	
	local LineDot = LUI.UIImage.new()
	LineDot:setLeftRight( true, false, 30, 58 )
	LineDot:setTopBottom( true, false, 607, 611 )
	LineDot:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	LineDot:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineDot )
	self.LineDot = LineDot
	
	local LineDot0 = LUI.UIImage.new()
	LineDot0:setLeftRight( true, false, 30, 58 )
	LineDot0:setTopBottom( true, false, 147, 151 )
	LineDot0:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	LineDot0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineDot0 )
	self.LineDot0 = LineDot0
	
	local XCamMouseControl = CoD.XCamMouseControl.new( f6_local1, controller )
	XCamMouseControl:setLeftRight( false, true, -470.5, -64 )
	XCamMouseControl:setTopBottom( true, true, 259, -180 )
	self:addElement( XCamMouseControl )
	self.XCamMouseControl = XCamMouseControl
	
	local PermanentUnlockTokensWidget = CoD.Prestige_PermanentUnlockTokensWidget.new( f6_local1, controller )
	PermanentUnlockTokensWidget:setLeftRight( false, true, -362, -81 )
	PermanentUnlockTokensWidget:setTopBottom( true, false, 39, 84 )
	PermanentUnlockTokensWidget:setAlpha( ShowIfInPermanentUnlockMenu( 0 ) )
	PermanentUnlockTokensWidget.tokenLabel:setTTF( "fonts/escom.ttf" )
	self:addElement( PermanentUnlockTokensWidget )
	self.PermanentUnlockTokensWidget = PermanentUnlockTokensWidget
	
	local BubbleGumBuffDescription = CoD.BubbleGumBuffDescription.new( f6_local1, controller )
	BubbleGumBuffDescription:setLeftRight( true, false, 700, 1020.31 )
	BubbleGumBuffDescription:setTopBottom( true, false, 196.55, 215.55 )
	self:addElement( BubbleGumBuffDescription )
	self.BubbleGumBuffDescription = BubbleGumBuffDescription
	
	local ZMLockBig = CoD.ZM_LockBig.new( f6_local1, controller )
	ZMLockBig:setLeftRight( true, false, 917.31, 1013.31 )
	ZMLockBig:setTopBottom( true, false, 126.63, 654.38 )
	ZMLockBig:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsCACItemFromDLC( menu, element, controller ) and IsBGBItemLocked( menu, element, controller )
			end
		}
	} )
	ZMLockBig:linkToElementModel( ZMLockBig, "itemIndex", true, function ( model )
		f6_local1:updateElementState( ZMLockBig, {
			name = "model_validation",
			menu = f6_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	self:addElement( ZMLockBig )
	self.ZMLockBig = ZMLockBig
	
	BubbleGumBuffGumShadow:linkToElementModel( selectionList, nil, false, function ( model )
		BubbleGumBuffGumShadow:setModel( model, controller )
	end )
	BubblegumBuffSelectFootnote:linkToElementModel( selectionList, nil, false, function ( model )
		BubblegumBuffSelectFootnote:setModel( model, controller )
	end )
	scorestreaksTitleBox:linkToElementModel( selectionList, nil, false, function ( model )
		scorestreaksTitleBox:setModel( model, controller )
	end )
	scorestreaksTitleBox:linkToElementModel( selectionList, "itemIndex", true, function ( model )
		local itemIndex = Engine.GetModelValue( model )
		if itemIndex then
			scorestreaksTitleBox.ScorestreaksLabel:setText( Engine.Localize( GetItemNameFromIndexZM( itemIndex ) ) )
		end
	end )
	BubbleGumBuffDescription:linkToElementModel( selectionList, nil, false, function ( model )
		BubbleGumBuffDescription:setModel( model, controller )
	end )
	ZMLockBig:linkToElementModel( selectionList, nil, false, function ( model )
		ZMLockBig:setModel( model, controller )
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self:registerEventHandler( "menu_opened", function ( element, event )
		local f33_local0 = nil
		SendClientScriptMenuChangeNotify( controller, f6_local1, true )
		SetGlobalModelValueTrue( "inBubblegumBuffSelectMenu" )
		if not f33_local0 then
			f33_local0 = element:dispatchEventToChildren( event )
		end
		return f33_local0
	end )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local f34_local0 = nil
		if IsInPermanentUnlockMenu( controller ) then
			ShowHeaderKickerAndIcon( f6_local1 )
			SendClientScriptMenuChangeNotify( controller, f6_local1, true )
			SetElementStateByElementName( self, "GenericMenuFrame0", controller, "Update" )
			PlayClipOnElement( self, {
				elementName = "GenericMenuFrame0",
				clipName = "intro"
			}, controller )
			PlayClip( self, "into", controller )
		else
			ShowHeaderIconOnly( f6_local1 )
			SetElementStateByElementName( self, "GenericMenuFrame0", controller, "Update" )
			PlayClipOnElement( self, {
				elementName = "GenericMenuFrame0",
				clipName = "intro"
			}, controller )
			PlayClip( self, "into", controller )
		end
		if not f34_local0 then
			f34_local0 = element:dispatchEventToChildren( event )
		end
		return f34_local0
	end )
	self:registerEventHandler( "used_permanent_unlock_token", function ( element, event )
		local f35_local0 = nil
		UpdateAllMenuButtonPrompts( f6_local1, controller )
		if not f35_local0 then
			f35_local0 = element:dispatchEventToChildren( event )
		end
		return f35_local0
	end )
	f6_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f36_arg0, f36_arg1, f36_arg2, f36_arg3 )
		GoBack( self, f36_arg2 )
		PlaySoundSetSound( self, "menu_no_selection" )
		SendClientScriptMenuChangeNotify( f36_arg2, f36_arg1, false )
		return true
	end, function ( f37_arg0, f37_arg1, f37_arg2 )
		CoD.Menu.SetButtonLabel( f37_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, true )
	f6_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, nil, function ( f38_arg0, f38_arg1, f38_arg2, f38_arg3 )
		if CACShowRotatePrompt( self, f38_arg0, f38_arg2 ) then
			return true
		else
			
		end
	end, function ( f39_arg0, f39_arg1, f39_arg2 )
		if CACShowRotatePrompt( self, f39_arg0, f39_arg2 ) then
			CoD.Menu.SetButtonLabel( f39_arg1, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "PLATFORM_EMBLEM_ROTATE_LAYER" )
			return true
		else
			return false
		end
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		SetGlobalModelValueFalse( "inBubblegumBuffSelectMenu" )
	end )
	GenericMenuFrame0:setModel( self.buttonModel, controller )
	selectionList.id = "selectionList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f6_local1
	} )
	if not self:restoreState() then
		self.selectionList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BubbleGumBuffGumShadow:close()
		element.LeftPanel:close()
		element.scorestreakVignetteContainer:close()
		element.GenericMenuFrame0:close()
		element.BubblegumBuffSelectFootnote:close()
		element.selectionList:close()
		element.scorestreaksTitleBox:close()
		element.TabList:close()
		element.XCamMouseControl:close()
		element.PermanentUnlockTokensWidget:close()
		element.BubbleGumBuffDescription:close()
		element.ZMLockBig:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "BubblegumBuffSelect.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

