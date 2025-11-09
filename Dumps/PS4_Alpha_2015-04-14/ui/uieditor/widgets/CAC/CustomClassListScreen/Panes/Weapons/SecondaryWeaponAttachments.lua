require( "ui.uieditor.widgets.CAC.CustomClassListScreen.CustomClassMinorHeader" )
require( "ui.uieditor.widgets.CAC.CustomClassListScreen.Panes.CustomClassGenericItemButton" )

CoD.SecondaryWeaponAttachments = InheritFrom( LUI.UIElement )
CoD.SecondaryWeaponAttachments.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SecondaryWeaponAttachments )
	self.id = "SecondaryWeaponAttachments"
	self.soundSet = "CAC_EditLoadout"
	self:setLeftRight( true, false, 0, 335 )
	self:setTopBottom( true, false, 0, 134 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local OpticsHeader = CoD.CustomClassMinorHeader.new( menu, controller )
	OpticsHeader:setLeftRight( true, false, 0, 108 )
	OpticsHeader:setTopBottom( true, false, 0, 20 )
	OpticsHeader:setRGB( 1, 1, 1 )
	OpticsHeader.text:setText( Engine.Localize( "MPUI_OPTICS_CAPS" ) )
	self:addElement( OpticsHeader )
	self.OpticsHeader = OpticsHeader
	
	local AttachmentsHeader = CoD.CustomClassMinorHeader.new( menu, controller )
	AttachmentsHeader:setLeftRight( true, true, 113.33, 4.77 )
	AttachmentsHeader:setTopBottom( true, false, 0, 20 )
	AttachmentsHeader:setRGB( 1, 1, 1 )
	AttachmentsHeader.text:setText( Engine.Localize( "MPUI_ATTACHMENTS_CAPS" ) )
	self:addElement( AttachmentsHeader )
	self.AttachmentsHeader = AttachmentsHeader
	
	local Optic = CoD.CustomClassGenericItemButton.new( menu, controller )
	Optic:setLeftRight( true, false, 0, 108 )
	Optic:setTopBottom( true, false, 26, 134 )
	Optic:setRGB( 1, 1, 1 )
	Optic:linkToElementModel( self, "secondaryattachment1", false, function ( model )
		Optic:setModel( model, controller )
	end )
	Optic:mergeStateConditions( {
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
	if Optic.m_eventHandlers.update_class then
		local currentEv = Optic.m_eventHandlers.update_class
		Optic:registerEventHandler( "update_class", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		Optic:registerEventHandler( "update_class", LUI.UIElement.updateState )
	end
	Optic:linkToElementModel( Optic, "itemIndex", true, function ( model )
		menu:updateElementState( Optic, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	self:addElement( Optic )
	self.Optic = Optic
	
	local currentEv = CoD.CustomClassGenericItemButton.new( menu, controller )
	currentEv:setLeftRight( true, false, 113.33, 221.33 )
	currentEv:setTopBottom( true, false, 26, 134 )
	currentEv:setRGB( 1, 1, 1 )
	currentEv:linkToElementModel( self, "secondaryattachment2", false, function ( model )
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
	self.Attachment1 = currentEv
	
	local currentEv = CoD.CustomClassGenericItemButton.new( menu, controller )
	currentEv:setLeftRight( true, false, 226.66, 334.66 )
	currentEv:setTopBottom( true, false, 26, 134 )
	currentEv:setRGB( 1, 1, 1 )
	currentEv:linkToElementModel( self, "secondaryattachment3", false, function ( model )
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
	self.Attachment2 = currentEv
	
	Optic.navigation = {
		right = currentEv
	}
	currentEv.navigation = {
		left = Optic,
		right = currentEv
	}
	currentEv.navigation = {
		left = currentEv
	}
	Optic.id = "Optic"
	currentEv.id = "Attachment1"
	currentEv.id = "Attachment2"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.Optic:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.OpticsHeader:close()
		self.AttachmentsHeader:close()
		self.Optic:close()
		self.Attachment1:close()
		self.Attachment2:close()
		CoD.SecondaryWeaponAttachments.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

