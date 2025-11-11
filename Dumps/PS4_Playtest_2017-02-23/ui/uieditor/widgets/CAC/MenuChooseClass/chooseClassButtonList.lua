require( "ui.uieditor.menus.CAC.CustomClass" )
require( "ui.uieditor.widgets.CAC.List1ButtonChooseClass" )

CoD.chooseClassButtonList = InheritFrom( LUI.UIElement )
CoD.chooseClassButtonList.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.chooseClassButtonList )
	self.id = "chooseClassButtonList"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 420 )
	self:setTopBottom( 0, 0, 0, 507 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local buttonList = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, false )
	buttonList:makeFocusable()
	buttonList:setLeftRight( 0, 0, 0, 420 )
	buttonList:setTopBottom( 0, 0, 5, 503 )
	buttonList:setWidgetType( CoD.List1ButtonChooseClass )
	buttonList:setVerticalCount( 10 )
	buttonList:setDataSource( "ChooseClassList" )
	buttonList:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		local element = buttonList
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	buttonList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		SetCustomParentClassNum( self, element, controller )
		ResetCustomClassStartingFocus( self, element, controller, false )
		return retVal
	end )
	buttonList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	buttonList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( buttonList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsMultiplayer() and IsIntDvarNonZero( "mp_prototype" ) then
			return true
		elseif not IsMenuInState( menu, "ExtraSlots" ) then
			SetCustomParentClassNum( self, element, controller )
			NavigateToMenu( self, "CustomClass", true, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsMultiplayer() and IsIntDvarNonZero( "mp_prototype" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "", nil )
			return false
		elseif not IsMenuInState( menu, "ExtraSlots" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( buttonList )
	self.buttonList = buttonList
	
	buttonList.id = "buttonList"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.buttonList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.buttonList:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

