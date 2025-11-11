require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.PC.StartMenu.Dropdown.OptionDropdownItem" )
require( "ui.uieditor.widgets.Scrollbars.verticalScrollbar" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )

local ToggleInUse = function ( self, controller )
	if self.DropDownList then
		self.inUse = not self.inUse
		if self.inUse then
			self:setPriority( 100 )
			self.m_disableNavigation = true
			MakeFocusable( self.DropDownList )
			SetFocusToElement( self, "DropDownList", controller )
			self.DropDownList.m_disableNavigation = nil
			if type( self.dropDownCurrentValue ) == "function" then
				local currentValue = self.dropDownCurrentValue( controller, self )
				local selectedItem = self.DropDownList:findItem( {
					value = currentValue
				}, nil, false, nil )
				if selectedItem then
					self.DropDownList:setActiveItem( selectedItem )
				end
			end
			local listWidth, listHeight = self.DropDownList:getLocalSize()
			self.listBackground:setTopBottom( false, true, 0, listHeight )
		else
			self:setPriority( 0 )
			self.m_disableNavigation = nil
			MakeNotFocusable( self.DropDownList )
			SetLoseFocusToElement( self, "DropDownList", controller )
			self.DropDownList.m_disableNavigation = true
		end
		self:dispatchEventToParent( {
			name = "dropdown_triggered",
			widget = self,
			inUse = self.inUse,
			controller = controller
		} )
	end
end

local SetupPC = function ( self, controller, menu )
	self:setForceMouseEventDispatch( true )
	self:registerEventHandler( "dropdown_item_selected", function ( self, event )
		if type( self.dropDownItemSelected ) == "function" and self.inUse then
			local newValueDisplay = self.dropDownItemSelected( controller, self, event.element )
			self.currentValueText:setText( Engine.Localize( newValueDisplay ) )
		end
		ToggleInUse( self, controller )
		UpdateState( self, event )
		self.DropDownList:updateDataSource()
		return true
	end )
	self:registerEventHandler( "dropdown_item_cancelled", function ( self, event )
		if self.inUse then
			ToggleInUse( self, controller )
			UpdateState( self, event )
			return true
		else
			return false
		end
	end )
	self:registerEventHandler( "options_refresh", function ( self, event )
		self.DropDownList:updateDataSource()
		if type( self.dropDownRefresh ) == "function" then
			local newValueDisplay = self.dropDownRefresh( controller, self, self.DropDownList )
			self.currentValueText:setText( Engine.Localize( newValueDisplay ) )
		end
		UpdateState( self, event )
	end )
	self.listBackground:setHandleMouseButton( true )
	self.listBackground:registerEventHandler( "leftmouseup", function ( element, event )
		if event.inside then
			element.m_clickedInside = nil
		end
	end )
	self.listBackground:registerEventHandler( "leftmousedown", function ( element, event )
		element.m_clickedInside = true
	end )
	self.listBackground:registerEventHandler( "leftclick_outside", function ( element, event )
		if self.inUse and not element.m_clickedInside then
			ToggleInUse( self, controller )
			UpdateState( self, event )
			return true
		else
			element.m_clickedInside = nil
			return false
		end
	end )
	self:registerEventHandler( "mouse_left_click", function ( element, event )
		if event.element.m_dropdownItem then
			return element:dispatchEventToParent( event )
		else
			return true
		end
	end )
	CoD.Menu.AddButtonCallbackFunction( menu, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not self.disabled and not menu.m_disableNavigation and menu:AcceptGamePadButtonInputFromModelCallback( controller ) then
			if not self.inUse then
				ToggleInUse( self, controller )
				UpdateState( self, {
					name = "update_state",
					controller = controller
				} )
			end
			return true
		else
			
		end
	end )
end

local PostLoadFunc = function ( self, controller, menu )
	if CoD.isPC then
		SetupPC( self, controller, menu )
	end
end

