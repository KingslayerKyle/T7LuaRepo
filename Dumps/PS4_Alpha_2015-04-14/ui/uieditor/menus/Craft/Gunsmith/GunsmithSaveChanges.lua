require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithFullPopupBackground" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_TitlePopup" )
require( "ui.uieditor.widgets.Lobby.Common.List1ButtonLarge_Left_ND" )

local PreLoadFunc = function ( self, controller )
	self:setModel( CoD.perController[controller].gunsmithVariantModel )
end

LUI.createMenu.GunsmithSaveChanges = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "GunsmithSaveChanges" )
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
	Panel:setLeftRight( true, true, 0, 0 )
	Panel:setTopBottom( true, true, 0, 0 )
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
	
	local variantImage = LUI.UIImage.new()
	variantImage:setLeftRight( true, false, 111.5, 509.73 )
	variantImage:setTopBottom( true, false, 245.75, 505.06 )
	variantImage:setRGB( 1, 1, 1 )
	variantImage:setAlpha( 0 )
	variantImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( variantImage )
	self.variantImage = variantImage
	
	local subTitle = LUI.UIText.new()
	subTitle:setLeftRight( true, false, 131, 816 )
	subTitle:setTopBottom( true, false, 282.06, 307.06 )
	subTitle:setRGB( 1, 1, 1 )
	subTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	subTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	subTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	subTitle:subscribeToGlobalModel( controller, "Customization", "weapon_index", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			subTitle:setText( Engine.Localize( LocalizeWeaponNameIntoString( modelValue, "MENU_GUNSMITH_SAVE_CHANGES_SUBTITLE", controller ) ) )
		end
	end )
	self:addElement( subTitle )
	self.subTitle = subTitle
	
	local StartMenuTitlePopup = CoD.StartMenu_TitlePopup.new( self, controller )
	StartMenuTitlePopup:setLeftRight( true, false, -51, 848 )
	StartMenuTitlePopup:setTopBottom( true, false, 112, 258 )
	StartMenuTitlePopup:setRGB( 1, 1, 1 )
	self:addElement( StartMenuTitlePopup )
	self.StartMenuTitlePopup = StartMenuTitlePopup
	
	local yesButton = CoD.List1ButtonLarge_Left_ND.new( self, controller )
	yesButton:setLeftRight( true, false, 131, 411 )
	yesButton:setTopBottom( true, false, 381.06, 413.06 )
	yesButton:setRGB( 1, 1, 1 )
	yesButton.btnDisplayText:setText( Engine.Localize( "MPUI_YES" ) )
	yesButton.btnDisplayTextStroke:setText( Engine.Localize( "MPUI_YES" ) )
	yesButton:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		Gunsmith_SaveChangesButtonAction( self, element, "save", controller )
		Gunsmith_ClearCACWithUpdatedVariant( self, controller )
		ClearMenuSavedState( self )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( yesButton )
	self.yesButton = yesButton
	
	local noButton = CoD.List1ButtonLarge_Left_ND.new( self, controller )
	noButton:setLeftRight( true, false, 131, 411 )
	noButton:setTopBottom( true, false, 422.06, 454.06 )
	noButton:setRGB( 1, 1, 1 )
	noButton.btnDisplayText:setText( Engine.Localize( "MPUI_ELITE_APP_DOWNLOAD_NO" ) )
	noButton.btnDisplayTextStroke:setText( Engine.Localize( "MPUI_ELITE_APP_DOWNLOAD_NO" ) )
	noButton:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		Gunsmith_SaveChangesButtonAction( self, element, "discard", controller )
		ClearMenuSavedState( self )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( noButton )
	self.noButton = noButton
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( true, false, 57, 93 )
	Image3:setTopBottom( false, false, 130.56, 134.06 )
	Image3:setRGB( 1, 1, 1 )
	Image3:setZRot( 180 )
	Image3:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image4 = LUI.UIImage.new()
	Image4:setLeftRight( true, false, 57, 93 )
	Image4:setTopBottom( false, false, -125.69, -122.19 )
	Image4:setRGB( 1, 1, 1 )
	Image4:setZRot( 180 )
	Image4:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image4:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	local LineSide0 = LUI.UIImage.new()
	LineSide0:setLeftRight( true, false, 72.5, 77.5 )
	LineSide0:setTopBottom( true, false, 251.06, 481.44 )
	LineSide0:setRGB( 1, 1, 1 )
	LineSide0:setAlpha( 0.8 )
	LineSide0:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide0 )
	self.LineSide0 = LineSide0
	
	local Image40 = LUI.UIImage.new()
	Image40:setLeftRight( true, false, 56, 72 )
	Image40:setTopBottom( true, false, 284.06, 336.06 )
	Image40:setRGB( 1, 1, 1 )
	Image40:setZoom( -5 )
	Image40:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	Image40:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image40 )
	self.Image40 = Image40
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, false, 0, 1280 )
	CategoryListLine:setTopBottom( true, false, 192.83, 200.5 )
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
	
	local CategoryListLine01 = LUI.UIImage.new()
	CategoryListLine01:setLeftRight( true, false, 0, 1280 )
	CategoryListLine01:setTopBottom( true, false, 130.83, 138.5 )
	CategoryListLine01:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine01:setAlpha( 0.25 )
	CategoryListLine01:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	CategoryListLine01:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( CategoryListLine01 )
	self.CategoryListLine01 = CategoryListLine01
	
	local Image400 = LUI.UIImage.new()
	Image400:setLeftRight( true, false, 56, 72 )
	Image400:setTopBottom( true, false, 392.06, 444.06 )
	Image400:setRGB( 1, 1, 1 )
	Image400:setZoom( -5 )
	Image400:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	Image400:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image400 )
	self.Image400 = Image400
	
	self.StartMenuTitlePopup:linkToElementModel( self, "variantName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			StartMenuTitlePopup.StartMenuTitleContainerLOC.StartMenu3dTitle.StartMenu3dTitleLabel.Label0:setText( Engine.Localize( LocalizeIntoString( modelValue, "MENU_GUNSMITH_SAVE_CHANGES_TITLE" ) ) )
		end
	end )
	yesButton.navigation = {
		down = noButton
	}
	noButton.navigation = {
		up = yesButton
	}
	self.buttonPromptAddFunctions = {}
	self.buttonPromptAddFunctions.secondary = function ( menu, element, event )
		return true
	end
	
	self:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "secondary" or event.button == "key_shortcut" and event.key == "ESCAPE") then
			GoBack( self, controller )
			ClearMenuSavedState( self )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	yesButton.id = "yesButton"
	noButton.id = "noButton"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.yesButton:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	self.close = function ( self )
		self.GunsmithFullPopupBackground:close()
		self.StartMenuTitlePopup:close()
		self.yesButton:close()
		self.noButton:close()
		self.subTitle:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

