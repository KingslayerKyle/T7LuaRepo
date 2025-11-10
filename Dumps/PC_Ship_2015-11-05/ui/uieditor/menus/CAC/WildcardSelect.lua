require( "ui.uieditor.widgets.BackgroundFrames.CACFullPopupBackground" )
require( "ui.uieditor.menus.CAC.Popups.OutOfUnlockTokens" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WildcardItemButton" )
require( "ui.uieditor.widgets.Pregame.Pregame_TimerOverlay" )
require( "ui.uieditor.widgets.Prestige.Prestige_PermanentUnlockTokensWidget" )

local f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	for f1_local0 = 1, CoD.CACUtility.maxBonusCards, 1 do
		local f1_local3 = "bonuscard" .. f1_local0
		local f1_local4 = f1_arg0:getModel( f1_arg1, f1_local3 .. ".itemIndex" )
		if f1_local4 then
			if f1_arg2 and Engine.GetModelValue( f1_local4 ) == f1_arg2 then
				return f1_local3
			end
		end
	end
end

local PreLoadFunc = function ( self, controller )
	CoD.GenericCACSelectionPreLoadFunc( self, controller, "bonuscard", CoD.perController[controller].weaponCategory )
end

local f0_local2 = function ( f3_arg0, f3_arg1 )
	if CoD.useMouse then
		for f3_local0 = 1, f3_arg0.selectionList.requestedColumnCount, 1 do
			local f3_local3 = f3_arg0.selectionList:getItemAtPosition( 1, f3_local0 )
			f3_local3.m_inputDisabled = true
		end
		local f3_local0 = CoD.perController[f3_arg1].CACSpecficModelValueFocusTable
		local f3_local1 = nil
		if f3_local0 then
			f3_local1 = f3_arg0.selectionList:findItem( f3_local0, nil, false, nil )
			f3_local1.m_inputDisabled = false
		end
	end
end

local PostLoadFunc = function ( f4_arg0, f4_arg1 )
	f4_arg0.getEquippedLoadoutSlot = f0_local0
	if IsCACContextualWildcardOpen( f4_arg1 ) then
		f0_local2( f4_arg0, f4_arg1 )
		f4_arg0.selectionList.m_disableNavigation = true
	end
end

LUI.createMenu.WildcardSelect = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "WildcardSelect" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "CAC_EditLoadout"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "WildcardSelect.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local background = CoD.CACFullPopupBackground.new( self, controller )
	background:setLeftRight( true, true, 0, 0 )
	background:setTopBottom( true, true, 0, 0 )
	background.StartMenuTitlePopup.StartMenuTitleContainerLOC.StartMenu3dTitle.StartMenu3dTitleLabel.Label0:setText( Engine.Localize( "MENU_WILDCARDS_CAPS" ) )
	background:linkToElementModel( self, nil, false, function ( model )
		background.buttons:setModel( model, controller )
	end )
	self:addElement( background )
	self.background = background
	
	local selectionList = LUI.UIList.new( self, controller, 8, 0, function ( f7_arg0 )
		return Engine.GetModelValue( Engine.GetModel( f7_arg0, "group" ) ) == "bonuscard"
	end, true, false, 0, 0, false, false )
	selectionList:makeFocusable()
	selectionList:setLeftRight( false, false, -556, 556 )
	selectionList:setTopBottom( true, false, 265.25, 407.25 )
	selectionList:setDataSource( "Unlockables" )
	selectionList:setWidgetType( CoD.WildcardItemButton )
	selectionList:setHorizontalCount( 10 )
	selectionList:setSpacing( 8 )
	selectionList:linkToElementModel( selectionList, "itemIndex", true, function ( model )
		local f8_local0 = selectionList
		local f8_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		}
		CoD.Menu.UpdateButtonShownState( f8_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	selectionList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f9_local0 = nil
		if IsCACItemNew( element, controller ) and not IsInPermanentUnlockMenu( controller ) then
			SetCACItemAsOld( element, controller )
			UpdateSelfElementState( self, element, controller )
		end
		return f9_local0
	end )
	selectionList:registerEventHandler( "gain_focus", function ( element, event )
		local f10_local0 = nil
		if element.gainFocus then
			f10_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f10_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f10_local0
	end )
	selectionList:registerEventHandler( "lose_focus", function ( element, event )
		local f11_local0 = nil
		if element.loseFocus then
			f11_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f11_local0 = element.super:loseFocus( event )
		end
		return f11_local0
	end )
	self:AddButtonCallbackFunction( selectionList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsCACItemLocked( menu, element, controller ) and not IsCACItemPurchased( element, controller ) and not IsCACHaveTokens( controller ) and not IsInPermanentUnlockMenu( controller ) then
			SetUnlockConfirmationInfo( element, controller )
			OpenPopup( self, "OutOfUnlockTokens", controller )
			return true
		elseif not IsCACItemLocked( menu, element, controller ) and not IsCACItemPurchased( element, controller ) and IsCACHaveTokens( controller ) and not IsInPermanentUnlockMenu( controller ) then
			OpenUnlockClassItemDialog( menu, element, controller )
			return true
		elseif not IsCACItemLocked( menu, element, controller ) and IsCACItemPurchased( element, controller ) and not IsInPermanentUnlockMenu( controller ) then
			SetClassWildcard( self, element, controller )
			return true
		elseif IsInPermanentUnlockMenu( controller ) and not IsPermanentlyUnlocked( element, controller ) and HavePermanentUnlockTokens( controller ) then
			OpenPermanentUnlockClassItemDialog( menu, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if not IsCACItemLocked( menu, element, controller ) and not IsCACItemPurchased( element, controller ) and not IsCACHaveTokens( controller ) and not IsInPermanentUnlockMenu( controller ) then
			return true
		elseif not IsCACItemLocked( menu, element, controller ) and not IsCACItemPurchased( element, controller ) and IsCACHaveTokens( controller ) and not IsInPermanentUnlockMenu( controller ) then
			return true
		elseif not IsCACItemLocked( menu, element, controller ) and IsCACItemPurchased( element, controller ) and not IsInPermanentUnlockMenu( controller ) then
			return true
		elseif IsInPermanentUnlockMenu( controller ) and not IsPermanentlyUnlocked( element, controller ) and HavePermanentUnlockTokens( controller ) then
			return true
		else
			return false
		end
	end, true )
	self:addElement( selectionList )
	self.selectionList = selectionList
	
	local listTopRight = LUI.UIImage.new()
	listTopRight:setLeftRight( false, false, 453, 489 )
	listTopRight:setTopBottom( true, false, 257, 260.5 )
	listTopRight:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	listTopRight:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( listTopRight )
	self.listTopRight = listTopRight
	
	local listBottomRight = LUI.UIImage.new()
	listBottomRight:setLeftRight( false, false, 453, 489 )
	listBottomRight:setTopBottom( true, false, 392, 393.75 )
	listBottomRight:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	listBottomRight:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( listBottomRight )
	self.listBottomRight = listBottomRight
	
	local listTopLeft = LUI.UIImage.new()
	listTopLeft:setLeftRight( false, false, -493, -457 )
	listTopLeft:setTopBottom( true, false, 255.25, 258.75 )
	listTopLeft:setZRot( 180 )
	listTopLeft:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	listTopLeft:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( listTopLeft )
	self.listTopLeft = listTopLeft
	
	local listBottomLeft = LUI.UIImage.new()
	listBottomLeft:setLeftRight( false, false, -493, -457 )
	listBottomLeft:setTopBottom( true, false, 389.5, 393 )
	listBottomLeft:setZRot( 180 )
	listBottomLeft:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	listBottomLeft:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( listBottomLeft )
	self.listBottomLeft = listBottomLeft
	
	local popupBottomLeft = LUI.UIImage.new()
	popupBottomLeft:setLeftRight( false, false, -613, -577 )
	popupBottomLeft:setTopBottom( true, false, 496.56, 500.06 )
	popupBottomLeft:setZRot( 180 )
	popupBottomLeft:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	popupBottomLeft:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( popupBottomLeft )
	self.popupBottomLeft = popupBottomLeft
	
	local popupTopLeft = LUI.UIImage.new()
	popupTopLeft:setLeftRight( false, false, -613, -577 )
	popupTopLeft:setTopBottom( true, false, 245.31, 248.81 )
	popupTopLeft:setZRot( 180 )
	popupTopLeft:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	popupTopLeft:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( popupTopLeft )
	self.popupTopLeft = popupTopLeft
	
	local popupLineLeft = LUI.UIImage.new()
	popupLineLeft:setLeftRight( false, false, -597.5, -592.5 )
	popupLineLeft:setTopBottom( true, false, 258, 488.38 )
	popupLineLeft:setAlpha( 0.8 )
	popupLineLeft:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	popupLineLeft:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( popupLineLeft )
	self.popupLineLeft = popupLineLeft
	
	local popupMiddleLeft = LUI.UIImage.new()
	popupMiddleLeft:setLeftRight( false, false, -586, -570 )
	popupMiddleLeft:setTopBottom( true, false, 361.06, 413.06 )
	popupMiddleLeft:setZoom( -5 )
	popupMiddleLeft:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	popupMiddleLeft:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( popupMiddleLeft )
	self.popupMiddleLeft = popupMiddleLeft
	
	local popupBottomRight = LUI.UIImage.new()
	popupBottomRight:setLeftRight( false, false, 578, 614 )
	popupBottomRight:setTopBottom( true, false, 497.38, 501.06 )
	popupBottomRight:setZRot( 360 )
	popupBottomRight:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	popupBottomRight:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( popupBottomRight )
	self.popupBottomRight = popupBottomRight
	
	local popupTopRight = LUI.UIImage.new()
	popupTopRight:setLeftRight( false, false, 578, 614 )
	popupTopRight:setTopBottom( true, false, 246.25, 249.75 )
	popupTopRight:setZRot( 360 )
	popupTopRight:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	popupTopRight:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( popupTopRight )
	self.popupTopRight = popupTopRight
	
	local popupLineRight = LUI.UIImage.new()
	popupLineRight:setLeftRight( false, false, 593.5, 598.5 )
	popupLineRight:setTopBottom( true, false, 259.06, 489.44 )
	popupLineRight:setAlpha( 0.8 )
	popupLineRight:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	popupLineRight:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( popupLineRight )
	self.popupLineRight = popupLineRight
	
	local popupMiddleRight = LUI.UIImage.new()
	popupMiddleRight:setLeftRight( false, false, 569, 585 )
	popupMiddleRight:setTopBottom( true, false, 360, 412 )
	popupMiddleRight:setZoom( -5 )
	popupMiddleRight:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	popupMiddleRight:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( popupMiddleRight )
	self.popupMiddleRight = popupMiddleRight
	
	local PregameTimerOverlay = CoD.Pregame_TimerOverlay.new( self, controller )
	PregameTimerOverlay:setLeftRight( true, true, 0, 0 )
	PregameTimerOverlay:setTopBottom( true, true, 0, 0 )
	PregameTimerOverlay:mergeStateConditions( {
		{
			stateName = "WildcardSelect",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	PregameTimerOverlay:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.state" ), function ( model )
		self:updateElementState( PregameTimerOverlay, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.Pregame.state"
		} )
	end )
	self:addElement( PregameTimerOverlay )
	self.PregameTimerOverlay = PregameTimerOverlay
	
	local PermanentUnlockTokensWidget = CoD.Prestige_PermanentUnlockTokensWidget.new( self, controller )
	PermanentUnlockTokensWidget:setLeftRight( false, true, -362, -81 )
	PermanentUnlockTokensWidget:setTopBottom( true, false, 149, 193 )
	PermanentUnlockTokensWidget:setAlpha( ShowIfInPermanentUnlockMenu( 0 ) )
	PermanentUnlockTokensWidget.tokenLabel:setTTF( "fonts/escom.ttf" )
	self:addElement( PermanentUnlockTokensWidget )
	self.PermanentUnlockTokensWidget = PermanentUnlockTokensWidget
	
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBackAndUpdateNavigation( self, element, controller )
		PlaySoundSetSound( self, "menu_no_selection" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	background:setModel( self.buttonModel, controller )
	selectionList.id = "selectionList"
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
		element.background:close()
		element.selectionList:close()
		element.PregameTimerOverlay:close()
		element.PermanentUnlockTokensWidget:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "WildcardSelect.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

