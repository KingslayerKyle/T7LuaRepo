require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithFullPopupBackground" )
require( "ui.uieditor.widgets.Lobby.Common.List1ButtonLarge_Left_ND" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_TitlePopup" )

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
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "GunsmithSaveChanges.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local Panel = LUI.UIImage.new()
	Panel:setLeftRight( 0, 1, 0, 0 )
	Panel:setTopBottom( 0, 1, 0, 0 )
	Panel:setRGB( 0, 0, 0 )
	Panel:setAlpha( 0 )
	self:addElement( Panel )
	self.Panel = Panel
	
	local GunsmithFullPopupBackground = CoD.GunsmithFullPopupBackground.new( self, controller )
	GunsmithFullPopupBackground:setLeftRight( 0, 0, 0, 1920 )
	GunsmithFullPopupBackground:setTopBottom( 0, 0, -2, 1078 )
	self:addElement( GunsmithFullPopupBackground )
	self.GunsmithFullPopupBackground = GunsmithFullPopupBackground
	
	local variantImage = LUI.UIImage.new()
	variantImage:setLeftRight( 0, 0, 167, 764 )
	variantImage:setTopBottom( 0, 0, 369, 758 )
	variantImage:setAlpha( 0 )
	self:addElement( variantImage )
	self.variantImage = variantImage
	
	local subTitle = LUI.UIText.new()
	subTitle:setLeftRight( 0, 0, 196, 1627 )
	subTitle:setTopBottom( 0, 0, 423, 461 )
	subTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	subTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	subTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	subTitle:subscribeToGlobalModel( controller, "Customization", "weapon_index", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			subTitle:setText( LocalizeWeaponNameIntoString( "MENU_GUNSMITH_SAVE_CHANGES_SUBTITLE", controller, modelValue ) )
		end
	end )
	self:addElement( subTitle )
	self.subTitle = subTitle
	
	local StartMenuTitlePopup = CoD.StartMenu_TitlePopup.new( self, controller )
	StartMenuTitlePopup:setLeftRight( 0, 0, 10, 1782 )
	StartMenuTitlePopup:setTopBottom( 0, 0, 168.5, 387.5 )
	self:addElement( StartMenuTitlePopup )
	self.StartMenuTitlePopup = StartMenuTitlePopup
	
	local yesButton = CoD.List1ButtonLarge_Left_ND.new( self, controller )
	yesButton:setLeftRight( 0, 0, 196, 616 )
	yesButton:setTopBottom( 0, 0, 572, 620 )
	yesButton.btnDisplayText:setText( LocalizeToUpperString( "MENU_SAVE" ) )
	yesButton.btnDisplayTextStroke:setText( LocalizeToUpperString( "MENU_SAVE" ) )
	yesButton:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	yesButton:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( yesButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		Gunsmith_SaveChangesButtonAction( self, element, "save", controller )
		ForceNotifyModel( controller, "Gunsmith.UpdateDataSource" )
		Gunsmith_ClearCACWithUpdatedVariant( self, controller )
		ClearMenuSavedState( menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( yesButton )
	self.yesButton = yesButton
	
	local noButton = CoD.List1ButtonLarge_Left_ND.new( self, controller )
	noButton:setLeftRight( 0, 0, 196, 616 )
	noButton:setTopBottom( 0, 0, 627, 675 )
	noButton.btnDisplayText:setText( LocalizeToUpperString( "MENU_DISCARD" ) )
	noButton.btnDisplayTextStroke:setText( LocalizeToUpperString( "MENU_DISCARD" ) )
	noButton:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	noButton:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( noButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		Gunsmith_SaveChangesButtonAction( self, element, "discard", controller )
		ClearMenuSavedState( menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( noButton )
	self.noButton = noButton
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( 0, 0, 85, 139 )
	Image3:setTopBottom( 0.5, 0.5, 196, 201 )
	Image3:setZRot( 180 )
	Image3:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image4 = LUI.UIImage.new()
	Image4:setLeftRight( 0, 0, 85, 139 )
	Image4:setTopBottom( 0.5, 0.5, -188, -183 )
	Image4:setZRot( 180 )
	Image4:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image4:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	local LineSide0 = LUI.UIImage.new()
	LineSide0:setLeftRight( 0, 0, 108, 116 )
	LineSide0:setTopBottom( 0, 0, 376, 722 )
	LineSide0:setAlpha( 0.8 )
	LineSide0:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide0 )
	self.LineSide0 = LineSide0
	
	local Image40 = LUI.UIImage.new()
	Image40:setLeftRight( 0, 0, 84, 108 )
	Image40:setTopBottom( 0, 0, 426, 504 )
	Image40:setZoom( -5 )
	Image40:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	Image40:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image40 )
	self.Image40 = Image40
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( 0, 0, 0, 1920 )
	CategoryListLine:setTopBottom( 0, 0, 289, 301 )
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
	
	local CategoryListLine01 = LUI.UIImage.new()
	CategoryListLine01:setLeftRight( 0, 0, 0, 1920 )
	CategoryListLine01:setTopBottom( 0, 0, 196, 208 )
	CategoryListLine01:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine01:setAlpha( 0.25 )
	CategoryListLine01:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine01 )
	self.CategoryListLine01 = CategoryListLine01
	
	local Image400 = LUI.UIImage.new()
	Image400:setLeftRight( 0, 0, 84, 108 )
	Image400:setTopBottom( 0, 0, 588, 666 )
	Image400:setZoom( -5 )
	Image400:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	Image400:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image400 )
	self.Image400 = Image400
	
	self.StartMenuTitlePopup:linkToElementModel( self, "variantName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			StartMenuTitlePopup.StartMenuTitleContainerLOC.StartMenu3dTitle.StartMenu3dTitleLabel.Label0:setText( LocalizeIntoString( "MENU_GUNSMITH_SAVE_CHANGES_TITLE", modelValue ) )
		end
	end )
	yesButton.navigation = {
		down = noButton
	}
	noButton.navigation = {
		up = yesButton
	}
	self.resetProperties = function ()
		subTitle:completeAnimation()
		StartMenuTitlePopup:completeAnimation()
		yesButton:completeAnimation()
		noButton:completeAnimation()
		subTitle:setLeftRight( 0, 0, 196, 1627 )
		subTitle:setTopBottom( 0, 0, 423, 461 )
		StartMenuTitlePopup:setLeftRight( 0, 0, 10, 1782 )
		StartMenuTitlePopup:setTopBottom( 0, 0, 168.5, 387.5 )
		yesButton:setLeftRight( 0, 0, 196, 616 )
		yesButton:setTopBottom( 0, 0, 572, 620 )
		noButton:setLeftRight( 0, 0, 196, 616 )
		noButton:setTopBottom( 0, 0, 627, 675 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		ArabicFrontEnd = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				subTitle:completeAnimation()
				self.subTitle:setLeftRight( 0, 0, 196.5, 1632.5 )
				self.subTitle:setTopBottom( 0, 0, 423, 461 )
				self.clipFinished( subTitle, {} )
				StartMenuTitlePopup:completeAnimation()
				self.StartMenuTitlePopup:setLeftRight( 0, 0, -76, 1776 )
				self.StartMenuTitlePopup:setTopBottom( 0, 0, 168.5, 387.5 )
				self.clipFinished( StartMenuTitlePopup, {} )
				yesButton:completeAnimation()
				self.yesButton:setLeftRight( 0, 0, 1212, 1632 )
				self.yesButton:setTopBottom( 0, 0, 571, 627 )
				self.clipFinished( yesButton, {} )
				noButton:completeAnimation()
				self.noButton:setLeftRight( 0, 0, 1212, 1632 )
				self.noButton:setTopBottom( 0, 0, 627, 675 )
				self.clipFinished( noButton, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "ArabicFrontEnd",
			condition = function ( menu, element, event )
				return IsInGame() and IsArabicSku()
			end
		}
	} )
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		ClearMenuSavedState( menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "", nil )
		return false
	end, false )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.GunsmithFullPopupBackground:close()
		self.StartMenuTitlePopup:close()
		self.yesButton:close()
		self.noButton:close()
		self.subTitle:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "GunsmithSaveChanges.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

