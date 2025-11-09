require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithFullPopupBackground" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_TitlePopup" )
require( "ui.uieditor.widgets.Lobby.Common.List1ButtonLarge_Left_ND" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.InfoPaneItemNameLabel" )

local PreLoadFunc = function ( self, controller )
	self:setModel( CoD.perController[controller].gunsmithVariantModel )
end

LUI.createMenu.GunsmithVariantOptions = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "GunsmithVariantOptions" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local GunsmithFullPopupBackground = CoD.GunsmithFullPopupBackground.new( self, controller )
	GunsmithFullPopupBackground:setLeftRight( true, false, 0, 1280 )
	GunsmithFullPopupBackground:setTopBottom( true, false, -1.5, 718.5 )
	GunsmithFullPopupBackground:setRGB( 1, 1, 1 )
	self:addElement( GunsmithFullPopupBackground )
	self.GunsmithFullPopupBackground = GunsmithFullPopupBackground
	
	local StartMenuTitlePopup = CoD.StartMenu_TitlePopup.new( self, controller )
	StartMenuTitlePopup:setLeftRight( true, false, -51, 848 )
	StartMenuTitlePopup:setTopBottom( true, false, 112, 258 )
	StartMenuTitlePopup:setRGB( 1, 1, 1 )
	StartMenuTitlePopup:subscribeToGlobalModel( controller, "Customization", "weapon_index", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			StartMenuTitlePopup.StartMenuTitleContainerLOC.StartMenu3dTitle.StartMenu3dTitleLabel.Label0:setText( Engine.Localize( LocalizeWeaponNameIntoString( modelValue, "MENU_GUNSMITH_VARIANT_OPTIONS", controller ) ) )
		end
	end )
	self:addElement( StartMenuTitlePopup )
	self.StartMenuTitlePopup = StartMenuTitlePopup
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( true, false, 57, 93 )
	Image3:setTopBottom( false, false, 141.56, 145.06 )
	Image3:setRGB( 1, 1, 1 )
	Image3:setZRot( 180 )
	Image3:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image4 = LUI.UIImage.new()
	Image4:setLeftRight( true, false, 57, 93 )
	Image4:setTopBottom( false, false, -114.69, -111.19 )
	Image4:setRGB( 1, 1, 1 )
	Image4:setZRot( 180 )
	Image4:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image4:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	local LineSide0 = LUI.UIImage.new()
	LineSide0:setLeftRight( true, false, 72.5, 77.5 )
	LineSide0:setTopBottom( true, false, 262.06, 492.44 )
	LineSide0:setRGB( 1, 1, 1 )
	LineSide0:setAlpha( 0.8 )
	LineSide0:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide0 )
	self.LineSide0 = LineSide0
	
	local Image40 = LUI.UIImage.new()
	Image40:setLeftRight( true, false, 54, 70 )
	Image40:setTopBottom( true, false, 343.06, 395.06 )
	Image40:setRGB( 1, 1, 1 )
	Image40:setZoom( -5 )
	Image40:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	Image40:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image40 )
	self.Image40 = Image40
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, false, 0, 1280 )
	CategoryListLine:setTopBottom( true, false, 194.83, 202.5 )
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
	
	local CategoryListLine010 = LUI.UIImage.new()
	CategoryListLine010:setLeftRight( true, false, 0, 1280 )
	CategoryListLine010:setTopBottom( true, false, 128.83, 136.5 )
	CategoryListLine010:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine010:setAlpha( 0.25 )
	CategoryListLine010:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	CategoryListLine010:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( CategoryListLine010 )
	self.CategoryListLine010 = CategoryListLine010
	
	local Rename = CoD.List1ButtonLarge_Left_ND.new( self, controller )
	Rename:setLeftRight( true, false, 138.73, 418.73 )
	Rename:setTopBottom( true, false, 374.11, 406.11 )
	Rename:setRGB( 1, 1, 1 )
	Rename.btnDisplayText:setText( Engine.Localize( "MENU_GUNSMITH_RENAME_VARIANT" ) )
	Rename.btnDisplayTextStroke:setText( Engine.Localize( "MENU_GUNSMITH_RENAME_VARIANT" ) )
	Rename:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		ShowKeyboard( self, element, controller, "KEYBOARD_TYPE_GUNSMITH" )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	Rename:registerEventHandler( "ui_keyboard_input", function ( element, event )
		local retVal = nil
		Gunsmith_HandleRenameKeyboardComplete( self, element, controller, event )
		Gunsmith_RenameVariant( self, element, controller )
		GoBack( self, controller )
		ClearMenuSavedState( self )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( Rename )
	self.Rename = Rename
	
	local Clear = CoD.List1ButtonLarge_Left_ND.new( self, controller )
	Clear:setLeftRight( true, false, 138.73, 418.73 )
	Clear:setTopBottom( true, false, 416.11, 448.11 )
	Clear:setRGB( 1, 1, 1 )
	Clear.btnDisplayText:setText( Engine.Localize( "MENU_GUNSMITH_CLEAR_VARIANT" ) )
	Clear.btnDisplayTextStroke:setText( Engine.Localize( "MENU_GUNSMITH_CLEAR_VARIANT" ) )
	Clear:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		Gunsmith_ClearVariant( self, element, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( Clear )
	self.Clear = Clear
	
	local itemName = CoD.InfoPaneItemNameLabel.new( self, controller )
	itemName:setLeftRight( false, false, -501.27, -348.51 )
	itemName:setTopBottom( true, false, 290.81, 332.92 )
	itemName:setRGB( 1, 1, 1 )
	itemName:linkToElementModel( self, "variantName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			itemName.itemName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( itemName )
	self.itemName = itemName
	
	Rename.navigation = {
		down = Clear
	}
	Clear.navigation = {
		up = Rename
	}
	self.buttonPromptAddFunctions = {}
	self.buttonPromptAddFunctions.secondary = function ( menu, element, event )
		menu:addButtonPrompt( "secondary", Engine.Localize( "MENU_BACK_CAPS" ), "ESCAPE", element )
		return true
	end
	
	self.buttonPromptAddFunctions.secondary( self, self, {
		controller = controller
	} )
	self:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "secondary" or event.button == "key_shortcut" and event.key == "ESCAPE") then
			GoBack( self, controller )
			ClearSavedState( self, controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	Rename.id = "Rename"
	Clear.id = "Clear"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.Rename:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	self.close = function ( self )
		self.GunsmithFullPopupBackground:close()
		self.StartMenuTitlePopup:close()
		self.Rename:close()
		self.Clear:close()
		self.itemName:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

