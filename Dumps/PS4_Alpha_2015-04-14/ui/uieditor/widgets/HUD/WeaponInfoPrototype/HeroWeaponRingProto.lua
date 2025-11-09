CoD.HeroWeaponRingProto = InheritFrom( LUI.UIElement )
CoD.HeroWeaponRingProto.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.HeroWeaponRingProto )
	self.id = "HeroWeaponRingProto"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 88 )
	self:setTopBottom( true, false, 0, 88 )
	
	local HeroRingImage = LUI.UIImage.new()
	HeroRingImage:setLeftRight( true, true, 0, 0 )
	HeroRingImage:setTopBottom( true, true, 0, 0 )
	HeroRingImage:setRGB( 1, 1, 1 )
	HeroRingImage:setImage( RegisterImage( "uie_img_t7_hud_cm_heroringproto" ) )
	HeroRingImage:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
	HeroRingImage:setShaderVector( 1, 0.5, 0, 0, 0 )
	HeroRingImage:setShaderVector( 2, 0.5, 0, 0, 0 )
	HeroRingImage:setShaderVector( 3, 0, 0, 0, 0 )
	HeroRingImage:subscribeToGlobalModel( controller, "PlayerAbilities", "playerGadget3.powerRatio", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			HeroRingImage:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	self:addElement( HeroRingImage )
	self.HeroRingImage = HeroRingImage
	
	local HeroRingFillImage = LUI.UIImage.new()
	HeroRingFillImage:setLeftRight( true, true, 0, 0 )
	HeroRingFillImage:setTopBottom( true, true, 0, 0 )
	HeroRingFillImage:setRGB( 0.63, 0.63, 0.63 )
	HeroRingFillImage:setImage( RegisterImage( "uie_img_t7_hud_cm_heroringproto" ) )
	HeroRingFillImage:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
	HeroRingFillImage:setShaderVector( 0, 0.3, 0, 0, 0 )
	HeroRingFillImage:setShaderVector( 1, 0.5, 0, 0, 0 )
	HeroRingFillImage:setShaderVector( 2, 0.5, 0, 0, 0 )
	HeroRingFillImage:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( HeroRingFillImage )
	self.HeroRingFillImage = HeroRingFillImage
	
	local HeroRingGold = LUI.UIImage.new()
	HeroRingGold:setLeftRight( true, true, 0, 0 )
	HeroRingGold:setTopBottom( true, true, 0, 0 )
	HeroRingGold:setRGB( 1, 0.85, 0 )
	HeroRingGold:setAlpha( 0 )
	HeroRingGold:setImage( RegisterImage( "uie_img_t7_hud_cm_heroringproto" ) )
	HeroRingGold:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
	HeroRingGold:setShaderVector( 1, 0.5, 0, 0, 0 )
	HeroRingGold:setShaderVector( 2, 0.5, 0, 0, 0 )
	HeroRingGold:setShaderVector( 3, 0, 0, 0, 0 )
	HeroRingGold:subscribeToGlobalModel( controller, "PlayerAbilities", "playerGadget3.powerRatio", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			HeroRingGold:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	self:addElement( HeroRingGold )
	self.HeroRingGold = HeroRingGold
	
	local HeroRingGoldWeapon = LUI.UIImage.new()
	HeroRingGoldWeapon:setLeftRight( true, true, 0, 0 )
	HeroRingGoldWeapon:setTopBottom( true, true, 0, 0 )
	HeroRingGoldWeapon:setRGB( 1, 0.85, 0 )
	HeroRingGoldWeapon:setImage( RegisterImage( "uie_img_t7_hud_cm_heroringproto" ) )
	HeroRingGoldWeapon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( HeroRingGoldWeapon )
	self.HeroRingGoldWeapon = HeroRingGoldWeapon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				HeroRingImage:completeAnimation()
				self.HeroRingImage:setRGB( 1, 1, 1 )
				self.clipFinished( HeroRingImage, {} )
				HeroRingGold:completeAnimation()
				self.HeroRingGold:setAlpha( 0 )
				self.clipFinished( HeroRingGold, {} )
				HeroRingGoldWeapon:completeAnimation()
				self.HeroRingGoldWeapon:setAlpha( 0 )
				self.clipFinished( HeroRingGoldWeapon, {} )
			end
		},
		ReadyGadget = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				HeroRingImage:completeAnimation()
				self.HeroRingImage:setRGB( 1, 0.85, 0 )
				self.clipFinished( HeroRingImage, {} )
				HeroRingGold:completeAnimation()
				self.HeroRingGold:setRGB( 1, 0.85, 0 )
				self.HeroRingGold:setAlpha( 1 )
				self.clipFinished( HeroRingGold, {} )
				HeroRingGoldWeapon:completeAnimation()
				self.HeroRingGoldWeapon:setAlpha( 0 )
				self.clipFinished( HeroRingGoldWeapon, {} )
			end
		},
		Charge = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				HeroRingImage:completeAnimation()
				self.HeroRingImage:setRGB( 1, 1, 1 )
				self.HeroRingImage:setAlpha( 1 )
				self.clipFinished( HeroRingImage, {} )
				HeroRingFillImage:completeAnimation()
				self.HeroRingFillImage:setRGB( 0.63, 0.63, 0.63 )
				self.HeroRingFillImage:setAlpha( 1 )
				self.clipFinished( HeroRingFillImage, {} )
				HeroRingGold:completeAnimation()
				self.HeroRingGold:setAlpha( 0 )
				self.HeroRingGold:setShaderVector( 1, 0.5, 0, 0, 0 )
				self.HeroRingGold:setShaderVector( 2, 0.5, 0, 0, 0 )
				self.HeroRingGold:setShaderVector( 3, 0, 0, 0, 0 )
				self.clipFinished( HeroRingGold, {} )
				HeroRingGoldWeapon:completeAnimation()
				self.HeroRingGoldWeapon:setAlpha( 0 )
				self.clipFinished( HeroRingGoldWeapon, {} )
			end
		},
		InUseGadget = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				HeroRingImage:completeAnimation()
				self.HeroRingImage:setRGB( 1, 1, 1 )
				self.HeroRingImage:setAlpha( 0 )
				self.clipFinished( HeroRingImage, {} )
				HeroRingFillImage:completeAnimation()
				self.HeroRingFillImage:setAlpha( 0.8 )
				self.clipFinished( HeroRingFillImage, {} )
				HeroRingGold:completeAnimation()
				self.HeroRingGold:setAlpha( 1 )
				self.clipFinished( HeroRingGold, {} )
				HeroRingGoldWeapon:completeAnimation()
				self.HeroRingGoldWeapon:setAlpha( 0 )
				self.clipFinished( HeroRingGoldWeapon, {} )
			end
		},
		ReadyWeapon = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				HeroRingGold:completeAnimation()
				self.HeroRingGold:setAlpha( 0 )
				self.clipFinished( HeroRingGold, {} )
				HeroRingGoldWeapon:completeAnimation()
				self.HeroRingGoldWeapon:setAlpha( 1 )
				self.clipFinished( HeroRingGoldWeapon, {} )
			end
		},
		InUseWeapon = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				HeroRingGold:completeAnimation()
				self.HeroRingGold:setAlpha( 0 )
				self.clipFinished( HeroRingGold, {} )
				HeroRingGoldWeapon:completeAnimation()
				self.HeroRingGoldWeapon:setAlpha( 1 )
				self.clipFinished( HeroRingGoldWeapon, {} )
			end
		}
	}
	self.close = function ( self )
		self.HeroRingImage:close()
		self.HeroRingGold:close()
		CoD.HeroWeaponRingProto.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

