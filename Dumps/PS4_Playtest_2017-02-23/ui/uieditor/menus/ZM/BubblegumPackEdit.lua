require( "ui.uieditor.menus.ZM.BubblegumBuffSelect" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.BubbleGumBuffs.EquippedBubbleGumBuffButton" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.MenuSpecificWidgets.Scorestreaks.scorestreakVignetteContainer" )
require( "ui.uieditor.widgets.PC.Utility.XCamMouseControl" )
require( "ui.uieditor.widgets.Scorestreaks.scorestreaks_TitleBox" )

LUI.createMenu.BubblegumPackEdit = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "BubblegumPackEdit" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "BubblegumPackEdit.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	LeftPanel:setLeftRight( 0, 0, 96, 987 )
	LeftPanel:setTopBottom( 0, 0, 126, 1107 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local scorestreakVignetteContainer = CoD.scorestreakVignetteContainer.new( self, controller )
	scorestreakVignetteContainer:setLeftRight( 0, 0, 0, 1920 )
	scorestreakVignetteContainer:setTopBottom( 0, 0, 0, 1080 )
	self:addElement( scorestreakVignetteContainer )
	self.scorestreakVignetteContainer = scorestreakVignetteContainer
	
	local selectionList = LUI.UIList.new( self, controller, 10, 0, nil, true, false, 0, 0, false, false )
	selectionList:makeFocusable()
	selectionList:mergeStateConditions( {
		{
			stateName = "Equipped",
			condition = function ( menu, element, event )
				return IsCACItemEquipped( menu, element, controller ) and AlwaysFalse()
			end
		},
		{
			stateName = "New",
			condition = function ( menu, element, event )
				return IsCACItemNew( element, controller ) and AlwaysFalse()
			end
		}
	} )
	selectionList:linkToElementModel( selectionList, "itemIndex", true, function ( model )
		self:updateElementState( selectionList, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	selectionList:setLeftRight( 0, 0, 117, 967 )
	selectionList:setTopBottom( 0, 0, 229, 907 )
	selectionList:setWidgetType( CoD.EquippedBubbleGumBuffButton )
	selectionList:setHorizontalCount( 5 )
	selectionList:setVerticalCount( 4 )
	selectionList:setSpacing( 10 )
	selectionList:setDataSource( "BubbleGumBuffs" )
	selectionList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		if IsCACItemNew( element, controller ) then
			SetCACItemAsOld( element, controller )
			UpdateSelfElementState( self, element, controller )
			ShowBubblegumBuffModel( self, element, controller )
		else
			ShowBubblegumBuffModel( self, element, controller )
		end
		return retVal
	end )
	selectionList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	selectionList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( selectionList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		SelectBubblegumBuff( self, element, controller )
		NavigateToMenu( self, "BubblegumBuffSelect", true, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( selectionList )
	self.selectionList = selectionList
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( 0, 0, -16, 1940 )
	CategoryListLine:setTopBottom( 0, 0, 120, 132 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local GenericMenuFrame0 = CoD.GenericMenuFrame.new( self, controller )
	GenericMenuFrame0:setLeftRight( 0, 1, 0, 0 )
	GenericMenuFrame0:setTopBottom( 0, 1, 0, 0 )
	GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_bubblebuffs" ) )
	GenericMenuFrame0:subscribeToGlobalModel( controller, "EquippedBubbleGumPack", "bgbPackIndex", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GenericMenuFrame0.titleLabel:setText( Engine.Localize( GetBubbleGumPackNameFromPackIndex( controller, modelValue ) ) )
		end
	end )
	GenericMenuFrame0:subscribeToGlobalModel( controller, "EquippedBubbleGumPack", "bgbPackIndex", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( GetBubbleGumPackNameFromPackIndex( controller, modelValue ) ) )
		end
	end )
	self:addElement( GenericMenuFrame0 )
	self.GenericMenuFrame0 = GenericMenuFrame0
	
	local scorestreaksTitleBox = CoD.scorestreaks_TitleBox.new( self, controller )
	scorestreaksTitleBox:setLeftRight( 0, 0, 1050, 1426 )
	scorestreaksTitleBox:setTopBottom( 0, 0, 228, 280 )
	self:addElement( scorestreaksTitleBox )
	self.scorestreaksTitleBox = scorestreaksTitleBox
	
	local highlightedDescription = LUI.UIText.new()
	highlightedDescription:setLeftRight( 0.5, 0.5, 90, 570 )
	highlightedDescription:setTopBottom( 0.5, 0.5, -245, -217 )
	highlightedDescription:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	highlightedDescription:setLineSpacing( 0.5 )
	highlightedDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	highlightedDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( highlightedDescription )
	self.highlightedDescription = highlightedDescription
	
	local LineSide = LUI.UIImage.new()
	LineSide:setLeftRight( 0, 0, 75, 79 )
	LineSide:setTopBottom( 0, 0, 35, 1016 )
	LineSide:setAlpha( 0.5 )
	LineSide:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide )
	self.LineSide = LineSide
	
	local TextBox0 = LUI.UIText.new()
	TextBox0:setLeftRight( 0, 0, 120, 496 )
	TextBox0:setTopBottom( 0, 0, 155, 193 )
	TextBox0:setText( Engine.Localize( "MENU_EDIT_BUBBLEGUM_PACK" ) )
	TextBox0:setTTF( "fonts/escom.ttf" )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	local LineSide0 = LUI.UIImage.new()
	LineSide0:setLeftRight( 0, 0, 76, 79 )
	LineSide0:setTopBottom( 0, 0, 114, 1012 )
	LineSide0:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide0 )
	self.LineSide0 = LineSide0
	
	local LineDot = LUI.UIImage.new()
	LineDot:setLeftRight( 0, 0, 45, 87 )
	LineDot:setTopBottom( 0, 0, 911, 917 )
	LineDot:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	LineDot:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineDot )
	self.LineDot = LineDot
	
	local LineDot0 = LUI.UIImage.new()
	LineDot0:setLeftRight( 0, 0, 45, 87 )
	LineDot0:setTopBottom( 0, 0, 221, 227 )
	LineDot0:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	LineDot0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineDot0 )
	self.LineDot0 = LineDot0
	
	local XCamMouseControl = CoD.XCamMouseControl.new( self, controller )
	XCamMouseControl:setLeftRight( 1, 1, -706, -96 )
	XCamMouseControl:setTopBottom( 0, 1, 384, -274 )
	self:addElement( XCamMouseControl )
	self.XCamMouseControl = XCamMouseControl
	
	scorestreaksTitleBox:linkToElementModel( selectionList, nil, false, function ( model )
		scorestreaksTitleBox:setModel( model, controller )
	end )
	scorestreaksTitleBox:linkToElementModel( selectionList, "itemIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			scorestreaksTitleBox.ScorestreaksLabel:setText( Engine.Localize( GetItemNameFromIndex( modelValue ) ) )
		end
	end )
	highlightedDescription:linkToElementModel( selectionList, "itemIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			highlightedDescription:setText( Engine.Localize( GetItemDescriptionFromIndex( modelValue ) ) )
		end
	end )
	self:registerEventHandler( "menu_opened", function ( element, event )
		local retVal = nil
		SetElementStateByElementName( self, "GenericMenuFrame0", controller, "Update" )
		SendClientScriptMenuChangeNotify( controller, self, true )
		SetFocusToElement( self, "selectionList", controller )
		SetPerControllerTableProperty( controller, "weaponCategory", "bubblegum" )
		UpdateState( self, event )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		ShowHeaderIconOnly( self )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		PlaySoundSetSound( self, "menu_no_selection" )
		SendClientScriptMenuChangeNotify( controller, menu, false )
		SaveLoadout( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, nil, function ( element, menu, controller, model )
		if CACShowRotatePrompt( self, element, controller ) then
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if CACShowRotatePrompt( self, element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "PLATFORM_EMBLEM_ROTATE_LAYER", nil )
			return true
		else
			return false
		end
	end, false )
	selectionList.id = "selectionList"
	GenericMenuFrame0:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.selectionList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.LeftPanel:close()
		self.scorestreakVignetteContainer:close()
		self.selectionList:close()
		self.GenericMenuFrame0:close()
		self.scorestreaksTitleBox:close()
		self.XCamMouseControl:close()
		self.highlightedDescription:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "BubblegumPackEdit.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

