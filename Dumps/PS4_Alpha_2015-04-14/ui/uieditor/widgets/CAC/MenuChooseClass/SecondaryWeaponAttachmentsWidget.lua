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
	self:setLeftRight( true, false, 0, 196 )
	self:setTopBottom( true, false, 0, 129 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local attachment2 = CoD.WeaponItemModelWidgetNew.new( menu, controller )
	attachment2:setLeftRight( false, true, -62, 0 )
	attachment2:setTopBottom( true, false, 0, 62 )
	attachment2:setRGB( 1, 1, 1 )
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
			stateName = "NotEquippable",
			condition = function ( menu, element, event )
				local f4_local0
				if not IsCACSlotEquipped( menu, element, controller ) then
					f4_local0 = IsCACSlotWeaponForAttachmentEquipped( menu, element, controller )
					if f4_local0 then
						f4_local0 = IsSecondaryWeaponAttachmentAvailable( controller )
					end
				else
					f4_local0 = false
				end
				return f4_local0
			end
		}
	} )
	self:addElement( attachment2 )
	self.attachment2 = attachment2
	
	local attachment1 = CoD.WeaponItemModelWidgetNew.new( menu, controller )
	attachment1:setLeftRight( true, false, 67, 129 )
	attachment1:setTopBottom( true, false, 0, 62 )
	attachment1:setRGB( 1, 1, 1 )
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
				local f7_local0
				if not IsCACSlotEquipped( menu, element, controller ) then
					f7_local0 = IsCACSlotWeaponForAttachmentEquipped( menu, element, controller )
					if f7_local0 then
						f7_local0 = IsSecondaryWeaponAttachmentAvailable( controller )
					end
				else
					f7_local0 = false
				end
				return f7_local0
			end
		}
	} )
	self:addElement( attachment1 )
	self.attachment1 = attachment1
	
	local optic = CoD.WeaponItemModelWidgetNew.new( menu, controller )
	optic:setLeftRight( false, true, -196, -134 )
	optic:setTopBottom( false, true, -129, -67 )
	optic:setRGB( 1, 1, 1 )
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
	self:addElement( optic )
	self.optic = optic
	
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
	self.close = function ( self )
		self.attachment2:close()
		self.attachment1:close()
		self.optic:close()
		CoD.SecondaryWeaponAttachmentsWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

