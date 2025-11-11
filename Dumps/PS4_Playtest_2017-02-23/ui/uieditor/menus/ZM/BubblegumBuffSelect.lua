require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.BubbleGumBuffs.BubbleGumBuffDescription" )
require( "ui.uieditor.widgets.BubbleGumBuffs.BubblegumBuffSelectFootnote" )
require( "ui.uieditor.widgets.BubbleGumBuffs.BubbleGumGridItemButton" )
require( "ui.uieditor.widgets.CAC.cac_LockBig" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TabBar" )
require( "ui.uieditor.widgets.MenuSpecificWidgets.Scorestreaks.scorestreakVignetteContainer" )
require( "ui.uieditor.widgets.PC.Utility.XCamMouseControl" )
require( "ui.uieditor.widgets.Prestige.Prestige_PermanentUnlockTokensWidget" )
require( "ui.uieditor.widgets.Scorestreaks.scorestreaks_TitleBox" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.TabbedWidgets.WeaponGroupsTabWidget" )

local PreLoadFunc = function ( self, controller )
	CoD.perController[controller].weaponCategory = "bubblegum"
	DataSources.Unlockables.setCurrentFilterItem( "bubblegum" )
	self.restoreState = function ( self )
		if not CoD.PrestigeUtility.isInPermanentUnlockMenu then
			local bgbPackIndex = Engine.GetEquippedBubbleGumPack( controller )
			local bgbIndex = CoD.perController[controller].bgbIndex
			local itemIndex = Engine.GetBubbleGumBuff( controller, bgbPackIndex, bgbIndex )
			local itemGroup = Engine.GetItemGroup( itemIndex )
			self.TabList.Tabs.grid:findItem( nil, {
				filter = itemGroup
			}, true, nil )
			self.selectionList:findItem( {
				itemIndex = itemIndex
			}, nil, true, nil )
		end
	end
	
end

local PostLoadFunc = function ( self, controller )
	self.weaponCategoryList = self.TabList
	local updateOnStoreCloseModel = Engine.CreateModel( Engine.GetGlobalModel(), "UpdateOnStoreClose" )
	self:subscribeToModel( updateOnStoreCloseModel, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue == 0 then
			return 
		else
			self.selectionList:updateDataSource()
			Engine.SetModelValue( model, 0 )
		end
	end )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		if LUI.DEV then
			local modelsAreDifferent = LUI.DEV.ErrorIfModelsDoNotMatch( updateOnStoreCloseModel, Engine.CreateModel( Engine.GetGlobalModel(), "UpdateOnStoreClose" ) )
		end
		Engine.UnsubscribeAndFreeModel( updateOnStoreCloseModel )
	end )
end

LUI.createMenu.BubblegumBuffSelect = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "BubblegumBuffSelect" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "BubblegumBuffSelect.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	LeftPanel:setLeftRight( 0, 0, 96, 987 )
	LeftPanel:setTopBottom( 0, 0, 126, 1107 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local scorestreakVignetteContainer = CoD.scorestreakVignetteContainer.new( self, controller )
	scorestreakVignetteContainer:setLeftRight( 0, 0, 0, 1920 )
	scorestreakVignetteContainer:setTopBottom( 0, 0, 0, 1080 )
	self:addElement( scorestreakVignetteContainer )
	self.scorestreakVignetteContainer = scorestreakVignetteContainer
	
	local selectionList = LUI.UIList.new( self, controller, 10, 0, nil, true, false, 0, 0, false, false )
	selectionList:makeFocusable()
	selectionList:setLeftRight( 0, 0, 117, 967 )
	selectionList:setTopBottom( 0, 0, 229, 907 )
	selectionList:setWidgetType( CoD.BubbleGumGridItemButton )
	selectionList:setHorizontalCount( 5 )
	selectionList:setVerticalCount( 4 )
	selectionList:setSpacing( 10 )
	selectionList:setVerticalCounter( CoD.verticalCounter )
	selectionList:setDataSource( "Unlockables" )
	selectionList:linkToElementModel( selectionList, "itemIndex", true, function ( model )
		local element = selectionList
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	selectionList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		if IsCACItemNew( element, controller ) then
			SetCACWeaponAsOld( self, element, controller )
			UpdateSelfElementState( self, element, controller )
			ShowBubblegumBuffModel( self, element, controller )
		else
			ShowBubblegumBuffModel( self, element, controller )
		end
		return retVal
	end )
	selectionList:registerEventHandler( "used_permanent_unlock_token", function ( element, event )
		local retVal = nil
		ShowBubblegumBuffModel( self, element, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	selectionList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		return retVal
	end )
	selectionList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( selectionList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsInPermanentUnlockMenu( controller ) and not IsBGBItemLocked( menu, element, controller ) then
			EquipBubblegumBuff( self, element, controller )
			ClearMenuSavedState( menu )
			SendClientScriptMenuChangeNotify( controller, menu, false )
			GoBack( self, controller )
			return true
		elseif IsInPermanentUnlockMenu( controller ) and not IsPermanentlyUnlocked( element, controller ) and HavePermanentUnlockTokens( controller ) then
			OpenPermanentUnlockClassItemDialog( menu, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		if not IsInPermanentUnlockMenu( controller ) and not IsBGBItemLocked( menu, element, controller ) then
			return true
		elseif IsInPermanentUnlockMenu( controller ) and not IsPermanentlyUnlocked( element, controller ) and HavePermanentUnlockTokens( controller ) then
			return true
		else
			return false
		end
	end, true )
	self:AddButtonCallbackFunction( selectionList, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "N", function ( element, menu, controller, model )
		if IsCACItemFromDLC( menu, element, controller ) and not IsCACItemDLCPurchased( menu, element, controller ) then
			OpenStore( self, element, controller, "StoreButton", menu )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsCACItemFromDLC( menu, element, controller ) and not IsCACItemDLCPurchased( menu, element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_GO_TO_STORE", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( selectionList )
	self.selectionList = selectionList
	
	local BannerTab = LUI.UIImage.new()
	BannerTab:setLeftRight( 0, 1, 0, 0 )
	BannerTab:setTopBottom( 0.5, 0.5, -413, -356 )
	BannerTab:setRGB( 0, 0, 0 )
	self:addElement( BannerTab )
	self.BannerTab = BannerTab
	
	local GenericMenuFrame0 = CoD.GenericMenuFrame.new( self, controller )
	GenericMenuFrame0:setLeftRight( 0, 1, 0, 0 )
	GenericMenuFrame0:setTopBottom( 0, 1, 0, 0 )
	GenericMenuFrame0.titleLabel:setText( Engine.Localize( "MENU_BUBBLEGUM_BUFFS_CAPS" ) )
	GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_BUBBLEGUM_BUFFS_CAPS" ) )
	GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_bubblebuffs" ) )
	self:addElement( GenericMenuFrame0 )
	self.GenericMenuFrame0 = GenericMenuFrame0
	
	local scorestreaksTitleBox = CoD.scorestreaks_TitleBox.new( self, controller )
	scorestreaksTitleBox:setLeftRight( 0, 0, 1050, 1426 )
	scorestreaksTitleBox:setTopBottom( 0, 0, 228, 280 )
	self:addElement( scorestreaksTitleBox )
	self.scorestreaksTitleBox = scorestreaksTitleBox
	
	local TabList = CoD.FE_TabBar.new( self, controller )
	TabList:setLeftRight( 0, 0, 0, 3744 )
	TabList:setTopBottom( 0, 0, 126, 184 )
	TabList.Tabs.grid:setWidgetType( CoD.WeaponGroupsTabWidget )
	TabList.Tabs.grid:setDataSource( "BubbleGumTabType" )
	TabList:registerEventHandler( "list_active_changed", function ( element, event )
		local retVal = nil
		BubbleGumBuffSelectTabChanged( self, element, controller )
		return retVal
	end )
	self:addElement( TabList )
	self.TabList = TabList
	
	local BubblegumBuffSelectFootnote = CoD.BubblegumBuffSelectFootnote.new( self, controller )
	BubblegumBuffSelectFootnote:setLeftRight( 0.5, 0.5, 84, 780 )
	BubblegumBuffSelectFootnote:setTopBottom( 1, 1, -255, -111 )
	self:addElement( BubblegumBuffSelectFootnote )
	self.BubblegumBuffSelectFootnote = BubblegumBuffSelectFootnote
	
	local LineSide0 = LUI.UIImage.new()
	LineSide0:setLeftRight( 0, 0, 76, 79 )
	LineSide0:setTopBottom( 0, 0, 114, 1012 )
	LineSide0:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide0 )
	self.LineSide0 = LineSide0
	
	local LineDot = LUI.UIImage.new()
	LineDot:setLeftRight( 0, 0, 45, 87 )
	LineDot:setTopBottom( 0, 0, 911, 917 )
	LineDot:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	LineDot:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineDot )
	self.LineDot = LineDot
	
	local LineDot0 = LUI.UIImage.new()
	LineDot0:setLeftRight( 0, 0, 45, 87 )
	LineDot0:setTopBottom( 0, 0, 221, 227 )
	LineDot0:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	LineDot0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineDot0 )
	self.LineDot0 = LineDot0
	
	local XCamMouseControl = CoD.XCamMouseControl.new( self, controller )
	XCamMouseControl:setLeftRight( 1, 1, -706, -96 )
	XCamMouseControl:setTopBottom( 0, 1, 388, -270 )
	self:addElement( XCamMouseControl )
	self.XCamMouseControl = XCamMouseControl
	
	local PermanentUnlockTokensWidget = CoD.Prestige_PermanentUnlockTokensWidget.new( self, controller )
	PermanentUnlockTokensWidget:setLeftRight( 1, 1, -543, -121 )
	PermanentUnlockTokensWidget:setTopBottom( 0, 0, 58, 126 )
	PermanentUnlockTokensWidget:setAlpha( ShowIfInPermanentUnlockMenu( 0 ) )
	PermanentUnlockTokensWidget.tokenLabel:setTTF( "fonts/escom.ttf" )
	self:addElement( PermanentUnlockTokensWidget )
	self.PermanentUnlockTokensWidget = PermanentUnlockTokensWidget
	
	local lockedIcon = CoD.cac_LockBig.new( self, controller )
	lockedIcon:setLeftRight( 0, 0, 1354, 1498 )
	lockedIcon:setTopBottom( 0, 0, 185, 969 )
	self:addElement( lockedIcon )
	self.lockedIcon = lockedIcon
	
	local BubbleGumBuffDescription = CoD.BubbleGumBuffDescription.new( self, controller )
	BubbleGumBuffDescription:setLeftRight( 0, 0, 1050, 1530 )
	BubbleGumBuffDescription:setTopBottom( 0, 0, 295, 323 )
	self:addElement( BubbleGumBuffDescription )
	self.BubbleGumBuffDescription = BubbleGumBuffDescription
	
	scorestreaksTitleBox:linkToElementModel( selectionList, nil, false, function ( model )
		scorestreaksTitleBox:setModel( model, controller )
	end )
	scorestreaksTitleBox:linkToElementModel( selectionList, "itemIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			scorestreaksTitleBox.ScorestreaksLabel:setText( Engine.Localize( GetItemNameFromIndexZM( modelValue ) ) )
		end
	end )
	BubblegumBuffSelectFootnote:linkToElementModel( selectionList, nil, false, function ( model )
		BubblegumBuffSelectFootnote:setModel( model, controller )
	end )
	lockedIcon:linkToElementModel( selectionList, nil, false, function ( model )
		lockedIcon:setModel( model, controller )
	end )
	BubbleGumBuffDescription:linkToElementModel( selectionList, nil, false, function ( model )
		BubbleGumBuffDescription:setModel( model, controller )
	end )
	self:registerEventHandler( "menu_opened", function ( element, event )
		local retVal = nil
		SendClientScriptMenuChangeNotify( controller, self, true )
		SetGlobalModelValueTrue( "inBubblegumBuffSelectMenu" )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		if IsInPermanentUnlockMenu( controller ) then
			ShowHeaderKickerAndIcon( self )
			SendClientScriptMenuChangeNotify( controller, self, true )
			SetElementStateByElementName( self, "GenericMenuFrame0", controller, "Update" )
			PlayClipOnElement( self, {
				elementName = "GenericMenuFrame0",
				clipName = "intro"
			}, controller )
			PlayClip( self, "into", controller )
		else
			ShowHeaderIconOnly( self )
			SetElementStateByElementName( self, "GenericMenuFrame0", controller, "Update" )
			PlayClipOnElement( self, {
				elementName = "GenericMenuFrame0",
				clipName = "intro"
			}, controller )
			PlayClip( self, "into", controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:registerEventHandler( "used_permanent_unlock_token", function ( element, event )
		local retVal = nil
		UpdateAllMenuButtonPrompts( self, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		PlaySoundSetSound( self, "menu_no_selection" )
		SendClientScriptMenuChangeNotify( controller, menu, false )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
		return true
	end, true )
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
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		SetGlobalModelValueFalse( "inBubblegumBuffSelectMenu" )
	end )
	selectionList.id = "selectionList"
	GenericMenuFrame0:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.selectionList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.LeftPanel:close()
		self.scorestreakVignetteContainer:close()
		self.selectionList:close()
		self.GenericMenuFrame0:close()
		self.scorestreaksTitleBox:close()
		self.TabList:close()
		self.BubblegumBuffSelectFootnote:close()
		self.XCamMouseControl:close()
		self.PermanentUnlockTokensWidget:close()
		self.lockedIcon:close()
		self.BubbleGumBuffDescription:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "BubblegumBuffSelect.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

