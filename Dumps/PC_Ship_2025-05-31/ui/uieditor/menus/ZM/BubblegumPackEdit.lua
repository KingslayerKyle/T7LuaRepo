require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.MenuSpecificWidgets.Scorestreaks.scorestreakVignetteContainer" )
require( "ui.uieditor.menus.ZM.BubblegumBuffSelect" )
require( "ui.uieditor.widgets.BubbleGumBuffs.EquippedBubbleGumBuffButton" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Scorestreaks.scorestreaks_TitleBox" )
require( "ui.uieditor.widgets.PC.Utility.XCamMouseControl" )

LUI.createMenu.BubblegumPackEdit = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "BubblegumPackEdit" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "BubblegumPackEdit.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	LeftPanel:setLeftRight( true, false, 64, 658 )
	LeftPanel:setTopBottom( true, false, 84, 738 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local scorestreakVignetteContainer = CoD.scorestreakVignetteContainer.new( self, controller )
	scorestreakVignetteContainer:setLeftRight( true, false, 0, 1280 )
	scorestreakVignetteContainer:setTopBottom( true, false, 0, 720 )
	self:addElement( scorestreakVignetteContainer )
	self.scorestreakVignetteContainer = scorestreakVignetteContainer
	
	local selectionList = LUI.UIList.new( self, controller, 7, 0, nil, true, false, 0, 0, false, false )
	selectionList:makeFocusable()
	selectionList:setLeftRight( true, false, 77, 645 )
	selectionList:setTopBottom( true, false, 152, 605 )
	selectionList:setWidgetType( CoD.EquippedBubbleGumBuffButton )
	selectionList:setHorizontalCount( 5 )
	selectionList:setVerticalCount( 4 )
	selectionList:setSpacing( 7 )
	selectionList:setDataSource( "BubbleGumBuffs" )
	selectionList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f2_local0 = nil
		if IsCACItemNew( element, controller ) then
			SetCACItemAsOld( element, controller )
			UpdateSelfElementState( self, element, controller )
			ShowBubblegumBuffModel( self, element, controller )
		else
			ShowBubblegumBuffModel( self, element, controller )
		end
		return f2_local0
	end )
	selectionList:registerEventHandler( "gain_focus", function ( element, event )
		local f3_local0 = nil
		if element.gainFocus then
			f3_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f3_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f3_local0
	end )
	selectionList:registerEventHandler( "lose_focus", function ( element, event )
		local f4_local0 = nil
		if element.loseFocus then
			f4_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f4_local0 = element.super:loseFocus( event )
		end
		return f4_local0
	end )
	self:AddButtonCallbackFunction( selectionList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		SelectBubblegumBuff( self, element, controller )
		NavigateToMenu( self, "BubblegumBuffSelect", true, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
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
		},
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return IsBGBItemLocked( menu, element, controller )
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
	self:addElement( selectionList )
	self.selectionList = selectionList
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, false, -11, 1293 )
	CategoryListLine:setTopBottom( true, false, 80, 88 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local GenericMenuFrame0 = CoD.GenericMenuFrame.new( self, controller )
	GenericMenuFrame0:setLeftRight( true, true, 0, 0 )
	GenericMenuFrame0:setTopBottom( true, true, 0, 0 )
	GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_bubblebuffs" ) )
	GenericMenuFrame0:subscribeToGlobalModel( controller, "EquippedBubbleGumPack", "bgbPackIndex", function ( model )
		local bgbPackIndex = Engine.GetModelValue( model )
		if bgbPackIndex then
			GenericMenuFrame0.titleLabel:setText( Engine.Localize( GetBubbleGumPackNameFromPackIndex( controller, bgbPackIndex ) ) )
		end
	end )
	GenericMenuFrame0:subscribeToGlobalModel( controller, "EquippedBubbleGumPack", "bgbPackIndex", function ( model )
		local bgbPackIndex = Engine.GetModelValue( model )
		if bgbPackIndex then
			GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( GetBubbleGumPackNameFromPackIndex( controller, bgbPackIndex ) )
		end
	end )
	self:addElement( GenericMenuFrame0 )
	self.GenericMenuFrame0 = GenericMenuFrame0
	
	local scorestreaksTitleBox = CoD.scorestreaks_TitleBox.new( self, controller )
	scorestreaksTitleBox:setLeftRight( true, false, 700, 951 )
	scorestreaksTitleBox:setTopBottom( true, false, 152, 187 )
	self:addElement( scorestreaksTitleBox )
	self.scorestreaksTitleBox = scorestreaksTitleBox
	
	local highlightedDescription = LUI.UIText.new()
	highlightedDescription:setLeftRight( false, false, 60, 380.31 )
	highlightedDescription:setTopBottom( false, false, -163.45, -144.45 )
	highlightedDescription:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	highlightedDescription:setLineSpacing( 0.5 )
	highlightedDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	highlightedDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( highlightedDescription )
	self.highlightedDescription = highlightedDescription
	
	local LineSide = LUI.UIImage.new()
	LineSide:setLeftRight( true, false, 49.9, 52.9 )
	LineSide:setTopBottom( true, false, 23, 677 )
	LineSide:setAlpha( 0.5 )
	LineSide:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide )
	self.LineSide = LineSide
	
	local TextBox0 = LUI.UIText.new()
	TextBox0:setLeftRight( true, false, 80, 331 )
	TextBox0:setTopBottom( true, false, 103.4, 128.4 )
	TextBox0:setText( Engine.Localize( "MENU_EDIT_BUBBLEGUM_PACK" ) )
	TextBox0:setTTF( "fonts/escom.ttf" )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	local LineSide0 = LUI.UIImage.new()
	LineSide0:setLeftRight( true, false, 51, 53 )
	LineSide0:setTopBottom( true, false, 76, 675 )
	LineSide0:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide0 )
	self.LineSide0 = LineSide0
	
	local LineDot = LUI.UIImage.new()
	LineDot:setLeftRight( true, false, 30, 58 )
	LineDot:setTopBottom( true, false, 607, 611 )
	LineDot:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	LineDot:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineDot )
	self.LineDot = LineDot
	
	local LineDot0 = LUI.UIImage.new()
	LineDot0:setLeftRight( true, false, 30, 58 )
	LineDot0:setTopBottom( true, false, 147, 151 )
	LineDot0:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	LineDot0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineDot0 )
	self.LineDot0 = LineDot0
	
	local XCamMouseControl = CoD.XCamMouseControl.new( self, controller )
	XCamMouseControl:setLeftRight( false, true, -470.5, -64 )
	XCamMouseControl:setTopBottom( true, true, 256, -183 )
	self:addElement( XCamMouseControl )
	self.XCamMouseControl = XCamMouseControl
	
	scorestreaksTitleBox:linkToElementModel( selectionList, nil, false, function ( model )
		scorestreaksTitleBox:setModel( model, controller )
	end )
	scorestreaksTitleBox:linkToElementModel( selectionList, "itemIndex", true, function ( model )
		local itemIndex = Engine.GetModelValue( model )
		if itemIndex then
			scorestreaksTitleBox.ScorestreaksLabel:setText( Engine.Localize( GetItemNameFromIndex( itemIndex ) ) )
		end
	end )
	highlightedDescription:linkToElementModel( selectionList, "itemIndex", true, function ( model )
		local itemIndex = Engine.GetModelValue( model )
		if itemIndex then
			highlightedDescription:setText( Engine.Localize( GetItemDescriptionFromIndex( itemIndex ) ) )
		end
	end )
	self:registerEventHandler( "menu_opened", function ( self, event )
		local f16_local0 = nil
		SetElementStateByElementName( self, "GenericMenuFrame0", controller, "Update" )
		SendClientScriptMenuChangeNotify( controller, self, true )
		SetFocusToElement( self, "selectionList", controller )
		SetPerControllerTableProperty( controller, "weaponCategory", "bubblegum" )
		UpdateState( self, event )
		if not f16_local0 then
			f16_local0 = self:dispatchEventToChildren( event )
		end
		return f16_local0
	end )
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f17_local0 = nil
		ShowHeaderIconOnly( self )
		if not f17_local0 then
			f17_local0 = self:dispatchEventToChildren( event )
		end
		return f17_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		PlaySoundSetSound( self, "menu_no_selection" )
		SendClientScriptMenuChangeNotify( controller, menu, false )
		SaveLoadout( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, nil, function ( element, menu, controller, model )
		if CACShowRotatePrompt( self, element, controller ) then
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if CACShowRotatePrompt( self, element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "PLATFORM_EMBLEM_ROTATE_LAYER" )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LeftPanel:close()
		element.scorestreakVignetteContainer:close()
		element.selectionList:close()
		element.GenericMenuFrame0:close()
		element.scorestreaksTitleBox:close()
		element.XCamMouseControl:close()
		element.highlightedDescription:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "BubblegumPackEdit.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

