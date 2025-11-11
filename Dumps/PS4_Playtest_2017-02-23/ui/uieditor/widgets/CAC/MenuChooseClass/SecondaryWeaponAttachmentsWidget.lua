require( "ui.uieditor.widgets.CAC.MenuChooseClass.CategoryHeader" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.WeaponItemModelWidgetNew" )

CoD.SecondaryWeaponAttachmentsWidget = InheritFrom( LUI.UIElement )
CoD.SecondaryWeaponAttachmentsWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SecondaryWeaponAttachmentsWidget )
	self.id = "SecondaryWeaponAttachmentsWidget"
	self.soundSet = "CAC"
	self:setLeftRight( 0, 0, 0, 294 )
	self:setTopBottom( 0, 0, 0, 193 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local attachment2 = CoD.WeaponItemModelWidgetNew.new( menu, controller )
	attachment2:mergeStateConditions( {
		{
			stateName = "Equipped",
			condition = function ( menu, element, event )
				return IsSecondaryAttachmentEquippedWithNoPersonalization( menu, element, controller )
			end
		},
		{
			stateName = "WeaponEquipped",
			condition = function ( menu, element, event )
				return IsCACSlotEquipped( menu, element, controller )
			end
		},
		{
			stateName = "LockedByWildcard",
			condition = function ( menu, element, event )
				local f4_local0
				if not IsCACSlotEquipped( menu, element, controller ) then
					f4_local0 = IsCACSlotWeaponForAttachmentEquipped( menu, element, controller )
					if f4_local0 then
						f4_local0 = IsSecondaryWeaponAttachmentAvailable( controller )
						if f4_local0 then
							f4_local0 = IsNonAttachmentItemLocked( controller, "bonuscard_secondary_gunfighter" )
						end
					end
				else
					f4_local0 = false
				end
				return f4_local0
			end
		},
		{
			stateName = "NotEquippable",
			condition = function ( menu, element, event )
				local f5_local0
				if not IsCACSlotEquipped( menu, element, controller ) then
					f5_local0 = IsCACSlotWeaponForAttachmentEquipped( menu, element, controller )
					if f5_local0 then
						f5_local0 = IsSecondaryWeaponAttachmentAvailable( controller )
					end
				else
					f5_local0 = false
				end
				return f5_local0
			end
		}
	} )
	attachment2:setLeftRight( 1, 1, -93, 0 )
	attachment2:setTopBottom( 0, 0, 0, 93 )
	attachment2.plusIcon:setRGB( 1, 0.41, 0 )
	attachment2:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			attachment2.itemImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( attachment2 )
	self.attachment2 = attachment2
	
	local attachment1 = CoD.WeaponItemModelWidgetNew.new( menu, controller )
	attachment1:mergeStateConditions( {
		{
			stateName = "Equipped",
			condition = function ( menu, element, event )
				return IsSecondaryAttachmentEquippedWithNoPersonalization( menu, element, controller )
			end
		},
		{
			stateName = "WeaponEquipped",
			condition = function ( menu, element, event )
				return IsCACSlotEquipped( menu, element, controller )
			end
		},
		{
			stateName = "NotEquippable",
			condition = function ( menu, element, event )
				local f9_local0
				if not IsCACSlotEquipped( menu, element, controller ) then
					f9_local0 = IsCACSlotWeaponForAttachmentEquipped( menu, element, controller )
					if f9_local0 then
						f9_local0 = IsSecondaryWeaponAttachmentAvailable( controller )
					end
				else
					f9_local0 = false
				end
				return f9_local0
			end
		}
	} )
	attachment1:setLeftRight( 0, 0, 101, 194 )
	attachment1:setTopBottom( 0, 0, 0, 93 )
	attachment1.plusIcon:setRGB( 1, 0.41, 0 )
	attachment1:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			attachment1.itemImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( attachment1 )
	self.attachment1 = attachment1
	
	local attachmentHeader = CoD.CategoryHeader.new( menu, controller )
	attachmentHeader:mergeStateConditions( {
		{
			stateName = "BreadcrumbVisible",
			condition = function ( menu, element, event )
				return IsCACAnyAttachmentsNew( element, controller, "secondary" )
			end
		}
	} )
	attachmentHeader:setLeftRight( 0, 0, 99, 204 )
	attachmentHeader:setTopBottom( 0, 0, -31, -1 )
	attachmentHeader.header:setText( Engine.Localize( "MPUI_ATTACHMENTS_CAPS" ) )
	self:addElement( attachmentHeader )
	self.attachmentHeader = attachmentHeader
	
	local optic = CoD.WeaponItemModelWidgetNew.new( menu, controller )
	optic:mergeStateConditions( {
		{
			stateName = "Equipped",
			condition = function ( menu, element, event )
				local f12_local0
				if not IsCACCustomizationReticleAttachmentItemEquipped( menu, element, controller, "secondary" ) then
					f12_local0 = IsCACWeaponEquippedForSlot( menu, element, controller, "secondary" )
				else
					f12_local0 = false
				end
				return f12_local0
			end
		},
		{
			stateName = "WeaponEquipped",
			condition = function ( menu, element, event )
				return IsCACSlotEquipped( menu, element, controller )
			end
		},
		{
			stateName = "NotEquippable",
			condition = function ( menu, element, event )
				local f14_local0
				if not IsCACSlotEquipped( menu, element, controller ) then
					f14_local0 = IsCACSlotWeaponForAttachmentEquipped( menu, element, controller )
					if f14_local0 then
						f14_local0 = IsSecondaryWeaponAttachmentAvailable( controller )
					end
				else
					f14_local0 = false
				end
				return f14_local0
			end
		}
	} )
	optic:setLeftRight( 1, 1, -294, -201 )
	optic:setTopBottom( 1, 1, -193, -100 )
	optic.plusIcon:setRGB( 1, 0.41, 0 )
	optic.opticIndicator:setAlpha( 0.55 )
	optic:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			optic.itemImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( optic )
	self.optic = optic
	
	local opticsHeader = CoD.CategoryHeader.new( menu, controller )
	opticsHeader:mergeStateConditions( {
		{
			stateName = "BreadcrumbVisible",
			condition = function ( menu, element, event )
				return IsCACAnyOpticsNew( element, controller, "secondary" )
			end
		}
	} )
	opticsHeader:setLeftRight( 0, 0, 0, 105 )
	opticsHeader:setTopBottom( 0, 0, -31, -1 )
	opticsHeader.header:setText( Engine.Localize( "MPUI_OPTICS_CAPS" ) )
	self:addElement( opticsHeader )
	self.opticsHeader = opticsHeader
	
	attachment2.navigation = {
		left = attachment1
	}
	attachment1.navigation = {
		left = optic,
		right = attachment2
	}
	optic.navigation = {
		right = attachment1
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	attachment2.id = "attachment2"
	attachment1.id = "attachment1"
	optic.id = "optic"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.attachment2:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.attachment2:close()
		self.attachment1:close()
		self.attachmentHeader:close()
		self.optic:close()
		self.opticsHeader:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

