-- fce0f9ea118bfa22276398e7ac41140f
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 675 )
	self:setTopBottom( true, false, 0, 134 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local OpticsHeader = CoD.CustomClassMinorHeader.new( menu, controller )
	OpticsHeader:setLeftRight( true, false, 0, 108 )
	OpticsHeader:setTopBottom( true, false, 0, 8.83 )
	OpticsHeader.text:setText( Engine.Localize( "MPUI_OPTICS_CAPS" ) )
	self:addElement( OpticsHeader )
	self.OpticsHeader = OpticsHeader
	
	local AttachmentsHeader = CoD.CustomClassMinorHeader.new( menu, controller )
	AttachmentsHeader:setLeftRight( true, true, 113.33, 4.77 )
	AttachmentsHeader:setTopBottom( true, false, 0, 8.83 )
	AttachmentsHeader.text:setText( Engine.Localize( "MPUI_ATTACHMENTS_CAPS" ) )
	self:addElement( AttachmentsHeader )
	self.AttachmentsHeader = AttachmentsHeader
	
	local Optic = CoD.CustomClassGenericItemButton.new( menu, controller )
	Optic:setLeftRight( true, false, 0, 108 )
	Optic:setTopBottom( true, false, 26, 134 )
	Optic:linkToElementModel( self, "primaryattachment1", false, function ( model )
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
	self:addElement( Optic )
	self.Optic = Optic
	
	local Attachment1 = CoD.CustomClassGenericItemButton.new( menu, controller )
	Attachment1:setLeftRight( true, false, 113.33, 221.33 )
	Attachment1:setTopBottom( true, false, 26, 134 )
	Attachment1:linkToElementModel( self, "primaryattachment2", false, function ( model )
		Attachment1:setModel( model, controller )
	end )
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
	self:addElement( Attachment1 )
	self.Attachment1 = Attachment1
	
	local Attachment2 = CoD.CustomClassGenericItemButton.new( menu, controller )
	Attachment2:setLeftRight( true, false, 226.66, 334.66 )
	Attachment2:setTopBottom( true, false, 26, 134 )
	Attachment2:linkToElementModel( self, "primaryattachment3", false, function ( model )
		Attachment2:setModel( model, controller )
	end )
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
	self:addElement( Attachment2 )
	self.Attachment2 = Attachment2
	
	local Attachment3 = CoD.CustomClassGenericItemButton.new( menu, controller )
	Attachment3:setLeftRight( true, false, 340.34, 448.34 )
	Attachment3:setTopBottom( true, false, 26, 134 )
	Attachment3:linkToElementModel( self, "primaryattachment4", false, function ( model )
		Attachment3:setModel( model, controller )
	end )
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
	self:addElement( Attachment3 )
	self.Attachment3 = Attachment3
	
	local Attachment4 = CoD.CustomClassGenericItemButton.new( menu, controller )
	Attachment4:setLeftRight( true, false, 453.67, 561.67 )
	Attachment4:setTopBottom( true, false, 26, 134 )
	Attachment4:linkToElementModel( self, "primaryattachment5", false, function ( model )
		Attachment4:setModel( model, controller )
	end )
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
	self:addElement( Attachment4 )
	self.Attachment4 = Attachment4
	
	local Attachment5 = CoD.CustomClassGenericItemButton.new( menu, controller )
	Attachment5:setLeftRight( true, false, 567, 675 )
	Attachment5:setTopBottom( true, false, 26, 134 )
	Attachment5:linkToElementModel( self, "primaryattachment6", false, function ( model )
		Attachment5:setModel( model, controller )
	end )
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
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.Optic:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.OpticsHeader:close()
		element.AttachmentsHeader:close()
		element.Optic:close()
		element.Attachment1:close()
		element.Attachment2:close()
		element.Attachment3:close()
		element.Attachment4:close()
		element.Attachment5:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
