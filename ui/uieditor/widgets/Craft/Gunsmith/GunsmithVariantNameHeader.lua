-- b44aec19da0493a085493b8ebe008b14
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 417 )
	self:setTopBottom( true, false, 0, 49 )
	self.anyChildUsesUpdateState = true
	
	local InfoPaneItemName = CoD.InfoPaneItemName.new( menu, controller )
	InfoPaneItemName:setLeftRight( true, false, 3, 384 )
	InfoPaneItemName:setTopBottom( true, false, 6, 40 )
	InfoPaneItemName.weaponNameWithVariant.variantName:setAlpha( 1 )
	InfoPaneItemName:linkToElementModel( self, "weaponIndex", true, function ( model )
		local weaponIndex = Engine.GetModelValue( model )
		if weaponIndex then
			InfoPaneItemName.weaponNameWithVariant.itemName.itemName:setText( Engine.Localize( GetItemNameFromIndexMP( weaponIndex ) ) )
		end
	end )
	InfoPaneItemName:linkToElementModel( self, "variantNameBig", true, function ( model )
		local variantNameBig = Engine.GetModelValue( model )
		if variantNameBig then
			InfoPaneItemName.weaponNameWithVariant.variantName.itemName:setText( variantNameBig )
		end
	end )
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
	self:addElement( InfoPaneItemName )
	self.InfoPaneItemName = InfoPaneItemName
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				InfoPaneItemName:completeAnimation()
				self.InfoPaneItemName:setAlpha( 1 )
				self.clipFinished( InfoPaneItemName, {} )
			end
		},
		Hide = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				InfoPaneItemName:completeAnimation()
				self.InfoPaneItemName:setAlpha( 0 )
				self.clipFinished( InfoPaneItemName, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.InfoPaneItemName:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

