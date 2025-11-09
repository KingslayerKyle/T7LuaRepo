require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithFullPopupBackground" )
require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithInputButton" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_TitlePopup" )
require( "ui.uieditor.widgets.Lobby.Common.List1ButtonLarge_Left_ND" )

local PreLoadFunc = function ( self, controller )
	self:setModel( CoD.perController[controller].gunsmithVariantModel )
end

LUI.createMenu.GunsmithCreateVariantName = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "GunsmithCreateVariantName" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "HUD"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local Panel = LUI.UIImage.new()
	Panel:setLeftRight( true, false, 0, 1280 )
	Panel:setTopBottom( true, false, 0, 720 )
	Panel:setRGB( 0, 0, 0 )
	Panel:setAlpha( 0 )
	Panel:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Panel )
	self.Panel = Panel
	
	local GunsmithFullPopupBackground = CoD.GunsmithFullPopupBackground.new( self, controller )
	GunsmithFullPopupBackground:setLeftRight( true, false, 0, 1280 )
	GunsmithFullPopupBackground:setTopBottom( true, false, -1.5, 718.5 )
	GunsmithFullPopupBackground:setRGB( 1, 1, 1 )
	self:addElement( GunsmithFullPopupBackground )
	self.GunsmithFullPopupBackground = GunsmithFullPopupBackground
	
	local black0 = LUI.UIImage.new()
	black0:setLeftRight( true, false, 585, 965 )
	black0:setTopBottom( true, false, 305.75, 347.75 )
	black0:setRGB( 1, 1, 1 )
	black0:setAlpha( 0.12 )
	black0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( black0 )
	self.black0 = black0
	
	local variantNameInput = CoD.GunsmithInputButton.new( self, controller )
	variantNameInput:setLeftRight( true, false, 583, 968 )
	variantNameInput:setTopBottom( true, false, 304, 351 )
	variantNameInput:setRGB( 1, 1, 1 )
	variantNameInput:linkToElementModel( self, "variantTextEntry", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			variantNameInput.Text:setText( modelValue )
		end
	end )
	variantNameInput:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		ShowKeyboard( self, element, controller, "KEYBOARD_TYPE_GUNSMITH" )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( variantNameInput )
	self.variantNameInput = variantNameInput
	
	local variantImage = LUI.UIImage.new()
	variantImage:setLeftRight( true, false, 123, 515 )
	variantImage:setTopBottom( true, false, 240, 496.06 )
	variantImage:setRGB( 1, 1, 1 )
	variantImage:setImage( RegisterImage( "uie_t7_menu_gunsmith_nameyourvariant" ) )
	variantImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( variantImage )
	self.variantImage = variantImage
	
	local StartMenuTitlePopup = CoD.StartMenu_TitlePopup.new( self, controller )
	StartMenuTitlePopup:setLeftRight( true, false, -51, 848 )
	StartMenuTitlePopup:setTopBottom( true, false, 109, 255 )
	StartMenuTitlePopup:setRGB( 1, 1, 1 )
	StartMenuTitlePopup:subscribeToGlobalModel( controller, "Customization", "weapon_index", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			StartMenuTitlePopup.StartMenuTitleContainerLOC.StartMenu3dTitle.StartMenu3dTitleLabel.Label0:setText( Engine.Localize( LocalizeWeaponNameIntoString( modelValue, "MENU_GUNSMITH_CREATE_VARIANT_NAME_TITLE", controller ) ) )
		end
	end )
	self:addElement( StartMenuTitlePopup )
	self.StartMenuTitlePopup = StartMenuTitlePopup
	
	local Image5 = LUI.UIImage.new()
	Image5:setLeftRight( true, false, 976, 1012 )
	Image5:setTopBottom( false, false, -56, -52.5 )
	Image5:setRGB( 1, 1, 1 )
	Image5:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image5:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image5 )
	self.Image5 = Image5
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 976, 1012 )
	Image0:setTopBottom( false, false, -13, -9.5 )
	Image0:setRGB( 1, 1, 1 )
	Image0:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, 539, 575 )
	Image1:setTopBottom( false, false, -56, -52.5 )
	Image1:setRGB( 1, 1, 1 )
	Image1:setZRot( 180 )
	Image1:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( true, false, 57, 93 )
	Image3:setTopBottom( false, false, 134.56, 138.06 )
	Image3:setRGB( 1, 1, 1 )
	Image3:setZRot( 180 )
	Image3:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image4 = LUI.UIImage.new()
	Image4:setLeftRight( true, false, 57, 93 )
	Image4:setTopBottom( false, false, -121.69, -118.19 )
	Image4:setRGB( 1, 1, 1 )
	Image4:setZRot( 180 )
	Image4:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image4:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	local LineSide0 = LUI.UIImage.new()
	LineSide0:setLeftRight( true, false, 72.5, 77.5 )
	LineSide0:setTopBottom( true, false, 255.06, 485.44 )
	LineSide0:setRGB( 1, 1, 1 )
	LineSide0:setAlpha( 0.8 )
	LineSide0:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide0 )
	self.LineSide0 = LineSide0
	
	local Image40 = LUI.UIImage.new()
	Image40:setLeftRight( true, false, 54, 70 )
	Image40:setTopBottom( true, false, 336.06, 388.06 )
	Image40:setRGB( 1, 1, 1 )
	Image40:setZoom( -5 )
	Image40:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	Image40:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image40 )
	self.Image40 = Image40
	
	local Image30 = LUI.UIImage.new()
	Image30:setLeftRight( true, false, 1063, 1099 )
	Image30:setTopBottom( false, false, 134.22, 137.91 )
	Image30:setRGB( 1, 1, 1 )
	Image30:setZRot( 360 )
	Image30:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image30:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image30 )
	self.Image30 = Image30
	
	local Image41 = LUI.UIImage.new()
	Image41:setLeftRight( true, false, 1063, 1099 )
	Image41:setTopBottom( false, false, -121, -117.5 )
	Image41:setRGB( 1, 1, 1 )
	Image41:setZRot( 360 )
	Image41:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image41:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image41 )
	self.Image41 = Image41
	
	local Image400 = LUI.UIImage.new()
	Image400:setLeftRight( true, false, 1084, 1100 )
	Image400:setTopBottom( true, false, 341, 393 )
	Image400:setRGB( 1, 1, 1 )
	Image400:setZoom( -5 )
	Image400:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	Image400:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image400 )
	self.Image400 = Image400
	
	local Image10 = LUI.UIImage.new()
	Image10:setLeftRight( true, false, 539, 575 )
	Image10:setTopBottom( false, false, -14, -10.5 )
	Image10:setRGB( 1, 1, 1 )
	Image10:setZRot( 180 )
	Image10:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image10:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image10 )
	self.Image10 = Image10
	
	local List1ButtonLargeLeftND0 = CoD.List1ButtonLarge_Left_ND.new( self, controller )
	List1ButtonLargeLeftND0:setLeftRight( true, false, 585, 865 )
	List1ButtonLargeLeftND0:setTopBottom( true, false, 388.81, 420.81 )
	List1ButtonLargeLeftND0:setRGB( 1, 1, 1 )
	List1ButtonLargeLeftND0.btnDisplayText:setText( Engine.Localize( "MENU_CONFIRM_CAPS" ) )
	List1ButtonLargeLeftND0.btnDisplayTextStroke:setText( Engine.Localize( "MENU_CONFIRM_CAPS" ) )
	List1ButtonLargeLeftND0:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		Gunsmith_ConfirmVariantName( self, element, controller )
		ClearMenuSavedState( self )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
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
	self:addElement( List1ButtonLargeLeftND0 )
	self.List1ButtonLargeLeftND0 = List1ButtonLargeLeftND0
	
	local LineSide00 = LUI.UIImage.new()
	LineSide00:setLeftRight( true, false, 1078.5, 1083.5 )
	LineSide00:setTopBottom( true, false, 255.06, 485.44 )
	LineSide00:setRGB( 1, 1, 1 )
	LineSide00:setAlpha( 0.8 )
	LineSide00:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide00 )
	self.LineSide00 = LineSide00
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, false, 0, 1280 )
	CategoryListLine:setTopBottom( true, false, 191.83, 199.5 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	CategoryListLine:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local CategoryListLine0 = LUI.UIImage.new()
	CategoryListLine0:setLeftRight( true, false, 0, 1280 )
	CategoryListLine0:setTopBottom( true, false, 533.83, 541.5 )
	CategoryListLine0:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine0:setAlpha( 0.25 )
	CategoryListLine0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	CategoryListLine0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( CategoryListLine0 )
	self.CategoryListLine0 = CategoryListLine0
	
	local CategoryListLine00 = LUI.UIImage.new()
	CategoryListLine00:setLeftRight( true, false, 0, 1280 )
	CategoryListLine00:setTopBottom( true, false, 578.83, 586.5 )
	CategoryListLine00:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine00:setAlpha( 0.25 )
	CategoryListLine00:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	CategoryListLine00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( CategoryListLine00 )
	self.CategoryListLine00 = CategoryListLine00
	
	variantNameInput.navigation = {
		down = List1ButtonLargeLeftND0
	}
	List1ButtonLargeLeftND0.navigation = {
		up = variantNameInput
	}
	self.buttonPromptAddFunctions = {}
	self.buttonPromptAddFunctions.secondary = function ( menu, element, event )
		return true
	end
	
	self:registerEventHandler( "ui_keyboard_input", function ( element, event )
		local retVal = nil
		Gunsmith_HandleKeyboardComplete( self, element, controller, event )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "secondary" or event.button == "key_shortcut" and event.key == "ESCAPE") then
			GoBack( self, controller )
			ClearMenuSavedState( self )
			Gunsmith_CreateVariantNameBack( self, element, controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
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
	self.close = function ( self )
		self.GunsmithFullPopupBackground:close()
		self.variantNameInput:close()
		self.StartMenuTitlePopup:close()
		self.List1ButtonLargeLeftND0:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

