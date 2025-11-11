require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithFullPopupBackground" )
require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithInputButton" )
require( "ui.uieditor.widgets.Lobby.Common.List1ButtonLarge_Left_ND" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_TitlePopup" )

local PreLoadFunc = function ( self, controller )
	self:setModel( CoD.perController[controller].gunsmithVariantModel )
end

LUI.createMenu.GunsmithCreateVariantName = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "GunsmithCreateVariantName" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "GunsmithCreateVariantName.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local Panel = LUI.UIImage.new()
	Panel:setLeftRight( 0, 0, 0, 1920 )
	Panel:setTopBottom( 0, 0, 0, 1080 )
	Panel:setRGB( 0, 0, 0 )
	Panel:setAlpha( 0 )
	self:addElement( Panel )
	self.Panel = Panel
	
	local GunsmithFullPopupBackground = CoD.GunsmithFullPopupBackground.new( self, controller )
	GunsmithFullPopupBackground:setLeftRight( 0, 0, 0, 1920 )
	GunsmithFullPopupBackground:setTopBottom( 0, 0, -2, 1078 )
	self:addElement( GunsmithFullPopupBackground )
	self.GunsmithFullPopupBackground = GunsmithFullPopupBackground
	
	local black0 = LUI.UIImage.new()
	black0:setLeftRight( 0, 0, 877, 1447 )
	black0:setTopBottom( 0, 0, 459, 522 )
	black0:setAlpha( 0.12 )
	self:addElement( black0 )
	self.black0 = black0
	
	local variantNameInput = CoD.GunsmithInputButton.new( self, controller )
	variantNameInput:setLeftRight( 0, 0, 874, 1452 )
	variantNameInput:setTopBottom( 0, 0, 456, 526 )
	variantNameInput.Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	variantNameInput:linkToElementModel( self, "variantTextEntry", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			variantNameInput.Text:setText( modelValue )
		end
	end )
	variantNameInput:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	variantNameInput:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( variantNameInput, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ShowKeyboard( self, element, controller, "KEYBOARD_TYPE_GUNSMITH" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( variantNameInput )
	self.variantNameInput = variantNameInput
	
	local variantImage = LUI.UIImage.new()
	variantImage:setLeftRight( 0, 0, 184, 772 )
	variantImage:setTopBottom( 0, 0, 360, 744 )
	variantImage:setImage( RegisterImage( "uie_t7_menu_gunsmith_nameyourvariant" ) )
	self:addElement( variantImage )
	self.variantImage = variantImage
	
	local StartMenuTitlePopup = CoD.StartMenu_TitlePopup.new( self, controller )
	StartMenuTitlePopup:setLeftRight( 0, 0, -76, 1272 )
	StartMenuTitlePopup:setTopBottom( 0, 0, 163.5, 382.5 )
	StartMenuTitlePopup:subscribeToGlobalModel( controller, "Customization", "weapon_index", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			StartMenuTitlePopup.StartMenuTitleContainerLOC.StartMenu3dTitle.StartMenu3dTitleLabel.Label0:setText( LocalizeWeaponNameIntoString( "MENU_GUNSMITH_CREATE_VARIANT_NAME_TITLE", controller, modelValue ) )
		end
	end )
	self:addElement( StartMenuTitlePopup )
	self.StartMenuTitlePopup = StartMenuTitlePopup
	
	local Image5 = LUI.UIImage.new()
	Image5:setLeftRight( 0, 0, 1464, 1518 )
	Image5:setTopBottom( 0.5, 0.5, -84, -79 )
	Image5:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image5:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image5 )
	self.Image5 = Image5
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( 0, 0, 1464, 1518 )
	Image0:setTopBottom( 0.5, 0.5, -19, -14 )
	Image0:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( 0, 0, 809, 863 )
	Image1:setTopBottom( 0.5, 0.5, -84, -79 )
	Image1:setZRot( 180 )
	Image1:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( 0, 0, 85, 139 )
	Image3:setTopBottom( 0.5, 0.5, 202, 207 )
	Image3:setZRot( 180 )
	Image3:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image4 = LUI.UIImage.new()
	Image4:setLeftRight( 0, 0, 85, 139 )
	Image4:setTopBottom( 0.5, 0.5, -182, -177 )
	Image4:setZRot( 180 )
	Image4:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image4:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	local LineSide0 = LUI.UIImage.new()
	LineSide0:setLeftRight( 0, 0, 108, 116 )
	LineSide0:setTopBottom( 0, 0, 382, 728 )
	LineSide0:setAlpha( 0.8 )
	LineSide0:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide0 )
	self.LineSide0 = LineSide0
	
	local Image40 = LUI.UIImage.new()
	Image40:setLeftRight( 0, 0, 81, 105 )
	Image40:setTopBottom( 0, 0, 504, 582 )
	Image40:setZoom( -5 )
	Image40:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	Image40:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image40 )
	self.Image40 = Image40
	
	local Image30 = LUI.UIImage.new()
	Image30:setLeftRight( 0, 0, 1595, 1649 )
	Image30:setTopBottom( 0.5, 0.5, 201, 207 )
	Image30:setZRot( 360 )
	Image30:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image30:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image30 )
	self.Image30 = Image30
	
	local Image41 = LUI.UIImage.new()
	Image41:setLeftRight( 0, 0, 1595, 1649 )
	Image41:setTopBottom( 0.5, 0.5, -181, -176 )
	Image41:setZRot( 360 )
	Image41:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image41:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image41 )
	self.Image41 = Image41
	
	local Image400 = LUI.UIImage.new()
	Image400:setLeftRight( 0, 0, 1626, 1650 )
	Image400:setTopBottom( 0, 0, 511, 589 )
	Image400:setZoom( -5 )
	Image400:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	Image400:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image400 )
	self.Image400 = Image400
	
	local Image10 = LUI.UIImage.new()
	Image10:setLeftRight( 0, 0, 809, 863 )
	Image10:setTopBottom( 0.5, 0.5, -21, -16 )
	Image10:setZRot( 180 )
	Image10:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image10:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image10 )
	self.Image10 = Image10
	
	local List1ButtonLargeLeftND0 = CoD.List1ButtonLarge_Left_ND.new( self, controller )
	List1ButtonLargeLeftND0:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return not Gunsmith_ValidVariantNameEntered( element, controller )
			end
		}
	} )
	List1ButtonLargeLeftND0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Gunsmith.validVariantNameEntered" ), function ( model )
		self:updateElementState( List1ButtonLargeLeftND0, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "Gunsmith.validVariantNameEntered"
		} )
	end )
	List1ButtonLargeLeftND0:setLeftRight( 0, 0, 878, 1298 )
	List1ButtonLargeLeftND0:setTopBottom( 0, 0, 583, 631 )
	List1ButtonLargeLeftND0.btnDisplayText:setText( Engine.Localize( "MENU_CONFIRM_CAPS" ) )
	List1ButtonLargeLeftND0.btnDisplayTextStroke:setText( Engine.Localize( "MENU_CONFIRM_CAPS" ) )
	List1ButtonLargeLeftND0:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	List1ButtonLargeLeftND0:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( List1ButtonLargeLeftND0, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		Gunsmith_ConfirmVariantName( self, element, controller, menu )
		ClearMenuSavedState( menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( List1ButtonLargeLeftND0 )
	self.List1ButtonLargeLeftND0 = List1ButtonLargeLeftND0
	
	local LineSide00 = LUI.UIImage.new()
	LineSide00:setLeftRight( 0, 0, 1618, 1626 )
	LineSide00:setTopBottom( 0, 0, 382, 728 )
	LineSide00:setAlpha( 0.8 )
	LineSide00:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide00 )
	self.LineSide00 = LineSide00
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( 0, 0, 0, 1920 )
	CategoryListLine:setTopBottom( 0, 0, 288, 300 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local CategoryListLine0 = LUI.UIImage.new()
	CategoryListLine0:setLeftRight( 0, 0, 0, 1920 )
	CategoryListLine0:setTopBottom( 0, 0, 801, 813 )
	CategoryListLine0:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine0:setAlpha( 0.25 )
	CategoryListLine0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine0 )
	self.CategoryListLine0 = CategoryListLine0
	
	local CategoryListLine00 = LUI.UIImage.new()
	CategoryListLine00:setLeftRight( 0, 0, 0, 1920 )
	CategoryListLine00:setTopBottom( 0, 0, 868, 880 )
	CategoryListLine00:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine00:setAlpha( 0.25 )
	CategoryListLine00:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine00 )
	self.CategoryListLine00 = CategoryListLine00
	
	variantNameInput.navigation = {
		down = List1ButtonLargeLeftND0
	}
	List1ButtonLargeLeftND0.navigation = {
		up = variantNameInput
	}
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "ui_keyboard_input", function ( element, event )
		local retVal = nil
		Gunsmith_HandleKeyboardComplete( self, element, controller, event )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		Gunsmith_CreateVariantNameBack( self, element, controller )
		GoBack( self, controller )
		ClearMenuSavedState( menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "", nil )
		return false
	end, false )
	variantNameInput.id = "variantNameInput"
	List1ButtonLargeLeftND0.id = "List1ButtonLargeLeftND0"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.variantNameInput:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.GunsmithFullPopupBackground:close()
		self.variantNameInput:close()
		self.StartMenuTitlePopup:close()
		self.List1ButtonLargeLeftND0:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "GunsmithCreateVariantName.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

