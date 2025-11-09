require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.PC.StartMenu.Dropdown.OptionDropdownItem" )
require( "ui.uieditor.widgets.Scrollbars.verticalScrollbar" )

local ToggleInUse = function ( self, controller )
	if self.DropDownList then
		self.inUse = not self.inUse
		if self.inUse then
			self:setPriority( 100 )
			self.m_disableNavigation = true
			MakeFocusable( self.DropDownList )
			SetFocusToElement( self, "DropDownList", controller )
			self.DropDownList.m_disableNavigation = nil
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
		if type( self.dropDownRefresh ) == "function" then
			local newValueDisplay = self.dropDownRefresh( controller, self, self.DropDownList )
			self.currentValueText:setText( Engine.Localize( newValueDisplay ) )
		end
	end )
	self.listBackground:setHandleMouseButton( true )
	self.listBackground:registerEventHandler( "button_action", function ( element, event )
		
	end )
	self.listBackground:registerEventHandler( "leftclick_outside", function ( element, event )
		if self.inUse then
			ToggleInUse( self, controller )
			UpdateState( self, event )
			return true
		else
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
		if not menu.m_disableNavigation and menu:AcceptGamePadButtonInputFromModelCallback( controller ) then
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
	self:setLeftRight( true, false, 0, 500 )
	self:setTopBottom( true, false, 0, 34 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local listBackground = LUI.UIImage.new()
	listBackground:setLeftRight( true, false, 250, 519 )
	listBackground:setTopBottom( true, false, 34, 292 )
	listBackground:setRGB( 0.2, 0.2, 0.2 )
	listBackground:setAlpha( 0 )
	self:addElement( listBackground )
	self.listBackground = listBackground
	
	local fullBacking = LUI.UIImage.new()
	fullBacking:setLeftRight( true, true, 0, 0 )
	fullBacking:setTopBottom( true, true, 0, 0 )
	fullBacking:setRGB( 0.1, 0.1, 0.1 )
	self:addElement( fullBacking )
	self.fullBacking = fullBacking
	
	local StartMenuframenoBG00 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG00:setLeftRight( true, true, 0, 0 )
	StartMenuframenoBG00:setTopBottom( true, true, 0, 0 )
	self:addElement( StartMenuframenoBG00 )
	self.StartMenuframenoBG00 = StartMenuframenoBG00
	
	local labelText = LUI.UIText.new()
	labelText:setLeftRight( true, false, 9.34, 250 )
	labelText:setTopBottom( true, false, 4.5, 29.5 )
	labelText:setTTF( "fonts/default.ttf" )
	labelText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	labelText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( labelText )
	self.labelText = labelText
	
	local dropdownBacking = LUI.UIImage.new()
	dropdownBacking:setLeftRight( true, false, 250, 491 )
	dropdownBacking:setTopBottom( true, false, 7.25, 26.75 )
	dropdownBacking:setRGB( 0.1, 0.1, 0.1 )
	dropdownBacking:setAlpha( 0 )
	self:addElement( dropdownBacking )
	self.dropdownBacking = dropdownBacking
	
	local currentValueText = LUI.UIText.new()
	currentValueText:setLeftRight( true, false, 255, 499 )
	currentValueText:setTopBottom( true, false, 4.25, 29.25 )
	currentValueText:setText( Engine.Localize( "" ) )
	currentValueText:setTTF( "fonts/default.ttf" )
	currentValueText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	currentValueText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( currentValueText )
	self.currentValueText = currentValueText
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( true, true, 0, 0 )
	FocusBarB:setTopBottom( false, true, -5.5, 0 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( true, true, 2, 0 )
	FocusBarT:setTopBottom( true, false, 0, 4 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local DropDownList = LUI.UIList.new( menu, controller, 2, 0, nil, true, false, 1, 0, false, true )
	DropDownList:makeFocusable()
	DropDownList:setLeftRight( false, true, -251, 0 )
	DropDownList:setTopBottom( true, false, 34, 292 )
	DropDownList:setAlpha( 0 )
	DropDownList:setWidgetType( CoD.OptionDropdownItem )
	DropDownList:setVerticalCount( 10 )
	DropDownList:setVerticalScrollbar( CoD.verticalScrollbar )
	self:addElement( DropDownList )
	self.DropDownList = DropDownList
	
	local Arrow = LUI.UIImage.new()
	Arrow:setLeftRight( true, true, 468.12, -1 )
	Arrow:setTopBottom( true, true, 4.5, -4.5 )
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
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				listBackground:completeAnimation()
				self.listBackground:setAlpha( 0 )
				self.clipFinished( listBackground, {} )
				currentValueText:completeAnimation()
				self.currentValueText:setAlpha( 0.5 )
				self.clipFinished( currentValueText, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, true, 0, 0 )
				self.FocusBarT:setTopBottom( true, false, 0, 4 )
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				DropDownList:completeAnimation()
				self.DropDownList:setAlpha( 0 )
				self.clipFinished( DropDownList, {} )
				Arrow:completeAnimation()
				self.Arrow:setZRot( 90 )
				self.clipFinished( Arrow, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 6 )
				listBackground:completeAnimation()
				self.listBackground:setAlpha( 0 )
				self.clipFinished( listBackground, {} )
				currentValueText:completeAnimation()
				self.currentValueText:setAlpha( 1 )
				self.clipFinished( currentValueText, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				DropDownList:completeAnimation()
				self.DropDownList:setAlpha( 0 )
				self.clipFinished( DropDownList, {} )
				Arrow:completeAnimation()
				self.Arrow:setZRot( 90 )
				self.clipFinished( Arrow, {} )
			end
		},
		InUse = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				listBackground:completeAnimation()
				self.listBackground:setAlpha( 1 )
				self.clipFinished( listBackground, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
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
			stateName = "InUse",
			condition = function ( menu, element, event )
				return DropDownListIsInUse( element )
			end
		}
	} )
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

