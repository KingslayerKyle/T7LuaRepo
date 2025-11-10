require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.PC.StartMenu.Dropdown.OptionDropdownItem" )
require( "ui.uieditor.widgets.Scrollbars.verticalScrollbar" )

local f0_local0 = function ( f1_arg0, f1_arg1 )
	if f1_arg0.DropDownList then
		f1_arg0.inUse = not f1_arg0.inUse
		if f1_arg0.inUse then
			f1_arg0:setPriority( 100 )
			f1_arg0.m_disableNavigation = true
			MakeFocusable( f1_arg0.DropDownList )
			SetFocusToElement( f1_arg0, "DropDownList", f1_arg1 )
			f1_arg0.DropDownList.m_disableNavigation = nil
			if type( f1_arg0.dropDownCurrentValue ) == "function" then
				local f1_local0 = f1_arg0.DropDownList:findItem( {
					value = f1_arg0.dropDownCurrentValue( f1_arg1, f1_arg0 )
				}, nil, false, nil )
				if f1_local0 then
					f1_arg0.DropDownList:setActiveItem( f1_local0 )
				end
			end
			local f1_local1, f1_local0 = f1_arg0.DropDownList:getLocalSize()
			f1_arg0.listBackground:setTopBottom( false, true, 0, f1_local0 )
		else
			f1_arg0:setPriority( 0 )
			f1_arg0.m_disableNavigation = nil
			MakeNotFocusable( f1_arg0.DropDownList )
			SetLoseFocusToElement( f1_arg0, "DropDownList", f1_arg1 )
			f1_arg0.DropDownList.m_disableNavigation = true
		end
		f1_arg0:dispatchEventToParent( {
			name = "dropdown_triggered",
			widget = f1_arg0,
			inUse = f1_arg0.inUse,
			controller = f1_arg1
		} )
	end
end

local f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2 )
	f2_arg0:setForceMouseEventDispatch( true )
	f2_arg0:registerEventHandler( "dropdown_item_selected", function ( element, event )
		if type( element.dropDownItemSelected ) == "function" and element.inUse then
			element.currentValueText:setText( Engine.Localize( element.dropDownItemSelected( f2_arg1, element, event.element ) ) )
		end
		f0_local0( element, f2_arg1 )
		UpdateState( element, event )
		element.DropDownList:updateDataSource()
		return true
	end )
	f2_arg0:registerEventHandler( "dropdown_item_cancelled", function ( element, event )
		if element.inUse then
			f0_local0( element, f2_arg1 )
			UpdateState( element, event )
			return true
		else
			return false
		end
	end )
	f2_arg0:registerEventHandler( "options_refresh", function ( element, event )
		element.DropDownList:updateDataSource()
		if type( element.dropDownRefresh ) == "function" then
			element.currentValueText:setText( Engine.Localize( element.dropDownRefresh( f2_arg1, element, element.DropDownList ) ) )
		end
		UpdateState( element, event )
	end )
	f2_arg0.listBackground:setHandleMouseButton( true )
	f2_arg0.listBackground:registerEventHandler( "leftmouseup", function ( element, event )
		if event.inside then
			element.m_clickedInside = nil
		end
	end )
	f2_arg0.listBackground:registerEventHandler( "leftmousedown", function ( element, event )
		element.m_clickedInside = true
	end )
	f2_arg0.listBackground:registerEventHandler( "leftclick_outside", function ( element, event )
		if f2_arg0.inUse and not element.m_clickedInside then
			f0_local0( f2_arg0, f2_arg1 )
			UpdateState( f2_arg0, event )
			return true
		else
			element.m_clickedInside = nil
			return false
		end
	end )
	f2_arg0:registerEventHandler( "mouse_left_click", function ( element, event )
		if event.element.m_dropdownItem then
			return element:dispatchEventToParent( event )
		else
			return true
		end
	end )
	CoD.Menu.AddButtonCallbackFunction( f2_arg2, f2_arg0, f2_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, f10_arg3 )
		if not f2_arg0.disabled and not menu.m_disableNavigation and menu:AcceptGamePadButtonInputFromModelCallback( controller ) then
			if not f2_arg0.inUse then
				f0_local0( f2_arg0, controller )
				UpdateState( f2_arg0, {
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
		f0_local1( self, controller, menu )
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
	listBackground:setRGB( 0, 0, 0 )
	listBackground:setAlpha( 0 )
	self:addElement( listBackground )
	self.listBackground = listBackground
	
	local fullBacking = LUI.UIImage.new()
	fullBacking:setLeftRight( true, true, 0, 0 )
	fullBacking:setTopBottom( true, true, 0, 0 )
	fullBacking:setRGB( 0.1, 0.1, 0.1 )
	fullBacking:setAlpha( 0 )
	self:addElement( fullBacking )
	self.fullBacking = fullBacking
	
	local StartMenuframenoBG00 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG00:setLeftRight( true, true, 0, 0 )
	StartMenuframenoBG00:setTopBottom( true, true, 0, 0 )
	self:addElement( StartMenuframenoBG00 )
	self.StartMenuframenoBG00 = StartMenuframenoBG00
	
	local labelText = LUI.UIText.new()
	labelText:setLeftRight( true, false, 9.34, 285 )
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
	currentValueText:setLeftRight( true, false, 255, 470 )
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
	
	local frameOutline = CoD.StartMenu_frame_noBG.new( menu, controller )
	frameOutline:setLeftRight( true, true, 0, 0 )
	frameOutline:setTopBottom( true, true, 0, 0 )
	frameOutline:setRGB( 0.87, 0.37, 0 )
	frameOutline:setAlpha( 0 )
	self:addElement( frameOutline )
	self.frameOutline = frameOutline
	
	self.labelText:linkToElementModel( self, "label", true, function ( model )
		local label = Engine.GetModelValue( model )
		if label then
			labelText:setText( Engine.Localize( label ) )
		end
	end )
	self.DropDownList:linkToElementModel( self, "datasource", true, function ( model )
		local datasource = Engine.GetModelValue( model )
		if datasource then
			DropDownList:setDataSource( datasource )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				listBackground:completeAnimation()
				self.listBackground:setAlpha( 0 )
				self.clipFinished( listBackground, {} )
				labelText:completeAnimation()
				self.labelText:setRGB( 1, 1, 1 )
				self.clipFinished( labelText, {} )
				currentValueText:completeAnimation()
				self.currentValueText:setRGB( 1, 1, 1 )
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
				self.Arrow:setRGB( 1, 1, 1 )
				self.Arrow:setZRot( 90 )
				self.clipFinished( Arrow, {} )
				frameOutline:completeAnimation()
				self.frameOutline:setAlpha( 0 )
				self.clipFinished( frameOutline, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 7 )
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
				frameOutline:completeAnimation()
				self.frameOutline:setAlpha( 1 )
				self.clipFinished( frameOutline, {} )
			end
		},
		Disabled = {
			DefaultClip = function ()
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
				self:setupElementClipCounter( 7 )
				listBackground:completeAnimation()
				self.listBackground:setAlpha( 1 )
				self.clipFinished( listBackground, {} )
				labelText:completeAnimation()
				self.labelText:setRGB( 1, 1, 1 )
				self.clipFinished( labelText, {} )
				currentValueText:completeAnimation()
				self.currentValueText:setRGB( 1, 1, 1 )
				self.clipFinished( currentValueText, {} )
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
				self.Arrow:setRGB( 1, 1, 1 )
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
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, controller )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.StartMenuframenoBG00:close()
		element.FocusBarB:close()
		element.FocusBarT:close()
		element.DropDownList:close()
		element.frameOutline:close()
		element.labelText:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

