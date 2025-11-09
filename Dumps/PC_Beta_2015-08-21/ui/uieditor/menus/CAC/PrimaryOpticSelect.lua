require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.SelectMenuWidgetNew" )
require( "ui.uieditor.widgets.CAC.GridItemButtonNew" )
require( "ui.uieditor.widgets.CAC.cac_ElemsSideListBoxes" )
require( "ui.uieditor.widgets.Footer.fe_FooterContainer_NOTLobby" )
require( "ui.uieditor.widgets.Pregame.Pregame_TimerOverlay" )

local PreLoadFunc = function ( self, controller )
	self:setModel( CoD.perController[controller].classModel )
	self.restoreState = function ( f2_arg0 )
		local f2_local0 = f2_arg0:getModel()
		local f2_local1 = CoD.perController[controller].weaponCategory
		local f2_local2 = f2_arg0.selectionList.attachments
		f2_arg0.selectionList:findItem( {
			itemIndex = Engine.GetModelValue( f2_arg0:getModel( controller, f2_local1 .. ".itemIndex" ) )
		}, nil, true, nil )
	end
	
end

local PostLoadFunc = function ( f3_arg0 )
	local f3_local0 = f3_arg0:getOwner()
	f3_arg0:setModel( CoD.perController[f3_local0].classModel )
	f3_arg0:processEvent( {
		name = "update_from_data_source",
		controller = f3_local0
	} )
	f3_arg0:dispatchEventToChildren( {
		name = "update_state",
		controller = f3_local0
	} )
end

LUI.createMenu.PrimaryOpticSelect = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "PrimaryOpticSelect" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "CAC_PrimaryAttachment"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "PrimaryOpticSelect.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	LeftPanel:setLeftRight( true, false, 64, 428 )
	LeftPanel:setTopBottom( true, false, 78, 720 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local selectMenuWidget = CoD.SelectMenuWidgetNew.new( self, controller )
	selectMenuWidget:setLeftRight( true, true, 0, 0 )
	selectMenuWidget:setTopBottom( true, true, 0, 0 )
	selectMenuWidget.background.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( GetPrimaryAttachmentMenuTitle( controller, "MPUI_OPTICS_CAPS" ) ) )
	selectMenuWidget.selectionInfoWidget.itemName.weaponNameWithVariant.variantName.itemName:setText( Engine.Localize( "" ) )
	selectMenuWidget:mergeStateConditions( {
		{
			stateName = "GridLayout",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( selectMenuWidget )
	self.selectMenuWidget = selectMenuWidget
	
	local selectionList = LUI.UIList.new( self, controller, 7, 0, nil, true, false, 0, 0, false, false )
	selectionList:makeFocusable()
	selectionList:setLeftRight( true, false, 77, 415 )
	selectionList:setTopBottom( true, false, 136, 589 )
	selectionList:setDataSource( "WeaponAttachments" )
	selectionList:setWidgetType( CoD.GridItemButtonNew )
	selectionList:setHorizontalCount( 3 )
	selectionList:setVerticalCount( 4 )
	selectionList:setSpacing( 7 )
	selectionList:linkToElementModel( selectionList, "itemIndex", true, function ( model )
		local f6_local0 = selectionList
		local f6_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		}
		CoD.Menu.UpdateButtonShownState( f6_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	selectionList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f7_local0 = nil
		if IsCACAttachmentNew( self, element, controller ) then
			SetCACAttachmentAsOld( element, controller )
			UpdateSelfElementState( self, element, controller )
			FocusClassItem( self, element, controller )
		else
			FocusClassItem( self, element, controller )
		end
		return f7_local0
	end )
	selectionList:registerEventHandler( "gain_focus", function ( element, event )
		local f8_local0 = nil
		if element.gainFocus then
			f8_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f8_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f8_local0
	end )
	selectionList:registerEventHandler( "lose_focus", function ( element, event )
		local f9_local0 = nil
		if element.loseFocus then
			f9_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f9_local0 = element.super:loseFocus( event )
		end
		return f9_local0
	end )
	self:AddButtonCallbackFunction( selectionList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsCACItemLocked( menu, element, controller ) then
			SetClassAttachment( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if not IsCACItemLocked( menu, element, controller ) then
			return true
		else
			return false
		end
	end, true )
	selectionList:mergeStateConditions( {
		{
			stateName = "New",
			condition = function ( menu, element, event )
				return IsCACAttachmentNew( menu, element, controller )
			end
		},
		{
			stateName = "NotAvailable",
			condition = function ( menu, element, event )
				return AlwaysFalse()
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
	
	local cacElemsSideListBoxes0 = CoD.cac_ElemsSideListBoxes.new( self, controller )
	cacElemsSideListBoxes0:setLeftRight( true, false, 18.87, 71.87 )
	cacElemsSideListBoxes0:setTopBottom( true, false, -12, 658 )
	self:addElement( cacElemsSideListBoxes0 )
	self.cacElemsSideListBoxes0 = cacElemsSideListBoxes0
	
	local feFooterContainer = CoD.fe_FooterContainer_NOTLobby.new( self, controller )
	feFooterContainer:setLeftRight( true, true, 0, 0 )
	feFooterContainer:setTopBottom( false, true, -65, 0 )
	feFooterContainer:registerEventHandler( "menu_loaded", function ( element, event )
		local f15_local0 = nil
		SizeToSafeArea( element, controller )
		ShowHeaderKickerAndIcon( self )
		if not f15_local0 then
			f15_local0 = element:dispatchEventToChildren( event )
		end
		return f15_local0
	end )
	self:addElement( feFooterContainer )
	self.feFooterContainer = feFooterContainer
	
	local PregameTimerOverlay = CoD.Pregame_TimerOverlay.new( self, controller )
	PregameTimerOverlay:setLeftRight( true, true, 0, 0 )
	PregameTimerOverlay:setTopBottom( true, true, 0, 0 )
	PregameTimerOverlay:mergeStateConditions( {
		{
			stateName = "AttachmentSelect",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	PregameTimerOverlay:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.state" ), function ( model )
		self:updateElementState( PregameTimerOverlay, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.Pregame.state"
		} )
	end )
	self:addElement( PregameTimerOverlay )
	self.PregameTimerOverlay = PregameTimerOverlay
	
	selectMenuWidget:linkToElementModel( selectionList, nil, false, function ( model )
		selectMenuWidget:setModel( model, controller )
	end )
	selectMenuWidget:linkToElementModel( selectionList, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			selectMenuWidget.selectionInfoWidget.itemName.weaponNameWithVariant.itemName.itemName:setText( Engine.Localize( name ) )
		end
	end )
	selectMenuWidget:linkToElementModel( selectionList, "weaponAttributes", false, function ( model )
		selectMenuWidget.selectionInfoWidget.WeaponAttributesInternal:setModel( model, controller )
	end )
	self:registerEventHandler( "menu_opened", function ( self, event )
		local f21_local0 = nil
		SetElementStateByElementName( self, "selectMenuWidget", controller, "Update3" )
		if not f21_local0 then
			f21_local0 = self:dispatchEventToChildren( event )
		end
		return f21_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		PlaySoundSetSound( self, "menu_no_selection" )
		GetCustomClassModel( controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	selectionList.id = "selectionList"
	feFooterContainer:setModel( self.buttonModel, controller )
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
		element.selectMenuWidget:close()
		element.selectionList:close()
		element.cacElemsSideListBoxes0:close()
		element.feFooterContainer:close()
		element.PregameTimerOverlay:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "PrimaryOpticSelect.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

