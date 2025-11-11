require( "ui.uieditor.widgets.button" )

CoD.StartMenu_LoadoutModeSelect = InheritFrom( LUI.UIElement )
CoD.StartMenu_LoadoutModeSelect.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_LoadoutModeSelect )
	self.id = "StartMenu_LoadoutModeSelect"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( 0, 0, 0, 1725 )
	self:setTopBottom( 0, 0, 0, 780 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local ZM = CoD.button.new( menu, controller )
	ZM:setLeftRight( 0, 0, 1264.5, 1488.5 )
	ZM:setTopBottom( 0, 0, 367.5, 412.5 )
	ZM.buttoninternal0.Text0:setText( Engine.Localize( "MENU_ZOMBIES_CAPS" ) )
	ZM:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	ZM:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( ZM, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		OpenEditLoadout( self, element, controller, "", menu, Enum.eModes.MODE_ZOMBIES )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "", nil )
		return false
	end, false )
	self:addElement( ZM )
	self.ZM = ZM
	
	local MP = CoD.button.new( menu, controller )
	MP:setLeftRight( 0, 0, 750.5, 974.5 )
	MP:setTopBottom( 0, 0, 367.5, 412.5 )
	MP.buttoninternal0.Text0:setText( Engine.Localize( "MENU_MULTIPLAYER_CAPS" ) )
	MP:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	MP:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( MP, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		OpenEditLoadout( self, element, controller, "", menu, Enum.eModes.MODE_MULTIPLAYER )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "", nil )
		return false
	end, false )
	self:addElement( MP )
	self.MP = MP
	
	local CP = CoD.button.new( menu, controller )
	CP:setLeftRight( 0, 0, 287.5, 511.5 )
	CP:setTopBottom( 0, 0, 367.5, 412.5 )
	CP.buttoninternal0.Text0:setText( Engine.Localize( "MENU_CAMPAIGN_CAPS" ) )
	CP:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	CP:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( CP, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		OpenEditLoadout( self, element, controller, "", menu, Enum.eModes.MODE_CAMPAIGN )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "", nil )
		return false
	end, false )
	self:addElement( CP )
	self.CP = CP
	
	ZM.navigation = {
		left = MP
	}
	MP.navigation = {
		left = CP,
		right = ZM
	}
	CP.navigation = {
		right = MP
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	ZM.id = "ZM"
	MP.id = "MP"
	CP.id = "CP"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.ZM:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.ZM:close()
		self.MP:close()
		self.CP:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

