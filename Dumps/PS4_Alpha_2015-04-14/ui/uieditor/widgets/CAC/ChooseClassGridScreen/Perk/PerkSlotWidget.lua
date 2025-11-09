require( "ui.uieditor.widgets.CAC.ChooseClassGridScreen.Perk.PerkSlotItemWidget" )

CoD.PerkSlotWidget = InheritFrom( LUI.UIElement )
CoD.PerkSlotWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PerkSlotWidget )
	self.id = "PerkSlotWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 118 )
	self:setTopBottom( true, false, 0, 208 )
	self.anyChildUsesUpdateState = true
	
	local perkHeaderLabel = LUI.UITightText.new()
	perkHeaderLabel:setLeftRight( true, false, 2, 62 )
	perkHeaderLabel:setTopBottom( true, false, 0, 25 )
	perkHeaderLabel:setRGB( 0.4, 0.44, 0.52 )
	perkHeaderLabel:setText( Engine.Localize( "MPUI_PERK_1" ) )
	perkHeaderLabel:setTTF( "fonts/default.ttf" )
	self:addElement( perkHeaderLabel )
	self.perkHeaderLabel = perkHeaderLabel
	
	local PerkSlotItemWidget0 = CoD.PerkSlotItemWidget.new( menu, controller )
	PerkSlotItemWidget0:setLeftRight( true, false, 0, 118 )
	PerkSlotItemWidget0:setTopBottom( true, false, 25, 116 )
	PerkSlotItemWidget0:setRGB( 1, 1, 1 )
	PerkSlotItemWidget0:mergeStateConditions( {
		{
			stateName = "Unavailable",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "Unequipped",
			condition = function ( menu, element, event )
				return not IsCACSlotEquipped( menu, element, controller )
			end
		}
	} )
	PerkSlotItemWidget0:linkToElementModel( PerkSlotItemWidget0, "itemIndex", true, function ( model )
		menu:updateElementState( PerkSlotItemWidget0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	self:addElement( PerkSlotItemWidget0 )
	self.PerkSlotItemWidget0 = PerkSlotItemWidget0
	
	local PerkSlotItemWidget1 = CoD.PerkSlotItemWidget.new( menu, controller )
	PerkSlotItemWidget1:setLeftRight( true, false, 0, 118 )
	PerkSlotItemWidget1:setTopBottom( true, false, 117, 208 )
	PerkSlotItemWidget1:setRGB( 1, 1, 1 )
	PerkSlotItemWidget1:mergeStateConditions( {
		{
			stateName = "Unavailable",
			condition = function ( menu, element, event )
				return not IsCACSlotAvailable( menu, element, controller )
			end
		},
		{
			stateName = "Unequipped",
			condition = function ( menu, element, event )
				return not IsCACSlotEquipped( menu, element, controller )
			end
		}
	} )
	if PerkSlotItemWidget1.m_eventHandlers.update_class then
		local currentEv = PerkSlotItemWidget1.m_eventHandlers.update_class
		PerkSlotItemWidget1:registerEventHandler( "update_class", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		PerkSlotItemWidget1:registerEventHandler( "update_class", LUI.UIElement.updateState )
	end
	PerkSlotItemWidget1:linkToElementModel( PerkSlotItemWidget1, "itemIndex", true, function ( model )
		menu:updateElementState( PerkSlotItemWidget1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	self:addElement( PerkSlotItemWidget1 )
	self.PerkSlotItemWidget1 = PerkSlotItemWidget1
	
	self.close = function ( self )
		self.PerkSlotItemWidget0:close()
		self.PerkSlotItemWidget1:close()
		CoD.PerkSlotWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

