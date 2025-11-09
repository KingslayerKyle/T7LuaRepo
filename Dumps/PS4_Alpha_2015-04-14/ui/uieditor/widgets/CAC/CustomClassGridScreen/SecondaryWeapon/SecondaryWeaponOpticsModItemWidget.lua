require( "ui.uieditor.widgets.CAC.CustomClassGridScreen.SecondaryWeapon.SecondaryWeaponOpticsModItemWidget_Internal" )

CoD.SecondaryWeaponOpticsModItemWidget = InheritFrom( LUI.UIElement )
CoD.SecondaryWeaponOpticsModItemWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SecondaryWeaponOpticsModItemWidget )
	self.id = "SecondaryWeaponOpticsModItemWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 176 )
	self:setTopBottom( true, false, 0, 85 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local SecondaryWeaponOpticsModItemWidgetInternal0 = CoD.SecondaryWeaponOpticsModItemWidget_Internal.new( menu, controller )
	SecondaryWeaponOpticsModItemWidgetInternal0:setLeftRight( true, true, 0, 0 )
	SecondaryWeaponOpticsModItemWidgetInternal0:setTopBottom( true, true, 0, 0 )
	SecondaryWeaponOpticsModItemWidgetInternal0:setRGB( 1, 1, 1 )
	SecondaryWeaponOpticsModItemWidgetInternal0.opticsLabel:setText( Engine.Localize( "MPUI_OPTICS_CAPS" ) )
	self:addElement( SecondaryWeaponOpticsModItemWidgetInternal0 )
	self.SecondaryWeaponOpticsModItemWidgetInternal0 = SecondaryWeaponOpticsModItemWidgetInternal0
	
	SecondaryWeaponOpticsModItemWidgetInternal0.id = "SecondaryWeaponOpticsModItemWidgetInternal0"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.SecondaryWeaponOpticsModItemWidgetInternal0:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.SecondaryWeaponOpticsModItemWidgetInternal0:close()
		CoD.SecondaryWeaponOpticsModItemWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

