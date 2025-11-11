require( "ui.uieditor.menus.CAC.Popups.OutOfUnlockTokens" )
require( "ui.uieditor.widgets.BackgroundFrames.CACFullPopupBackground" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WildcardItemButton" )
require( "ui.uieditor.widgets.Pregame.Pregame_TimerOverlay" )
require( "ui.uieditor.widgets.Prestige.Prestige_PermanentUnlockTokensWidget" )

local GetEquippedBonusCardLoudoutSlot = function ( self, controller, itemIndex )
	for index = 1, CoD.CACUtility.maxBonusCards, 1 do
		local slotName = "bonuscard" .. index
		local model = self:getModel( controller, slotName .. ".itemIndex" )
		if model then
			local modelValue = Engine.GetModelValue( model )
			if itemIndex and modelValue == itemIndex then
				return slotName
			end
		end
	end
end

local PreLoadFunc = function ( self, controller )
	CoD.CACUtility.GenericCACSelectionPreLoadFunc( self, controller, "bonuscard", CoD.perController[controller].weaponCategory )
end

local DisableMouseForContextualWildcardOpen = function ( self, controller )
	if CoD.useMouse then
		for column = 1, self.selectionList.requestedColumnCount, 1 do
			local widget = self.selectionList:getItemAtPosition( 1, column )
			widget.m_inputDisabled = true
		end
		local cacSpecficModelFocusTable = CoD.perController[controller].CACSpecficModelValueFocusTable
		local selectWidget = nil
		if cacSpecficModelFocusTable then
			selectWidget = self.selectionList:findItem( cacSpecficModelFocusTable, nil, false, nil )
			selectWidget.m_inputDisabled = false
		end
	end
end

local PostLoadFunc = function ( self, controller )
	self.getEquippedLoadoutSlot = GetEquippedBonusCardLoudoutSlot
	if IsCACContextualWildcardOpen( controller ) then
		DisableMouseForContextualWildcardOpen( self, controller )
		self.selectionList.m_disableNavigation = true
	end
end

LUI.createMenu.WildcardSelect = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "WildcardSelect" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "CAC_EditLoadout"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "WildcardSelect.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local background = CoD.CACFullPopupBackground.new( self, controller )
	background:setLeftRight( 0, 1, 0, 0 )
	background:setTopBottom( 0, 1, 0, 0 )
	background.StartMenuTitlePopup.StartMenuTitleContainerLOC.StartMenu3dTitle.StartMenu3dTitleLabel.Label0:setText( Engine.Localize( "MENU_WILDCARDS_CAPS" ) )
	background:linkToElementModel( self, nil, false, function ( model )
		background.buttons:setModel( model, controller )
	end )
	self:addElement( background )
	self.background = background
	
	local selectionList = LUI.UIList.new( self, controller, 12, 0, function ( model )
		return Engine.GetModelValue( Engine.GetModel( model, "group" ) ) == "bonuscard"
	end, true, false, 0, 0, false, false )
	selectionList:makeFocusable()
	selectionList:setLeftRight( 0.5, 0.5, -834, 834 )
	selectionList:setTopBottom( 0, 0, 398, 611 )
	selectionList:setWidgetType( CoD.WildcardItemButton )
	selectionList:setHorizontalCount( 10 )
	selectionList:setSpacing( 12 )
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
	end )
	selectionList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		if IsCACItemNew( element, controller ) and not IsInPermanentUnlockMenu( controller ) then
			SetCACItemAsOld( element, controller )
			UpdateSelfElementState( self, element, controller )
		end
		return retVal
	end )
	selectionList:registerEventHandler( "used_permanent_unlock_token", function ( element, event )
		local retVal = nil
		UpdateDataSource( self, element, controller )
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
		if not IsCACItemLocked( menu, element, controller ) and not IsCACItemPurchased( element, controller ) and not IsCACHaveTokens( controller ) and not IsInPermanentUnlockMenu( controller ) then
			SetUnlockConfirmationInfo( element, controller )
			OpenPopup( self, "OutOfUnlockTokens", controller, "", "" )
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
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
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
	listTopRight:setLeftRight( 0.5, 0.5, 679, 733 )
	listTopRight:setTopBottom( 0, 0, 386, 391 )
	listTopRight:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	listTopRight:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( listTopRight )
	self.listTopRight = listTopRight
	
	local listBottomRight = LUI.UIImage.new()
	listBottomRight:setLeftRight( 0.5, 0.5, 679, 733 )
	listBottomRight:setTopBottom( 0, 0, 588, 591 )
	listBottomRight:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	listBottomRight:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( listBottomRight )
	self.listBottomRight = listBottomRight
	
	local listTopLeft = LUI.UIImage.new()
	listTopLeft:setLeftRight( 0.5, 0.5, -739, -685 )
	listTopLeft:setTopBottom( 0, 0, 383, 388 )
	listTopLeft:setZRot( 180 )
	listTopLeft:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	listTopLeft:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( listTopLeft )
	self.listTopLeft = listTopLeft
	
	local listBottomLeft = LUI.UIImage.new()
	listBottomLeft:setLeftRight( 0.5, 0.5, -739, -685 )
	listBottomLeft:setTopBottom( 0, 0, 584, 589 )
	listBottomLeft:setZRot( 180 )
	listBottomLeft:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	listBottomLeft:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( listBottomLeft )
	self.listBottomLeft = listBottomLeft
	
	local popupBottomLeft = LUI.UIImage.new()
	popupBottomLeft:setLeftRight( 0.5, 0.5, -919, -865 )
	popupBottomLeft:setTopBottom( 0, 0, 745, 750 )
	popupBottomLeft:setZRot( 180 )
	popupBottomLeft:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	popupBottomLeft:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( popupBottomLeft )
	self.popupBottomLeft = popupBottomLeft
	
	local popupTopLeft = LUI.UIImage.new()
	popupTopLeft:setLeftRight( 0.5, 0.5, -919, -865 )
	popupTopLeft:setTopBottom( 0, 0, 368, 373 )
	popupTopLeft:setZRot( 180 )
	popupTopLeft:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	popupTopLeft:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( popupTopLeft )
	self.popupTopLeft = popupTopLeft
	
	local popupLineLeft = LUI.UIImage.new()
	popupLineLeft:setLeftRight( 0.5, 0.5, -896, -888 )
	popupLineLeft:setTopBottom( 0, 0, 387, 733 )
	popupLineLeft:setAlpha( 0.8 )
	popupLineLeft:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	popupLineLeft:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( popupLineLeft )
	self.popupLineLeft = popupLineLeft
	
	local popupMiddleLeft = LUI.UIImage.new()
	popupMiddleLeft:setLeftRight( 0.5, 0.5, -879, -855 )
	popupMiddleLeft:setTopBottom( 0, 0, 542, 620 )
	popupMiddleLeft:setZoom( -5 )
	popupMiddleLeft:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	popupMiddleLeft:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( popupMiddleLeft )
	self.popupMiddleLeft = popupMiddleLeft
	
	local popupBottomRight = LUI.UIImage.new()
	popupBottomRight:setLeftRight( 0.5, 0.5, 867, 921 )
	popupBottomRight:setTopBottom( 0, 0, 746, 752 )
	popupBottomRight:setZRot( 360 )
	popupBottomRight:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	popupBottomRight:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( popupBottomRight )
	self.popupBottomRight = popupBottomRight
	
	local popupTopRight = LUI.UIImage.new()
	popupTopRight:setLeftRight( 0.5, 0.5, 867, 921 )
	popupTopRight:setTopBottom( 0, 0, 369, 374 )
	popupTopRight:setZRot( 360 )
	popupTopRight:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	popupTopRight:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( popupTopRight )
	self.popupTopRight = popupTopRight
	
	local popupLineRight = LUI.UIImage.new()
	popupLineRight:setLeftRight( 0.5, 0.5, 890, 898 )
	popupLineRight:setTopBottom( 0, 0, 388, 734 )
	popupLineRight:setAlpha( 0.8 )
	popupLineRight:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	popupLineRight:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( popupLineRight )
	self.popupLineRight = popupLineRight
	
	local popupMiddleRight = LUI.UIImage.new()
	popupMiddleRight:setLeftRight( 0.5, 0.5, 854, 878 )
	popupMiddleRight:setTopBottom( 0, 0, 540, 618 )
	popupMiddleRight:setZoom( -5 )
	popupMiddleRight:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	popupMiddleRight:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( popupMiddleRight )
	self.popupMiddleRight = popupMiddleRight
	
	local PregameTimerOverlay = CoD.Pregame_TimerOverlay.new( self, controller )
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
	PregameTimerOverlay:setLeftRight( 0, 1, 0, 0 )
	PregameTimerOverlay:setTopBottom( 0, 1, 0, 0 )
	self:addElement( PregameTimerOverlay )
	self.PregameTimerOverlay = PregameTimerOverlay
	
	local PermanentUnlockTokensWidget = CoD.Prestige_PermanentUnlockTokensWidget.new( self, controller )
	PermanentUnlockTokensWidget:setLeftRight( 1, 1, -543, -121 )
	PermanentUnlockTokensWidget:setTopBottom( 0, 0, 223, 289 )
	PermanentUnlockTokensWidget:setAlpha( ShowIfInPermanentUnlockMenu( 0 ) )
	PermanentUnlockTokensWidget.tokenLabel:setTTF( "fonts/escom.ttf" )
	self:addElement( PermanentUnlockTokensWidget )
	self.PermanentUnlockTokensWidget = PermanentUnlockTokensWidget
	
	self.resetProperties = function ()
		PermanentUnlockTokensWidget:completeAnimation()
		PermanentUnlockTokensWidget:setLeftRight( 1, 1, -543, -121 )
		PermanentUnlockTokensWidget:setTopBottom( 0, 0, 223, 289 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Arabic = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				PermanentUnlockTokensWidget:completeAnimation()
				self.PermanentUnlockTokensWidget:setLeftRight( 1, 1, -543, -121 )
				self.PermanentUnlockTokensWidget:setTopBottom( 0, 0, 306, 372 )
				self.clipFinished( PermanentUnlockTokensWidget, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Arabic",
			condition = function ( menu, element, event )
				return IsCurrentLanguageArabic()
			end
		}
	} )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBackAndUpdateNavigation( self, element, controller )
		PlaySoundSetSound( self, "menu_no_selection" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.background:close()
		self.selectionList:close()
		self.PregameTimerOverlay:close()
		self.PermanentUnlockTokensWidget:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "WildcardSelect.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

