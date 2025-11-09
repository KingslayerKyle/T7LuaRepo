require( "ui.uieditor.widgets.CAC.MenuChooseClassold.ItemWidgets.AttachmentWidget_old" )

CoD.SecondaryWeaponAttachmentsWidget_old = InheritFrom( LUI.UIElement )
CoD.SecondaryWeaponAttachmentsWidget_old.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SecondaryWeaponAttachmentsWidget_old )
	self.id = "SecondaryWeaponAttachmentsWidget_old"
	self.soundSet = "CAC"
	self:setLeftRight( true, false, 0, 221 )
	self:setTopBottom( true, false, 0, 70 )
	self.anyChildUsesUpdateState = true
	
	local optic = CoD.AttachmentWidget_old.new( menu, controller )
	optic:setLeftRight( true, false, 0, 70 )
	optic:setTopBottom( true, false, 0, 70 )
	optic:setRGB( 1, 1, 1 )
	optic:mergeStateConditions( {
		{
			stateName = "Unavailable",
			condition = function ( menu, element, event )
				return not IsCACSlotEquipped( menu, element, controller )
			end
		}
	} )
	optic:linkToElementModel( optic, "itemIndex", true, function ( model )
		menu:updateElementState( optic, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	self:addElement( optic )
	self.optic = optic
	
	local attachment1 = CoD.AttachmentWidget_old.new( menu, controller )
	attachment1:setLeftRight( true, false, 75.5, 145.5 )
	attachment1:setTopBottom( true, false, 0, 70 )
	attachment1:setRGB( 1, 1, 1 )
	attachment1:mergeStateConditions( {
		{
			stateName = "Unavailable",
			condition = function ( menu, element, event )
				return not IsCACSlotEquipped( menu, element, controller )
			end
		}
	} )
	attachment1:linkToElementModel( attachment1, "itemIndex", true, function ( model )
		menu:updateElementState( attachment1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	self:addElement( attachment1 )
	self.attachment1 = attachment1
	
	local attachment2 = CoD.AttachmentWidget_old.new( menu, controller )
	attachment2:setLeftRight( true, false, 151, 221 )
	attachment2:setTopBottom( true, false, 0, 70 )
	attachment2:setRGB( 1, 1, 1 )
	attachment2:mergeStateConditions( {
		{
			stateName = "Unavailable",
			condition = function ( menu, element, event )
				return not IsCACSlotEquipped( menu, element, controller )
			end
		}
	} )
	attachment2:linkToElementModel( attachment2, "itemIndex", true, function ( model )
		menu:updateElementState( attachment2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	self:addElement( attachment2 )
	self.attachment2 = attachment2
	
	self.close = function ( self )
		self.optic:close()
		self.attachment1:close()
		self.attachment2:close()
		CoD.SecondaryWeaponAttachmentsWidget_old.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

