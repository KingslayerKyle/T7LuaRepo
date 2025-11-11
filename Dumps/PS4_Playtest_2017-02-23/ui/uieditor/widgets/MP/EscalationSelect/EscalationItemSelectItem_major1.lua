require( "ui.uieditor.widgets.MP.EscalationSelect.EscalationItemSelected_major1" )
require( "ui.uieditor.widgets.MP.PositionsLoadout.SelectionItemCount" )

CoD.EscalationItemSelectItem_major1 = InheritFrom( LUI.UIElement )
CoD.EscalationItemSelectItem_major1.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.EscalationItemSelectItem_major1 )
	self.id = "EscalationItemSelectItem_major1"
	self.soundSet = "none"
	self:setLeftRight( 0, 0, 0, 140 )
	self:setTopBottom( 0, 0, 0, 120 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local EscalationItemSelectedmajor1 = CoD.EscalationItemSelected_major1.new( menu, controller )
	EscalationItemSelectedmajor1:setLeftRight( 0, 0, 10, 130 )
	EscalationItemSelectedmajor1:setTopBottom( 0, 0, 0, 120 )
	self:addElement( EscalationItemSelectedmajor1 )
	self.EscalationItemSelectedmajor1 = EscalationItemSelectedmajor1
	
	local countLabel = CoD.SelectionItemCount.new( menu, controller )
	countLabel:setLeftRight( 0.5, 0.5, -20, 20 )
	countLabel:setTopBottom( 0, 0, 123, 153 )
	self:addElement( countLabel )
	self.countLabel = countLabel
	
	EscalationItemSelectedmajor1.id = "EscalationItemSelectedmajor1"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.EscalationItemSelectedmajor1:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.EscalationItemSelectedmajor1:close()
		self.countLabel:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

