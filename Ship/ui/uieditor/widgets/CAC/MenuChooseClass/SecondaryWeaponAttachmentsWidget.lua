-- 0728ee831d4a1b5aa89ca19704a3c296
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.WeaponItemModelWidgetNew" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.CategoryHeader" )

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
	self:setLeftRight( true, false, 0, 196 )
	self:setTopBottom( true, false, 0, 129 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local attachment2 = CoD.WeaponItemModelWidgetNew.new( menu, controller )
	attachment2:setLeftRight( false, true, -62, 0 )
	attachment2:setTopBottom( true, false, 0, 62 )
	attachment2.plusIcon:setRGB( 1, 0.41, 0 )
	attachment2:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			attachment2.itemImage:setImage( RegisterImage( image ) )
		end
	end )
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
				local f5_local0
				if not IsCACSlotEquipped( menu, element, controller ) then
					f5_local0 = IsCACSlotWeaponForAttachmentEquipped( menu, element, controller )
					if f5_local0 then
						f5_local0 = IsSecondaryWeaponAttachmentAvailable( controller )
						if f5_local0 then
							f5_local0 = IsNonAttachmentItemLocked( controller, "bonuscard_secondary_gunfighter" )
						end
					end
				else
					f5_local0 = false
				end
				return f5_local0
			end
		},
		{
			stateName = "NotEquippable",
			condition = function ( menu, element, event )
				local f6_local0
				if not IsCACSlotEquipped( menu, element, controller ) then
					f6_local0 = IsCACSlotWeaponForAttachmentEquipped( menu, element, controller )
					if f6_local0 then
						f6_local0 = IsSecondaryWeaponAttachmentAvailable( controller )
					end
				else
					f6_local0 = false
				end
				return f6_local0
			end
		}
	} )
	self:addElement( attachment2 )
	self.attachment2 = attachment2
	
	local attachment1 = CoD.WeaponItemModelWidgetNew.new( menu, controller )
	attachment1:setLeftRight( true, false, 67, 129 )
	attachment1:setTopBottom( true, false, 0, 62 )
	attachment1.plusIcon:setRGB( 1, 0.41, 0 )
	attachment1:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			attachment1.itemImage:setImage( RegisterImage( image ) )
		end
	end )
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
				local f10_local0
				if not IsCACSlotEquipped( menu, element, controller ) then
					f10_local0 = IsCACSlotWeaponForAttachmentEquipped( menu, element, controller )
					if f10_local0 then
						f10_local0 = IsSecondaryWeaponAttachmentAvailable( controller )
					end
				else
					f10_local0 = false
				end
				return f10_local0
			end
		}
	} )
	self:addElement( attachment1 )
	self.attachment1 = attachment1
	
	local attachmentHeader = CoD.CategoryHeader.new( menu, controller )
	attachmentHeader:setLeftRight( true, false, 66, 136 )
	attachmentHeader:setTopBottom( true, false, -21, -1 )
	attachmentHeader.header:setText( Engine.Localize( "MPUI_ATTACHMENTS_CAPS" ) )
	attachmentHeader:mergeStateConditions( {
		{
			stateName = "BreadcrumbVisible",
			condition = function ( menu, element, event )
				return IsCACAnyAttachmentsNew( element, controller, "secondary" )
			end
		}
	} )
	self:addElement( attachmentHeader )
	self.attachmentHeader = attachmentHeader
	
	local optic = CoD.WeaponItemModelWidgetNew.new( menu, controller )
	optic:setLeftRight( false, true, -196, -134 )
	optic:setTopBottom( false, true, -129, -67 )
	optic.plusIcon:setRGB( 1, 0.41, 0 )
	optic.opticIndicator:setAlpha( 0.55 )
	optic:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			optic.itemImage:setImage( RegisterImage( image ) )
		end
	end )
	optic:mergeStateConditions( {
		{
			stateName = "Equipped",
			condition = function ( menu, element, event )
				local f13_local0
				if not IsCACCustomizationReticleAttachmentItemEquipped( menu, element, controller, "secondary" ) then
					f13_local0 = IsCACWeaponEquippedForSlot( menu, element, controller, "secondary" )
				else
					f13_local0 = false
				end
				return f13_local0
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
				local f15_local0
				if not IsCACSlotEquipped( menu, element, controller ) then
					f15_local0 = IsCACSlotWeaponForAttachmentEquipped( menu, element, controller )
					if f15_local0 then
						f15_local0 = IsSecondaryWeaponAttachmentAvailable( controller )
					end
				else
					f15_local0 = false
				end
				return f15_local0
			end
		}
	} )
	self:addElement( optic )
	self.optic = optic
	
	local opticsHeader = CoD.CategoryHeader.new( menu, controller )
	opticsHeader:setLeftRight( true, false, 0, 70 )
	opticsHeader:setTopBottom( true, false, -21, -1 )
	opticsHeader.header:setText( Engine.Localize( "MPUI_OPTICS_CAPS" ) )
	opticsHeader:mergeStateConditions( {
		{
			stateName = "BreadcrumbVisible",
			condition = function ( menu, element, event )
				return IsCACAnyOpticsNew( element, controller, "secondary" )
			end
		}
	} )
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
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.attachment2:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.attachment2:close()
		element.attachment1:close()
		element.attachmentHeader:close()
		element.optic:close()
		element.opticsHeader:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
