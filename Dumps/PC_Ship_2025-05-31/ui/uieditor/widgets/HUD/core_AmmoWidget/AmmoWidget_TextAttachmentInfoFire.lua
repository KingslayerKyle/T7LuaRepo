CoD.AmmoWidget_TextAttachmentInfoFire = InheritFrom( LUI.UIElement )
CoD.AmmoWidget_TextAttachmentInfoFire.new = function ( menu, controller )
	local self = LUI.UIHorizontalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 5
	} )
	self:setAlignment( LUI.Alignment.Right )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidget_TextAttachmentInfoFire )
	self.id = "AmmoWidget_TextAttachmentInfoFire"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 296 )
	self:setTopBottom( true, false, 0, 18 )
	
	local WeaponFireRateLbl = LUI.UITightText.new()
	WeaponFireRateLbl:setLeftRight( false, true, -68, 0 )
	WeaponFireRateLbl:setTopBottom( false, true, -16, 0 )
	WeaponFireRateLbl:setTTF( "fonts/escom.ttf" )
	WeaponFireRateLbl:setLetterSpacing( 0.5 )
	WeaponFireRateLbl:subscribeToGlobalModel( controller, "CurrentWeapon", "fireRateString", function ( model )
		local fireRateString = Engine.GetModelValue( model )
		if fireRateString then
			WeaponFireRateLbl:setText( fireRateString )
		end
	end )
	self:addElement( WeaponFireRateLbl )
	self.WeaponFireRateLbl = WeaponFireRateLbl
	
	local WeaponNameStrokeLbl = LUI.UITightText.new()
	WeaponNameStrokeLbl:setLeftRight( false, true, -188, -73 )
	WeaponNameStrokeLbl:setTopBottom( false, true, -16, 0 )
	WeaponNameStrokeLbl:setTTF( "fonts/escom.ttf" )
	WeaponNameStrokeLbl:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	WeaponNameStrokeLbl:setShaderVector( 0, 0, 0, 0, 0 )
	WeaponNameStrokeLbl:setShaderVector( 1, 0, 0, 0, 0 )
	WeaponNameStrokeLbl:setShaderVector( 2, 1, 0, 0, 0 )
	WeaponNameStrokeLbl:setLetterSpacing( 0.5 )
	WeaponNameStrokeLbl:subscribeToGlobalModel( controller, "CurrentWeapon", "weaponName", function ( model )
		local weaponName = Engine.GetModelValue( model )
		if weaponName then
			WeaponNameStrokeLbl:setText( Engine.Localize( weaponName ) )
		end
	end )
	self:addElement( WeaponNameStrokeLbl )
	self.WeaponNameStrokeLbl = WeaponNameStrokeLbl
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.WeaponFireRateLbl:close()
		element.WeaponNameStrokeLbl:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

