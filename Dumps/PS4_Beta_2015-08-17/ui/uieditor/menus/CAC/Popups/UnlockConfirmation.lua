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
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "UnlockConfirmation.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local background = CoD.CACFullPopupBackground.new( self, controller )
	background:setLeftRight( true, false, 0, 1280 )
	background:setTopBottom( true, false, 0, 720 )
	background.StartMenuTitlePopup.StartMenuTitleContainerLOC.StartMenu3dTitle.StartMenu3dTitleLabel.Label0:setText( Engine.Localize( "MPUI_CONFIRM_PURCHASE_CAPS" ) )
	self:addElement( background )
	self.background = background
	
	local desc = LUI.UITightText.new()
	desc:setLeftRight( true, false, 450, 798 )
	desc:setTopBottom( true, false, 223.25, 248.25 )
	desc:setRGB( 0.5, 0.51, 0.52 )
	desc:setText( Engine.Localize( GetUnlockTokenItemString( controller, "MPUI_UNLOCK_ITEM" ) ) )
	desc:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	desc:setLetterSpacing( 0.5 )
	self:addElement( desc )
	self.desc = desc
	
	local previewImage = LUI.UIImage.new()
	previewImage:setLeftRight( true, false, 92, 330 )
	previewImage:setTopBottom( true, false, 226, 464 )
	previewImage:linkToElementModel( self, "itemIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			previewImage:setImage( RegisterImage( GetItemImageFromIndexPerWeaponCategory( controller, modelValue ) ) )
		end
	end )
	self:addElement( previewImage )
	self.previewImage = previewImage
	
	local buttonList = LUI.UIList.new( self, controller, 10, 0, nil, false, false, 0, 0, false, true )
	buttonList:makeFocusable()
	buttonList:setLeftRight( true, false, 450, 730 )
	buttonList:setTopBottom( true, false, 329, 445 )
	buttonList:setDataSource( "UnlockTokenMenuList" )
	buttonList:setWidgetType( CoD.CACGenericButton )
	buttonList:setVerticalCount( 3 )
	buttonList:setSpacing( 10 )
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
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "" )
		return false
	end, false )
	self:addElement( buttonList )
	self.buttonList = buttonList
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( true, false, 10, 46 )
	Image3:setTopBottom( false, false, 99.5, 103 )
	Image3:setZRot( 180 )
	Image3:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image4 = LUI.UIImage.new()
	Image4:setLeftRight( true, false, 10, 46 )
	Image4:setTopBottom( false, false, -136.75, -133.25 )
	Image4:setZRot( 180 )
	Image4:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image4:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	local LineSide0 = LUI.UIImage.new()
	LineSide0:setLeftRight( true, false, 25.5, 30.5 )
	LineSide0:setTopBottom( true, false, 230, 460.38 )
	LineSide0:setAlpha( 0.8 )
	LineSide0:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide0 )
	self.LineSide0 = LineSide0
	
	local Image40 = LUI.UIImage.new()
	Image40:setLeftRight( true, false, 7, 23 )
	Image40:setTopBottom( true, false, 295, 347 )
	Image40:setZoom( -5 )
	Image40:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	Image40:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image40 )
	self.Image40 = Image40
	
	local Image30 = LUI.UIImage.new()
	Image30:setLeftRight( true, false, 1231, 1267 )
	Image30:setTopBottom( false, false, 99.5, 103 )
	Image30:setZRot( 180 )
	Image30:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image30:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image30 )
	self.Image30 = Image30
	
	local Image41 = LUI.UIImage.new()
	Image41:setLeftRight( true, false, 1231, 1267 )
	Image41:setTopBottom( false, false, -136.75, -133.25 )
	Image41:setZRot( 180 )
	Image41:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image41:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image41 )
	self.Image41 = Image41
	
	local LineSide00 = LUI.UIImage.new()
	LineSide00:setLeftRight( true, false, 1246.5, 1251.5 )
	LineSide00:setTopBottom( true, false, 230, 460.38 )
	LineSide00:setAlpha( 0.8 )
	LineSide00:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide00 )
	self.LineSide00 = LineSide00
	
	local UnlockTokensWidget = CoD.UnlockTokensWidget.new( self, controller )
	UnlockTokensWidget:setLeftRight( false, true, -499, -260 )
	UnlockTokensWidget:setTopBottom( true, false, 148, 192 )
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

