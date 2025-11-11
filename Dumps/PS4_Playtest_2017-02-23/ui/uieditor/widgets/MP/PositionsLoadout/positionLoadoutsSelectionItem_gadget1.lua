require( "ui.uieditor.widgets.MP.PositionsLoadout.positionLoadoutsSelectedItem_gadget1" )
require( "ui.uieditor.widgets.MP.PositionsLoadout.SelectionItemCount" )

CoD.positionLoadoutsSelectionItem_gadget1 = InheritFrom( LUI.UIElement )
CoD.positionLoadoutsSelectionItem_gadget1.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.positionLoadoutsSelectionItem_gadget1 )
	self.id = "positionLoadoutsSelectionItem_gadget1"
	self.soundSet = "none"
	self:setLeftRight( 0, 0, 0, 140 )
	self:setTopBottom( 0, 0, 0, 120 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local selectedItem = CoD.positionLoadoutsSelectedItem_gadget1.new( menu, controller )
	selectedItem:setLeftRight( 0, 0, 10, 130 )
	selectedItem:setTopBottom( 0, 0, 0, 120 )
	selectedItem:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		SetPerControllerTableProperty( controller, "weaponCategory", element.actionParam )
		SetControllerModelValueNumberIncrement( controller, "PositionDraft.isEscalationWheelFocusCounter" )
		UpdateState( self, event )
		return retVal
	end )
	selectedItem:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		SetControllerModelValueNumberDecrement( controller, "PositionDraft.isEscalationWheelFocusCounter", 0 )
		return retVal
	end )
	self:addElement( selectedItem )
	self.selectedItem = selectedItem
	
	local countLabel = CoD.SelectionItemCount.new( menu, controller )
	countLabel:setLeftRight( 0.5, 0.5, -20, 20 )
	countLabel:setTopBottom( 0, 0, 123, 153 )
	self:addElement( countLabel )
	self.countLabel = countLabel
	
	selectedItem.id = "selectedItem"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.selectedItem:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.selectedItem:close()
		self.countLabel:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

