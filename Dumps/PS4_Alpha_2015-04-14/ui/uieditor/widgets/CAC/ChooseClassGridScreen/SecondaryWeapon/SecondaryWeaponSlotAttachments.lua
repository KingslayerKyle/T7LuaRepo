require( "ui.uieditor.widgets.CAC.ChooseClassGridScreen.SecondaryWeapon.SecondaryWeaponSlotAttachmentItem" )

CoD.SecondaryWeaponSlotAttachments = InheritFrom( LUI.UIElement )
CoD.SecondaryWeaponSlotAttachments.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SecondaryWeaponSlotAttachments )
	self.id = "SecondaryWeaponSlotAttachments"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 370 )
	self:setTopBottom( true, false, 0, 60 )
	self.anyChildUsesUpdateState = true
	local SecondaryWeaponSlotOptic = CoD.SecondaryWeaponSlotAttachmentItem.new( menu, controller )
	SecondaryWeaponSlotOptic:setLeftRight( true, false, 0, 122 )
	SecondaryWeaponSlotOptic:setTopBottom( true, false, 0, 60 )
	SecondaryWeaponSlotOptic:setRGB( 1, 1, 1 )
	SecondaryWeaponSlotOptic:mergeStateConditions( {
		{
			stateName = "NotAvailable",
			condition = function ( menu, element, event )
				return not IsSecondaryWeaponAttachmentAvailable( controller )
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
	if SecondaryWeaponSlotOptic.m_eventHandlers.update_class then
		local currentEv = SecondaryWeaponSlotOptic.m_eventHandlers.update_class
		SecondaryWeaponSlotOptic:registerEventHandler( "update_class", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		SecondaryWeaponSlotOptic:registerEventHandler( "update_class", LUI.UIElement.updateState )
	end
	SecondaryWeaponSlotOptic:linkToElementModel( SecondaryWeaponSlotOptic, "itemIndex", true, function ( model )
		menu:updateElementState( SecondaryWeaponSlotOptic, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	self:addElement( SecondaryWeaponSlotOptic )
	self.SecondaryWeaponSlotOptic = SecondaryWeaponSlotOptic
	
	local currentEv = CoD.SecondaryWeaponSlotAttachmentItem.new( menu, controller )
	currentEv:setLeftRight( true, false, 125, 247 )
	currentEv:setTopBottom( true, false, 0, 60 )
	currentEv:setRGB( 1, 1, 1 )
	currentEv:mergeStateConditions( {
		{
			stateName = "NotAvailable",
			condition = function ( menu, element, event )
				return not IsSecondaryWeaponAttachmentAvailable( controller )
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
	self.SecondaryWeaponSlotAttachmentItem0 = currentEv
	
	local currentEv = CoD.SecondaryWeaponSlotAttachmentItem.new( menu, controller )
	currentEv:setLeftRight( true, false, 250, 370 )
	currentEv:setTopBottom( true, false, 0, 60 )
	currentEv:setRGB( 1, 1, 1 )
	currentEv:mergeStateConditions( {
		{
			stateName = "NotAvailable",
			condition = function ( menu, element, event )
				return not IsSecondaryWeaponAttachmentAvailable( controller )
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
	self.SecondaryWeaponSlotAttachmentItem1 = currentEv
	
	self.close = function ( self )
		self.SecondaryWeaponSlotOptic:close()
		self.SecondaryWeaponSlotAttachmentItem0:close()
		self.SecondaryWeaponSlotAttachmentItem1:close()
		CoD.SecondaryWeaponSlotAttachments.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

