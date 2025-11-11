require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.InGame.Draft.PositionDraft_CategoryIcon" )
require( "ui.uieditor.widgets.InGame.Draft.PositionDraft_Character" )
require( "ui.uieditor.widgets.MP.PositionsLoadout.positionLoadoutsSelectionItem_lethal" )
require( "ui.uieditor.widgets.MP.PositionsLoadout.positionLoadoutsSelectionItem_primary" )
require( "ui.uieditor.widgets.MP.PositionsLoadout.positionLoadoutsSelectionItem_secondary" )

LUI.createMenu.PositionsLoadout = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "PositionsLoadout" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	CoD.BaseUtility.InitControllerModel( controller, "PositionEditLoadout.SelectedCharacterIndex", CoD.PlayerRoleUtility.GetFirstHeroFromHeroList() )
	self.soundSet = "none"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "PositionsLoadout.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local GenericMenuFrame0 = CoD.GenericMenuFrame.new( self, controller )
	GenericMenuFrame0:setLeftRight( 0, 1, 0, 0 )
	GenericMenuFrame0:setTopBottom( 0, 1, 0, 0 )
	GenericMenuFrame0:setAlpha( 0 )
	GenericMenuFrame0:setZoom( 20 )
	GenericMenuFrame0.titleLabel:setText( Engine.Localize( "MPUI_POSITION_LOADOUTS" ) )
	GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MPUI_POSITION_LOADOUTS" ) )
	GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_character" ) )
	self:addElement( GenericMenuFrame0 )
	self.GenericMenuFrame0 = GenericMenuFrame0
	
	local positions = LUI.UIList.new( self, controller, 0, 0, nil, false, false, 0, 0, false, false )
	positions:makeFocusable()
	positions:setLeftRight( 0.5, 0.5, -671, 742 )
	positions:setTopBottom( 0, 0, 778, 982 )
	positions:setWidgetType( CoD.PositionDraft_Character )
	positions:setHorizontalCount( 9 )
	positions:setSpacing( 0 )
	positions:setDataSource( "PositionLoadoutList" )
	positions:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		return retVal
	end )
	positions:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	positions:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( positions, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		SaveCurrentListSelection( self.positions )
		SetControllerModelValue( controller, "PositionEditLoadout.SelectedCharacterIndex", element.characterIndex )
		SendCustomClientScriptNotifyForAdjustedClient( controller, "updateHero", "changeHero", element.characterIndex, CoD.PlayerRoleUtility.customizationMode )
		SetElementPropertyOnPerControllerTable( controller, "classNum", element, "classNum" )
		SetElementSubModelOnPerControllerTable( controller, "classModel", element, "classModel" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_EDIT", Enum.LUIButtonPromptFlags.BPF_CONTEXTUAL )
		return true
	end, false )
	self:addElement( positions )
	self.positions = positions
	
	local mainBackingBottom = LUI.UIImage.new()
	mainBackingBottom:setLeftRight( 0, 0, 237, 645 )
	mainBackingBottom:setTopBottom( 0, 0, 551, 719 )
	mainBackingBottom:setZoom( 20 )
	mainBackingBottom:setImage( RegisterImage( "uie_menu_loadout_main_backing_bottom" ) )
	self:addElement( mainBackingBottom )
	self.mainBackingBottom = mainBackingBottom
	
	local mainBackingMiddle = LUI.UIImage.new()
	mainBackingMiddle:setLeftRight( 0, 0, 237, 645 )
	mainBackingMiddle:setTopBottom( 0, 0, 372, 540 )
	mainBackingMiddle:setZoom( 20 )
	mainBackingMiddle:setImage( RegisterImage( "uie_menu_loadout_main_backing_bottom" ) )
	self:addElement( mainBackingMiddle )
	self.mainBackingMiddle = mainBackingMiddle
	
	local mainBackingTop = LUI.UIImage.new()
	mainBackingTop:setLeftRight( 0, 0, 237, 645 )
	mainBackingTop:setTopBottom( 0, 0, 194, 362 )
	mainBackingTop:setZoom( 20 )
	mainBackingTop:setImage( RegisterImage( "uie_menu_loadout_main_backing_top" ) )
	self:addElement( mainBackingTop )
	self.mainBackingTop = mainBackingTop
	
	local lethal = CoD.positionLoadoutsSelectionItem_lethal.new( self, controller )
	lethal:setLeftRight( 0, 0, 351, 491 )
	lethal:setTopBottom( 0, 0, 571, 691 )
	lethal:setZoom( 20 )
	lethal:subscribeToGlobalModel( controller, "PositionEditLoadout", "classModel", function ( model )
		lethal:setModel( model, controller )
	end )
	lethal:subscribeToGlobalModel( controller, "PositionEditLoadout", "classModel.primarygrenade", function ( model )
		lethal.selectedItem:setModel( model, controller )
	end )
	lethal:subscribeToGlobalModel( controller, "PositionEditLoadout", "classModel.primarygrenadecount", function ( model )
		lethal.countLabel:setModel( model, controller )
	end )
	lethal:subscribeToGlobalModel( controller, "PositionEditLoadout", "possibleLethals", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			lethal.possibleItemsList:setDataSource( modelValue )
		end
	end )
	self:addElement( lethal )
	self.lethal = lethal
	
	local secondary = CoD.positionLoadoutsSelectionItem_secondary.new( self, controller )
	secondary:setLeftRight( 0, 0, 351, 491 )
	secondary:setTopBottom( 0, 0, 396, 516 )
	secondary:setZoom( 20 )
	secondary:subscribeToGlobalModel( controller, "PositionEditLoadout", "classModel", function ( model )
		secondary:setModel( model, controller )
	end )
	secondary:subscribeToGlobalModel( controller, "PositionEditLoadout", "classModel.secondary", function ( model )
		secondary.selectedItem:setModel( model, controller )
	end )
	secondary:subscribeToGlobalModel( controller, "PositionEditLoadout", "possibleSecondaries", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			secondary.possibleItemsList:setDataSource( modelValue )
		end
	end )
	self:addElement( secondary )
	self.secondary = secondary
	
	local primary = CoD.positionLoadoutsSelectionItem_primary.new( self, controller )
	primary:setLeftRight( 0, 0, 351, 491 )
	primary:setTopBottom( 0, 0, 218, 338 )
	primary:setZoom( 20 )
	primary:subscribeToGlobalModel( controller, "PositionEditLoadout", "classModel", function ( model )
		primary:setModel( model, controller )
	end )
	primary:subscribeToGlobalModel( controller, "PositionEditLoadout", "classModel.primary", function ( model )
		primary.selectedItem:setModel( model, controller )
	end )
	primary:subscribeToGlobalModel( controller, "PositionEditLoadout", "possiblePrimaries", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			primary.possibleItemsList:setDataSource( modelValue )
		end
	end )
	self:addElement( primary )
	self.primary = primary
	
	local equipmentHeader = LUI.UIText.new()
	equipmentHeader:setLeftRight( 0, 0, 332, 532 )
	equipmentHeader:setTopBottom( 0, 0, 564, 594 )
	equipmentHeader:setRGB( 0.19, 0.62, 0.57 )
	equipmentHeader:setZoom( 20 )
	equipmentHeader:setText( Engine.Localize( "MPUI_EQUIPMENT_CAPS" ) )
	equipmentHeader:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	equipmentHeader:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	equipmentHeader:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( equipmentHeader )
	self.equipmentHeader = equipmentHeader
	
	local secondaryHeader = LUI.UIText.new()
	secondaryHeader:setLeftRight( 0, 0, 332, 532 )
	secondaryHeader:setTopBottom( 0, 0, 383, 413 )
	secondaryHeader:setRGB( 0.19, 0.62, 0.57 )
	secondaryHeader:setZoom( 20 )
	secondaryHeader:setText( Engine.Localize( "MPUI_SECONDARY_CAPS" ) )
	secondaryHeader:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	secondaryHeader:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	secondaryHeader:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( secondaryHeader )
	self.secondaryHeader = secondaryHeader
	
	local primaryHeader = LUI.UIText.new()
	primaryHeader:setLeftRight( 0, 0, 332, 532 )
	primaryHeader:setTopBottom( 0, 0, 204, 234 )
	primaryHeader:setRGB( 0.19, 0.62, 0.57 )
	primaryHeader:setZoom( 20 )
	primaryHeader:setText( Engine.Localize( "MPUI_PRIMARY_CAPS" ) )
	primaryHeader:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	primaryHeader:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	primaryHeader:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( primaryHeader )
	self.primaryHeader = primaryHeader
	
	local SelectSpecialist = LUI.UIText.new()
	SelectSpecialist:setLeftRight( 0, 0, 262, 620 )
	SelectSpecialist:setTopBottom( 0, 0, 91, 136 )
	SelectSpecialist:setAlpha( 0.1 )
	SelectSpecialist:setZoom( 20 )
	SelectSpecialist:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	SelectSpecialist:setLetterSpacing( 9.4 )
	SelectSpecialist:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	SelectSpecialist:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	SelectSpecialist:subscribeToGlobalModel( controller, "PositionEditLoadout", "characterIndex", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			SelectSpecialist:setText( Engine.Localize( GetPositionCategoryField( "string", "displayName", modelValue ) ) )
		end
	end )
	self:addElement( SelectSpecialist )
	self.SelectSpecialist = SelectSpecialist
	
	local SpecialistCategory = LUI.UIText.new()
	SpecialistCategory:setLeftRight( 0, 0, 262, 772 )
	SpecialistCategory:setTopBottom( 0, 0, 134, 194 )
	SpecialistCategory:setAlpha( 0.5 )
	SpecialistCategory:setZoom( 20 )
	SpecialistCategory:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	SpecialistCategory:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	SpecialistCategory:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	SpecialistCategory:subscribeToGlobalModel( controller, "PositionEditLoadout", "name", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			SpecialistCategory:setText( LocalizeToUpperString( modelValue ) )
		end
	end )
	self:addElement( SpecialistCategory )
	self.SpecialistCategory = SpecialistCategory
	
	local PositionIcon = LUI.UIImage.new()
	PositionIcon:setLeftRight( 0, 0, 96, 262 )
	PositionIcon:setTopBottom( 0, 0, 53, 219 )
	PositionIcon:setAlpha( 0.1 )
	PositionIcon:setZoom( 20 )
	PositionIcon:setScale( 0.85 )
	PositionIcon:subscribeToGlobalModel( controller, "PositionEditLoadout", "characterIndex", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PositionIcon:setImage( RegisterImage( GetPositionCategoryField( "image", "iconBig", modelValue ) ) )
		end
	end )
	self:addElement( PositionIcon )
	self.PositionIcon = PositionIcon
	
	local CategoryIcon1 = CoD.PositionDraft_CategoryIcon.new( self, controller )
	CategoryIcon1:setLeftRight( 0, 0, 330, 825 )
	CategoryIcon1:setTopBottom( 0, 0, 972, 1019 )
	CategoryIcon1:setAlpha( 0.75 )
	CategoryIcon1:setZoom( 20 )
	CategoryIcon1:subscribeToGlobalModel( controller, "PositionLoadoutDraftCategories", "0", function ( model )
		CategoryIcon1:setModel( model, controller )
	end )
	self:addElement( CategoryIcon1 )
	self.CategoryIcon1 = CategoryIcon1
	
	local CategoryIcon2 = CoD.PositionDraft_CategoryIcon.new( self, controller )
	CategoryIcon2:setLeftRight( 0, 0, 712, 1207 )
	CategoryIcon2:setTopBottom( 0, 0, 972, 1019 )
	CategoryIcon2:setAlpha( 0.75 )
	CategoryIcon2:setZoom( 20 )
	CategoryIcon2:subscribeToGlobalModel( controller, "PositionLoadoutDraftCategories", "1", function ( model )
		CategoryIcon2:setModel( model, controller )
	end )
	self:addElement( CategoryIcon2 )
	self.CategoryIcon2 = CategoryIcon2
	
	local CategoryIcon3 = CoD.PositionDraft_CategoryIcon.new( self, controller )
	CategoryIcon3:setLeftRight( 0, 0, 1098, 1593 )
	CategoryIcon3:setTopBottom( 0, 0, 972, 1019 )
	CategoryIcon3:setAlpha( 0.75 )
	CategoryIcon3:setZoom( 20 )
	CategoryIcon3:subscribeToGlobalModel( controller, "PositionLoadoutDraftCategories", "2", function ( model )
		CategoryIcon3:setModel( model, controller )
	end )
	self:addElement( CategoryIcon3 )
	self.CategoryIcon3 = CategoryIcon3
	
	positions.navigation = {
		left = CategoryIcon2,
		up = lethal,
		right = CategoryIcon3,
		down = {
			CategoryIcon1,
			CategoryIcon2,
			CategoryIcon3
		}
	}
	lethal.navigation = {
		up = secondary,
		down = positions
	}
	secondary.navigation = {
		up = primary,
		down = lethal
	}
	primary.navigation = {
		down = secondary
	}
	CategoryIcon1.navigation = {
		up = positions,
		right = positions
	}
	CategoryIcon2.navigation = {
		left = CategoryIcon1,
		up = positions,
		right = positions
	}
	CategoryIcon3.navigation = {
		left = positions,
		up = positions
	}
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "ESCAPE", function ( element, menu, controller, model )
		GoBack( self, controller )
		SendClientScriptMenuChangeNotify( controller, menu, false )
		ClearSavedState( self, controller )
		SetPerControllerTableProperty( controller, "classNum", nil )
		SetPerControllerTableProperty( controller, "weaponCategory", nil )
		SetPerControllerTableProperty( controller, "classModel", nil )
		UploadStats( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
		return true
	end, false )
	self:subscribeToGlobalModel( controller, "PerController", "PositionEditLoadout.SelectedCharacterIndex", function ( model )
		local element = self
		DataSourceHelperRecreate( controller, "PositionEditLoadout" )
	end )
	GenericMenuFrame0:setModel( self.buttonModel, controller )
	positions.id = "positions"
	lethal.id = "lethal"
	secondary.id = "secondary"
	primary.id = "primary"
	CategoryIcon1.id = "CategoryIcon1"
	CategoryIcon2.id = "CategoryIcon2"
	CategoryIcon3.id = "CategoryIcon3"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.positions:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.GenericMenuFrame0:close()
		self.positions:close()
		self.lethal:close()
		self.secondary:close()
		self.primary:close()
		self.CategoryIcon1:close()
		self.CategoryIcon2:close()
		self.CategoryIcon3:close()
		self.SelectSpecialist:close()
		self.SpecialistCategory:close()
		self.PositionIcon:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "PositionsLoadout.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	local element = nil
	SendClientScriptMenuChangeNotify( controller, self, true )
	SaveCurrentListSelection( self.positions )
	SetControllerModelValue( controller, "PositionEditLoadout.SelectedCharacterIndex", CoD.PlayerRoleUtility.GetFirstHeroFromHeroList() )
	SendCustomClientScriptNotifyForAdjustedClient( controller, "updateHero", "changeHero", CoD.PlayerRoleUtility.GetFirstHeroFromHeroList(), CoD.PlayerRoleUtility.customizationMode )
	SetLoseFocusToElement( self, "positions", controller )
	CoD.FreeCursorUtility.RegisterFlyoutAdvanced( self, lethal, controller, "selectedItem", "possibleItemsList", "DefaultState", "FlyOut_Left" )
	element = secondary
	SetElementProperty( element, "slot", "secondary" )
	CoD.FreeCursorUtility.RegisterFlyoutAdvanced( self, element, controller, "selectedItem", "possibleItemsList", "DefaultState", "FlyOut_Left" )
	element = primary
	SetElementProperty( element, "slot", "primary" )
	CoD.FreeCursorUtility.RegisterFlyoutAdvanced( self, element, controller, "selectedItem", "possibleItemsList", "DefaultState", "FlyOut_Left" )
	return self
end

