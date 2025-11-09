require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.InfoPaneItemNameLabel" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.InfoPaneItemVariantName" )

CoD.InfoPaneItemNameWithVariantName = InheritFrom( LUI.UIElement )
CoD.InfoPaneItemNameWithVariantName.new = function ( menu, controller )
	local self = LUI.UIHorizontalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 0
	} )
	self:setAlignment( LUI.Alignment.Left )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.InfoPaneItemNameWithVariantName )
	self.id = "InfoPaneItemNameWithVariantName"
	self.soundSet = "CAC_EditLoadout"
	self:setLeftRight( true, false, 0, 595 )
	self:setTopBottom( true, false, 0, 34 )
	
	local itemName = CoD.InfoPaneItemNameLabel.new( menu, controller )
	itemName:setLeftRight( false, false, -297.5, -147.74 )
	itemName:setTopBottom( true, true, 0, 0 )
	itemName:setRGB( 1, 1, 1 )
	itemName:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			itemName.itemName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( itemName )
	self.itemName = itemName
	
	local variantName = CoD.InfoPaneItemVariantName.new( menu, controller )
	variantName:setLeftRight( true, false, 149.76, 496 )
	variantName:setTopBottom( true, false, 0, 34 )
	variantName:setRGB( 1, 1, 1 )
	variantName.itemName:setText( Engine.Localize( "" ) )
	self:addElement( variantName )
	self.variantName = variantName
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				variantName:completeAnimation()
				self.variantName:setAlpha( 0 )
				self.clipFinished( variantName, {} )
			end
		},
		ShowVariant = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				itemName:completeAnimation()
				self.itemName:setAlpha( 1 )
				self.clipFinished( itemName, {} )
				variantName:completeAnimation()
				self.variantName:setAlpha( 1 )
				self.clipFinished( variantName, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "ShowVariant",
			condition = function ( menu, element, event )
				return IsCACSlotHasVariantName( element )
			end
		}
	} )
	self.close = function ( self )
		self.itemName:close()
		self.variantName:close()
		CoD.InfoPaneItemNameWithVariantName.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

