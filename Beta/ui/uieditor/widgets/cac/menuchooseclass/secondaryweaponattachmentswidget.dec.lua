require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.WeaponItemModelWidgetNew" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.NewNumberBreadcrumb" )

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
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			attachment2.itemImageSolid:setImage( RegisterImage( modelValue ) )
		end
	end )
	attachment2:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			attachment2.itemImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	attachment2:mergeStateConditions( {
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
	self:addElement( attachment2 )
	self.attachment2 = attachment2
	
	local attachment1 = CoD.WeaponItemModelWidgetNew.new( menu, controller )
	attachment1:setLeftRight( true, false, 67, 129 )
	attachment1:setTopBottom( true, false, 0, 62 )
	attachment1.plusIcon:setRGB( 1, 0.41, 0 )
	attachment1:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			attachment1.itemImageSolid:setImage( RegisterImage( modelValue ) )
		end
	end )
	attachment1:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			attachment1.itemImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	attachment1:mergeStateConditions( {
		{
			stateName = "NotEquippable",
			condition = function ( menu, element, event )
				local f8_local0
				if not IsCACSlotEquipped( menu, element, controller ) then
					f8_local0 = IsCACSlotWeaponForAttachmentEquipped( menu, element, controller )
					if f8_local0 then
						f8_local0 = IsSecondaryWeaponAttachmentAvailable( controller )
					end
				else
					f8_local0 = false
				end
				return f8_local0
			end
		}
	} )
	self:addElement( attachment1 )
	self.attachment1 = attachment1
	
	local attachmentNewNumber = CoD.NewNumberBreadcrumb.new( menu, controller )
	attachmentNewNumber:setLeftRight( false, true, -86, -70 )
	attachmentNewNumber:setTopBottom( true, false, 3, 19 )
	attachmentNewNumber:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				local f9_local0 = IsCurrentMenu( menu, "CustomClass" )
				if f9_local0 then
					f9_local0 = AlwaysFalse()
					if f9_local0 then
						f9_local0 = IsCACAnyAttachmentsNew( element, controller )
					end
				end
				return f9_local0
			end
		}
	} )
	self:addElement( attachmentNewNumber )
	self.attachmentNewNumber = attachmentNewNumber
	
	local optic = CoD.WeaponItemModelWidgetNew.new( menu, controller )
	optic:setLeftRight( false, true, -196, -134 )
	optic:setTopBottom( false, true, -129, -67 )
	optic.plusIcon:setRGB( 1, 0.41, 0 )
	optic.opticIndicator:setAlpha( 0.55 )
	optic:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			optic.itemImageSolid:setImage( RegisterImage( modelValue ) )
		end
	end )
	optic:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			optic.itemImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	optic:mergeStateConditions( {
		{
			stateName = "NotEquippable",
			condition = function ( menu, element, event )
				local f12_local0
				if not IsCACSlotEquipped( menu, element, controller ) then
					f12_local0 = IsCACSlotWeaponForAttachmentEquipped( menu, element, controller )
					if f12_local0 then
						f12_local0 = IsSecondaryWeaponAttachmentAvailable( controller )
					end
				else
					f12_local0 = false
				end
				return f12_local0
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
				local f13_local0 = IsCurrentMenu( menu, "CustomClass" )
				if f13_local0 then
					f13_local0 = AlwaysFalse()
					if f13_local0 then
						f13_local0 = IsCACAnyOpticsNew( element, controller )
					end
				end
				return f13_local0
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
		self.attachmentNewNumber:close()
		self.optic:close()
		self.opticNewNumber:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

