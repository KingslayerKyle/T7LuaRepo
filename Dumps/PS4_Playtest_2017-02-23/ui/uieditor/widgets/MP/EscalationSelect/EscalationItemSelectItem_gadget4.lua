require( "ui.uieditor.widgets.MP.EscalationSelect.EscalationItemSelected_major2" )
require( "ui.uieditor.widgets.MP.PositionsLoadout.SelectionItemCount" )

CoD.EscalationItemSelectItem_gadget4 = InheritFrom( LUI.UIElement )
CoD.EscalationItemSelectItem_gadget4.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.EscalationItemSelectItem_gadget4 )
	self.id = "EscalationItemSelectItem_gadget4"
	self.soundSet = "none"
	self:setLeftRight( 0, 0, 0, 140 )
	self:setTopBottom( 0, 0, 0, 120 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local countLabel = CoD.SelectionItemCount.new( menu, controller )
	countLabel:setLeftRight( 0.5, 0.5, -20, 20 )
	countLabel:setTopBottom( 0, 0, 123, 153 )
	self:addElement( countLabel )
	self.countLabel = countLabel
	
	local selectedItem = CoD.EscalationItemSelected_major2.new( menu, controller )
	selectedItem:setLeftRight( 0, 0, 30, 110 )
	selectedItem:setTopBottom( 0, 0, 20, 100 )
	self:addElement( selectedItem )
	self.selectedItem = selectedItem
	
	selectedItem.id = "selectedItem"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.selectedItem:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.countLabel:close()
		self.selectedItem:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

