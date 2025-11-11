require( "ui.uieditor.widgets.buttonprompt" )
require( "ui.uieditor.widgets.CAC.BlackMarketItemDescription" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.InfoPaneItemName" )

CoD.ChooseTaunts_GestureOptionInfo = InheritFrom( LUI.UIElement )
CoD.ChooseTaunts_GestureOptionInfo.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ChooseTaunts_GestureOptionInfo )
	self.id = "ChooseTaunts_GestureOptionInfo"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 571 )
	self:setTopBottom( 0, 0, 0, 51 )
	self.anyChildUsesUpdateState = true
	
	local itemName = CoD.InfoPaneItemName.new( menu, controller )
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
	itemName:setLeftRight( 0, 0, 0, 572 )
	itemName:setTopBottom( 0, 0, 0.5, 51.5 )
	itemName.weaponNameWithVariant.variantName.itemName:setText( Engine.Localize( "" ) )
	itemName:linkToElementModel( self, "itemName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			itemName.weaponNameWithVariant.itemName.itemName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( itemName )
	self.itemName = itemName
	
	local itemDescription = CoD.BlackMarketItemDescription.new( menu, controller )
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
	itemDescription:setLeftRight( 0, 0, 0, 576 )
	itemDescription:setTopBottom( 0, 0, 63.5, 96.5 )
	itemDescription:setAlpha( 0 )
	itemDescription.weaponDescTextBox:setText( LocalizeIntoString( "MPUI_BLACKMARKET_ITEM_CLASSIFIED_DESC", "MENU_GESTURE" ) )
	itemDescription:linkToElementModel( self, nil, false, function ( model )
		itemDescription:setModel( model, controller )
	end )
	self:addElement( itemDescription )
	self.itemDescription = itemDescription
	
	local buttonprompt0 = CoD.buttonprompt.new( menu, controller )
	buttonprompt0:setLeftRight( 0, 0, -0.5, 320.5 )
	buttonprompt0:setTopBottom( 0, 0, 60, 106 )
	buttonprompt0.label:setText( Engine.Localize( "HEROES_PREVIEW_GESTURE" ) )
	buttonprompt0:subscribeToGlobalModel( controller, "Controller", "alt2_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			buttonprompt0.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( buttonprompt0 )
	self.buttonprompt0 = buttonprompt0
	
	self.resetProperties = function ()
		buttonprompt0:completeAnimation()
		itemDescription:completeAnimation()
		buttonprompt0:setRGB( 1, 1, 1 )
		buttonprompt0:setAlpha( 1 )
		itemDescription:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		BMClassified = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				itemDescription:completeAnimation()
				self.itemDescription:setAlpha( 1 )
				self.clipFinished( itemDescription, {} )
				buttonprompt0:completeAnimation()
				self.buttonprompt0:setRGB( ColorSet.Disabled.r, ColorSet.Disabled.g, ColorSet.Disabled.b )
				self.buttonprompt0:setAlpha( 0 )
				self.clipFinished( buttonprompt0, {} )
			end
		},
		NoPreview = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				buttonprompt0:completeAnimation()
				self.buttonprompt0:setRGB( 0.59, 0.59, 0.59 )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.itemName:close()
		self.itemDescription:close()
		self.buttonprompt0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

