require( "ui.uieditor.widgets.CAC.CustomClassGridScreen.PrimaryWeapon.PrimaryWeaponOpticsModItemWidget" )
require( "ui.uieditor.widgets.CAC.CustomClassGridScreen.PrimaryWeapon.PrimaryWeaponAttachmentsModItemWidget" )

CoD.PrimaryWeaponModItemCardWidget_Internal = InheritFrom( LUI.UIElement )
CoD.PrimaryWeaponModItemCardWidget_Internal.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PrimaryWeaponModItemCardWidget_Internal )
	self.id = "PrimaryWeaponModItemCardWidget_Internal"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 537 )
	self:setTopBottom( true, false, 0, 85 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local PrimaryWeaponOpticsModItemWidget0 = CoD.PrimaryWeaponOpticsModItemWidget.new( menu, controller )
	PrimaryWeaponOpticsModItemWidget0:setLeftRight( true, false, 0, 87 )
	PrimaryWeaponOpticsModItemWidget0:setTopBottom( true, false, 0, 85 )
	PrimaryWeaponOpticsModItemWidget0:setRGB( 1, 1, 1 )
	PrimaryWeaponOpticsModItemWidget0.PrimaryWeaponOpticsModItemWidgetInternal0.opticsLabel:setText( Engine.Localize( "MPUI_OPTICS_CAPS" ) )
	self:addElement( PrimaryWeaponOpticsModItemWidget0 )
	self.PrimaryWeaponOpticsModItemWidget0 = PrimaryWeaponOpticsModItemWidget0
	
	local PrimaryWeaponAttachmentsModItemWidget0 = CoD.PrimaryWeaponAttachmentsModItemWidget.new( menu, controller )
	PrimaryWeaponAttachmentsModItemWidget0:setLeftRight( true, false, 90, 492 )
	PrimaryWeaponAttachmentsModItemWidget0:setTopBottom( true, false, 0, 85 )
	PrimaryWeaponAttachmentsModItemWidget0:setRGB( 1, 1, 1 )
	self:addElement( PrimaryWeaponAttachmentsModItemWidget0 )
	self.PrimaryWeaponAttachmentsModItemWidget0 = PrimaryWeaponAttachmentsModItemWidget0
	
	PrimaryWeaponOpticsModItemWidget0.navigation = {
		right = PrimaryWeaponAttachmentsModItemWidget0
	}
	PrimaryWeaponAttachmentsModItemWidget0.navigation = {
		left = PrimaryWeaponOpticsModItemWidget0
	}
	PrimaryWeaponOpticsModItemWidget0.id = "PrimaryWeaponOpticsModItemWidget0"
	PrimaryWeaponAttachmentsModItemWidget0.id = "PrimaryWeaponAttachmentsModItemWidget0"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.PrimaryWeaponAttachmentsModItemWidget0:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.PrimaryWeaponOpticsModItemWidget0:close()
		self.PrimaryWeaponAttachmentsModItemWidget0:close()
		CoD.PrimaryWeaponModItemCardWidget_Internal.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

