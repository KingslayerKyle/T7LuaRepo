require( "ui.uieditor.widgets.CAC.CustomClassListScreen.Panes.CustomClassGenericItemButton" )
require( "ui.uieditor.widgets.CAC.CustomClassListScreen.CustomClassMinorHeader" )

CoD.PerkBonusSlot = InheritFrom( LUI.UIElement )
CoD.PerkBonusSlot.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PerkBonusSlot )
	self.id = "PerkBonusSlot"
	self.soundSet = "CAC_EditLoadout"
	self:setLeftRight( true, false, 0, 108 )
	self:setTopBottom( true, false, 0, 134 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	local Bonus = CoD.CustomClassGenericItemButton.new( menu, controller )
	Bonus:setLeftRight( true, false, 0, 108 )
	Bonus:setTopBottom( true, false, 26, 134 )
	Bonus:setRGB( 1, 1, 1 )
	Bonus:linkToElementModel( self, nil, false, function ( model )
		Bonus:setModel( model, controller )
	end )
	Bonus:mergeStateConditions( {
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
		},
		{
			stateName = "Unavailable_Gadget",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "Unequipped_Gadget",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "Equipped_Gadget",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	if Bonus.m_eventHandlers.update_class then
		local currentEv = Bonus.m_eventHandlers.update_class
		Bonus:registerEventHandler( "update_class", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		Bonus:registerEventHandler( "update_class", LUI.UIElement.updateState )
	end
	Bonus:linkToElementModel( Bonus, "itemIndex", true, function ( model )
		menu:updateElementState( Bonus, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	self:addElement( Bonus )
	self.Bonus = Bonus
	
	local currentEv = CoD.CustomClassMinorHeader.new( menu, controller )
	currentEv:setLeftRight( true, false, 0, 108 )
	currentEv:setTopBottom( true, false, 0, 20 )
	currentEv:setRGB( 1, 1, 1 )
	currentEv.text:setText( Engine.Localize( LocalizeString( "CHALLENGE_PERK_GREED" ) ) )
	self:addElement( currentEv )
	self.BonusPerkHeader = currentEv
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Bonus:completeAnimation()
				self.Bonus:setAlpha( 1 )
				self.clipFinished( Bonus, {} )
			end
		}
	}
	Bonus.id = "Bonus"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.Bonus:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.Bonus:close()
		self.BonusPerkHeader:close()
		CoD.PerkBonusSlot.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

