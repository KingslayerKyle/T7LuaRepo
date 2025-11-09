require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )

local SetupPC = function ( self, controller, menu )
	CoD.Menu.AddButtonCallbackFunction( menu, self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		self:processEvent( {
			name = "lose_focus",
			controller = controller
		} )
		return self:dispatchEventToParent( {
			name = "dropdown_item_cancelled",
			element = self
		} )
	end )
	CoD.Menu.AddButtonCallbackFunction( menu, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not menu.m_disableNavigation and menu:AcceptGamePadButtonInputFromModelCallback( controller ) then
			self:processEvent( {
				name = "lose_focus",
				controller = controller
			} )
			return self:dispatchEventToParent( {
				name = "dropdown_item_selected",
				element = self
			} )
		else
			
		end
	end )
	self.m_dropdownItem = true
end

local PostLoadFunc = function ( self, controller, menu )
	if CoD.isPC then
		SetupPC( self, controller, menu )
	end
end

CoD.OptionDropdownItem = InheritFrom( LUI.UIElement )
CoD.OptionDropdownItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.OptionDropdownItem )
	self.id = "OptionDropdownItem"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 250 )
	self:setTopBottom( true, false, 0, 24 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local fullbacking = LUI.UIImage.new()
	fullbacking:setLeftRight( true, true, 0, 0 )
	fullbacking:setTopBottom( true, true, 0, 0 )
	fullbacking:setRGB( 0, 0, 0 )
	self:addElement( fullbacking )
	self.fullbacking = fullbacking
	
	local labelText = LUI.UIText.new()
	labelText:setLeftRight( true, false, 6.2, 243 )
	labelText:setTopBottom( true, false, 0, 24 )
	labelText:setTTF( "fonts/default.ttf" )
	labelText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	labelText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( labelText )
	self.labelText = labelText
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( true, true, -2, 2 )
	FocusBarT:setTopBottom( true, false, -1, 3 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( true, true, -2, 2 )
	FocusBarB:setTopBottom( false, true, -2, 2 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	self.labelText:linkToElementModel( self, "valueDisplay", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			labelText:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				labelText:completeAnimation()
				self.labelText:setLeftRight( true, false, 6.2, 243 )
				self.labelText:setTopBottom( true, false, 0, 24 )
				self.labelText:setAlpha( 0.5 )
				self.clipFinished( labelText, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 4 )
				fullbacking:completeAnimation()
				self.fullbacking:setRGB( 0, 0, 0 )
				self.fullbacking:setAlpha( 1 )
				self.clipFinished( fullbacking, {} )
				labelText:completeAnimation()
				self.labelText:setLeftRight( true, false, 6.2, 240 )
				self.labelText:setTopBottom( true, false, 0, 24 )
				self.labelText:setAlpha( 1 )
				self.clipFinished( labelText, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FocusBarT:close()
		self.FocusBarB:close()
		self.labelText:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

