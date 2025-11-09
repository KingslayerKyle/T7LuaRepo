CoD.GunsmithStatBaseWeaponValue = InheritFrom( LUI.UIElement )
CoD.GunsmithStatBaseWeaponValue.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GunsmithStatBaseWeaponValue )
	self.id = "GunsmithStatBaseWeaponValue"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 100 )
	self:setTopBottom( true, false, 0, 24 )
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, true, 0, 0 )
	background:setTopBottom( true, false, 0, 24 )
	background:setAlpha( 0.1 )
	self:addElement( background )
	self.background = background
	
	local weaponStatValue = LUI.UIText.new()
	weaponStatValue:setLeftRight( true, true, 0, 0 )
	weaponStatValue:setTopBottom( true, false, 3, 21 )
	weaponStatValue:setRGB( ColorSet.GroupName.r, ColorSet.GroupName.g, ColorSet.GroupName.b )
	weaponStatValue:setText( Engine.Localize( "MENU_KILLS_CAPS" ) )
	weaponStatValue:setTTF( "fonts/escom.ttf" )
	weaponStatValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	weaponStatValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( weaponStatValue )
	self.weaponStatValue = weaponStatValue
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

