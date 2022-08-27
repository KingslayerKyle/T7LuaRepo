-- c720ada59d360e219e5d7b8fd940441a
-- This hash is used for caching, delete to decompile the file again

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
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "GunsmithCreateVariantName.buttonPrompts" )
	local f2_local1 = self
	self.anyChildUsesUpdateState = true
	
	local Panel = LUI.UIImage.new()
	Panel:setLeftRight( true, false, 0, 1280 )
	Panel:setTopBottom( true, false, 0, 720 )
	Panel:setRGB( 0, 0, 0 )
	Panel:setAlpha( 0 )
	self:addElement( Panel )
	self.Panel = Panel
	
	local GunsmithFullPopupBackground = CoD.GunsmithFullPopupBackground.new( f2_local1, controller )
	GunsmithFullPopupBackground:setLeftRight( true, false, 0, 1280 )
	GunsmithFullPopupBackground:setTopBottom( true, false, -1.5, 718.5 )
	self:addElement( GunsmithFullPopupBackground )
	self.GunsmithFullPopupBackground = GunsmithFullPopupBackground
	
	local black0 = LUI.UIImage.new()
	black0:setLeftRight( true, false, 585, 965 )
	black0:setTopBottom( true, false, 305.75, 347.75 )
	black0:setAlpha( 0.12 )
	self:addElement( black0 )
	self.black0 = black0
	
	local variantNameInput = CoD.GunsmithInputButton.new( f2_local1, controller )
	variantNameInput:setLeftRight( true, false, 583, 968 )
	variantNameInput:setTopBottom( true, false, 304, 351 )
	variantNameInput.Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	variantNameInput:linkToElementModel( self, "variantTextEntry", true, function ( model )
		local variantTextEntry = Engine.GetModelValue( model )
		if variantTextEntry then
			variantNameInput.Text:setText( variantTextEntry )
		end
	end )
	variantNameInput:registerEventHandler( "gain_focus", function ( element, event )
		local f4_local0 = nil
		if element.gainFocus then
			f4_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f4_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f2_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f4_local0
	end )
	variantNameInput:registerEventHandler( "lose_focus", function ( element, event )
		local f5_local0 = nil
		if element.loseFocus then
			f5_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f5_local0 = element.super:loseFocus( event )
		end
		return f5_local0
	end )
	f2_local1:AddButtonCallbackFunction( variantNameInput, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f6_arg0, f6_arg1, f6_arg2, f6_arg3 )
		ShowKeyboard( self, f6_arg0, f6_arg2, "KEYBOARD_TYPE_GUNSMITH" )
		return true
	end, function ( f7_arg0, f7_arg1, f7_arg2 )
		CoD.Menu.SetButtonLabel( f7_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( variantNameInput )
	self.variantNameInput = variantNameInput
	
	local variantImage = LUI.UIImage.new()
	variantImage:setLeftRight( true, false, 123, 515 )
	variantImage:setTopBottom( true, false, 240, 496.06 )
	variantImage:setImage( RegisterImage( "uie_t7_menu_gunsmith_nameyourvariant" ) )
	self:addElement( variantImage )
	self.variantImage = variantImage
	
	local StartMenuTitlePopup = CoD.StartMenu_TitlePopup.new( f2_local1, controller )
	StartMenuTitlePopup:setLeftRight( true, false, -51, 848 )
	StartMenuTitlePopup:setTopBottom( true, false, 109, 255 )
	StartMenuTitlePopup:subscribeToGlobalModel( controller, "Customization", "weapon_index", function ( model )
		local weaponIndex = Engine.GetModelValue( model )
		if weaponIndex then
			StartMenuTitlePopup.StartMenuTitleContainerLOC.StartMenu3dTitle.StartMenu3dTitleLabel.Label0:setText( LocalizeWeaponNameIntoString( "MENU_GUNSMITH_CREATE_VARIANT_NAME_TITLE", "mp", controller, weaponIndex ) )
		end
	end )
	self:addElement( StartMenuTitlePopup )
	self.StartMenuTitlePopup = StartMenuTitlePopup
	
	local Image5 = LUI.UIImage.new()
	Image5:setLeftRight( true, false, 976, 1012 )
	Image5:setTopBottom( false, false, -56, -52.5 )
	Image5:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image5:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image5 )
	self.Image5 = Image5
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 976, 1012 )
	Image0:setTopBottom( false, false, -13, -9.5 )
	Image0:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, 539, 575 )
	Image1:setTopBottom( false, false, -56, -52.5 )
	Image1:setZRot( 180 )
	Image1:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( true, false, 57, 93 )
	Image3:setTopBottom( false, false, 134.56, 138.06 )
	Image3:setZRot( 180 )
	Image3:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image4 = LUI.UIImage.new()
	Image4:setLeftRight( true, false, 57, 93 )
	Image4:setTopBottom( false, false, -121.69, -118.19 )
	Image4:setZRot( 180 )
	Image4:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image4:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	local LineSide0 = LUI.UIImage.new()
	LineSide0:setLeftRight( true, false, 72.5, 77.5 )
	LineSide0:setTopBottom( true, false, 255.06, 485.44 )
	LineSide0:setAlpha( 0.8 )
	LineSide0:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide0 )
	self.LineSide0 = LineSide0
	
	local Image40 = LUI.UIImage.new()
	Image40:setLeftRight( true, false, 54, 70 )
	Image40:setTopBottom( true, false, 336.06, 388.06 )
	Image40:setZoom( -5 )
	Image40:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	Image40:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image40 )
	self.Image40 = Image40
	
	local Image30 = LUI.UIImage.new()
	Image30:setLeftRight( true, false, 1063, 1099 )
	Image30:setTopBottom( false, false, 134.22, 137.91 )
	Image30:setZRot( 360 )
	Image30:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image30:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image30 )
	self.Image30 = Image30
	
	local Image41 = LUI.UIImage.new()
	Image41:setLeftRight( true, false, 1063, 1099 )
	Image41:setTopBottom( false, false, -121, -117.5 )
	Image41:setZRot( 360 )
	Image41:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image41:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image41 )
	self.Image41 = Image41
	
	local Image400 = LUI.UIImage.new()
	Image400:setLeftRight( true, false, 1084, 1100 )
	Image400:setTopBottom( true, false, 341, 393 )
	Image400:setZoom( -5 )
	Image400:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	Image400:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image400 )
	self.Image400 = Image400
	
	local Image10 = LUI.UIImage.new()
	Image10:setLeftRight( true, false, 539, 575 )
	Image10:setTopBottom( false, false, -14, -10.5 )
	Image10:setZRot( 180 )
	Image10:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image10:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image10 )
	self.Image10 = Image10
	
	local List1ButtonLargeLeftND0 = CoD.List1ButtonLarge_Left_ND.new( f2_local1, controller )
	List1ButtonLargeLeftND0:setLeftRight( true, false, 585, 865 )
	List1ButtonLargeLeftND0:setTopBottom( true, false, 388.81, 420.81 )
	List1ButtonLargeLeftND0.btnDisplayText:setText( Engine.Localize( "MENU_CONFIRM_CAPS" ) )
	List1ButtonLargeLeftND0.btnDisplayTextStroke:setText( Engine.Localize( "MENU_CONFIRM_CAPS" ) )
	List1ButtonLargeLeftND0:registerEventHandler( "gain_focus", function ( element, event )
		local f9_local0 = nil
		if element.gainFocus then
			f9_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f9_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f2_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f9_local0
	end )
	List1ButtonLargeLeftND0:registerEventHandler( "lose_focus", function ( element, event )
		local f10_local0 = nil
		if element.loseFocus then
			f10_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f10_local0 = element.super:loseFocus( event )
		end
		return f10_local0
	end )
	f2_local1:AddButtonCallbackFunction( List1ButtonLargeLeftND0, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f11_arg0, f11_arg1, f11_arg2, f11_arg3 )
		Gunsmith_ConfirmVariantName( self, f11_arg0, f11_arg2, f11_arg1 )
		ClearMenuSavedState( f11_arg1 )
		return true
	end, function ( f12_arg0, f12_arg1, f12_arg2 )
		CoD.Menu.SetButtonLabel( f12_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	List1ButtonLargeLeftND0:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return not Gunsmith_ValidVariantNameEntered( element, controller )
			end
		}
	} )
	List1ButtonLargeLeftND0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Gunsmith.validVariantNameEntered" ), function ( model )
		f2_local1:updateElementState( List1ButtonLargeLeftND0, {
			name = "model_validation",
			menu = f2_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "Gunsmith.validVariantNameEntered"
		} )
	end )
	self:addElement( List1ButtonLargeLeftND0 )
	self.List1ButtonLargeLeftND0 = List1ButtonLargeLeftND0
	
	local LineSide00 = LUI.UIImage.new()
	LineSide00:setLeftRight( true, false, 1078.5, 1083.5 )
	LineSide00:setTopBottom( true, false, 255.06, 485.44 )
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
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local CategoryListLine0 = LUI.UIImage.new()
	CategoryListLine0:setLeftRight( true, false, 0, 1280 )
	CategoryListLine0:setTopBottom( true, false, 533.83, 541.5 )
	CategoryListLine0:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine0:setAlpha( 0.25 )
	CategoryListLine0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine0 )
	self.CategoryListLine0 = CategoryListLine0
	
	local CategoryListLine00 = LUI.UIImage.new()
	CategoryListLine00:setLeftRight( true, false, 0, 1280 )
	CategoryListLine00:setTopBottom( true, false, 578.83, 586.5 )
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
	CoD.Menu.AddNavigationHandler( f2_local1, self, controller )
	self:registerEventHandler( "ui_keyboard_input", function ( element, event )
		local f15_local0 = nil
		Gunsmith_HandleKeyboardComplete( self, element, controller, event )
		if not f15_local0 then
			f15_local0 = element:dispatchEventToChildren( event )
		end
		return f15_local0
	end )
	f2_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f16_arg0, f16_arg1, f16_arg2, f16_arg3 )
		Gunsmith_CreateVariantNameBack( self, f16_arg0, f16_arg2 )
		GoBack( self, f16_arg2 )
		ClearMenuSavedState( f16_arg1 )
		return true
	end, function ( f17_arg0, f17_arg1, f17_arg2 )
		CoD.Menu.SetButtonLabel( f17_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "" )
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
		menu = f2_local1
	} )
	if not self:restoreState() then
		self.variantNameInput:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GunsmithFullPopupBackground:close()
		element.variantNameInput:close()
		element.StartMenuTitlePopup:close()
		element.List1ButtonLargeLeftND0:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "GunsmithCreateVariantName.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

