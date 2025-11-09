require( "ui.uieditor.widgets.CAC.CustomClassGridScreen.PrimaryWeapon.PrimaryWeaponOpticsModItemWidget_Internal" )

CoD.PrimaryWeaponOpticsModItemWidget = InheritFrom( LUI.UIElement )
CoD.PrimaryWeaponOpticsModItemWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PrimaryWeaponOpticsModItemWidget )
	self.id = "PrimaryWeaponOpticsModItemWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 87 )
	self:setTopBottom( true, false, 0, 85 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local PrimaryWeaponOpticsModItemWidgetInternal0 = CoD.PrimaryWeaponOpticsModItemWidget_Internal.new( menu, controller )
	PrimaryWeaponOpticsModItemWidgetInternal0:setLeftRight( true, true, 0, 0 )
	PrimaryWeaponOpticsModItemWidgetInternal0:setTopBottom( true, true, 0, 0 )
	PrimaryWeaponOpticsModItemWidgetInternal0:setRGB( 1, 1, 1 )
	PrimaryWeaponOpticsModItemWidgetInternal0.opticsLabel:setText( Engine.Localize( "MPUI_OPTICS_CAPS" ) )
	self:addElement( PrimaryWeaponOpticsModItemWidgetInternal0 )
	self.PrimaryWeaponOpticsModItemWidgetInternal0 = PrimaryWeaponOpticsModItemWidgetInternal0
	
	PrimaryWeaponOpticsModItemWidgetInternal0.id = "PrimaryWeaponOpticsModItemWidgetInternal0"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.PrimaryWeaponOpticsModItemWidgetInternal0:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.PrimaryWeaponOpticsModItemWidgetInternal0:close()
		CoD.PrimaryWeaponOpticsModItemWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

