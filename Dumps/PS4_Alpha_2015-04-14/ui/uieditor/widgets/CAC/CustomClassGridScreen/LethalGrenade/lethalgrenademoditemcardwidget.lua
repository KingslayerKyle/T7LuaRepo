require( "ui.uieditor.widgets.CAC.CustomClassGridScreen.LethalGrenade.LethalGrenadeModItemCardWidget_Internal" )

CoD.LethalGrenadeModItemCardWidget = InheritFrom( LUI.UIElement )
CoD.LethalGrenadeModItemCardWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LethalGrenadeModItemCardWidget )
	self.id = "LethalGrenadeModItemCardWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 263 )
	self:setTopBottom( true, false, 0, 89 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local modItemCard = CoD.LethalGrenadeModItemCardWidget_Internal.new( menu, controller )
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
		CoD.LethalGrenadeModItemCardWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

