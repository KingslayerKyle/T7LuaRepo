-- 32458447886d9959a8f3fe8337043642
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.WeaponItemModelWidgetNew_InGame" )

CoD.PrimaryWeaponAttachmentsWidget_InGame = InheritFrom( LUI.UIElement )
CoD.PrimaryWeaponAttachmentsWidget_InGame.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.PrimaryWeaponAttachmentsWidget_InGame )
	self.id = "PrimaryWeaponAttachmentsWidget_InGame"
	self.soundSet = "CAC"
	self:setLeftRight( true, false, 0, 196 )
	self:setTopBottom( true, false, 0, 129 )
	self.anyChildUsesUpdateState = true
	
	local attachment5 = CoD.WeaponItemModelWidgetNew_InGame.new( menu, controller )
	attachment5:setLeftRight( false, true, -62, 0 )
	attachment5:setTopBottom( false, true, -62, 0 )
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
				local f3_local0
				if not IsCACSlotEquipped( menu, element, controller ) then
					f3_local0 = IsCACEquippedWildcardItemCount( menu, "bonuscard_primary_gunfighter", 2 )
					if f3_local0 then
						f3_local0 = IsCACSlotWeaponForAttachmentEquipped( menu, element, controller )
					end
				else
					f3_local0 = false
				end
				return f3_local0
			end
		},
		{
			stateName = "NotAvailable",
			condition = function ( menu, element, event )
				local f4_local0
				if not IsCACSlotAvailable( menu, element, controller ) then
					f4_local0 = IsCACCountGreaterThanEquippedWildcardItem( menu, "bonuscard_primary_gunfighter", 3 )
				else
					f4_local0 = false
				end
				return f4_local0
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
	
	local attachment4 = CoD.WeaponItemModelWidgetNew_InGame.new( menu, controller )
	attachment4:setLeftRight( false, false, -31, 31 )
	attachment4:setTopBottom( false, true, -62, 0 )
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
				local f7_local0
				if not IsCACSlotEquipped( menu, element, controller ) then
					f7_local0 = IsCACEquippedWildcardItemCount( menu, "bonuscard_primary_gunfighter", 1 )
					if f7_local0 then
						f7_local0 = IsCACSlotWeaponForAttachmentEquipped( menu, element, controller )
					end
				else
					f7_local0 = false
				end
				return f7_local0
			end
		},
		{
			stateName = "NotAvailable",
			condition = function ( menu, element, event )
				local f8_local0
				if not IsCACSlotAvailable( menu, element, controller ) then
					f8_local0 = IsCACCountGreaterThanEquippedWildcardItem( menu, "bonuscard_primary_gunfighter", 2 )
				else
					f8_local0 = false
				end
				return f8_local0
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
	
	local attachment3 = CoD.WeaponItemModelWidgetNew_InGame.new( menu, controller )
	attachment3:setLeftRight( true, false, 0, 62 )
	attachment3:setTopBottom( false, true, -62, 0 )
	attachment3:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			attachment3.itemImage:setImage( RegisterImage( image ) )
		end
	end )
	attachment3:mergeStateConditions( {
		{
			stateName = "NotEquippable",
			condition = function ( menu, element, event )
				local f11_local0
				if not IsCACSlotEquipped( menu, element, controller ) then
					f11_local0 = IsCACSlotWeaponForAttachmentEquipped( menu, element, controller )
					if f11_local0 then
						f11_local0 = IsPrimaryWeaponAttachmentAvailable( controller )
					end
				else
					f11_local0 = false
				end
				return f11_local0
			end
		}
	} )
	self:addElement( attachment3 )
	self.attachment3 = attachment3
	
	local attachment2 = CoD.WeaponItemModelWidgetNew_InGame.new( menu, controller )
	attachment2:setLeftRight( false, true, -62, 0 )
	attachment2:setTopBottom( true, false, 0, 62 )
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
				local f13_local0
				if not IsCACSlotEquipped( menu, element, controller ) then
					f13_local0 = IsCACSlotWeaponForAttachmentEquipped( menu, element, controller )
					if f13_local0 then
						f13_local0 = IsPrimaryWeaponAttachmentAvailable( controller )
					end
				else
					f13_local0 = false
				end
				return f13_local0
			end
		}
	} )
	self:addElement( attachment2 )
	self.attachment2 = attachment2
	
	local attachment1 = CoD.WeaponItemModelWidgetNew_InGame.new( menu, controller )
	attachment1:setLeftRight( false, false, -31, 31 )
	attachment1:setTopBottom( true, false, 0, 62 )
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
				local f15_local0
				if not IsCACSlotEquipped( menu, element, controller ) then
					f15_local0 = IsCACSlotWeaponForAttachmentEquipped( menu, element, controller )
					if f15_local0 then
						f15_local0 = IsPrimaryWeaponAttachmentAvailable( controller )
					end
				else
					f15_local0 = false
				end
				return f15_local0
			end
		}
	} )
	self:addElement( attachment1 )
	self.attachment1 = attachment1
	
	local optic = CoD.WeaponItemModelWidgetNew_InGame.new( menu, controller )
	optic:setLeftRight( true, false, 0, 62 )
	optic:setTopBottom( true, false, 0, 62 )
	optic.opticIndicator:setAlpha( 0.55 )
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
	self:addElement( optic )
	self.optic = optic
	
	local header = LUI.UITightText.new()
	header:setLeftRight( true, false, 66, 150 )
	header:setTopBottom( true, false, -20, -2 )
	header:setRGB( 0.57, 0.6, 0.65 )
	header:setText( Engine.Localize( "MPUI_ATTACHMENTS_CAPS" ) )
	header:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	header:setLetterSpacing( 0.5 )
	self:addElement( header )
	self.header = header
	
	local Label0 = LUI.UITightText.new()
	Label0:setLeftRight( true, false, 0, 78 )
	Label0:setTopBottom( true, false, -20, -2 )
	Label0:setRGB( 0.57, 0.6, 0.65 )
	Label0:setText( Engine.Localize( "MPUI_OPTICS_CAPS" ) )
	Label0:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Label0:setLetterSpacing( 0.5 )
	self:addElement( Label0 )
	self.Label0 = Label0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.attachment5:close()
		element.attachment4:close()
		element.attachment3:close()
		element.attachment2:close()
		element.attachment1:close()
		element.optic:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
