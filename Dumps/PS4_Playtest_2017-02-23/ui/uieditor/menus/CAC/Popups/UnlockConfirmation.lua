require( "ui.uieditor.widgets.BackgroundFrames.CACFullPopupBackground" )
require( "ui.uieditor.widgets.CAC.Customization.CACGenericButton" )
require( "ui.uieditor.widgets.CAC.UnlockTokensWidget" )

local UnlockConfirmationPrepare = function ( controller )
	local list = {}
	local isInCybercoreUpgrade = CoD.perController[controller].isInCybercoreUpgrade or false
	local addItemListButton = function ( displayText, action )
		return {
			models = {
				displayText = displayText
			},
			properties = {
				action = action
			}
		}
	end
	
	local setElementModelItemIndex = function ( self, element, controller )
		local itemIndexModel = self:getModel( controller, "itemIndex" )
		local elementModel = element:getModel()
		Engine.SetModelValue( Engine.CreateModel( elementModel, "itemIndex" ), Engine.GetModelValue( itemIndexModel ) )
	end
	
	local UnlockAction = function ( self, element, controller, actionParam, menu )
		setElementModelItemIndex( self, element, controller )
		UnlockItem( self, element, controller )
		local previousMenu = GoBackAndUpdateStateOnPreviousMenu( self, controller )
		if isInCybercoreUpgrade then
			UpdateCybercoreTree( previousMenu, previousMenu, controller )
		end
		ClearSavedState( self, controller )
	end
	
	local UnlockAndEquipAction = function ( self, element, controller, actionParam, menu )
		setElementModelItemIndex( self, element, controller )
		UnlockAndEquipItem( self, element, controller )
		GoBackToCustomClassMenu( self, controller )
		ClearSavedState( self, controller )
	end
	
	local CancelUnlockAction = function ( self, element, controller, actionParam, menu )
		GoBack( self, controller )
		ClearSavedState( self, controller )
	end
	
	local isEquippable = not isInCybercoreUpgrade
	table.insert( list, addItemListButton( "MENU_UNLOCK", UnlockAction ) )
	if isEquippable then
		table.insert( list, addItemListButton( "MENU_UNLOCK_AND_EQUIP", UnlockAndEquipAction ) )
	end
	table.insert( list, addItemListButton( "MENU_CANCEL_UNLOCK", CancelUnlockAction ) )
	return list
end

DataSources.UnlockTokenMenuList = DataSourceHelpers.ListSetup( "UnlockTokenMenuList", UnlockConfirmationPrepare, true )
LUI.createMenu.UnlockConfirmation = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "UnlockConfirmation" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "CAC_Overcapacity"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "UnlockConfirmation.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local background = CoD.CACFullPopupBackground.new( self, controller )
	background:setLeftRight( 0, 0, 0, 1920 )
	background:setTopBottom( 0, 0, 0, 1080 )
	background.StartMenuTitlePopup.StartMenuTitleContainerLOC.StartMenu3dTitle.StartMenu3dTitleLabel.Label0:setText( Engine.Localize( "MPUI_CONFIRM_PURCHASE_CAPS" ) )
	background:linkToElementModel( self, nil, false, function ( model )
		background.buttons:setModel( model, controller )
	end )
	self:addElement( background )
	self.background = background
	
	local desc = LUI.UITightText.new()
	desc:setLeftRight( 0, 0, 675, 1197 )
	desc:setTopBottom( 0, 0, 335, 373 )
	desc:setRGB( 0.5, 0.51, 0.52 )
	desc:setText( GetUnlockTokenItemString( controller, "MPUI_UNLOCK_ITEM" ) )
	desc:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	desc:setLetterSpacing( 0.5 )
	self:addElement( desc )
	self.desc = desc
	
	local previewImage = LUI.UIImage.new()
	previewImage:setLeftRight( 0, 0, 138, 495 )
	previewImage:setTopBottom( 0, 0, 339, 696 )
	previewImage:linkToElementModel( self, "itemIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			previewImage:setImage( RegisterImage( GetItemImageFromIndexPerWeaponCategory( controller, modelValue ) ) )
		end
	end )
	self:addElement( previewImage )
	self.previewImage = previewImage
	
	local buttonList = LUI.UIList.new( self, controller, 15, 0, nil, false, false, 0, 0, false, false )
	buttonList:makeFocusable()
	buttonList:setLeftRight( 0, 0, 324, 1446 )
	buttonList:setTopBottom( 0, 0, 493, 667 )
	buttonList:setWidgetType( CoD.CACGenericButton )
	buttonList:setVerticalCount( 3 )
	buttonList:setSpacing( 15 )
	buttonList:setDataSource( "UnlockTokenMenuList" )
	buttonList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	buttonList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( buttonList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ProcessListAction( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "", nil )
		return false
	end, false )
	self:addElement( buttonList )
	self.buttonList = buttonList
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( 0, 0, 15, 69 )
	Image3:setTopBottom( 0.5, 0.5, 149, 154 )
	Image3:setZRot( 180 )
	Image3:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image4 = LUI.UIImage.new()
	Image4:setLeftRight( 0, 0, 15, 69 )
	Image4:setTopBottom( 0.5, 0.5, -205, -200 )
	Image4:setZRot( 180 )
	Image4:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image4:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	local LineSide0 = LUI.UIImage.new()
	LineSide0:setLeftRight( 0, 0, 38, 46 )
	LineSide0:setTopBottom( 0, 0, 345, 691 )
	LineSide0:setAlpha( 0.8 )
	LineSide0:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide0 )
	self.LineSide0 = LineSide0
	
	local Image40 = LUI.UIImage.new()
	Image40:setLeftRight( 0, 0, 10, 34 )
	Image40:setTopBottom( 0, 0, 443, 521 )
	Image40:setZoom( -5 )
	Image40:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	Image40:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image40 )
	self.Image40 = Image40
	
	local Image30 = LUI.UIImage.new()
	Image30:setLeftRight( 0, 0, 1847, 1901 )
	Image30:setTopBottom( 0.5, 0.5, 149, 154 )
	Image30:setZRot( 180 )
	Image30:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image30:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image30 )
	self.Image30 = Image30
	
	local Image41 = LUI.UIImage.new()
	Image41:setLeftRight( 0, 0, 1847, 1901 )
	Image41:setTopBottom( 0.5, 0.5, -205, -200 )
	Image41:setZRot( 180 )
	Image41:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image41:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image41 )
	self.Image41 = Image41
	
	local LineSide00 = LUI.UIImage.new()
	LineSide00:setLeftRight( 0, 0, 1870, 1878 )
	LineSide00:setTopBottom( 0, 0, 345, 691 )
	LineSide00:setAlpha( 0.8 )
	LineSide00:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide00 )
	self.LineSide00 = LineSide00
	
	local UnlockTokensWidget = CoD.UnlockTokensWidget.new( self, controller )
	UnlockTokensWidget:setLeftRight( 1, 1, -748, -390 )
	UnlockTokensWidget:setTopBottom( 0, 0, 222, 288 )
	UnlockTokensWidget.tokenLabel:setTTF( "fonts/escom.ttf" )
	self:addElement( UnlockTokensWidget )
	self.UnlockTokensWidget = UnlockTokensWidget
	
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SetModelFromPerControllerTable( controller, self, "UnlockTokenInfo" )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		ClearSavedState( self, controller )
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
	buttonList.id = "buttonList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.buttonList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.background:close()
		self.buttonList:close()
		self.UnlockTokensWidget:close()
		self.previewImage:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "UnlockConfirmation.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

