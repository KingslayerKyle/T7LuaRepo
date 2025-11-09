require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.WeaponItemModelWidgetNew" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.NewNumberBreadcrumb" )

local f0_local0 = function ( f1_arg0, f1_arg1 )
	f1_arg0:setForceMouseEventDispatch( true )
end

local PostLoadFunc = function ( f2_arg0, f2_arg1 )
	if CoD.isPC then
		f0_local0( f2_arg0, f2_arg1 )
	end
end

CoD.PrimaryWeaponAttachmentsWidget = InheritFrom( LUI.UIElement )
CoD.PrimaryWeaponAttachmentsWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PrimaryWeaponAttachmentsWidget )
	self.id = "PrimaryWeaponAttachmentsWidget"
	self.soundSet = "CAC"
	self:setLeftRight( true, false, 0, 196 )
	self:setTopBottom( true, false, 0, 129 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local attachment5 = CoD.WeaponItemModelWidgetNew.new( menu, controller )
	attachment5:setLeftRight( false, true, -62, 0 )
	attachment5:setTopBottom( false, true, -62, 0 )
	attachment5.plusIcon:setRGB( 1, 0.41, 0 )
	attachment5:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			attachment5.itemImageSolid:setImage( RegisterImage( image ) )
		end
	end )
	attachment5:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			attachment5.itemImage:setImage( RegisterImage( image ) )
		end
	end )
	attachment5:mergeStateConditions( {
		{
			stateName = "NotEquippable",
			condition = function ( menu, element, event )
				local f6_local0
				if not IsCACSlotEquipped( menu, element, controller ) then
					f6_local0 = IsCACEquippedWildcardItemCount( menu, "bonuscard_primary_gunfighter", 2 )
					if f6_local0 then
						f6_local0 = IsCACSlotWeaponForAttachmentEquipped( menu, element, controller )
					end
				else
					f6_local0 = false
				end
				return f6_local0
			end
		},
		{
			stateName = "NotAvailable",
			condition = function ( menu, element, event )
				local f7_local0
				if not IsCACSlotAvailable( menu, element, controller ) then
					f7_local0 = IsCACCountGreaterThanEquippedWildcardItem( menu, "bonuscard_primary_gunfighter", 3 )
				else
					f7_local0 = false
				end
				return f7_local0
			end
		},
		{
			stateName = "NotVisible",
			condition = function ( menu, element, event )
				return IsCACAttachmentSlotVisible( menu, element, controller, 3 )
			end
		}
	} )
	self:addElement( attachment5 )
	self.attachment5 = attachment5
	
	local attachment4 = CoD.WeaponItemModelWidgetNew.new( menu, controller )
	attachment4:setLeftRight( false, false, -31, 31 )
	attachment4:setTopBottom( false, true, -62, 0 )
	attachment4.plusIcon:setRGB( 1, 0.41, 0 )
	attachment4:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			attachment4.itemImageSolid:setImage( RegisterImage( image ) )
		end
	end )
	attachment4:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			attachment4.itemImage:setImage( RegisterImage( image ) )
		end
	end )
	attachment4:mergeStateConditions( {
		{
			stateName = "NotEquippable",
			condition = function ( menu, element, event )
				local f11_local0
				if not IsCACSlotEquipped( menu, element, controller ) then
					f11_local0 = IsCACEquippedWildcardItemCount( menu, "bonuscard_primary_gunfighter", 1 )
					if f11_local0 then
						f11_local0 = IsCACSlotWeaponForAttachmentEquipped( menu, element, controller )
					end
				else
					f11_local0 = false
				end
				return f11_local0
			end
		},
		{
			stateName = "NotAvailable",
			condition = function ( menu, element, event )
				local f12_local0
				if not IsCACSlotAvailable( menu, element, controller ) then
					f12_local0 = IsCACCountGreaterThanEquippedWildcardItem( menu, "bonuscard_primary_gunfighter", 2 )
				else
					f12_local0 = false
				end
				return f12_local0
			end
		},
		{
			stateName = "NotVisible",
			condition = function ( menu, element, event )
				return IsCACAttachmentSlotVisible( menu, element, controller, 2 )
			end
		}
	} )
	self:addElement( attachment4 )
	self.attachment4 = attachment4
	
	local attachment3 = CoD.WeaponItemModelWidgetNew.new( menu, controller )
	attachment3:setLeftRight( true, false, 0, 62 )
	attachment3:setTopBottom( false, true, -62, 0 )
	attachment3.plusIcon:setRGB( 1, 0.41, 0 )
	attachment3:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			attachment3.itemImageSolid:setImage( RegisterImage( image ) )
		end
	end )
	attachment3:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			attachment3.itemImage:setImage( RegisterImage( image ) )
		end
	end )
	attachment3:mergeStateConditions( {
		{
			stateName = "LockedByWildcard",
			condition = function ( menu, element, event )
				local f16_local0
				if not IsCACSlotEquipped( menu, element, controller ) then
					f16_local0 = IsCACSlotWeaponForAttachmentEquipped( menu, element, controller )
					if f16_local0 then
						f16_local0 = IsPrimaryWeaponAttachmentAvailable( controller )
						if f16_local0 then
							f16_local0 = IsNonAttachmentItemLocked( controller, "bonuscard_primary_gunfighter" )
						end
					end
				else
					f16_local0 = false
				end
				return f16_local0
			end
		},
		{
			stateName = "NotEquippable",
			condition = function ( menu, element, event )
				local f17_local0
				if not IsCACSlotEquipped( menu, element, controller ) then
					f17_local0 = IsCACSlotWeaponForAttachmentEquipped( menu, element, controller )
					if f17_local0 then
						f17_local0 = IsPrimaryWeaponAttachmentAvailable( controller )
					end
				else
					f17_local0 = false
				end
				return f17_local0
			end
		}
	} )
	self:addElement( attachment3 )
	self.attachment3 = attachment3
	
	local attachment2 = CoD.WeaponItemModelWidgetNew.new( menu, controller )
	attachment2:setLeftRight( false, true, -62, 0 )
	attachment2:setTopBottom( true, false, 0, 62 )
	attachment2.plusIcon:setRGB( 1, 0.41, 0 )
	attachment2:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			attachment2.itemImageSolid:setImage( RegisterImage( image ) )
		end
	end )
	attachment2:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			attachment2.itemImage:setImage( RegisterImage( image ) )
		end
	end )
	attachment2:mergeStateConditions( {
		{
			stateName = "NotEquippable",
			condition = function ( menu, element, event )
				local f20_local0
				if not IsCACSlotEquipped( menu, element, controller ) then
					f20_local0 = IsCACSlotWeaponForAttachmentEquipped( menu, element, controller )
					if f20_local0 then
						f20_local0 = IsPrimaryWeaponAttachmentAvailable( controller )
					end
				else
					f20_local0 = false
				end
				return f20_local0
			end
		}
	} )
	self:addElement( attachment2 )
	self.attachment2 = attachment2
	
	local attachment1 = CoD.WeaponItemModelWidgetNew.new( menu, controller )
	attachment1:setLeftRight( false, false, -31, 31 )
	attachment1:setTopBottom( true, false, 0, 62 )
	attachment1.plusIcon:setRGB( 1, 0.41, 0 )
	attachment1:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			attachment1.itemImageSolid:setImage( RegisterImage( image ) )
		end
	end )
	attachment1:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			attachment1.itemImage:setImage( RegisterImage( image ) )
		end
	end )
	attachment1:mergeStateConditions( {
		{
			stateName = "NotEquippable",
			condition = function ( menu, element, event )
				local f23_local0
				if not IsCACSlotEquipped( menu, element, controller ) then
					f23_local0 = IsCACSlotWeaponForAttachmentEquipped( menu, element, controller )
					if f23_local0 then
						f23_local0 = IsPrimaryWeaponAttachmentAvailable( controller )
					end
				else
					f23_local0 = false
				end
				return f23_local0
			end
		}
	} )
	self:addElement( attachment1 )
	self.attachment1 = attachment1
	
	local attachmentNewNumber = CoD.NewNumberBreadcrumb.new( menu, controller )
	attachmentNewNumber:setLeftRight( false, false, 12, 28 )
	attachmentNewNumber:setTopBottom( true, false, 3, 19 )
	attachmentNewNumber:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				local f24_local0 = IsCurrentMenu( menu, "CustomClass" )
				if f24_local0 then
					f24_local0 = AlwaysFalse()
					if f24_local0 then
						f24_local0 = IsCACAnyAttachmentsNew( element, controller )
					end
				end
				return f24_local0
			end
		}
	} )
	self:addElement( attachmentNewNumber )
	self.attachmentNewNumber = attachmentNewNumber
	
	local optic = CoD.WeaponItemModelWidgetNew.new( menu, controller )
	optic:setLeftRight( true, false, 0, 62 )
	optic:setTopBottom( true, false, 0, 62 )
	optic.plusIcon:setRGB( 1, 0.41, 0 )
	optic.opticIndicator:setAlpha( 0.55 )
	optic:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			optic.itemImageSolid:setImage( RegisterImage( image ) )
		end
	end )
	optic:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			optic.itemImage:setImage( RegisterImage( image ) )
		end
	end )
	optic:mergeStateConditions( {
		{
			stateName = "NotEquippable",
			condition = function ( menu, element, event )
				local f27_local0
				if not IsCACSlotEquipped( menu, element, controller ) then
					f27_local0 = IsCACSlotWeaponForAttachmentEquipped( menu, element, controller )
					if f27_local0 then
						f27_local0 = IsPrimaryWeaponAttachmentAvailable( controller )
					end
				else
					f27_local0 = false
				end
				return f27_local0
			end
		}
	} )
	self:addElement( optic )
	self.optic = optic
	
	local opticNewNumber = CoD.NewNumberBreadcrumb.new( menu, controller )
	opticNewNumber:setLeftRight( true, false, 43, 59 )
	opticNewNumber:setTopBottom( true, false, 3, 19 )
	opticNewNumber:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				local f28_local0 = IsCurrentMenu( menu, "CustomClass" )
				if f28_local0 then
					f28_local0 = AlwaysFalse()
					if f28_local0 then
						f28_local0 = IsCACAnyOpticsNew( element, controller )
					end
				end
				return f28_local0
			end
		}
	} )
	self:addElement( opticNewNumber )
	self.opticNewNumber = opticNewNumber
	
	local attachmentHeader = LUI.UITightText.new()
	attachmentHeader:setLeftRight( true, false, 66, 150 )
	attachmentHeader:setTopBottom( true, false, -20, -2 )
	attachmentHeader:setRGB( 0.76, 0.76, 0.76 )
	attachmentHeader:setText( Engine.Localize( "MPUI_ATTACHMENTS_CAPS" ) )
	attachmentHeader:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	attachmentHeader:setLetterSpacing( 0.5 )
	self:addElement( attachmentHeader )
	self.attachmentHeader = attachmentHeader
	
	local opticsHeader = LUI.UITightText.new()
	opticsHeader:setLeftRight( true, false, 0, 78 )
	opticsHeader:setTopBottom( true, false, -20, -2 )
	opticsHeader:setRGB( 0.76, 0.76, 0.76 )
	opticsHeader:setText( Engine.Localize( "MPUI_OPTICS_CAPS" ) )
	opticsHeader:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	opticsHeader:setLetterSpacing( 0.5 )
	self:addElement( opticsHeader )
	self.opticsHeader = opticsHeader
	
	attachment5.navigation = {
		left = attachment4,
		up = attachment2
	}
	attachment4.navigation = {
		left = attachment3,
		up = attachment1,
		right = attachment5
	}
	attachment3.navigation = {
		up = optic,
		right = attachment4
	}
	attachment2.navigation = {
		left = attachment1,
		down = attachment5
	}
	attachment1.navigation = {
		left = optic,
		right = attachment2,
		down = attachment4
	}
	optic.navigation = {
		right = attachment1,
		down = attachment3
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	attachment5.id = "attachment5"
	attachment4.id = "attachment4"
	attachment3.id = "attachment3"
	attachment2.id = "attachment2"
	attachment1.id = "attachment1"
	optic.id = "optic"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.attachment5:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.attachment5:close()
		element.attachment4:close()
		element.attachment3:close()
		element.attachment2:close()
		element.attachment1:close()
		element.attachmentNewNumber:close()
		element.optic:close()
		element.opticNewNumber:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

