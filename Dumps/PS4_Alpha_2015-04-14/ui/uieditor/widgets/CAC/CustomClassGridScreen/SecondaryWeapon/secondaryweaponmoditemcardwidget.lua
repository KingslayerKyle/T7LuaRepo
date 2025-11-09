require( "ui.uieditor.widgets.CAC.CustomClassGridScreen.SecondaryWeapon.SecondaryWeaponModItemCardWidget_Internal" )

CoD.SecondaryWeaponModItemCardWidget = InheritFrom( LUI.UIElement )
CoD.SecondaryWeaponModItemCardWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SecondaryWeaponModItemCardWidget )
	self.id = "SecondaryWeaponModItemCardWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 402 )
	self:setTopBottom( true, false, 0, 85 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local modItemCard = CoD.SecondaryWeaponModItemCardWidget_Internal.new( menu, controller )
	modItemCard:setLeftRight( true, false, 0, 402 )
	modItemCard:setTopBottom( true, false, 0, 85 )
	modItemCard:setRGB( 1, 1, 1 )
	modItemCard.SecondaryWeaponOpticsModItemWidget0.SecondaryWeaponOpticsModItemWidgetInternal0.opticsLabel:setText( Engine.Localize( "MPUI_OPTICS_CAPS" ) )
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
		CoD.SecondaryWeaponModItemCardWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