CoD.OptionDropdown = InheritFrom( LUI.UIElement )
CoD.OptionDropdown.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.OptionDropdown )
	self.id = "OptionDropdown"
	self.soundSet = "none"
	self:setLeftRight( 0, 0, 0, 750 )
	self:setTopBottom( 0, 0, 0, 51 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local listBackground = LUI.UIImage.new()
	listBackground:setLeftRight( 0, 0, 375, 779 )
	listBackground:setTopBottom( 0, 0, 51, 438 )
	listBackground:setRGB( 0, 0, 0 )
	listBackground:setAlpha( 0 )
	self:addElement( listBackground )
	self.listBackground = listBackground
	
	local fullBacking = LUI.UIImage.new()
	fullBacking:setLeftRight( 0, 1, 0, 0 )
	fullBacking:setTopBottom( 0, 1, 0, 0 )
	fullBacking:setRGB( 0.1, 0.1, 0.1 )
	fullBacking:setAlpha( 0 )
	self:addElement( fullBacking )
	self.fullBacking = fullBacking
	
	local StartMenuframenoBG00 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG00:setLeftRight( 0, 1, 0, 0 )
	StartMenuframenoBG00:setTopBottom( 0, 1, 0, 0 )
	self:addElement( StartMenuframenoBG00 )
	self.StartMenuframenoBG00 = StartMenuframenoBG00
	
	local labelText = LUI.UIText.new()
	labelText:setLeftRight( 0, 0, 14, 427 )
	labelText:setTopBottom( 0, 0, 7, 45 )
	labelText:setTTF( "fonts/default.ttf" )
	labelText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	labelText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( labelText )
	self.labelText = labelText
	
	local dropdownBacking = LUI.UIImage.new()
	dropdownBacking:setLeftRight( 0, 0, 375, 737 )
	dropdownBacking:setTopBottom( 0, 0, 11, 40 )
	dropdownBacking:setRGB( 0.1, 0.1, 0.1 )
	dropdownBacking:setAlpha( 0 )
	self:addElement( dropdownBacking )
	self.dropdownBacking = dropdownBacking
	
	local currentValueText = LUI.UIText.new()
	currentValueText:setLeftRight( 0, 0, 383, 705 )
	currentValueText:setTopBottom( 0, 0, 6, 44 )
	currentValueText:setText( Engine.Localize( "" ) )
	currentValueText:setTTF( "fonts/default.ttf" )
	currentValueText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	currentValueText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( currentValueText )
	self.currentValueText = currentValueText
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( 0, 1, 0, 0 )
	FocusBarB:setTopBottom( 1, 1, -8, 0 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( 0, 1, 4, 0 )
	FocusBarT:setTopBottom( 0, 0, 0, 6 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local DropDownList = LUI.UIList.new( menu, controller, 2, 0, nil, true, false, 1, 0, false, false )
	DropDownList:makeFocusable()
	DropDownList:setLeftRight( 1, 1, -376, 0 )
	DropDownList:setTopBottom( 0, 0, 55, 433 )
	DropDownList:setAlpha( 0 )
	DropDownList:setWidgetType( CoD.OptionDropdownItem )
	DropDownList:setVerticalCount( 10 )
	DropDownList:setVerticalScrollbar( CoD.verticalScrollbar )
	self:addElement( DropDownList )
	self.DropDownList = DropDownList
	
	local Arrow = LUI.UIImage.new()
	Arrow:setLeftRight( 0, 1, 702, -2 )
	Arrow:setTopBottom( 0, 1, 7, -7 )
	Arrow:setZRot( 90 )
	Arrow:setScale( 0.6 )
	Arrow:setImage( RegisterImage( "uie_characterminiselectorarrow" ) )
	self:addElement( Arrow )
	self.Arrow = Arrow
	
	self.labelText:linkToElementModel( self, "label", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			labelText:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.DropDownList:linkToElementModel( self, "datasource", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			DropDownList:setDataSource( modelValue )
		end
	end )
	self.resetProperties = function ()
		FocusBarT:completeAnimation()
		currentValueText:completeAnimation()
		FocusBarB:completeAnimation()
		Arrow:completeAnimation()
		labelText:completeAnimation()
		DropDownList:completeAnimation()
		listBackground:completeAnimation()
		FocusBarT:setLeftRight( 0, 1, 4, 0 )
		FocusBarT:setTopBottom( 0, 0, 0, 6 )
		FocusBarT:setAlpha( 0 )
		currentValueText:setRGB( 1, 1, 1 )
		currentValueText:setAlpha( 1 )
		FocusBarB:setAlpha( 0 )
		Arrow:setRGB( 1, 1, 1 )
		Arrow:setZRot( 90 )
		labelText:setRGB( 1, 1, 1 )
		DropDownList:setAlpha( 0 )
		listBackground:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				currentValueText:completeAnimation()
				self.currentValueText:setAlpha( 0.5 )
				self.clipFinished( currentValueText, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( 0, 1, 0, 0 )
				self.FocusBarT:setTopBottom( 0, 0, 0, 6 )
				self.clipFinished( FocusBarT, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
			end
		},
		Disabled = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				labelText:completeAnimation()
				self.labelText:setRGB( 0.2, 0.2, 0.2 )
				self.clipFinished( labelText, {} )
				currentValueText:completeAnimation()
				self.currentValueText:setRGB( 0.2, 0.2, 0.2 )
				self.clipFinished( currentValueText, {} )
				Arrow:completeAnimation()
				self.Arrow:setRGB( 0.2, 0.2, 0.2 )
				self.clipFinished( Arrow, {} )
			end
		},
		InUse = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				listBackground:completeAnimation()
				self.listBackground:setAlpha( 1 )
				self.clipFinished( listBackground, {} )
				DropDownList:completeAnimation()
				self.DropDownList:setAlpha( 1 )
				self.clipFinished( DropDownList, {} )
				Arrow:completeAnimation()
				self.Arrow:setZRot( 270 )
				self.clipFinished( Arrow, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return IsDisabled( element, controller )
			end
		},
		{
			stateName = "InUse",
			condition = function ( menu, element, event )
				return DropDownListIsInUse( element )
			end
		}
	} )
	self:linkToElementModel( self, "disabled", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		} )
	end )
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, state )
		if IsInDefaultState( element ) then
			MakeElementNotFocusable( self, "DropDownList", controller )
		end
	end )
	DropDownList.id = "DropDownList"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.DropDownList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.StartMenuframenoBG00:close()
		self.FocusBarB:close()
		self.FocusBarT:close()
		self.DropDownList:close()
		self.labelText:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

