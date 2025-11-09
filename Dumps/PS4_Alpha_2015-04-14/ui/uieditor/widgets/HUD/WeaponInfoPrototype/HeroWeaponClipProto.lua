CoD.HeroWeaponClipProto = InheritFrom( LUI.UIElement )
CoD.HeroWeaponClipProto.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.HeroWeaponClipProto )
	self.id = "HeroWeaponClipProto"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 8 )
	self:setTopBottom( true, false, 0, 16 )
	
	local HeroWeaponAmmoCount = LUI.UITightText.new()
	HeroWeaponAmmoCount:setLeftRight( false, false, -4, 4 )
	HeroWeaponAmmoCount:setTopBottom( false, true, -16, 0 )
	HeroWeaponAmmoCount:setRGB( 1, 0.85, 0 )
	HeroWeaponAmmoCount:setTTF( "fonts/UnitedSansSmCdBd_0.ttf" )
	HeroWeaponAmmoCount:subscribeToGlobalModel( controller, "HeroWeapon", "ammo", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			HeroWeaponAmmoCount:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( HeroWeaponAmmoCount )
	self.HeroWeaponAmmoCount = HeroWeaponAmmoCount
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				HeroWeaponAmmoCount:completeAnimation()
				self.HeroWeaponAmmoCount:setAlpha( 1 )
				self.clipFinished( HeroWeaponAmmoCount, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				HeroWeaponAmmoCount:completeAnimation()
				self.HeroWeaponAmmoCount:setAlpha( 1 )
				self.clipFinished( HeroWeaponAmmoCount, {} )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				HeroWeaponAmmoCount:completeAnimation()
				self.HeroWeaponAmmoCount:setAlpha( 0 )
				self.clipFinished( HeroWeaponAmmoCount, {} )
			end
		}
	}
	self.close = function ( self )
		self.HeroWeaponAmmoCount:close()
		CoD.HeroWeaponClipProto.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

