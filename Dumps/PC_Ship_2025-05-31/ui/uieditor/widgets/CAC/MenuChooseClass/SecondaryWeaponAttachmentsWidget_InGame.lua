require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.WeaponItemModelWidgetNew_InGame" )

CoD.SecondaryWeaponAttachmentsWidget_InGame = InheritFrom( LUI.UIElement )
CoD.SecondaryWeaponAttachmentsWidget_InGame.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SecondaryWeaponAttachmentsWidget_InGame )
	self.id = "SecondaryWeaponAttachmentsWidget_InGame"
	self.soundSet = "CAC"
	self:setLeftRight( true, false, 0, 196 )
	self:setTopBottom( true, false, 0, 129 )
	self.anyChildUsesUpdateState = true
	
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
				local f3_local0
				if not IsCACSlotEquipped( menu, element, controller ) then
					f3_local0 = IsCACSlotWeaponForAttachmentEquipped( menu, element, controller )
					if f3_local0 then
						f3_local0 = IsSecondaryWeaponAttachmentAvailable( controller )
					end
				else
					f3_local0 = false
				end
				return f3_local0
			end
		}
	} )
	self:addElement( attachment2 )
	self.attachment2 = attachment2
	
	local attachment1 = CoD.WeaponItemModelWidgetNew_InGame.new( menu, controller )
	attachment1:setLeftRight( true, false, 67, 129 )
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
	self:addElement( attachment1 )
	self.attachment1 = attachment1
	
	local optic = CoD.WeaponItemModelWidgetNew_InGame.new( menu, controller )
	optic:setLeftRight( false, true, -196, -134 )
	optic:setTopBottom( false, true, -129, -67 )
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
		element.attachment2:close()
		element.attachment1:close()
		element.optic:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

