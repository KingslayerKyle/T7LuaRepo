require( "ui.uieditor.widgets.CAC.ChooseClassGridScreen.LethalGrenade.LethalGrenadeModItemSlotWidget" )

CoD.LethalGrenadeModSlotWidget = InheritFrom( LUI.UIElement )
CoD.LethalGrenadeModSlotWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LethalGrenadeModSlotWidget )
	self.id = "LethalGrenadeModSlotWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 236 )
	self:setTopBottom( true, false, 0, 89 )
	self.anyChildUsesUpdateState = true
	local LethalGrenadeModItemSlotWidget0 = CoD.LethalGrenadeModItemSlotWidget.new( menu, controller )
	LethalGrenadeModItemSlotWidget0:setLeftRight( true, false, 0, 116.5 )
	LethalGrenadeModItemSlotWidget0:setTopBottom( true, false, 0, 89 )
	LethalGrenadeModItemSlotWidget0:setRGB( 1, 1, 1 )
	LethalGrenadeModItemSlotWidget0:linkToElementModel( self, "custprimarygadgetattachment1", false, function ( model )
		LethalGrenadeModItemSlotWidget0:setModel( model, controller )
	end )
	LethalGrenadeModItemSlotWidget0:mergeStateConditions( {
		{
			stateName = "NotAvailable",
			condition = function ( menu, element, event )
				return not IsPrimaryEquipmentModAvailable( menu, element, event )
			end
		},
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
		}
	} )
	if LethalGrenadeModItemSlotWidget0.m_eventHandlers.update_class then
		local currentEv = LethalGrenadeModItemSlotWidget0.m_eventHandlers.update_class
		LethalGrenadeModItemSlotWidget0:registerEventHandler( "update_class", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		LethalGrenadeModItemSlotWidget0:registerEventHandler( "update_class", LUI.UIElement.updateState )
	end
	LethalGrenadeModItemSlotWidget0:linkToElementModel( LethalGrenadeModItemSlotWidget0, "itemIndex", true, function ( model )
		menu:updateElementState( LethalGrenadeModItemSlotWidget0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	self:addElement( LethalGrenadeModItemSlotWidget0 )
	self.LethalGrenadeModItemSlotWidget0 = LethalGrenadeModItemSlotWidget0
	
	local currentEv = CoD.LethalGrenadeModItemSlotWidget.new( menu, controller )
	currentEv:setLeftRight( true, false, 119.5, 236 )
	currentEv:setTopBottom( true, false, 0, 89 )
	currentEv:setRGB( 1, 1, 1 )
	currentEv:linkToElementModel( self, "custprimarygadgetattachment2", false, function ( model )
		currentEv:setModel( model, controller )
	end )
	currentEv:mergeStateConditions( {
		{
			stateName = "NotAvailable",
			condition = function ( menu, element, event )
				return not IsPrimaryEquipmentModAvailable( menu, element, event )
			end
		},
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
	self.LethalGrenadeModItemSlotWidget1 = currentEv
	
	self.close = function ( self )
		self.LethalGrenadeModItemSlotWidget0:close()
		self.LethalGrenadeModItemSlotWidget1:close()
		CoD.LethalGrenadeModSlotWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

