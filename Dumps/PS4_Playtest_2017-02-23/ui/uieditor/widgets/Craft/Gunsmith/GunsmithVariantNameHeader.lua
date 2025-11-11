require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.InfoPaneItemName" )

CoD.GunsmithVariantNameHeader = InheritFrom( LUI.UIElement )
CoD.GunsmithVariantNameHeader.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GunsmithVariantNameHeader )
	self.id = "GunsmithVariantNameHeader"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 625 )
	self:setTopBottom( 0, 0, 0, 73 )
	self.anyChildUsesUpdateState = true
	
	local InfoPaneItemName = CoD.InfoPaneItemName.new( menu, controller )
	InfoPaneItemName:mergeStateConditions( {
		{
			stateName = "Equipped",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		},
		{
			stateName = "Available",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "NeedsWildcard",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "NotEquippable",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "NotAvailable",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	InfoPaneItemName:setLeftRight( 0, 0, 4, 576 )
	InfoPaneItemName:setTopBottom( 0, 0, 8.5, 59.5 )
	InfoPaneItemName.weaponNameWithVariant.variantName:setAlpha( 1 )
	InfoPaneItemName:linkToElementModel( self, "weaponIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			InfoPaneItemName.weaponNameWithVariant.itemName.itemName:setText( Engine.Localize( GetItemNameFromIndex( modelValue ) ) )
		end
	end )
	InfoPaneItemName:linkToElementModel( self, "variantNameBig", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			InfoPaneItemName.weaponNameWithVariant.variantName.itemName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( InfoPaneItemName )
	self.InfoPaneItemName = InfoPaneItemName
	
	self.resetProperties = function ()
		InfoPaneItemName:completeAnimation()
		InfoPaneItemName:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Hide = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				InfoPaneItemName:completeAnimation()
				self.InfoPaneItemName:setAlpha( 0 )
				self.clipFinished( InfoPaneItemName, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.InfoPaneItemName:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

