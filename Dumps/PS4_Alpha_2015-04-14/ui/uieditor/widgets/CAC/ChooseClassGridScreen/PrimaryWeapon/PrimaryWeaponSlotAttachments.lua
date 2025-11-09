require( "ui.uieditor.widgets.CAC.ChooseClassGridScreen.PrimaryWeapon.PrimaryWeaponSlotAttachmentItem" )

CoD.PrimaryWeaponSlotAttachments = InheritFrom( LUI.UIElement )
CoD.PrimaryWeaponSlotAttachments.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PrimaryWeaponSlotAttachments )
	self.id = "PrimaryWeaponSlotAttachments"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 485 )
	self:setTopBottom( true, false, 0, 60 )
	self.anyChildUsesUpdateState = true
	local PrimaryWeaponSlotOptic = CoD.PrimaryWeaponSlotAttachmentItem.new( menu, controller )
	PrimaryWeaponSlotOptic:setLeftRight( true, false, 0, 79 )
	PrimaryWeaponSlotOptic:setTopBottom( true, false, 0, 60 )
	PrimaryWeaponSlotOptic:setRGB( 1, 1, 1 )
	PrimaryWeaponSlotOptic:mergeStateConditions( {
		{
			stateName = "NotAvailable",
			condition = function ( menu, element, event )
				return not IsPrimaryWeaponAttachmentAvailable( controller )
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
	if PrimaryWeaponSlotOptic.m_eventHandlers.update_class then
		local currentEv = PrimaryWeaponSlotOptic.m_eventHandlers.update_class
		PrimaryWeaponSlotOptic:registerEventHandler( "update_class", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		PrimaryWeaponSlotOptic:registerEventHandler( "update_class", LUI.UIElement.updateState )
	end
	PrimaryWeaponSlotOptic:linkToElementModel( PrimaryWeaponSlotOptic, "itemIndex", true, function ( model )
		menu:updateElementState( PrimaryWeaponSlotOptic, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	self:addElement( PrimaryWeaponSlotOptic )
	self.PrimaryWeaponSlotOptic = PrimaryWeaponSlotOptic
	
	local currentEv = CoD.PrimaryWeaponSlotAttachmentItem.new( menu, controller )
	currentEv:setLeftRight( true, false, 82, 161 )
	currentEv:setTopBottom( true, false, 0, 60 )
	currentEv:setRGB( 1, 1, 1 )
	currentEv:mergeStateConditions( {
		{
			stateName = "NotAvailable",
			condition = function ( menu, element, event )
				return not IsPrimaryWeaponAttachmentAvailable( controller )
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
	self.PrimaryWeaponSlotAttachmentItem0 = currentEv
	
	local currentEv = CoD.PrimaryWeaponSlotAttachmentItem.new( menu, controller )
	currentEv:setLeftRight( true, false, 163, 242 )
	currentEv:setTopBottom( true, false, 0, 60 )
	currentEv:setRGB( 1, 1, 1 )
	currentEv:mergeStateConditions( {
		{
			stateName = "NotAvailable",
			condition = function ( menu, element, event )
				return not IsPrimaryWeaponAttachmentAvailable( controller )
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
	self.PrimaryWeaponSlotAttachmentItem1 = currentEv
	
	local currentEv = CoD.PrimaryWeaponSlotAttachmentItem.new( menu, controller )
	currentEv:setLeftRight( true, false, 244, 323 )
	currentEv:setTopBottom( true, false, 0, 60 )
	currentEv:setRGB( 1, 1, 1 )
	currentEv:mergeStateConditions( {
		{
			stateName = "NotAvailable",
			condition = function ( menu, element, event )
				return not IsPrimaryWeaponAttachmentAvailable( controller )
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
	self.PrimaryWeaponSlotAttachmentItem2 = currentEv
	
	local currentEv = CoD.PrimaryWeaponSlotAttachmentItem.new( menu, controller )
	currentEv:setLeftRight( true, false, 325, 404 )
	currentEv:setTopBottom( true, false, 0, 60 )
	currentEv:setRGB( 1, 1, 1 )
	currentEv:mergeStateConditions( {
		{
			stateName = "NotAvailable",
			condition = function ( menu, element, event )
				return not IsPrimaryWeaponAttachmentAvailable( controller )
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
	self.PrimaryWeaponSlotAttachmentItem3 = currentEv
	
	local currentEv = CoD.PrimaryWeaponSlotAttachmentItem.new( menu, controller )
	currentEv:setLeftRight( true, false, 406, 485 )
	currentEv:setTopBottom( true, false, 0, 60 )
	currentEv:setRGB( 1, 1, 1 )
	currentEv:mergeStateConditions( {
		{
			stateName = "NotAvailable",
			condition = function ( menu, element, event )
				return not IsPrimaryWeaponAttachmentAvailable( controller )
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
	self.PrimaryWeaponSlotAttachmentItem4 = currentEv
	
	self.close = function ( self )
		self.PrimaryWeaponSlotOptic:close()
		self.PrimaryWeaponSlotAttachmentItem0:close()
		self.PrimaryWeaponSlotAttachmentItem1:close()
		self.PrimaryWeaponSlotAttachmentItem2:close()
		self.PrimaryWeaponSlotAttachmentItem3:close()
		self.PrimaryWeaponSlotAttachmentItem4:close()
		CoD.PrimaryWeaponSlotAttachments.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

