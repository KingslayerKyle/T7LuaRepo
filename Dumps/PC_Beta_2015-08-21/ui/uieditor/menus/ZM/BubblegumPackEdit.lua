require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.menus.ZM.BubblegumBuffSelect" )
require( "ui.uieditor.widgets.BubbleGumBuffs.EquippedBubbleGumBuffButton" )
require( "ui.uieditor.widgets.CAC.cac_ElemsSideListBoxes" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Scorestreaks.scorestreaks_TitleBox" )

LUI.createMenu.BubblegumPackEdit = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "BubblegumPackEdit" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "CAC_Perk"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "BubblegumPackEdit.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	LeftPanel:setLeftRight( true, false, 64, 428 )
	LeftPanel:setTopBottom( true, false, 78, 667 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local selectionList = LUI.UIList.new( self, controller, 7, 0, nil, true, false, 0, 0, false, false )
	selectionList:makeFocusable()
	selectionList:setLeftRight( true, false, 77, 415 )
	selectionList:setTopBottom( true, false, 136, 589 )
	selectionList:setDataSource( "BubbleGumBuffs" )
	selectionList:setWidgetType( CoD.EquippedBubbleGumBuffButton )
	selectionList:setHorizontalCount( 3 )
	selectionList:setVerticalCount( 4 )
	selectionList:setSpacing( 7 )
	selectionList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f2_local0 = nil
		ShowBubblegumBuffModel( self, element, controller )
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
	self:addElement( selectionList )
	self.selectionList = selectionList
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, false, -11, 1293 )
	CategoryListLine:setTopBottom( true, false, 80, 88 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local cacElemsSideListBoxes0 = CoD.cac_ElemsSideListBoxes.new( self, controller )
	cacElemsSideListBoxes0:setLeftRight( true, false, 18.87, 71.87 )
	cacElemsSideListBoxes0:setTopBottom( true, false, -12, 658 )
	self:addElement( cacElemsSideListBoxes0 )
	self.cacElemsSideListBoxes0 = cacElemsSideListBoxes0
	
	local GenericMenuFrame0 = CoD.GenericMenuFrame.new( self, controller )
	GenericMenuFrame0:setLeftRight( true, true, 0, 0 )
	GenericMenuFrame0:setTopBottom( true, true, 0, 0 )
	GenericMenuFrame0:subscribeToGlobalModel( controller, "EquippedBubbleGumPack", "bgbPackIndex", function ( model )
		local bgbPackIndex = Engine.GetModelValue( model )
		if bgbPackIndex then
			GenericMenuFrame0.titleLabel:setText( Engine.Localize( GetBubbleGumPackNameFromPackIndex( controller, bgbPackIndex ) ) )
		end
	end )
	GenericMenuFrame0:subscribeToGlobalModel( controller, "EquippedBubbleGumPack", "bgbPackIndex", function ( model )
		local bgbPackIndex = Engine.GetModelValue( model )
		if bgbPackIndex then
			GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( GetBubbleGumPackNameFromPackIndex( controller, bgbPackIndex ) ) )
		end
	end )
	self:addElement( GenericMenuFrame0 )
	self.GenericMenuFrame0 = GenericMenuFrame0
	
	local scorestreaksTitleBox = CoD.scorestreaks_TitleBox.new( self, controller )
	scorestreaksTitleBox:setLeftRight( true, false, 748, 999 )
	scorestreaksTitleBox:setTopBottom( true, false, 124.72, 172.72 )
	self:addElement( scorestreaksTitleBox )
	self.scorestreaksTitleBox = scorestreaksTitleBox
	
	local highlightedDescription = LUI.UIText.new()
	highlightedDescription:setLeftRight( false, false, 108, 428.31 )
	highlightedDescription:setTopBottom( false, false, -181.73, -162.73 )
	highlightedDescription:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	highlightedDescription:setLineSpacing( 0.5 )
	highlightedDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	highlightedDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( highlightedDescription )
	self.highlightedDescription = highlightedDescription
	
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
		local f12_local0 = nil
		SetElementStateByElementName( self, "GenericMenuFrame0", controller, "Update" )
		if not f12_local0 then
			f12_local0 = self:dispatchEventToChildren( event )
		end
		return f12_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		PlaySoundSetSound( self, "menu_no_selection" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
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
		element.selectionList:close()
		element.cacElemsSideListBoxes0:close()
		element.GenericMenuFrame0:close()
		element.scorestreaksTitleBox:close()
		element.highlightedDescription:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "BubblegumPackEdit.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

