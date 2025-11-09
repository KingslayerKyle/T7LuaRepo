require( "ui.uieditor.widgets.CAC.CustomClassGridScreen.TacticalGrenade.TacticalGrenadeModItemCardWidget_Internal" )

CoD.TacticalGrenadeModItemCardWidget = InheritFrom( LUI.UIElement )
CoD.TacticalGrenadeModItemCardWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.TacticalGrenadeModItemCardWidget )
	self.id = "TacticalGrenadeModItemCardWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 263 )
	self:setTopBottom( true, false, 0, 89 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local modItemCard = CoD.TacticalGrenadeModItemCardWidget_Internal.new( menu, controller )
	modItemCard:setLeftRight( true, false, 0, 263 )
	modItemCard:setTopBottom( true, false, 0, 89 )
	modItemCard:setRGB( 1, 1, 1 )
	self:addElement( modItemCard )
	self.modItemCard = modItemCard
	
	modItemCard.id = "modItemCard"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.modItemCard:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.modItemCard:close()
		CoD.TacticalGrenadeModItemCardWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

