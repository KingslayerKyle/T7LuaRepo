require( "ui.uieditor.widgets.MP.EscalationSelect.EscalationItemSelected_major2" )
require( "ui.uieditor.widgets.MP.PositionsLoadout.SelectionItemCount" )

CoD.EscalationItemSelectItem_gadget2 = InheritFrom( LUI.UIElement )
CoD.EscalationItemSelectItem_gadget2.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.EscalationItemSelectItem_gadget2 )
	self.id = "EscalationItemSelectItem_gadget2"
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
	
	local SelectedItem = CoD.EscalationItemSelected_major2.new( menu, controller )
	SelectedItem:setLeftRight( 0, 0, 30, 110 )
	SelectedItem:setTopBottom( 0, 0, 20, 100 )
	self:addElement( SelectedItem )
	self.SelectedItem = SelectedItem
	
	SelectedItem.id = "SelectedItem"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.SelectedItem:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.countLabel:close()
		self.SelectedItem:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

