require( "ui.uieditor.widgets.CAC.CustomClassGridScreen.SecondaryWeapon.SecondaryWeaponModItemWidget" )

CoD.SecondaryWeaponOpticsModItemWidget_Internal = InheritFrom( LUI.UIElement )
CoD.SecondaryWeaponOpticsModItemWidget_Internal.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SecondaryWeaponOpticsModItemWidget_Internal )
	self.id = "SecondaryWeaponOpticsModItemWidget_Internal"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 176 )
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
	
	local SecondaryWeaponModItemWidget0 = CoD.SecondaryWeaponModItemWidget.new( menu, controller )
	SecondaryWeaponModItemWidget0:setLeftRight( true, true, 0, 0 )
	SecondaryWeaponModItemWidget0:setTopBottom( true, false, 25, 85 )
	SecondaryWeaponModItemWidget0:setRGB( 1, 1, 1 )
	self:addElement( SecondaryWeaponModItemWidget0 )
	self.SecondaryWeaponModItemWidget0 = SecondaryWeaponModItemWidget0
	
	SecondaryWeaponModItemWidget0.id = "SecondaryWeaponModItemWidget0"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.SecondaryWeaponModItemWidget0:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.SecondaryWeaponModItemWidget0:close()
		CoD.SecondaryWeaponOpticsModItemWidget_Internal.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

