require( "ui.uieditor.widgets.BackgroundFrames.CACFullPopupBackground" )
require( "ui.uieditor.menus.CAC.Popups.OutOfUnlockTokens" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WildcardItemButton" )
require( "ui.uieditor.widgets.Pregame.Pregame_TimerOverlay" )

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
	CoD.GenericCACSelectionPreLoadFunc( self, controller, "bonuscard", CoD.perController[controller].weaponCategory )
end

local PostLoadFunc = function ( self, controller )
	self.getEquippedLoadoutSlot = GetEquippedBonusCardLoudoutSlot
	if IsCACContextualWildcardOpen( controller ) then
		self.selectionList.m_disableNavigation = true
	end
end

LUI.createMenu.WildcardSelect = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "WildcardSelect" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "CAC_Wildcard"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "WildcardSelect.buttonPrompts" )
	local menu = self
	self.anyChildUsesUpdateState = true
	
	local background = CoD.CACFullPopupBackground.new( menu, controller )
	background:setLeftRight( true, false, 0, 1280 )
	background:setTopBottom( true, false, 0, 720 )
	background.StartMenuTitlePopup.StartMenuTitleContainerLOC.StartMenu3dTitle.StartMenu3dTitleLabel.Label0:setText( Engine.Localize( "MENU_WILDCARDS_CAPS" ) )
	self:addElement( background )
	self.background = background
	
	local selectionList = LUI.UIList.new( menu, controller, 10, 0, function ( model )
		return Engine.GetModelValue( Engine.GetModel( model, "group" ) ) == "bonuscard"
	end, true, false, 0, 0, false, false )
	selectionList:makeFocusable()
	selectionList:setLeftRight( false, false, -454, 448 )
	selectionList:setTopBottom( true, false, 254.25, 396.25 )
	selectionList:setDataSource( "Unlockables" )
	selectionList:setWidgetType( CoD.WildcardItemButton )
	selectionList:setHorizontalCount( 8 )
	selectionList:setSpacing( 10 )
	selectionList:linkToElementModel( "itemIndex", true, function ( model )
		local element = selectionList
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	selectionList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		if IsCACItemNew( element, controller ) then
			SetCACItemAsOld( element, controller )
			UpdateSelfElementState( menu, element, controller )
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
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
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
	menu:AddButtonCallbackFunction( selectionList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsCACItemLocked( menu, element, controller ) and not IsCACItemPurchased( element, controller ) and not IsCACHaveTokens( controller ) then
			SetUnlockConfirmationInfo( element, controller )
			OpenPopup( self, "OutOfUnlockTokens", controller )
			return true
		elseif not IsCACItemLocked( menu, element, controller ) and not IsCACItemPurchased( element, controller ) and IsCACHaveTokens( controller ) then
			OpenUnlockClassItemDialog( menu, element, controller )
			return true
		elseif not IsCACItemLocked( menu, element, controller ) and IsCACItemPurchased( element, controller ) then
			SetClassWildcard( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if not IsCACItemLocked( menu, element, controller ) and not IsCACItemPurchased( element, controller ) and not IsCACHaveTokens( controller ) then
			return true
		elseif not IsCACItemLocked( menu, element, controller ) and not IsCACItemPurchased( element, controller ) and IsCACHaveTokens( controller ) then
			return true
		elseif not IsCACItemLocked( menu, element, controller ) and IsCACItemPurchased( element, controller ) then
			return true
		else
			return false
		end
	end, true )
	self:addElement( selectionList )
	self.selectionList = selectionList
	
	local listTopRight = LUI.UIImage.new()
	listTopRight:setLeftRight( true, false, 1093, 1129 )
	listTopRight:setTopBottom( false, false, -103, -99.5 )
	listTopRight:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	listTopRight:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( listTopRight )
	self.listTopRight = listTopRight
	
	local listBottomRight = LUI.UIImage.new()
	listBottomRight:setLeftRight( true, false, 1093, 1129 )
	listBottomRight:setTopBottom( false, false, 32, 33.75 )
	listBottomRight:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	listBottomRight:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( listBottomRight )
	self.listBottomRight = listBottomRight
	
	local listTopLeft = LUI.UIImage.new()
	listTopLeft:setLeftRight( true, false, 147, 183 )
	listTopLeft:setTopBottom( false, false, -104.75, -101.25 )
	listTopLeft:setZRot( 180 )
	listTopLeft:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	listTopLeft:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( listTopLeft )
	self.listTopLeft = listTopLeft
	
	local listBottomLeft = LUI.UIImage.new()
	listBottomLeft:setLeftRight( true, false, 147, 183 )
	listBottomLeft:setTopBottom( false, false, 29.5, 33 )
	listBottomLeft:setZRot( 180 )
	listBottomLeft:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	listBottomLeft:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( listBottomLeft )
	self.listBottomLeft = listBottomLeft
	
	local popupBottomLeft = LUI.UIImage.new()
	popupBottomLeft:setLeftRight( true, false, 57, 93 )
	popupBottomLeft:setTopBottom( false, false, 136.56, 140.06 )
	popupBottomLeft:setZRot( 180 )
	popupBottomLeft:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	popupBottomLeft:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( popupBottomLeft )
	self.popupBottomLeft = popupBottomLeft
	
	local popupTopLeft = LUI.UIImage.new()
	popupTopLeft:setLeftRight( true, false, 57, 93 )
	popupTopLeft:setTopBottom( false, false, -114.69, -111.19 )
	popupTopLeft:setZRot( 180 )
	popupTopLeft:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	popupTopLeft:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( popupTopLeft )
	self.popupTopLeft = popupTopLeft
	
	local popupLineLeft = LUI.UIImage.new()
	popupLineLeft:setLeftRight( true, false, 72.5, 77.5 )
	popupLineLeft:setTopBottom( true, false, 258, 488.38 )
	popupLineLeft:setAlpha( 0.8 )
	popupLineLeft:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	popupLineLeft:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( popupLineLeft )
	self.popupLineLeft = popupLineLeft
	
	local popupMiddleLeft = LUI.UIImage.new()
	popupMiddleLeft:setLeftRight( true, false, 54, 70 )
	popupMiddleLeft:setTopBottom( true, false, 361.06, 413.06 )
	popupMiddleLeft:setZoom( -5 )
	popupMiddleLeft:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	popupMiddleLeft:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( popupMiddleLeft )
	self.popupMiddleLeft = popupMiddleLeft
	
	local popupBottomRight = LUI.UIImage.new()
	popupBottomRight:setLeftRight( true, false, 1186, 1222 )
	popupBottomRight:setTopBottom( false, false, 137.38, 141.06 )
	popupBottomRight:setZRot( 360 )
	popupBottomRight:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	popupBottomRight:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( popupBottomRight )
	self.popupBottomRight = popupBottomRight
	
	local popupTopRight = LUI.UIImage.new()
	popupTopRight:setLeftRight( true, false, 1186, 1222 )
	popupTopRight:setTopBottom( false, false, -113.75, -110.25 )
	popupTopRight:setZRot( 360 )
	popupTopRight:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	popupTopRight:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( popupTopRight )
	self.popupTopRight = popupTopRight
	
	local popupLineRight = LUI.UIImage.new()
	popupLineRight:setLeftRight( true, false, 1201.5, 1206.5 )
	popupLineRight:setTopBottom( true, false, 259.06, 489.44 )
	popupLineRight:setAlpha( 0.8 )
	popupLineRight:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	popupLineRight:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( popupLineRight )
	self.popupLineRight = popupLineRight
	
	local popupMiddleRight = LUI.UIImage.new()
	popupMiddleRight:setLeftRight( true, false, 1209, 1225 )
	popupMiddleRight:setTopBottom( true, false, 360, 412 )
	popupMiddleRight:setZoom( -5 )
	popupMiddleRight:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	popupMiddleRight:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( popupMiddleRight )
	self.popupMiddleRight = popupMiddleRight
	
	local PregameTimerOverlay = CoD.Pregame_TimerOverlay.new( menu, controller )
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
		menu:updateElementState( PregameTimerOverlay, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.Pregame.state"
		} )
	end )
	self:addElement( PregameTimerOverlay )
	self.PregameTimerOverlay = PregameTimerOverlay
	
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBackAndUpdateNavigation( self, element, controller )
		PlaySoundSetSound( self, "menu_no_selection" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
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
		menu = menu
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
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "WildcardSelect.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

