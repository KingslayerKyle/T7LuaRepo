require( "ui.uieditor.widgets.Scrollbars.listCounterButton" )

CoD.verticalCounter = InheritFrom( LUI.UIElement )
CoD.verticalCounter.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.verticalCounter )
	self.id = "verticalCounter"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 300 )
	self:setTopBottom( 0, 0, 0, 37 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local currentItem = LUI.UIText.new()
	currentItem:setLeftRight( 0.5, 0.5, -57, -12 )
	currentItem:setTopBottom( 0.5, 0.5, -13.5, 13.5 )
	currentItem:setAlpha( 0.65 )
	currentItem:setText( "" )
	currentItem:setTTF( "fonts/default.ttf" )
	currentItem:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	currentItem:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( currentItem )
	self.currentItem = currentItem
	
	local dividor = LUI.UITightText.new()
	dividor:setLeftRight( 0.5, 0.5, -4.5, 4.5 )
	dividor:setTopBottom( 0.5, 0.5, -13.5, 13.5 )
	dividor:setAlpha( 0.65 )
	dividor:setText( Engine.Localize( "/" ) )
	dividor:setTTF( "fonts/default.ttf" )
	self:addElement( dividor )
	self.dividor = dividor
	
	local count = LUI.UIText.new()
	count:setLeftRight( 0.5, 0.5, 12, 57 )
	count:setTopBottom( 0.5, 0.5, -13.5, 13.5 )
	count:setAlpha( 0.65 )
	count:setText( "" )
	count:setTTF( "fonts/default.ttf" )
	count:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	count:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( count )
	self.count = count
	
	local downArrowBtn = CoD.listCounterButton.new( menu, controller )
	downArrowBtn:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return IsElementInAnyState( self, "AtTopAndBottom", "NoItems" )
			end
		},
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return IsElementInAnyState( self, "AtBottom" )
			end
		}
	} )
	downArrowBtn:setLeftRight( 0.5, 0.5, -119, -47 )
	downArrowBtn:setTopBottom( 0.5, 0.5, -18, 18 )
	downArrowBtn:setZRot( 180 )
	downArrowBtn:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	downArrowBtn:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( downArrowBtn, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		NavigateScrollButtonDown( self )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "", nil )
		return false
	end, false )
	self:addElement( downArrowBtn )
	self.downArrowBtn = downArrowBtn
	
	local upArrowBtn = CoD.listCounterButton.new( menu, controller )
	upArrowBtn:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return IsElementInAnyState( self, "AtTopAndBottom", "NoItems" )
			end
		},
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return IsElementInAnyState( self, "AtTop" )
			end
		}
	} )
	upArrowBtn:setLeftRight( 0.5, 0.5, 47, 119 )
	upArrowBtn:setTopBottom( 0.5, 0.5, -18, 18 )
	upArrowBtn:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	upArrowBtn:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( upArrowBtn, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		NavigateScrollButtonUp( self )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "", nil )
		return false
	end, false )
	self:addElement( upArrowBtn )
	self.upArrowBtn = upArrowBtn
	
	downArrowBtn.navigation = {
		right = upArrowBtn
	}
	upArrowBtn.navigation = {
		left = downArrowBtn
	}
	self.resetProperties = function ()
		currentItem:completeAnimation()
		dividor:completeAnimation()
		count:completeAnimation()
		downArrowBtn:completeAnimation()
		upArrowBtn:completeAnimation()
		currentItem:setAlpha( 0.65 )
		dividor:setAlpha( 0.65 )
		count:setAlpha( 0.65 )
		downArrowBtn:setAlpha( 1 )
		upArrowBtn:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				currentItem:completeAnimation()
				self.currentItem:setAlpha( 1 )
				self.clipFinished( currentItem, {} )
				dividor:completeAnimation()
				self.dividor:setAlpha( 1 )
				self.clipFinished( dividor, {} )
				count:completeAnimation()
				self.count:setAlpha( 1 )
				self.clipFinished( count, {} )
			end
		},
		AtTopAndBottom = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				currentItem:completeAnimation()
				self.currentItem:setAlpha( 0 )
				self.clipFinished( currentItem, {} )
				dividor:completeAnimation()
				self.dividor:setAlpha( 0 )
				self.clipFinished( dividor, {} )
				count:completeAnimation()
				self.count:setAlpha( 0 )
				self.clipFinished( count, {} )
				downArrowBtn:completeAnimation()
				self.downArrowBtn:setAlpha( 0 )
				self.clipFinished( downArrowBtn, {} )
				upArrowBtn:completeAnimation()
				self.upArrowBtn:setAlpha( 0 )
				self.clipFinished( upArrowBtn, {} )
			end
		},
		AtTop = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				currentItem:completeAnimation()
				self.currentItem:setAlpha( 1 )
				self.clipFinished( currentItem, {} )
				dividor:completeAnimation()
				self.dividor:setAlpha( 1 )
				self.clipFinished( dividor, {} )
				count:completeAnimation()
				self.count:setAlpha( 1 )
				self.clipFinished( count, {} )
			end
		},
		AtBottom = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				currentItem:completeAnimation()
				self.currentItem:setAlpha( 1 )
				self.clipFinished( currentItem, {} )
				dividor:completeAnimation()
				self.dividor:setAlpha( 1 )
				self.clipFinished( dividor, {} )
				count:completeAnimation()
				self.count:setAlpha( 1 )
				self.clipFinished( count, {} )
			end
		},
		NoItems = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				currentItem:completeAnimation()
				self.currentItem:setAlpha( 0 )
				self.clipFinished( currentItem, {} )
				dividor:completeAnimation()
				self.dividor:setAlpha( 0 )
				self.clipFinished( dividor, {} )
				count:completeAnimation()
				self.count:setAlpha( 0 )
				self.clipFinished( count, {} )
				downArrowBtn:completeAnimation()
				self.downArrowBtn:setAlpha( 0 )
				self.clipFinished( downArrowBtn, {} )
				upArrowBtn:completeAnimation()
				self.upArrowBtn:setAlpha( 0 )
				self.clipFinished( upArrowBtn, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "AtTopAndBottom",
			condition = function ( menu, element, event )
				return IsSelfInState( self, "AtTopAndBottom" )
			end
		},
		{
			stateName = "AtTop",
			condition = function ( menu, element, event )
				return IsSelfInState( self, "AtTop" )
			end
		},
		{
			stateName = "AtBottom",
			condition = function ( menu, element, event )
				return IsSelfInState( self, "AtBottom" )
			end
		},
		{
			stateName = "NoItems",
			condition = function ( menu, element, event )
				return IsSelfInState( self, "NoItems" )
			end
		}
	} )
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, state )
		UpdateElementState( self, "downArrowBtn", controller )
		UpdateElementState( self, "upArrowBtn", controller )
	end )
	downArrowBtn.id = "downArrowBtn"
	upArrowBtn.id = "upArrowBtn"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.downArrowBtn:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.downArrowBtn:close()
		self.upArrowBtn:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

