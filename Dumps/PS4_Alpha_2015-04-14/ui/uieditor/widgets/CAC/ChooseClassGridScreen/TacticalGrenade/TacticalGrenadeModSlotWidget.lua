require( "ui.uieditor.widgets.CAC.ChooseClassGridScreen.TacticalGrenade.TacticalGrenadeModItemSlotWidget" )

CoD.TacticalGrenadeModSlotWidget = InheritFrom( LUI.UIElement )
CoD.TacticalGrenadeModSlotWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.TacticalGrenadeModSlotWidget )
	self.id = "TacticalGrenadeModSlotWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 236 )
	self:setTopBottom( true, false, 0, 89 )
	self.anyChildUsesUpdateState = true
	local TacticalGrenadeModItemSlotWidget0 = CoD.TacticalGrenadeModItemSlotWidget.new( menu, controller )
	TacticalGrenadeModItemSlotWidget0:setLeftRight( true, false, 0, 116.5 )
	TacticalGrenadeModItemSlotWidget0:setTopBottom( true, false, 0, 89 )
	TacticalGrenadeModItemSlotWidget0:setRGB( 1, 1, 1 )
	TacticalGrenadeModItemSlotWidget0:linkToElementModel( self, "custsecondarygadgetattachment1", false, function ( model )
		TacticalGrenadeModItemSlotWidget0:setModel( model, controller )
	end )
	TacticalGrenadeModItemSlotWidget0:mergeStateConditions( {
		{
			stateName = "NotAvailable",
			condition = function ( menu, element, event )
				return not IsSecondaryEquipmentModAvailable( menu, element, event )
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
	if TacticalGrenadeModItemSlotWidget0.m_eventHandlers.update_class then
		local currentEv = TacticalGrenadeModItemSlotWidget0.m_eventHandlers.update_class
		TacticalGrenadeModItemSlotWidget0:registerEventHandler( "update_class", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		TacticalGrenadeModItemSlotWidget0:registerEventHandler( "update_class", LUI.UIElement.updateState )
	end
	TacticalGrenadeModItemSlotWidget0:linkToElementModel( TacticalGrenadeModItemSlotWidget0, "itemIndex", true, function ( model )
		menu:updateElementState( TacticalGrenadeModItemSlotWidget0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	self:addElement( TacticalGrenadeModItemSlotWidget0 )
	self.TacticalGrenadeModItemSlotWidget0 = TacticalGrenadeModItemSlotWidget0
	
	local currentEv = CoD.TacticalGrenadeModItemSlotWidget.new( menu, controller )
	currentEv:setLeftRight( true, false, 119.5, 236 )
	currentEv:setTopBottom( true, false, 0, 89 )
	currentEv:setRGB( 1, 1, 1 )
	currentEv:linkToElementModel( self, "custsecondarygadgetattachment2", false, function ( model )
		currentEv:setModel( model, controller )
	end )
	currentEv:mergeStateConditions( {
		{
			stateName = "NotAvailable",
			condition = function ( menu, element, event )
				return not IsSecondaryEquipmentModAvailable( menu, element, event )
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
	self.TacticalGrenadeModItemSlotWidget1 = currentEv
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self.close = function ( self )
		self.TacticalGrenadeModItemSlotWidget0:close()
		self.TacticalGrenadeModItemSlotWidget1:close()
		CoD.TacticalGrenadeModSlotWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

