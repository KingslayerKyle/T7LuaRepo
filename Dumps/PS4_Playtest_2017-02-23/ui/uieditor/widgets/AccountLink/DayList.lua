require( "ui.uieditor.widgets.AccountLink.DayItem" )
require( "ui.uieditor.widgets.InputButton" )
require( "ui.uieditor.widgets.Scrollbars.verticalScrollbarNew" )

CoD.DayList = InheritFrom( LUI.UIElement )
CoD.DayList.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.DayList )
	self.id = "DayList"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 577 )
	self:setTopBottom( 0, 0, 0, 51 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local DropdownRoot = CoD.InputButton.new( menu, controller )
	DropdownRoot:setLeftRight( 0, 1, 0, 0 )
	DropdownRoot:setTopBottom( 0, 1, 0, 0 )
	DropdownRoot.Text:setText( Engine.Localize( "MENU_NEW" ) )
	DropdownRoot:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	DropdownRoot:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( DropdownRoot, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ToggleDropdownListInUse_Console( self, controller )
		UpdateState( self, event )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( DropdownRoot )
	self.DropdownRoot = DropdownRoot
	
	local SelectedValue = LUI.UIText.new()
	SelectedValue:setLeftRight( 0, 1, 19, -19 )
	SelectedValue:setTopBottom( 0, 0, 8, 46 )
	SelectedValue:setText( Engine.Localize( "" ) )
	SelectedValue:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	SelectedValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	SelectedValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( SelectedValue )
	self.SelectedValue = SelectedValue
	
	local DropdownList = LUI.UIList.new( menu, controller, 2, 0, nil, true, false, 0, 0, false, false )
	DropdownList:makeFocusable()
	DropdownList:setLeftRight( 0.5, 0.5, -288.5, 288.5 )
	DropdownList:setTopBottom( 0.5, 0.5, -130, 133 )
	DropdownList:setAlpha( 0 )
	DropdownList:setWidgetType( CoD.DayItem )
	DropdownList:setVerticalCount( 5 )
	DropdownList:setVerticalScrollbar( CoD.verticalScrollbarNew )
	DropdownList:setDataSource( "Day" )
	DropdownList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	DropdownList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( DropdownList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ToggleDropdownListInUse_Console( self, controller )
		UpdateState( self, event )
		AccountLink_SelectDay( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( DropdownList )
	self.DropdownList = DropdownList
	
	DropdownRoot.navigation = {
		down = DropdownList
	}
	DropdownList.navigation = {
		up = DropdownRoot
	}
	self.resetProperties = function ()
		DropdownList:completeAnimation()
		DropdownList:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		InUse = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				DropdownList:completeAnimation()
				self.DropdownList:setAlpha( 1 )
				self.clipFinished( DropdownList, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "InUse",
			condition = function ( menu, element, event )
				return DropdownListIsInUse_Console( element )
			end
		}
	} )
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, state )
		if IsInDefaultState( element ) then
			MakeElementNotFocusable( self, "DropdownList", controller )
		end
	end )
	DropdownRoot.id = "DropdownRoot"
	DropdownList.id = "DropdownList"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.DropdownList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.DropdownRoot:close()
		self.DropdownList:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

