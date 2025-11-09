require( "ui.uieditor.widgets.CAC.CustomClassGridScreen.PrimaryWeapon.PrimaryWeaponModItemWidget" )

CoD.PrimaryWeaponOpticsModItemWidget_Internal = InheritFrom( LUI.UIElement )
CoD.PrimaryWeaponOpticsModItemWidget_Internal.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PrimaryWeaponOpticsModItemWidget_Internal )
	self.id = "PrimaryWeaponOpticsModItemWidget_Internal"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 132 )
	self:setTopBottom( true, false, 0, 85 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local opticsLabel = LUI.UITightText.new()
	opticsLabel:setLeftRight( true, false, 0, 57 )
	opticsLabel:setTopBottom( true, false, 5, 25 )
	opticsLabel:setRGB( 0.4, 0.44, 0.52 )
	opticsLabel:setText( Engine.Localize( "MPUI_OPTICS_CAPS" ) )
	opticsLabel:setTTF( "fonts/default.ttf" )
	self:addElement( opticsLabel )
	self.opticsLabel = opticsLabel
	
	local PrimaryWeaponModItemWidget0 = CoD.PrimaryWeaponModItemWidget.new( menu, controller )
	PrimaryWeaponModItemWidget0:setLeftRight( true, true, 0, 0 )
	PrimaryWeaponModItemWidget0:setTopBottom( true, false, 25, 85 )
	PrimaryWeaponModItemWidget0:setRGB( 1, 1, 1 )
	self:addElement( PrimaryWeaponModItemWidget0 )
	self.PrimaryWeaponModItemWidget0 = PrimaryWeaponModItemWidget0
	
	PrimaryWeaponModItemWidget0.id = "PrimaryWeaponModItemWidget0"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.PrimaryWeaponModItemWidget0:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.PrimaryWeaponModItemWidget0:close()
		CoD.PrimaryWeaponOpticsModItemWidget_Internal.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

