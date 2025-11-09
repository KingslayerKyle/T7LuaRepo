require( "ui.uieditor.widgets.CAC.CustomClassListScreen.CustomClassCategoryHeader" )
require( "ui.uieditor.widgets.CAC.CustomClassListScreen.Panes.CustomClassGenericItemButton" )

CoD.WildcardPane = InheritFrom( LUI.UIElement )
CoD.WildcardPane.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.WildcardPane )
	self.id = "WildcardPane"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 108 )
	self:setTopBottom( true, false, 0, 445 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local CustomClassCategoryHeader0 = CoD.CustomClassCategoryHeader.new( menu, controller )
	CustomClassCategoryHeader0:setLeftRight( true, true, -3, 35 )
	CustomClassCategoryHeader0:setTopBottom( true, false, 0, 20 )
	CustomClassCategoryHeader0:setRGB( 1, 1, 1 )
	CustomClassCategoryHeader0.text:setText( Engine.Localize( "MENU_WILDCARDS_CAPS" ) )
	self:addElement( CustomClassCategoryHeader0 )
	self.CustomClassCategoryHeader0 = CustomClassCategoryHeader0
	
	local WildcardSlot1 = CoD.CustomClassGenericItemButton.new( menu, controller )
	WildcardSlot1:setLeftRight( true, false, 0, 108 )
	WildcardSlot1:setTopBottom( true, false, 167.66, 303.99 )
	WildcardSlot1:setRGB( 1, 1, 1 )
	WildcardSlot1:linkToElementModel( self, "bonuscard2", false, function ( model )
		WildcardSlot1:setModel( model, controller )
	end )
	WildcardSlot1:mergeStateConditions( {
		{
			stateName = "Unavailable",
			condition = function ( menu, element, event )
				return not IsCACSlotAvailable( menu, element, controller )
			end
		},
		{
			stateName = "Unequipped",
			condition = function ( menu, element, event )
				return not IsCACSlotEquipped( menu, element, controller )
			end
		},
		{
			stateName = "Unavailable_Gadget",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "Unequipped_Gadget",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "Equipped_Gadget",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	if WildcardSlot1.m_eventHandlers.update_class then
		local currentEv = WildcardSlot1.m_eventHandlers.update_class
		WildcardSlot1:registerEventHandler( "update_class", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		WildcardSlot1:registerEventHandler( "update_class", LUI.UIElement.updateState )
	end
	WildcardSlot1:linkToElementModel( WildcardSlot1, "itemIndex", true, function ( model )
		menu:updateElementState( WildcardSlot1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	self:addElement( WildcardSlot1 )
	self.WildcardSlot1 = WildcardSlot1
	
	local currentEv = CoD.CustomClassGenericItemButton.new( menu, controller )
	currentEv:setLeftRight( true, false, 0, 108 )
	currentEv:setTopBottom( true, false, 308.5, 444.83 )
	currentEv:setRGB( 1, 1, 1 )
	currentEv:linkToElementModel( self, "bonuscard3", false, function ( model )
		currentEv:setModel( model, controller )
	end )
	currentEv:mergeStateConditions( {
		{
			stateName = "Unavailable",
			condition = function ( menu, element, event )
				return not IsCACSlotAvailable( menu, element, controller )
			end
		},
		{
			stateName = "Unequipped",
			condition = function ( menu, element, event )
				return not IsCACSlotEquipped( menu, element, controller )
			end
		},
		{
			stateName = "Unavailable_Gadget",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "Unequipped_Gadget",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "Equipped_Gadget",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	if currentEv.m_eventHandlers.update_class then
		local currentEv = currentEv.m_eventHandlers.update_class
		currentEv:registerEventHandler( "update_class", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		currentEv:registerEventHandler( "update_class", LUI.UIElement.updateState )
	end
	currentEv:linkToElementModel( currentEv, "itemIndex", true, function ( model )
		menu:updateElementState( currentEv, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	self:addElement( currentEv )
	self.WildcardSlot2 = currentEv
	
	local currentEv = CoD.CustomClassGenericItemButton.new( menu, controller )
	currentEv:setLeftRight( true, false, 0, 108 )
	currentEv:setTopBottom( true, false, 27, 163.33 )
	currentEv:setRGB( 1, 1, 1 )
	currentEv:linkToElementModel( self, "bonuscard1", false, function ( model )
		currentEv:setModel( model, controller )
	end )
	currentEv:mergeStateConditions( {
		{
			stateName = "Unavailable",
			condition = function ( menu, element, event )
				return not IsCACSlotAvailable( menu, element, controller )
			end
		},
		{
			stateName = "Unequipped",
			condition = function ( menu, element, event )
				return not IsCACSlotEquipped( menu, element, controller )
			end
		},
		{
			stateName = "Unavailable_Gadget",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "Unequipped_Gadget",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "Equipped_Gadget",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	if currentEv.m_eventHandlers.update_class then
		local currentEv = currentEv.m_eventHandlers.update_class
		currentEv:registerEventHandler( "update_class", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		currentEv:registerEventHandler( "update_class", LUI.UIElement.updateState )
	end
	currentEv:linkToElementModel( currentEv, "itemIndex", true, function ( model )
		menu:updateElementState( currentEv, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	self:addElement( currentEv )
	self.WildcardSlot0 = currentEv
	
	WildcardSlot1.navigation = {
		up = currentEv,
		down = currentEv
	}
	currentEv.navigation = {
		up = WildcardSlot1
	}
	currentEv.navigation = {
		down = WildcardSlot1
	}
	WildcardSlot1.id = "WildcardSlot1"
	currentEv.id = "WildcardSlot2"
	currentEv.id = "WildcardSlot0"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.WildcardSlot0:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.CustomClassCategoryHeader0:close()
		self.WildcardSlot1:close()
		self.WildcardSlot2:close()
		self.WildcardSlot0:close()
		CoD.WildcardPane.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

