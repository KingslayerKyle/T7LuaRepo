require( "ui.uieditor.widgets.CAC.CustomClassListScreen.CustomClassMinorHeader" )
require( "ui.uieditor.widgets.CAC.CustomClassListScreen.Panes.CustomClassGenericItemButton" )

CoD.WeaponAttachments = InheritFrom( LUI.UIElement )
CoD.WeaponAttachments.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.WeaponAttachments )
	self.id = "WeaponAttachments"
	self.soundSet = "CAC_EditLoadout"
	self:setLeftRight( 0, 0, 0, 1012 )
	self:setTopBottom( 0, 0, 0, 201 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local OpticsHeader = CoD.CustomClassMinorHeader.new( menu, controller )
	OpticsHeader:setLeftRight( 0, 0, 0, 162 )
	OpticsHeader:setTopBottom( 0, 0, 0, 13 )
	OpticsHeader.text:setText( Engine.Localize( "MPUI_OPTICS_CAPS" ) )
	self:addElement( OpticsHeader )
	self.OpticsHeader = OpticsHeader
	
	local AttachmentsHeader = CoD.CustomClassMinorHeader.new( menu, controller )
	AttachmentsHeader:setLeftRight( 0, 1, 170, 8 )
	AttachmentsHeader:setTopBottom( 0, 0, 0, 13 )
	AttachmentsHeader.text:setText( Engine.Localize( "MPUI_ATTACHMENTS_CAPS" ) )
	self:addElement( AttachmentsHeader )
	self.AttachmentsHeader = AttachmentsHeader
	
	local Optic = CoD.CustomClassGenericItemButton.new( menu, controller )
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
	Optic:setLeftRight( 0, 0, 0, 162 )
	Optic:setTopBottom( 0, 0, 39, 201 )
	Optic:linkToElementModel( self, "primaryattachment1", false, function ( model )
		Optic:setModel( model, controller )
	end )
	self:addElement( Optic )
	self.Optic = Optic
	
	local Attachment1 = CoD.CustomClassGenericItemButton.new( menu, controller )
	Attachment1:mergeStateConditions( {
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
	Attachment1:setLeftRight( 0, 0, 170, 332 )
	Attachment1:setTopBottom( 0, 0, 39, 201 )
	Attachment1:linkToElementModel( self, "primaryattachment2", false, function ( model )
		Attachment1:setModel( model, controller )
	end )
	self:addElement( Attachment1 )
	self.Attachment1 = Attachment1
	
	local Attachment2 = CoD.CustomClassGenericItemButton.new( menu, controller )
	Attachment2:mergeStateConditions( {
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
	Attachment2:setLeftRight( 0, 0, 340, 502 )
	Attachment2:setTopBottom( 0, 0, 39, 201 )
	Attachment2:linkToElementModel( self, "primaryattachment3", false, function ( model )
		Attachment2:setModel( model, controller )
	end )
	self:addElement( Attachment2 )
	self.Attachment2 = Attachment2
	
	local Attachment3 = CoD.CustomClassGenericItemButton.new( menu, controller )
	Attachment3:mergeStateConditions( {
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
	Attachment3:setLeftRight( 0, 0, 511, 673 )
	Attachment3:setTopBottom( 0, 0, 39, 201 )
	Attachment3:linkToElementModel( self, "primaryattachment4", false, function ( model )
		Attachment3:setModel( model, controller )
	end )
	self:addElement( Attachment3 )
	self.Attachment3 = Attachment3
	
	local Attachment4 = CoD.CustomClassGenericItemButton.new( menu, controller )
	Attachment4:mergeStateConditions( {
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
	Attachment4:setLeftRight( 0, 0, 681, 843 )
	Attachment4:setTopBottom( 0, 0, 39, 201 )
	Attachment4:linkToElementModel( self, "primaryattachment5", false, function ( model )
		Attachment4:setModel( model, controller )
	end )
	self:addElement( Attachment4 )
	self.Attachment4 = Attachment4
	
	local Attachment5 = CoD.CustomClassGenericItemButton.new( menu, controller )
	Attachment5:mergeStateConditions( {
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
	Attachment5:setLeftRight( 0, 0, 851, 1013 )
	Attachment5:setTopBottom( 0, 0, 39, 201 )
	Attachment5:linkToElementModel( self, "primaryattachment6", false, function ( model )
		Attachment5:setModel( model, controller )
	end )
	self:addElement( Attachment5 )
	self.Attachment5 = Attachment5
	
	Optic.navigation = {
		right = Attachment1
	}
	Attachment1.navigation = {
		left = Optic,
		right = Attachment2
	}
	Attachment2.navigation = {
		left = Attachment1,
		right = Attachment3
	}
	Attachment3.navigation = {
		left = Attachment2,
		right = Attachment4
	}
	Attachment4.navigation = {
		left = Attachment3,
		right = Attachment5
	}
	Attachment5.navigation = {
		left = Attachment4
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	Optic.id = "Optic"
	Attachment1.id = "Attachment1"
	Attachment2.id = "Attachment2"
	Attachment3.id = "Attachment3"
	Attachment4.id = "Attachment4"
	Attachment5.id = "Attachment5"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.Optic:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.OpticsHeader:close()
		self.AttachmentsHeader:close()
		self.Optic:close()
		self.Attachment1:close()
		self.Attachment2:close()
		self.Attachment3:close()
		self.Attachment4:close()
		self.Attachment5:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

