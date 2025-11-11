require( "ui.uieditor.widgets.Lobby.Flyouts.lobbyFlyout_GenericSelectionButton" )

CoD.lobbyFlyout_Generic = InheritFrom( LUI.UIElement )
CoD.lobbyFlyout_Generic.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.lobbyFlyout_Generic )
	self.id = "lobbyFlyout_Generic"
	self.soundSet = "none"
	self:setLeftRight( 0, 0, 0, 162 )
	self:setTopBottom( 0, 0, 0, 170 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local selectedItem = CoD.lobbyFlyout_GenericSelectionButton.new( menu, controller )
	selectedItem:setLeftRight( 0, 0, 0, 162 )
	selectedItem:setTopBottom( 0, 0, 8, 170 )
	selectedItem:linkToElementModel( self, nil, false, function ( model )
		selectedItem:setModel( model, controller )
	end )
	selectedItem:linkToElementModel( selectedItem, "disabled", true, function ( model )
		local element = selectedItem
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	selectedItem:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	selectedItem:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( selectedItem, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		if not IsDisabled( self, controller ) and HasListAction( self, controller ) then
			ProcessListAction( self, self, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsDisabled( self, controller ) and HasListAction( self, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", Enum.LUIButtonPromptFlags.BPF_CONTEXTUAL )
			return true
		else
			return false
		end
	end, false )
	self:addElement( selectedItem )
	self.selectedItem = selectedItem
	
	local possibleItemsList = LUI.UIList.new( menu, controller, -42, 0, nil, false, false, 0, 0, false, false )
	possibleItemsList:makeFocusable()
	possibleItemsList:setLeftRight( 0, 0, 0, 2202 )
	possibleItemsList:setTopBottom( 0, 0, -162, 0 )
	possibleItemsList:setAlpha( 0.2 )
	possibleItemsList:setWidgetType( CoD.lobbyFlyout_GenericSelectionButton )
	possibleItemsList:setHorizontalCount( 18 )
	possibleItemsList:setSpacing( -42 )
	possibleItemsList:linkToElementModel( self, "listDatasource", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			possibleItemsList:setDataSource( modelValue )
		end
	end )
	possibleItemsList:linkToElementModel( possibleItemsList, "disabled", true, function ( model )
		local element = possibleItemsList
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	possibleItemsList:linkToElementModel( possibleItemsList, "locked", true, function ( model )
		local element = possibleItemsList
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "locked"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	possibleItemsList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		ProcessListItemGainFocusAction( menu, self, element, controller )
		return retVal
	end )
	possibleItemsList:registerEventHandler( "list_item_lose_focus", function ( element, event )
		local retVal = nil
		ProcessListItemLoseFocusAction( menu, self, element, controller )
		return retVal
	end )
	possibleItemsList:registerEventHandler( "gain_list_focus", function ( element, event )
		local retVal = nil
		ProcessListGainFocusAction( menu, self, element, controller )
		return retVal
	end )
	possibleItemsList:registerEventHandler( "lose_list_focus", function ( element, event )
		local retVal = nil
		ProcessListLoseFocusAction( menu, self, element, controller )
		return retVal
	end )
	possibleItemsList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	possibleItemsList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( possibleItemsList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		if not IsDisabled( element, controller ) and not IsSelfModelValueTrue( element, controller, "locked" ) then
			ProcessListAction( self, element, controller )
			UpdateSelfElementState( menu, self.possibleItemsList, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsDisabled( element, controller ) and not IsSelfModelValueTrue( element, controller, "locked" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MPUI_EQUIP", Enum.LUIButtonPromptFlags.BPF_CONTEXTUAL )
			return true
		else
			return false
		end
	end, false )
	self:addElement( possibleItemsList )
	self.possibleItemsList = possibleItemsList
	
	selectedItem.navigation = {
		up = possibleItemsList
	}
	possibleItemsList.navigation = {
		down = selectedItem
	}
	self.resetProperties = function ()
		possibleItemsList:completeAnimation()
		possibleItemsList:setAlpha( 0.2 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				possibleItemsList:completeAnimation()
				self.possibleItemsList:setAlpha( 0 )
				self.clipFinished( possibleItemsList, {} )
			end
		},
		FlyOut = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				possibleItemsList:completeAnimation()
				self.possibleItemsList:setAlpha( 1 )
				self.clipFinished( possibleItemsList, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "FlyOut",
			condition = function ( menu, element, event )
				return IsSelfInState( self, "FlyOut_Right" )
			end
		}
	} )
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	selectedItem.id = "selectedItem"
	possibleItemsList.id = "possibleItemsList"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.selectedItem:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.selectedItem:close()
		self.possibleItemsList:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	local element = self
	CoD.FreeCursorUtility.RegisterFlyout( menu, self, controller, "selectedItem", "possibleItemsList" )
	DisableDefaultGainFocus( self, controller )
	return self
end

