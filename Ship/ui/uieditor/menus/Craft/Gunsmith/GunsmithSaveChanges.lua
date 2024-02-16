-- 2c661fe3f064f7460c0cf089e2bab958
-- This hash is used for caching, delete to decompile the file again

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
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "GunsmithSaveChanges.buttonPrompts" )
	local f2_local1 = self
	self.anyChildUsesUpdateState = true
	
	local Panel = LUI.UIImage.new()
	Panel:setLeftRight( true, true, 0, 0 )
	Panel:setTopBottom( true, true, 0, 0 )
	Panel:setRGB( 0, 0, 0 )
	Panel:setAlpha( 0 )
	self:addElement( Panel )
	self.Panel = Panel
	
	local GunsmithFullPopupBackground = CoD.GunsmithFullPopupBackground.new( f2_local1, controller )
	GunsmithFullPopupBackground:setLeftRight( true, false, 0, 1280 )
	GunsmithFullPopupBackground:setTopBottom( true, false, -1.5, 718.5 )
	self:addElement( GunsmithFullPopupBackground )
	self.GunsmithFullPopupBackground = GunsmithFullPopupBackground
	
	local variantImage = LUI.UIImage.new()
	variantImage:setLeftRight( true, false, 111.5, 509.73 )
	variantImage:setTopBottom( true, false, 245.75, 505.06 )
	variantImage:setAlpha( 0 )
	self:addElement( variantImage )
	self.variantImage = variantImage
	
	local subTitle = LUI.UIText.new()
	subTitle:setLeftRight( true, false, 131, 1085 )
	subTitle:setTopBottom( true, false, 282.06, 307.06 )
	subTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	subTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	subTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	subTitle:subscribeToGlobalModel( controller, "Customization", "weapon_index", function ( model )
		local weaponIndex = Engine.GetModelValue( model )
		if weaponIndex then
			subTitle:setText( LocalizeWeaponNameIntoString( "MENU_GUNSMITH_SAVE_CHANGES_SUBTITLE", "mp", controller, weaponIndex ) )
		end
	end )
	self:addElement( subTitle )
	self.subTitle = subTitle
	
	local StartMenuTitlePopup = CoD.StartMenu_TitlePopup.new( f2_local1, controller )
	StartMenuTitlePopup:setLeftRight( true, false, 7, 1188 )
	StartMenuTitlePopup:setTopBottom( true, false, 112, 258 )
	self:addElement( StartMenuTitlePopup )
	self.StartMenuTitlePopup = StartMenuTitlePopup
	
	local yesButton = CoD.List1ButtonLarge_Left_ND.new( f2_local1, controller )
	yesButton:setLeftRight( true, false, 131, 411 )
	yesButton:setTopBottom( true, false, 381.06, 413.06 )
	yesButton.btnDisplayText:setText( LocalizeToUpperString( "MENU_SAVE" ) )
	yesButton.btnDisplayTextStroke:setText( LocalizeToUpperString( "MENU_SAVE" ) )
	yesButton:registerEventHandler( "gain_focus", function ( element, event )
		local f4_local0 = nil
		if element.gainFocus then
			f4_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f4_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f2_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f4_local0
	end )
	yesButton:registerEventHandler( "lose_focus", function ( element, event )
		local f5_local0 = nil
		if element.loseFocus then
			f5_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f5_local0 = element.super:loseFocus( event )
		end
		return f5_local0
	end )
	f2_local1:AddButtonCallbackFunction( yesButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f6_arg0, f6_arg1, f6_arg2, f6_arg3 )
		Gunsmith_SaveChangesButtonAction( self, f6_arg0, "save", f6_arg2 )
		ForceNotifyModel( f6_arg2, "Gunsmith.UpdateDataSource" )
		Gunsmith_ClearCACWithUpdatedVariant( self, f6_arg2 )
		ClearMenuSavedState( f6_arg1 )
		return true
	end, function ( f7_arg0, f7_arg1, f7_arg2 )
		CoD.Menu.SetButtonLabel( f7_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( yesButton )
	self.yesButton = yesButton
	
	local noButton = CoD.List1ButtonLarge_Left_ND.new( f2_local1, controller )
	noButton:setLeftRight( true, false, 131, 411 )
	noButton:setTopBottom( true, false, 418.06, 450.06 )
	noButton.btnDisplayText:setText( LocalizeToUpperString( "MENU_DISCARD" ) )
	noButton.btnDisplayTextStroke:setText( LocalizeToUpperString( "MENU_DISCARD" ) )
	noButton:registerEventHandler( "gain_focus", function ( element, event )
		local f8_local0 = nil
		if element.gainFocus then
			f8_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f8_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f2_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f8_local0
	end )
	noButton:registerEventHandler( "lose_focus", function ( element, event )
		local f9_local0 = nil
		if element.loseFocus then
			f9_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f9_local0 = element.super:loseFocus( event )
		end
		return f9_local0
	end )
	f2_local1:AddButtonCallbackFunction( noButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f10_arg0, f10_arg1, f10_arg2, f10_arg3 )
		Gunsmith_SaveChangesButtonAction( self, f10_arg0, "discard", f10_arg2 )
		ClearMenuSavedState( f10_arg1 )
		return true
	end, function ( f11_arg0, f11_arg1, f11_arg2 )
		CoD.Menu.SetButtonLabel( f11_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( noButton )
	self.noButton = noButton
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( true, false, 57, 93 )
	Image3:setTopBottom( false, false, 130.56, 134.06 )
	Image3:setZRot( 180 )
	Image3:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image4 = LUI.UIImage.new()
	Image4:setLeftRight( true, false, 57, 93 )
	Image4:setTopBottom( false, false, -125.69, -122.19 )
	Image4:setZRot( 180 )
	Image4:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image4:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	local LineSide0 = LUI.UIImage.new()
	LineSide0:setLeftRight( true, false, 72.5, 77.5 )
	LineSide0:setTopBottom( true, false, 251.06, 481.44 )
	LineSide0:setAlpha( 0.8 )
	LineSide0:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide0 )
	self.LineSide0 = LineSide0
	
	local Image40 = LUI.UIImage.new()
	Image40:setLeftRight( true, false, 56, 72 )
	Image40:setTopBottom( true, false, 284.06, 336.06 )
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
	
	local CategoryListLine01 = LUI.UIImage.new()
	CategoryListLine01:setLeftRight( true, false, 0, 1280 )
	CategoryListLine01:setTopBottom( true, false, 130.83, 138.5 )
	CategoryListLine01:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine01:setAlpha( 0.25 )
	CategoryListLine01:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine01 )
	self.CategoryListLine01 = CategoryListLine01
	
	local Image400 = LUI.UIImage.new()
	Image400:setLeftRight( true, false, 56, 72 )
	Image400:setTopBottom( true, false, 392.06, 444.06 )
	Image400:setZoom( -5 )
	Image400:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	Image400:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image400 )
	self.Image400 = Image400
	
	self.StartMenuTitlePopup:linkToElementModel( self, "variantName", true, function ( model )
		local variantName = Engine.GetModelValue( model )
		if variantName then
			StartMenuTitlePopup.StartMenuTitleContainerLOC.StartMenu3dTitle.StartMenu3dTitleLabel.Label0:setText( LocalizeIntoString( "MENU_GUNSMITH_SAVE_CHANGES_TITLE", variantName ) )
		end
	end )
	yesButton.navigation = {
		down = noButton
	}
	noButton.navigation = {
		up = yesButton
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		ArabicFrontEnd = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				subTitle:completeAnimation()
				self.subTitle:setLeftRight( true, false, 131, 1088 )
				self.subTitle:setTopBottom( true, false, 282.06, 307.06 )
				self.subTitle:setAlpha( 1 )
				self.clipFinished( subTitle, {} )
				StartMenuTitlePopup:completeAnimation()
				self.StartMenuTitlePopup:setLeftRight( true, false, -51, 1184 )
				self.StartMenuTitlePopup:setTopBottom( true, false, 112, 258 )
				self.StartMenuTitlePopup:setAlpha( 1 )
				self.clipFinished( StartMenuTitlePopup, {} )
				yesButton:completeAnimation()
				self.yesButton:setLeftRight( true, false, 808, 1088 )
				self.yesButton:setTopBottom( true, false, 381.06, 418.06 )
				self.yesButton:setAlpha( 1 )
				self.clipFinished( yesButton, {} )
				noButton:completeAnimation()
				self.noButton:setLeftRight( true, false, 808, 1088 )
				self.noButton:setTopBottom( true, false, 418.06, 450.06 )
				self.noButton:setAlpha( 1 )
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
	CoD.Menu.AddNavigationHandler( f2_local1, self, controller )
	f2_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f16_arg0, f16_arg1, f16_arg2, f16_arg3 )
		GoBack( self, f16_arg2 )
		ClearMenuSavedState( f16_arg1 )
		return true
	end, function ( f17_arg0, f17_arg1, f17_arg2 )
		CoD.Menu.SetButtonLabel( f17_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "" )
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
		menu = f2_local1
	} )
	if not self:restoreState() then
		self.yesButton:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GunsmithFullPopupBackground:close()
		element.StartMenuTitlePopup:close()
		element.yesButton:close()
		element.noButton:close()
		element.subTitle:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "GunsmithSaveChanges.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

