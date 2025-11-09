require( "ui.uieditor.widgets.CAC.List1ButtonChooseClass" )

CoD.chooseClassInGameClassList = InheritFrom( LUI.UIElement )
CoD.chooseClassInGameClassList.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.chooseClassInGameClassList )
	self.id = "chooseClassInGameClassList"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 280 )
	self:setTopBottom( true, false, 0, 508 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local classList = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, false )
	classList:makeFocusable()
	classList:setLeftRight( true, false, 0, 280 )
	classList:setTopBottom( true, false, 0, 508 )
	classList:setWidgetType( CoD.List1ButtonChooseClass )
	classList:setVerticalCount( 15 )
	classList:setDataSource( "ChooseClass_InGame" )
	classList:linkToElementModel( classList, "disabled", true, function ( model )
		local f2_local0 = classList
		local f2_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		}
		CoD.Menu.UpdateButtonShownState( f2_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	classList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f3_local0 = nil
		if IsCampaign() then
			SetCustomParentClassNum( self, element, controller )
		else
			UpdateParentClassView( self, element, controller )
		end
		return f3_local0
	end )
	classList:registerEventHandler( "gain_focus", function ( element, event )
		local f4_local0 = nil
		if element.gainFocus then
			f4_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f4_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f4_local0
	end )
	classList:registerEventHandler( "lose_focus", function ( element, event )
		local f5_local0 = nil
		if element.loseFocus then
			f5_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f5_local0 = element.super:loseFocus( event )
		end
		return f5_local0
	end )
	menu:AddButtonCallbackFunction( classList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsPerControllerTablePropertyValue( controller, "isInMobileArmory", true ) then
			ChangeClass( self, element, controller )
			LockInput( self, controller, false )
			Close( self, controller )
			SetPerControllerTableProperty( controller, "isInMobileArmory", false )
			return true
		elseif not IsInGame() then
			ChangeClass( self, element, controller )
			GoBack( self, controller )
			return true
		elseif IsInGame() and not IsDisabled( element, controller ) then
			ChangeClass( self, element, controller )
			CloseStartMenu( menu, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsPerControllerTablePropertyValue( controller, "isInMobileArmory", true ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		elseif not IsInGame() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		elseif IsInGame() and not IsDisabled( element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	self:addElement( classList )
	self.classList = classList
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	classList.id = "classList"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.classList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.classList:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

