require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.MenuSpecificWidgets.Scorestreaks.scorestreakVignetteContainer" )
require( "ui.uieditor.widgets.CAC.GridItemButtonNew" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Scorestreaks.scorestreaks_TitleBox" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TabBar" )
require( "ui.uieditor.widgets.TabbedWidgets.WeaponGroupsTabWidget" )
require( "ui.uieditor.widgets.BubbleGumBuffs.BubblegumBuffSelectFootnote" )
require( "ui.uieditor.widgets.PC.Utility.XCamMouseControl" )
require( "ui.uieditor.widgets.Prestige.Prestige_PermanentUnlockTokensWidget" )
require( "ui.uieditor.widgets.CAC.cac_LockBig" )

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
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	LeftPanel:setLeftRight( true, false, 64, 658 )
	LeftPanel:setTopBottom( true, false, 84, 738 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local scorestreakVignetteContainer = CoD.scorestreakVignetteContainer.new( self, controller )
	scorestreakVignetteContainer:setLeftRight( true, false, 0, 1280 )
	scorestreakVignetteContainer:setTopBottom( true, false, 0, 720 )
	self:addElement( scorestreakVignetteContainer )
	self.scorestreakVignetteContainer = scorestreakVignetteContainer
	
	local selectionList = LUI.UIList.new( self, controller, 7, 0, nil, true, false, 0, 0, false, false )
	selectionList:makeFocusable()
	selectionList:setLeftRight( true, false, 77, 645 )
	selectionList:setTopBottom( true, false, 152, 605 )
	selectionList:setDataSource( "Unlockables" )
	selectionList:setWidgetType( CoD.GridItemButtonNew )
	selectionList:setHorizontalCount( 5 )
	selectionList:setVerticalCount( 4 )
	selectionList:setSpacing( 7 )
	selectionList:setVerticalCounter( CoD.verticalCounter )
	selectionList:linkToElementModel( selectionList, "itemIndex", true, function ( model )
		local f5_local0 = selectionList
		local f5_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		}
		CoD.Menu.UpdateButtonShownState( f5_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	selectionList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f6_local0 = nil
		if IsCACItemNew( element, controller ) then
			SetCACWeaponAsOld( self, element, controller )
			UpdateSelfElementState( self, element, controller )
			ShowBubblegumBuffModel( self, element, controller )
		else
			ShowBubblegumBuffModel( self, element, controller )
		end
		return f6_local0
	end )
	selectionList:registerEventHandler( "used_permanent_unlock_token", function ( element, event )
		local f7_local0 = nil
		ShowBubblegumBuffModel( self, element, controller )
		if not f7_local0 then
			f7_local0 = element:dispatchEventToChildren( event )
		end
		return f7_local0
	end )
	selectionList:registerEventHandler( "gain_focus", function ( element, event )
		local f8_local0 = nil
		if element.gainFocus then
			f8_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f8_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f8_local0
	end )
	selectionList:registerEventHandler( "lose_focus", function ( element, event )
		local f9_local0 = nil
		if element.loseFocus then
			f9_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f9_local0 = element.super:loseFocus( event )
		end
		return f9_local0
	end )
	self:AddButtonCallbackFunction( selectionList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsInPermanentUnlockMenu( controller ) and not IsCACItemLocked( menu, element, controller ) then
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
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if not IsInPermanentUnlockMenu( controller ) and not IsCACItemLocked( menu, element, controller ) then
			return true
		elseif IsInPermanentUnlockMenu( controller ) and not IsPermanentlyUnlocked( element, controller ) and HavePermanentUnlockTokens( controller ) then
			return true
		else
			return false
		end
	end, true )
	self:addElement( selectionList )
	self.selectionList = selectionList
	
	local BannerTab = LUI.UIImage.new()
	BannerTab:setLeftRight( true, true, 0, 0 )
	BannerTab:setTopBottom( false, false, -275, -237 )
	BannerTab:setRGB( 0, 0, 0 )
	self:addElement( BannerTab )
	self.BannerTab = BannerTab
	
	local GenericMenuFrame0 = CoD.GenericMenuFrame.new( self, controller )
	GenericMenuFrame0:setLeftRight( true, true, 0, 0 )
	GenericMenuFrame0:setTopBottom( true, true, 0, 0 )
	GenericMenuFrame0.titleLabel:setText( Engine.Localize( "MENU_BUBBLEGUM_BUFFS_CAPS" ) )
	GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_BUBBLEGUM_BUFFS_CAPS" ) )
	GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_bubblebuffs" ) )
	self:addElement( GenericMenuFrame0 )
	self.GenericMenuFrame0 = GenericMenuFrame0
	
	local scorestreaksTitleBox = CoD.scorestreaks_TitleBox.new( self, controller )
	scorestreaksTitleBox:setLeftRight( true, false, 700, 951 )
	scorestreaksTitleBox:setTopBottom( true, false, 152, 187 )
	self:addElement( scorestreaksTitleBox )
	self.scorestreaksTitleBox = scorestreaksTitleBox
	
	local TabList = CoD.FE_TabBar.new( self, controller )
	TabList:setLeftRight( true, false, 0, 2496 )
	TabList:setTopBottom( true, false, 84, 123 )
	TabList.Tabs.grid:setDataSource( "BubbleGumTabType" )
	TabList.Tabs.grid:setWidgetType( CoD.WeaponGroupsTabWidget )
	TabList:registerEventHandler( "list_active_changed", function ( element, event )
		local f12_local0 = nil
		BubbleGumBuffSelectTabChanged( self, element, controller )
		return f12_local0
	end )
	self:addElement( TabList )
	self.TabList = TabList
	
	local highlightedDescription = LUI.UIText.new()
	highlightedDescription:setLeftRight( false, false, 60, 380.31 )
	highlightedDescription:setTopBottom( false, false, -163.45, -144.45 )
	highlightedDescription:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	highlightedDescription:setLineSpacing( 0.5 )
	highlightedDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	highlightedDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( highlightedDescription )
	self.highlightedDescription = highlightedDescription
	
	local BubblegumBuffSelectFootnote = CoD.BubblegumBuffSelectFootnote.new( self, controller )
	BubblegumBuffSelectFootnote:setLeftRight( false, false, 56, 520 )
	BubblegumBuffSelectFootnote:setTopBottom( false, true, -170, -74 )
	self:addElement( BubblegumBuffSelectFootnote )
	self.BubblegumBuffSelectFootnote = BubblegumBuffSelectFootnote
	
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
	
	local XCamMouseControl = CoD.XCamMouseControl.new( self, controller )
	XCamMouseControl:setLeftRight( false, true, -470.5, -64 )
	XCamMouseControl:setTopBottom( true, true, 256, -183 )
	self:addElement( XCamMouseControl )
	self.XCamMouseControl = XCamMouseControl
	
	local PermanentUnlockTokensWidget = CoD.Prestige_PermanentUnlockTokensWidget.new( self, controller )
	PermanentUnlockTokensWidget:setLeftRight( false, true, -362, -81 )
	PermanentUnlockTokensWidget:setTopBottom( true, false, 39, 84 )
	PermanentUnlockTokensWidget:setAlpha( ShowIfInPermanentUnlockMenu( 0 ) )
	PermanentUnlockTokensWidget.tokenLabel:setTTF( "fonts/escom.ttf" )
	self:addElement( PermanentUnlockTokensWidget )
	self.PermanentUnlockTokensWidget = PermanentUnlockTokensWidget
	
	local lockedIcon = CoD.cac_LockBig.new( self, controller )
	lockedIcon:setLeftRight( true, false, 903, 999 )
	lockedIcon:setTopBottom( true, false, 123, 646 )
	self:addElement( lockedIcon )
	self.lockedIcon = lockedIcon
	
	scorestreaksTitleBox:linkToElementModel( selectionList, nil, false, function ( model )
		scorestreaksTitleBox:setModel( model, controller )
	end )
	scorestreaksTitleBox:linkToElementModel( selectionList, "itemIndex", true, function ( model )
		local itemIndex = Engine.GetModelValue( model )
		if itemIndex then
			scorestreaksTitleBox.ScorestreaksLabel:setText( Engine.Localize( GetItemNameFromIndexZM( itemIndex ) ) )
		end
	end )
	highlightedDescription:linkToElementModel( selectionList, "itemIndex", true, function ( model )
		local itemIndex = Engine.GetModelValue( model )
		if itemIndex then
			highlightedDescription:setText( Engine.Localize( GetUnlockDescription( controller, itemIndex ) ) )
		end
	end )
	BubblegumBuffSelectFootnote:linkToElementModel( selectionList, nil, false, function ( model )
		BubblegumBuffSelectFootnote:setModel( model, controller )
	end )
	lockedIcon:linkToElementModel( selectionList, nil, false, function ( model )
		lockedIcon:setModel( model, controller )
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self:registerEventHandler( "menu_opened", function ( self, event )
		local f19_local0 = nil
		SendClientScriptMenuChangeNotify( controller, self, true )
		SetGlobalModelValueTrue( "inBubblegumBuffSelectMenu" )
		if not f19_local0 then
			f19_local0 = self:dispatchEventToChildren( event )
		end
		return f19_local0
	end )
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f20_local0 = nil
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
		if not f20_local0 then
			f20_local0 = self:dispatchEventToChildren( event )
		end
		return f20_local0
	end )
	self:registerEventHandler( "used_permanent_unlock_token", function ( self, event )
		local f21_local0 = nil
		UpdateAllMenuButtonPrompts( self, controller )
		if not f21_local0 then
			f21_local0 = self:dispatchEventToChildren( event )
		end
		return f21_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		PlaySoundSetSound( self, "menu_no_selection" )
		SendClientScriptMenuChangeNotify( controller, menu, false )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, true )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, nil, function ( element, menu, controller, model )
		if CACShowRotatePrompt( self, element, controller ) then
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "PLATFORM_EMBLEM_ROTATE_LAYER" )
		if CACShowRotatePrompt( self, element, controller ) then
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LeftPanel:close()
		element.scorestreakVignetteContainer:close()
		element.selectionList:close()
		element.GenericMenuFrame0:close()
		element.scorestreaksTitleBox:close()
		element.TabList:close()
		element.BubblegumBuffSelectFootnote:close()
		element.XCamMouseControl:close()
		element.PermanentUnlockTokensWidget:close()
		element.lockedIcon:close()
		element.highlightedDescription:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "BubblegumBuffSelect.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

