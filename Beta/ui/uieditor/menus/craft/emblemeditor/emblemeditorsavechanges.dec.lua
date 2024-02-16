require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithFullPopupBackground" )
require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithInputButton" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_TitlePopup" )
require( "ui.uieditor.widgets.Lobby.Common.List1ButtonLarge_Left_ND" )

local PreLoadFunc = function ( self, controller )
	self:setModel( CoD.perController[controller].selectedEmblemModel )
	self.restoreState = function ( self )
		if Emblem_IsOccupied( self, controller ) then
			self.save:processEvent( {
				name = "gain_focus",
				controller = controller
			} )
		else
			self.emblemNameInput:processEvent( {
				name = "gain_focus",
				controller = controller
			} )
		end
	end
	
end

LUI.createMenu.EmblemEditorSaveChanges = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "EmblemEditorSaveChanges" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "HUD"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "EmblemEditorSaveChanges.buttonPrompts" )
	local menu = self
	self.anyChildUsesUpdateState = true
	
	local Panel = LUI.UIImage.new()
	Panel:setLeftRight( true, false, 0, 1280 )
	Panel:setTopBottom( true, false, 0, 720 )
	Panel:setRGB( 0, 0, 0 )
	Panel:setAlpha( 0 )
	self:addElement( Panel )
	self.Panel = Panel
	
	local GunsmithFullPopupBackground = CoD.GunsmithFullPopupBackground.new( menu, controller )
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
	
	local emblemNameInput = CoD.GunsmithInputButton.new( menu, controller )
	emblemNameInput:setLeftRight( true, false, 583, 968 )
	emblemNameInput:setTopBottom( true, false, 304, 351 )
	emblemNameInput:linkToElementModel( self, nil, false, function ( model )
		emblemNameInput:setModel( model, controller )
	end )
	emblemNameInput:linkToElementModel( self, "emblemTextEntry", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			emblemNameInput.Text:setText( modelValue )
		end
	end )
	emblemNameInput:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	emblemNameInput:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( emblemNameInput, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ShowKeyboard( self, element, controller, "KEYBOARD_TYPE_EMBLEMS" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( emblemNameInput, "setState", function ( element, state )
		if IsElementInState( element, "Disabled" ) then
			MakeNotFocusable( element )
		else
			MakeFocusable( element )
		end
	end )
	emblemNameInput:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return Emblem_IsOccupied( element, controller )
			end
		}
	} )
	self:addElement( emblemNameInput )
	self.emblemNameInput = emblemNameInput
	
	local emblem = LUI.UIElement.new()
	emblem:setLeftRight( true, false, 123, 515 )
	emblem:setTopBottom( true, false, 267.82, 508.31 )
	emblem:subscribeToGlobalModel( controller, "Customization", "type", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			emblem:setupEmblem( modelValue )
		end
	end )
	self:addElement( emblem )
	self.emblem = emblem
	
	local StartMenuTitlePopup = CoD.StartMenu_TitlePopup.new( menu, controller )
	StartMenuTitlePopup:setLeftRight( true, false, -51, 848 )
	StartMenuTitlePopup:setTopBottom( true, false, 109, 255 )
	StartMenuTitlePopup.StartMenuTitleContainerLOC.StartMenu3dTitle.StartMenu3dTitleLabel.Label0:setText( Engine.Localize( "MENU_SAVE_EMBLEM" ) )
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
	
	local save = CoD.List1ButtonLarge_Left_ND.new( menu, controller )
	save:setLeftRight( true, false, 585, 865 )
	save:setTopBottom( true, false, 388.81, 420.81 )
	save.btnDisplayText:setText( Engine.Localize( "MENU_EMBLEM_SAVE_CHANGES" ) )
	save.btnDisplayTextStroke:setText( Engine.Localize( "MENU_EMBLEM_SAVE_CHANGES" ) )
	save:linkToElementModel( self, nil, false, function ( model )
		save:setModel( model, controller )
	end )
	save:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	save:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( save, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		EmblemEditor_SaveEmblem( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( save, "setState", function ( element, state )
		if IsElementInState( element, "Disabled" ) then
			MakeNotFocusable( element )
		else
			MakeFocusable( element )
		end
	end )
	save:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				local f19_local0
				if not Emblems_ValidEmblemNameEntered( element, controller ) then
					f19_local0 = not Emblem_IsOccupied( element, controller )
				else
					f19_local0 = false
				end
				return f19_local0
			end
		}
	} )
	save:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Emblem.validEmblemNameEntered" ), function ( model )
		menu:updateElementState( save, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "Emblem.validEmblemNameEntered"
		} )
	end )
	self:addElement( save )
	self.save = save
	
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
	
	local savePlayerCard = CoD.List1ButtonLarge_Left_ND.new( menu, controller )
	savePlayerCard:setLeftRight( true, false, 585, 865 )
	savePlayerCard:setTopBottom( true, false, 420.81, 452.81 )
	savePlayerCard.btnDisplayText:setText( Engine.Localize( "MENU_EMBLEM_SAVE_AND_SET" ) )
	savePlayerCard.btnDisplayTextStroke:setText( Engine.Localize( "MENU_EMBLEM_SAVE_AND_SET" ) )
	savePlayerCard:linkToElementModel( self, nil, false, function ( model )
		savePlayerCard:setModel( model, controller )
	end )
	savePlayerCard:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	savePlayerCard:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( savePlayerCard, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		EmblemEditor_SaveEmblemAndApplyAsPlayercard( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( savePlayerCard, "setState", function ( element, state )
		if IsElementInState( element, "Disabled" ) then
			MakeNotFocusable( element )
		else
			MakeFocusable( element )
		end
	end )
	savePlayerCard:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				local f27_local0
				if not Emblems_ValidEmblemNameEntered( element, controller ) then
					f27_local0 = not Emblem_IsOccupied( element, controller )
				else
					f27_local0 = false
				end
				return f27_local0
			end
		}
	} )
	savePlayerCard:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Emblem.validEmblemNameEntered" ), function ( model )
		menu:updateElementState( savePlayerCard, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "Emblem.validEmblemNameEntered"
		} )
	end )
	self:addElement( savePlayerCard )
	self.savePlayerCard = savePlayerCard
	
	local discard = CoD.List1ButtonLarge_Left_ND.new( menu, controller )
	discard:setLeftRight( true, false, 585, 865 )
	discard:setTopBottom( true, false, 453.44, 485.44 )
	discard.btnDisplayText:setText( Engine.Localize( "MENU_EMBLEMS_DISCARD" ) )
	discard.btnDisplayTextStroke:setText( Engine.Localize( "MENU_EMBLEMS_DISCARD" ) )
	discard:linkToElementModel( self, nil, false, function ( model )
		discard:setModel( model, controller )
	end )
	discard:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	discard:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( discard, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		EmblemEditor_DiscardChanges( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( discard )
	self.discard = discard
	
	emblemNameInput.navigation = {
		down = save
	}
	save.navigation = {
		up = emblemNameInput,
		down = savePlayerCard
	}
	savePlayerCard.navigation = {
		up = save,
		down = discard
	}
	discard.navigation = {
		up = savePlayerCard
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	self:registerEventHandler( "ui_keyboard_input", function ( element, event )
		local retVal = nil
		EmblemEditor_HandleKeyboardComplete( self, element, controller, event )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		ClearMenuSavedState( menu )
		EmblemEditor_SaveChangesBack( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "" )
		return false
	end, false )
	emblemNameInput.id = "emblemNameInput"
	save.id = "save"
	savePlayerCard.id = "savePlayerCard"
	discard.id = "discard"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = menu
	} )
	if not self:restoreState() then
		self.emblemNameInput:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.GunsmithFullPopupBackground:close()
		self.emblemNameInput:close()
		self.StartMenuTitlePopup:close()
		self.save:close()
		self.savePlayerCard:close()
		self.discard:close()
		self.emblem:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "EmblemEditorSaveChanges.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

