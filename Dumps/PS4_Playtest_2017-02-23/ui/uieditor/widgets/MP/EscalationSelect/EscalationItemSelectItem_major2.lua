require( "ui.uieditor.widgets.MP.EscalationSelect.EscalationItemSelected_major2" )
require( "ui.uieditor.widgets.MP.PositionsLoadout.SelectionItemCount" )

CoD.EscalationItemSelectItem_major2 = InheritFrom( LUI.UIElement )
CoD.EscalationItemSelectItem_major2.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.EscalationItemSelectItem_major2 )
	self.id = "EscalationItemSelectItem_major2"
	self.soundSet = "none"
	self:setLeftRight( 0, 0, 0, 140 )
	self:setTopBottom( 0, 0, 0, 120 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local EscalationItemSelectedmajor2 = CoD.EscalationItemSelected_major2.new( menu, controller )
	EscalationItemSelectedmajor2:setLeftRight( 0, 0, 10, 130 )
	EscalationItemSelectedmajor2:setTopBottom( 0, 0, 0, 120 )
	self:addElement( EscalationItemSelectedmajor2 )
	self.EscalationItemSelectedmajor2 = EscalationItemSelectedmajor2
	
	local countLabel = CoD.SelectionItemCount.new( menu, controller )
	countLabel:setLeftRight( 0.5, 0.5, -20, 20 )
	countLabel:setTopBottom( 0, 0, 123, 153 )
	self:addElement( countLabel )
	self.countLabel = countLabel
	
	EscalationItemSelectedmajor2.id = "EscalationItemSelectedmajor2"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.EscalationItemSelectedmajor2:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.EscalationItemSelectedmajor2:close()
		self.countLabel:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

