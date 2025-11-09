require( "ui.uieditor.widgets.CAC.CustomClassGridScreen.Perk.PerkItemWidget_Internal" )

CoD.PerkItemWidget = InheritFrom( LUI.UIElement )
CoD.PerkItemWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PerkItemWidget )
	self.id = "PerkItemWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 128 )
	self:setTopBottom( true, false, 0, 208 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local perkHeaderLabel = LUI.UITightText.new()
	perkHeaderLabel:setLeftRight( true, false, 2, 68 )
	perkHeaderLabel:setTopBottom( true, false, 0, 25 )
	perkHeaderLabel:setRGB( 0.4, 0.44, 0.52 )
	perkHeaderLabel:setText( Engine.Localize( "MPUI_PERK_1_CAPS" ) )
	perkHeaderLabel:setTTF( "fonts/default.ttf" )
	self:addElement( perkHeaderLabel )
	self.perkHeaderLabel = perkHeaderLabel
	
	local PerkItemWidgetInternal0 = CoD.PerkItemWidget_Internal.new( menu, controller )
	PerkItemWidgetInternal0:setLeftRight( true, false, 0, 128 )
	PerkItemWidgetInternal0:setTopBottom( true, false, 25, 116 )
	PerkItemWidgetInternal0:setRGB( 1, 1, 1 )
	self:addElement( PerkItemWidgetInternal0 )
	self.PerkItemWidgetInternal0 = PerkItemWidgetInternal0
	
	local PerkItemWidgetInternal1 = CoD.PerkItemWidget_Internal.new( menu, controller )
	PerkItemWidgetInternal1:setLeftRight( true, false, 0, 128 )
	PerkItemWidgetInternal1:setTopBottom( true, false, 117, 208 )
	PerkItemWidgetInternal1:setRGB( 1, 1, 1 )
	self:addElement( PerkItemWidgetInternal1 )
	self.PerkItemWidgetInternal1 = PerkItemWidgetInternal1
	
	PerkItemWidgetInternal0.navigation = {
		down = PerkItemWidgetInternal1
	}
	PerkItemWidgetInternal1.navigation = {
		up = PerkItemWidgetInternal0
	}
	PerkItemWidgetInternal0.id = "PerkItemWidgetInternal0"
	PerkItemWidgetInternal1.id = "PerkItemWidgetInternal1"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.PerkItemWidgetInternal0:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.PerkItemWidgetInternal0:close()
		self.PerkItemWidgetInternal1:close()
		CoD.PerkItemWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

