require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.InfoPaneItemName" )
require( "ui.uieditor.widgets.CAC.BlackMarketItemDescription" )
require( "ui.uieditor.widgets.buttonprompt" )

CoD.ChooseTaunts_TauntOptionInfo = InheritFrom( LUI.UIElement )
CoD.ChooseTaunts_TauntOptionInfo.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ChooseTaunts_TauntOptionInfo )
	self.id = "ChooseTaunts_TauntOptionInfo"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 381 )
	self:setTopBottom( true, false, 0, 34 )
	self.anyChildUsesUpdateState = true
	
	local itemName = CoD.InfoPaneItemName.new( menu, controller )
	itemName:setLeftRight( true, false, 0, 381 )
	itemName:setTopBottom( true, false, 0, 34 )
	itemName.weaponNameWithVariant.variantName.itemName:setText( Engine.Localize( "" ) )
	itemName:linkToElementModel( self, "itemName", true, function ( model )
		local _itemName = Engine.GetModelValue( model )
		if _itemName then
			itemName.weaponNameWithVariant.itemName.itemName:setText( Engine.Localize( _itemName ) )
		end
	end )
	itemName:mergeStateConditions( {
		{
			stateName = "Equipped",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		},
		{
			stateName = "Available",
			condition = function ( menu, element, event )
				return true
			end
		},
		{
			stateName = "NotEquippable",
			condition = function ( menu, element, event )
				return true
			end
		},
		{
			stateName = "NotAvailable",
			condition = function ( menu, element, event )
				return true
			end
		}
	} )
	self:addElement( itemName )
	self.itemName = itemName
	
	local itemDescription = CoD.BlackMarketItemDescription.new( menu, controller )
	itemDescription:setLeftRight( true, false, 0, 384 )
	itemDescription:setTopBottom( true, false, 42, 64 )
	itemDescription:setAlpha( 0 )
	itemDescription.weaponDescTextBox:setText( Engine.Localize( LocalizeIntoString( "MPUI_BLACKMARKET_ITEM_CLASSIFIED_DESC", "HEROES_TAUNT" ) ) )
	itemDescription:linkToElementModel( self, nil, false, function ( model )
		itemDescription:setModel( model, controller )
	end )
	itemDescription:mergeStateConditions( {
		{
			stateName = "NotVisible",
			condition = function ( menu, element, event )
				return not IsSelfModelValueTrue( element, controller, "isBMClassified" )
			end
		}
	} )
	itemDescription:linkToElementModel( itemDescription, "isBMClassified", true, function ( model )
		menu:updateElementState( itemDescription, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBMClassified"
		} )
	end )
	self:addElement( itemDescription )
	self.itemDescription = itemDescription
	
	local buttonprompt0 = CoD.buttonprompt.new( menu, controller )
	buttonprompt0:setLeftRight( true, false, 0, 214 )
	buttonprompt0:setTopBottom( true, false, 39, 70 )
	buttonprompt0:setAlpha( NotPCShowAlpha( controller, 1 ) )
	buttonprompt0.label:setText( Engine.Localize( "HEROES_PREVIEW_TAUNT" ) )
	buttonprompt0:subscribeToGlobalModel( controller, "Controller", "alt2_button_image", function ( model )
		local alt2ButtonImage = Engine.GetModelValue( model )
		if alt2ButtonImage then
			buttonprompt0.buttonPromptImage:setImage( RegisterImage( alt2ButtonImage ) )
		end
	end )
	self:addElement( buttonprompt0 )
	self.buttonprompt0 = buttonprompt0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				itemDescription:completeAnimation()
				self.itemDescription:setAlpha( 0 )
				self.clipFinished( itemDescription, {} )
				buttonprompt0:completeAnimation()
				self.buttonprompt0:setRGB( 1, 1, 1 )
				self.buttonprompt0:setAlpha( NotPCShowAlpha( controller, 1 ) )
				self.clipFinished( buttonprompt0, {} )
			end
		},
		BMClassified = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				itemDescription:completeAnimation()
				self.itemDescription:setAlpha( 1 )
				self.clipFinished( itemDescription, {} )
				buttonprompt0:completeAnimation()
				self.buttonprompt0:setAlpha( NotPCShowAlpha( controller, 0 ) )
				self.clipFinished( buttonprompt0, {} )
			end
		},
		NoPreview = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				itemDescription:completeAnimation()
				self.itemDescription:setAlpha( 0 )
				self.clipFinished( itemDescription, {} )
				buttonprompt0:completeAnimation()
				self.buttonprompt0:setRGB( ColorSet.Disabled.r, ColorSet.Disabled.g, ColorSet.Disabled.b )
				self.buttonprompt0:setAlpha( NotPCShowAlpha( controller, 1 ) )
				self.clipFinished( buttonprompt0, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "BMClassified",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "isBMClassified" )
			end
		},
		{
			stateName = "NoPreview",
			condition = function ( menu, element, event )
				return not IsSelfModelValueTrue( element, controller, "canPreview" )
			end
		}
	} )
	self:linkToElementModel( self, "isBMClassified", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBMClassified"
		} )
	end )
	self:linkToElementModel( self, "canPreview", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "canPreview"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.itemName:close()
		element.itemDescription:close()
		element.buttonprompt0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

