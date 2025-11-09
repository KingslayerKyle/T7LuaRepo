require( "ui.uieditor.widgets.CAC.CustomClassGridScreen.SecondaryWeapon.SecondaryWeaponOpticsModItemWidget" )
require( "ui.uieditor.widgets.CAC.CustomClassGridScreen.SecondaryWeapon.SecondaryWeaponAttachmentsModItemWidget" )

CoD.SecondaryWeaponModItemCardWidget_Internal = InheritFrom( LUI.UIElement )
CoD.SecondaryWeaponModItemCardWidget_Internal.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SecondaryWeaponModItemCardWidget_Internal )
	self.id = "SecondaryWeaponModItemCardWidget_Internal"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 402 )
	self:setTopBottom( true, false, 0, 85 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local SecondaryWeaponOpticsModItemWidget0 = CoD.SecondaryWeaponOpticsModItemWidget.new( menu, controller )
	SecondaryWeaponOpticsModItemWidget0:setLeftRight( true, false, 0, 132 )
	SecondaryWeaponOpticsModItemWidget0:setTopBottom( true, false, 0, 85 )
	SecondaryWeaponOpticsModItemWidget0:setRGB( 1, 1, 1 )
	SecondaryWeaponOpticsModItemWidget0.SecondaryWeaponOpticsModItemWidgetInternal0.opticsLabel:setText( Engine.Localize( "MPUI_OPTICS_CAPS" ) )
	self:addElement( SecondaryWeaponOpticsModItemWidget0 )
	self.SecondaryWeaponOpticsModItemWidget0 = SecondaryWeaponOpticsModItemWidget0
	
	local SecondaryWeaponAttachmentsModItemWidget0 = CoD.SecondaryWeaponAttachmentsModItemWidget.new( menu, controller )
	SecondaryWeaponAttachmentsModItemWidget0:setLeftRight( true, false, 135, 402 )
	SecondaryWeaponAttachmentsModItemWidget0:setTopBottom( true, false, 0, 85 )
	SecondaryWeaponAttachmentsModItemWidget0:setRGB( 1, 1, 1 )
	self:addElement( SecondaryWeaponAttachmentsModItemWidget0 )
	self.SecondaryWeaponAttachmentsModItemWidget0 = SecondaryWeaponAttachmentsModItemWidget0
	
	SecondaryWeaponOpticsModItemWidget0.navigation = {
		right = SecondaryWeaponAttachmentsModItemWidget0
	}
	SecondaryWeaponAttachmentsModItemWidget0.navigation = {
		left = SecondaryWeaponOpticsModItemWidget0
	}
	SecondaryWeaponOpticsModItemWidget0.id = "SecondaryWeaponOpticsModItemWidget0"
	SecondaryWeaponAttachmentsModItemWidget0.id = "SecondaryWeaponAttachmentsModItemWidget0"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.SecondaryWeaponAttachmentsModItemWidget0:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.SecondaryWeaponOpticsModItemWidget0:close()
		self.SecondaryWeaponAttachmentsModItemWidget0:close()
		CoD.SecondaryWeaponModItemCardWidget_Internal.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

