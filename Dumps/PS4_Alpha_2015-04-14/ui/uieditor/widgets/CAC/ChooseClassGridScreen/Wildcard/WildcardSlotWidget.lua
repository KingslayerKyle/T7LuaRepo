require( "ui.uieditor.widgets.CAC.ChooseClassGridScreen.Wildcard.WildcardSlotItemWidget" )

CoD.WildcardSlotWidget = InheritFrom( LUI.UIElement )
CoD.WildcardSlotWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.WildcardSlotWidget )
	self.id = "WildcardSlotWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 881 )
	self:setTopBottom( true, false, 0, 93 )
	self.anyChildUsesUpdateState = true
	
	local label = LUI.UITightText.new()
	label:setLeftRight( true, false, 2, 114 )
	label:setTopBottom( true, false, 0, 25 )
	label:setRGB( 0.4, 0.44, 0.52 )
	label:setText( Engine.Localize( "MENU_WILDCARDS_CAPS" ) )
	label:setTTF( "fonts/default.ttf" )
	self:addElement( label )
	self.label = label
	
	local wildcardCard1 = CoD.WildcardSlotItemWidget.new( menu, controller )
	wildcardCard1:setLeftRight( true, false, 0, 288 )
	wildcardCard1:setTopBottom( true, false, 25, 93 )
	wildcardCard1:setRGB( 1, 1, 1 )
	wildcardCard1:mergeStateConditions( {
		{
			stateName = "Unequipped",
			condition = function ( menu, element, event )
				return not IsCACSlotEquipped( menu, element, controller )
			end
		}
	} )
	wildcardCard1:linkToElementModel( wildcardCard1, "itemIndex", true, function ( model )
		menu:updateElementState( wildcardCard1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	self:addElement( wildcardCard1 )
	self.wildcardCard1 = wildcardCard1
	
	local wildcardCard2 = CoD.WildcardSlotItemWidget.new( menu, controller )
	wildcardCard2:setLeftRight( true, false, 296.5, 584.5 )
	wildcardCard2:setTopBottom( true, false, 25, 93 )
	wildcardCard2:setRGB( 1, 1, 1 )
	wildcardCard2:mergeStateConditions( {
		{
			stateName = "Unequipped",
			condition = function ( menu, element, event )
				return not IsCACSlotEquipped( menu, element, controller )
			end
		}
	} )
	wildcardCard2:linkToElementModel( wildcardCard2, "itemIndex", true, function ( model )
		menu:updateElementState( wildcardCard2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	self:addElement( wildcardCard2 )
	self.wildcardCard2 = wildcardCard2
	
	local wildcardCard3 = CoD.WildcardSlotItemWidget.new( menu, controller )
	wildcardCard3:setLeftRight( true, false, 593, 881 )
	wildcardCard3:setTopBottom( true, false, 25, 93 )
	wildcardCard3:setRGB( 1, 1, 1 )
	wildcardCard3:mergeStateConditions( {
		{
			stateName = "Unequipped",
			condition = function ( menu, element, event )
				return not IsCACSlotEquipped( menu, element, controller )
			end
		}
	} )
	wildcardCard3:linkToElementModel( wildcardCard3, "itemIndex", true, function ( model )
		menu:updateElementState( wildcardCard3, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	self:addElement( wildcardCard3 )
	self.wildcardCard3 = wildcardCard3
	
	self.close = function ( self )
		self.wildcardCard1:close()
		self.wildcardCard2:close()
		self.wildcardCard3:close()
		CoD.WildcardSlotWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

