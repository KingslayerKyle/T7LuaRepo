CoD.AmmoWidget_HeroWeapon = InheritFrom( LUI.UIElement )
CoD.AmmoWidget_HeroWeapon.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidget_HeroWeapon )
	self.id = "AmmoWidget_HeroWeapon"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 88 )
	self:setTopBottom( true, false, 0, 88 )
	
	local Unavailable = LUI.UIImage.new()
	Unavailable:setLeftRight( false, false, -44, 44 )
	Unavailable:setTopBottom( false, false, -44, 44 )
	Unavailable:setRGB( 1, 1, 1 )
	Unavailable:setAlpha( 0 )
	Unavailable:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	Unavailable:subscribeToGlobalModel( controller, "HeroWeapon", "image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Unavailable:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( Unavailable )
	self.Unavailable = Unavailable
	
	local Available = LUI.UIImage.new()
	Available:setLeftRight( false, false, -44, 44 )
	Available:setTopBottom( false, false, -44, 44 )
	Available:setRGB( 1, 1, 1 )
	Available:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	Available:subscribeToGlobalModel( controller, "HeroWeapon", "imageAvailable", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Available:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( Available )
	self.Available = Available
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Unavailable:completeAnimation()
				self.Unavailable:setAlpha( 1 )
				self.clipFinished( Unavailable, {} )
				Available:completeAnimation()
				self.Available:setAlpha( 0 )
				self.clipFinished( Available, {} )
			end,
			WheelHide = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Ready = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Unavailable:completeAnimation()
				self.Unavailable:setAlpha( 0 )
				self.clipFinished( Unavailable, {} )
				Available:completeAnimation()
				self.Available:setAlpha( 1 )
				self.clipFinished( Available, {} )
			end
		},
		Charge = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Unavailable:completeAnimation()
				self.Unavailable:setAlpha( 1 )
				self.clipFinished( Unavailable, {} )
				Available:completeAnimation()
				self.Available:setAlpha( 0 )
				self.clipFinished( Available, {} )
			end
		},
		InUse = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Unavailable:completeAnimation()
				self.Unavailable:setAlpha( 0 )
				self.clipFinished( Unavailable, {} )
				Available:completeAnimation()
				self.Available:setAlpha( 1 )
				self.clipFinished( Available, {} )
			end
		}
	}
	self.close = function ( self )
		self.Unavailable:close()
		self.Available:close()
		CoD.AmmoWidget_HeroWeapon.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

