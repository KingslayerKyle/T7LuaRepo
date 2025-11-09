CoD.HeroWeaponImageProto = InheritFrom( LUI.UIElement )
CoD.HeroWeaponImageProto.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.HeroWeaponImageProto )
	self.id = "HeroWeaponImageProto"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 60 )
	self:setTopBottom( true, false, 0, 60 )
	
	local heroWeaponImage = LUI.UIImage.new()
	heroWeaponImage:setLeftRight( true, true, 0, 0 )
	heroWeaponImage:setTopBottom( true, true, 0, 0 )
	heroWeaponImage:setRGB( 1, 1, 1 )
	heroWeaponImage:setAlpha( 0 )
	heroWeaponImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	heroWeaponImage:subscribeToGlobalModel( controller, "HeroWeapon", "imageAvailable", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			heroWeaponImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( heroWeaponImage )
	self.heroWeaponImage = heroWeaponImage
	
	local heroWeaponImageInactive = LUI.UIImage.new()
	heroWeaponImageInactive:setLeftRight( true, true, 0, 0 )
	heroWeaponImageInactive:setTopBottom( true, true, 0, 0 )
	heroWeaponImageInactive:setRGB( 1, 1, 1 )
	heroWeaponImageInactive:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	heroWeaponImageInactive:subscribeToGlobalModel( controller, "HeroWeapon", "image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			heroWeaponImageInactive:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( heroWeaponImageInactive )
	self.heroWeaponImageInactive = heroWeaponImageInactive
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				heroWeaponImage:completeAnimation()
				self.heroWeaponImage:setAlpha( 0 )
				self.clipFinished( heroWeaponImage, {} )
				heroWeaponImageInactive:completeAnimation()
				self.heroWeaponImageInactive:setAlpha( 1 )
				self.clipFinished( heroWeaponImageInactive, {} )
			end
		},
		Ready = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				heroWeaponImage:completeAnimation()
				self.heroWeaponImage:setAlpha( 1 )
				self.clipFinished( heroWeaponImage, {} )
				heroWeaponImageInactive:completeAnimation()
				self.heroWeaponImageInactive:setAlpha( 0 )
				self.clipFinished( heroWeaponImageInactive, {} )
			end
		},
		Charge = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				heroWeaponImage:completeAnimation()
				self.heroWeaponImage:setAlpha( 0 )
				self.clipFinished( heroWeaponImage, {} )
				heroWeaponImageInactive:completeAnimation()
				self.heroWeaponImageInactive:setAlpha( 1 )
				self.clipFinished( heroWeaponImageInactive, {} )
			end
		},
		InUse = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				heroWeaponImage:completeAnimation()
				self.heroWeaponImage:setAlpha( 1 )
				self.clipFinished( heroWeaponImage, {} )
				heroWeaponImageInactive:completeAnimation()
				self.heroWeaponImageInactive:setAlpha( 0 )
				self.clipFinished( heroWeaponImageInactive, {} )
			end
		}
	}
	self.close = function ( self )
		self.heroWeaponImage:close()
		self.heroWeaponImageInactive:close()
		CoD.HeroWeaponImageProto.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

